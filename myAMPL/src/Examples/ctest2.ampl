--
--  A fancy version of test1!
--
%handles:
     StrTerm =
        Get
        Put
        Close
%cohandles:
      Console =
        Get
        Put
        Close
%run ( | console => strTerm1) :
     hput strTerm1  StrTerm.Get
     get strTerm1; store x -- store takes the first element of the stack and puts it on the environment
     hput strTerm1  StrTerm.Get
     get strTerm1; store y 
     load y 
     load x
     concat
     hput strTerm1 StrTerm.Put
     put  strTerm1
     hput strTerm1 StrTerm.Put
     put  strTerm1
     hput strTerm1 StrTerm.Close
     close strTerm1
     hput console Console.Close
     halt console
     
