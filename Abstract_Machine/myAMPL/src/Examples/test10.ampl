--
-- This example illustrates how one can create a terminal which inputs and outputs lists of numbers using a simple intTerm
-- The input is terminated by a negative number or zero.
--
%handles:
     CharTerm =
        Get
        Put
        Close

     CharLTerm =
        Get
        Put
        Close

%cohandles:
      Console =
        Get
        Put
        Close

%constructors:
       Bool =
          False 0
          True 0

       List = 
          Nil  0
          Cons  2

       GPt = 
           Gt 1
           Pt 1
           Ready 0


%processes:
        charlistTerm( d | ch => out) =
           load d
           case of
                GPt.Ready :              -- intlistTerm process is ready for input from calling routine
                   hcase ch of 
                       CharLTerm.Get : 
                              List.Nil; store x
                              GPt.Gt(x); store y
                              run charlistTerm( y | ch => out) 
                       CharLTerm.Put : 
                              get ch; store x 
                              GPt.Pt(x); store w
                              run charlistTerm( w | ch => out) 
                       CharLTerm.Close : 
                              hput out CharTerm.Close
                              close out
                              halt ch

                GPt.Gt(xs):     -- intlistTerm process collecting input until n=<0 is input (must reverse list)
                   hput out CharTerm.Get
                   get out; store x
                   cInt 0
                   load x
                   leq ; store b
                   load b
                   case  of
                      Bool.True:
                          call reverse(xs)
                          put ch
                          GPt.Ready; store w
                          run charlistTerm( w | ch => out)
                      Bool.False:
                         List.Cons(x,xs); store y
                         GPt.Gt(y); store w
                         run charlistTerm( w | ch => out)
                 
                GPt.Pt(xs):          -- inlistTerm process outputs a list
                        load xs
                        case  of
                            List.Nil: 
                                GPt.Ready; store w
                                run charlistTerm( w | ch => out)
                            List.Cons(x,xs):
                                hput out CharTerm.Put
                                load x; put out
                                GPt.Pt(xs); store w
                                run charlistTerm( w | ch => out) 

                
%functions:
       append(x,y) =               -- appending lists 
               load x
               case of
                    List.Nil: 
                           load y
                           ret
                    List.Cons(x,xs):
                            call append(xs,y); store w
                            List.Cons(x,w)
                            ret
               ret

       reverse(xx) =                -- reversing list
               load xx
               case of
                    List.Nil:
                        List.Nil
                        ret
                    List.Cons(x,xs):
                         call reverse(xs); store rxs
                         List.Nil; store v
                         List.Cons(x,v);store vv
                         call append(rxs,vv)
                         ret 
               ret  


%run (| console => charTerm1):
        plug ch with
             [console]:   -- this process collects two lists (outputing [1000] in between) 
                          -- appends the lists and outputs the result
                               hput ch CharLTerm.Get
                               get ch; store v1
                               List.Nil; store n
                               cInt 1000; store m
                               List.Cons(m,n)
                               hput ch CharLTerm.Put
                               put ch 
                               hput ch CharLTerm.Get   
                               get ch; store v2
                               call append(v1,v2);store ans
                               hput ch CharLTerm.Put
                               load ans; put ch
                               hput ch CharLTerm.Close
                               close ch
                               hput console Console.Close
                               halt console
             [charTerm1]: 
                               GPt.Ready; store w
                               run charlistTerm(w|ch => charTerm1) 
                   
                             

               
              

        

