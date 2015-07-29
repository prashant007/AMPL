%run ( |  => -1 ):
     hput -1 1  -- put handler 1 on channel -1
     get -1     -- get on channel -1
     store      -- store
     hput -1 1
     get -1
     store
     load 2
     load 1
     add
     hput -1 2  
     put  -1
     hput -1 3
     close -1

          