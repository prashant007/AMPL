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


