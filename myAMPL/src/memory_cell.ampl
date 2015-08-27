%handles:

   MEM = {PUT;GET;CLS}
   IntTerm = {Get;Put;Close}
   Passer = {Pass} -- made passer a handle

%cohandles:

   Console = {Get; Put; Close}


%processes:
   memory(x|ch => ) =
      hcase ch of
        MEM.PUT: get ch; store y
                 run memory(y|ch => )
        MEM.GET: load x; put ch
                 run memory(x|ch => )
        MEM.CLS: halt ch

   p2(| p => in, mem) =
       hcase p of 
         Passer.Pass: 
            hput in IntTerm.Get; get in; store x
            hput mem MEM.GET; get mem; store y
            hput in IntTerm.Put; load y; put in
            hput mem MEM.PUT; load x;put mem           
            fork p as 
               mm with mem :
                         mm := mem
               nmpp with in:
                        split nmpp into nm pp
                        plug z as 
                               with [in,pp]: run p2( | pp => in, z)
                               with [nm]: z:=nm

   p1(| => p, io) =
        hput io IntTerm.Get; get io; store x
        hput p Passer.Pass
        split p into m nmpp 
        hput m MEM.GET; get m; store y
        load y; hput io IntTerm.Put; put io
        load x; hput m MEM.PUT; put m
        fork nmpp  as
            nm with m:  nm:=m
            pp with io: run p1(| => pp,io)

%run (| => intTerm1,intTerm2) : -- changed the name from in1,in2
   plug c1 as
         with [intTerm1]:
              run p1(|=>c1,intTerm1)
         with [intTerm2]:
              plug m as 
                 with [intTerm2,c1]:
                    run p2(|c1 => intTerm2,m)
                 with []:
                    cInt 0; store x
                    run memory(x |m => )