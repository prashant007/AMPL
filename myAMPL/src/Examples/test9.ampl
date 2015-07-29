%run ( |  => -2 ):
     hput -2 1  
     get -2
     store 
     hput -2 1
     get -2
     store
     load 2
     load 1
     add
     hput -2 2
     put  -2
     hput -2 3
     close -2
          