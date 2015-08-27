

-- get chc;
-- store v1;
-- load v1;
-- put chb ;
-- get cha ;
-- store v2 ;
-- load v2 ;
-- put chc
-- close cha;
-- close chb ;
-- close chc ;
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

%run ( | console => intTerm4 ,intTerm5,intTerm3) :
     -- get on chc
     hput intTerm4  IntTerm.Get
     get intTerm4; store c
     load c
     -- put on chb
     hput intTerm5 IntTerm.Put
     put  intTerm5
     -- get on cha
     hput intTerm3  IntTerm.Get
     get intTerm3; store a
     load a
     -- put on chc
     hput intTerm4 IntTerm.Put
     put  intTerm4
     -- close channels     
     hput intTerm4 IntTerm.Close
     close intTerm4
     hput intTerm5 IntTerm.Close
     close intTerm5
     hput intTerm3 IntTerm.Close
     close intTerm3
     hput console Console.Close
     halt console
