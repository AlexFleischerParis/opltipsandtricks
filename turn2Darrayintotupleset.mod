{string} d1={"Y","Z"};
{string} d2={"A","B","C"};

int a[d1][d2] =  [[1,2, 3],
             [2 ,3 ,8]];
             
execute
{
  writeln("a=",a);
}     

tuple t
{
  key string dim1;
  key string dim2;
  int value;
}   

{t} s={<di1,di2,a[di1][di2]> | di1 in d1,di2 in d2};

execute
{
  writeln("s=",s);
}

/*

which gives

a= [[1 2 3]
         [2 3 8]]
s= {<"Y" "A" 1> <"Y" "B" 2> <"Y" "C" 3> <"Z" "A" 2> <"Z" "B" 3>
     <"Z" "C" 8>}
     
*/