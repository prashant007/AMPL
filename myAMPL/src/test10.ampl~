-- Page 28
-- Successor :: () put Nat top => put Nat top
-- Successor inCh => outCh =
-- get x on inCh.
-- put (Succ x) on outCh
-- close inCh -> end outCh

-- question :- here intTerm1 and intTerm2 both are output channels
-- need to think more about this example

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

%constructors:
       Nat = 
         Nil  0
         Succ 1

%functions:
     addOne(x) =
       load x 
       cInt 1
       add
       ret
          


--%run ( | console => intTerm1) :
     -- get on input channel
     --hput console  Console.Get
     --get console; store c
     --load c
     --cInt 1 
     --add 
     -- put on output channel
     --hput intTerm1 IntTerm.Put
     --put  intTerm1
     -- close channels
     --hput intTerm1 IntTerm.Close
     --close intTerm1
     --hput console Console.Close
     --halt console

%run ( | console => intTerm1,intTerm2) :
     -- get on input channel
     hput intTerm2  IntTerm.Get
     get intTerm2; store c
     load c
     call addOne(c) ; store d
     load d 
     -- put on output channel
     hput intTerm1 IntTerm.Put
     put  intTerm1
     -- close channels
     hput intTerm1 IntTerm.Close
     close intTerm1
     hput intTerm2 IntTerm.Close
     close intTerm2     
     hput console Console.Close
     halt console
