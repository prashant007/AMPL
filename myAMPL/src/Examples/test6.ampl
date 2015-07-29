--
--  Higher order application
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
%destructors:
     Exp =
       App 1


%run ( | console => intTerm1) :
     hput intTerm1  IntTerm.Get
     get intTerm1
     store x
     rec of 
           Exp.App(y): cInt 2
                       load y
                       add
                       fret
     store y
     load y
     Exp.App (x)
     store ans
     load ans
     hput intTerm1  IntTerm.Put
     put intTerm1
     hput intTerm1  IntTerm.Close
     close intTerm1 
     hput console Console.Close
     halt console

{-

(([],[(0,IN,0),(-1,OUT,-1)],[],

     AMC_HPUT (-1) 1
     AMC_GET (-1)
     AMC_STORE
     AMC_REC [[AMC_INT 2
              ,AMC_LOAD 1
              ,AMC_ADD
              ,AMC_RET
              ]]
     AMC_STORE
     AMC_LOAD 2
     AMC_LOAD 1
     AMC_DEST 1 1
     AMC_STORE
     AMC_LOAD 1
     AMC_HPUT (-1) 2
     AMC_PUT (-1)
     AMC_HPUT (-1) 3
     AMC_CLOSE (-1)
     AMC_HPUT 0 3
     AMC_HALT 0

(([],[(0,IN,0),(-1,OUT,-1)],[],
    [AMC_HPUT (-1) 1
    ,AMC_GET (-1)
    ,AMC_STORE
    ,AMC_REC 
      [[AMC_INT 2
       ,AMC_LOAD 1
       ,AMC_ADD
       ,AMC_FRET]]
    ,AMC_STORE
    ,AMC_LOAD 1
    ,AMC_LOAD 2
    ,AMC_DEST 1 1
    ,AMC_STORE
    ,AMC_LOAD 1
    ,AMC_HPUT (-1) 2
    ,AMC_PUT (-1)
    ,AMC_HPUT (-1) 3
    ,AMC_CLOSE (-1)
    ,AMC_HPUT 0 3
    ,AMC_HALT 0]

),([0,-1],[(0,Q_EMPTY,Q_EMPTY),(-1,Q_EMPTY,Q_EMPTY)]),[])

),([0,-1],[(0,Q_EMPTY,Q_EMPTY),(-1,Q_EMPTY,Q_EMPTY)]),[])

([([V_INT 7,V_REC ([[AMC_INT 2,AMC_LOAD 1,AMC_ADD,AMC_FRET]],[V_INT 7]),V_INT 7],
[(0,IN,0),(-1,OUT,-1)],
[V_REC ([[AMC_INT 2,AMC_LOAD 1,AMC_ADD,AMC_FRET]],[V_INT 7]),V_INT 7],
[AMC_DEST 1 1,AMC_STORE,AMC_LOAD 1,AMC_HPUT (-1) 2,AMC_PUT (-1),AMC_HPUT (-1) 3,AMC_CLOSE (-1),AMC_HPUT 0 3,AMC_HALT 0])],

([0,-1],[(0,Q_EMPTY,Q_EMPTY),(-1,Q_EMPTY,Q_EMPTY)]),[])

-}
     
     