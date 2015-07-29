--
--  A fancy version of test1!
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
%run ( | console => intTerm1) :
     hput intTerm1  IntTerm.Get
     get intTerm1; store x
     hput intTerm1 IntTerm.Get
     get intTerm1; store y
     load x
     load y
     add
     hput intTerm1 IntTerm.Put
     put  intTerm1
     hput intTerm1 IntTerm.Close
     close intTerm1
     hput console Console.Close
     halt console
     
