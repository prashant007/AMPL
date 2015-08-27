%constructor :
      List =
        Nil 0
        Cons 2

%functions:
     append (xl,yl) = 
             load x of
             case of
                 List.Nil          :  load y
                                      ret 
                 List.Cons(x,xs)   :  call append (xs,y) ; store w
                                      List.Cons (x,w)
                                      ret
             ret                           
             
     reverse(xx) =
          load xx
          case of 
             List.Nil : List.Nil
                        ret
             List.Cons(x,xs) :
                      call reverse(xs) ; store rxs
                      List.Nil ; store v
                      List.Cons(x,v);store vv
                      call append (vv,rxs)
                      ret
          ret                       
                   
