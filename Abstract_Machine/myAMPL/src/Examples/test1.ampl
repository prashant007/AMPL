
%run ( |  => -1 ):
     hput -1 1  
     get -1
     store 
     hput -1 1
     get -1
     store
     load 2
     load 1
     add
     hput -1 2
     put  -1
     hput -1 3
     --close -1
     halt -1 
          