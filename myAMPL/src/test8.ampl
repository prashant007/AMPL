

-- get ch1;
-- store v1;
-- load v1;
-- put ch2 ;
-- get ch3 ;
-- store v2 ;
-- load v2 ;
-- put ch1 ;
-- close ch1;
-- close ch2 ;
-- close ch3 ;
-- halt console ;

-- Above program in the "Fancy" Syntax.


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

%run ( | console => intTerm1 ,intTerm2,intTerm3) :
     -- get on ch1 
     hput intTerm1  IntTerm.Get
     get intTerm1; store x
     load x
     -- put on ch2
     hput intTerm2 IntTerm.Put
     put  intTerm2
     -- get on ch3
     hput intTerm3  IntTerm.Get
     get intTerm3; store y
     load y
     -- put on ch1
     hput intTerm1 IntTerm.Put
     put  intTerm1
     -- close channel
     hput intTerm1 IntTerm.Close
     close intTerm1
     hput intTerm2 IntTerm.Close
     close intTerm2
     hput intTerm3 IntTerm.Close
     close intTerm3
     hput console Console.Close
     halt console
