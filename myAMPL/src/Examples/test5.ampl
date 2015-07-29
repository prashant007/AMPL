--
--  Simple program using multiple integer channels 
--
%handles:
     IntTerm =
        Get
        Put
        Close
%cohandles:
      Console =
        Get
        Put
        Close
%run ( | console => intTerm1,intTerm2) :
     hput intTerm1  IntTerm.Get
     get intTerm1
     store x
     load x
     hput intTerm2  IntTerm.Put
     put intTerm2
     hput intTerm2  IntTerm.Get
     get intTerm2
     store y
     load y
     hput intTerm1  IntTerm.Put
     put intTerm1
     hput intTerm2 IntTerm.Close
     close intTerm2  
     hput intTerm1 IntTerm.Close
     close intTerm1
     hput console Console.Close
     halt console  


{- 

(([],[(0,IN,0),(-1,OUT,-1),(-2,OUT,-2)],[],

     AMC_HPUT (-1) 1
     AMC_GET (-1)
     AMC_STORE
     AMC_LOAD 1
     AMC_HPUT (-2) 2
     AMC_PUT (-2)
     AMC_HPUT (-2) 1
     AMC_STORE
     AMC_LOAD 1
     AMC_HPUT (-1) 2
     AMC_PUT (-1)
     AMC_HPUT (-2) 3
     AMC_CLOSE (-2)
     AMC_HPUT (-1) 3
     AMC_CLOSE (-1)
     AMC_HPUT 0 3
     AMC_HALT 0

),([0,-1,-2],[(0,Q_EMPTY,Q_EMPTY),(-1,Q_EMPTY,Q_EMPTY),(-2,Q_EMPTY,Q_EMPTY)]),[])

-}