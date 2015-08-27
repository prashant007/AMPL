--
-- basic passing of a memory cell!
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
        
     Passer = 
         Pass

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
----------------------------------------------------------------------

     p1( | => in2, c1, c2) =
           hcase c1 of     -- issue
              Passer.Pass:
                   hput in2 IntTerm.Get; get in2; store x
                   hput c2 MEM.GET; get c2; store y; hput c2 MEM.PUT
                   load x; put c2
                   load y; put in2
                   fork c1 as 
                               x1  with c2 : 
                                                x1 := c2 
                               x2  with in2 :  
                                                split x2 into nm x3 
                                                plug z as
                                                   with [x3,in2] :       run p1(|=>in2,x3, z)
                                                   with [nm]     :  z := nm 
    
----------------------------------------------------------------------------------------
     p2(| c => in1 ) =
                    hput in1 IntTerm.Get; store x
                    hput c Passer.Pass
                    split c into m x4
                    
                    hput m MEM.GET -- rewrite
                    
                    get m; store y 
                    load y; put in1
                    hput m MEM.PUT
                    load x; put m
                    fork x4 as  
                         nm with m :
                              n := nm
                         x5 with in1 :
                              run p2(|x5 => in1)


                          
            
%run (| => intTerm1,intTerm2) :
  plug c1 as 
          with  [intTerm2]:
                plug  c2 as
                  with [intTerm2,c1]: 
                          run p1( | => intTerm2,c1,c2)
                  with []: 
                           cInt 0
                           store x 
                           run memory( x |c2 => )
          with    [intTerm1]:
                run p2(| c1 => intTerm1)
             
             
   
   
