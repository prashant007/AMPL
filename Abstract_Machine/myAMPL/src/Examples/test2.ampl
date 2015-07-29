--
-- basic talking to a memory cell!
--
%handles:

     MEM =
        PUT
        GET
        CLS

     IntTerm = 
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
     memory (x | ch => ) =
           hcase ch of
               MEM.PUT: get ch
                        store y
                        run memory(y|ch =>)  
               MEM.GET: load  x
                        put ch
                        run memory(x|ch => )      
               MEM.CLS: halt ch



%functions:
      append(xs,ys) =
            load xs
	    case of
	       List.Nil: 
                     load ys
                     ret
	       List.Cons (x,xss): 
	             call append (xss,ys)
                     store z
                     List.Cons(x,z)
                     ret
            ret


	             

%run ( | console => intTerm1):
     plug ch with
         [intTerm1,console]:
            hput intTerm1 IntTerm.Get
            get intTerm1
            store x
            hput ch MEM.PUT
            load x
            put ch
            hput ch MEM.GET
            get ch
            store x
            hput intTerm1 IntTerm.Put
            load x
            put intTerm1
            hput ch MEM.CLS
            close ch
            hput intTerm1 IntTerm.Close
            close intTerm1
            hput console Console.Close 
            halt console    
         []: 
            cInt 1
            store x
            run memory(x|ch => )  
