int n=3;
int m=4;

range r1=1..n;
range r2=1..m;

/*

tuple t {
  string name;
  int  x[r1][r2];
}

This does not work since only 1 dimension arrays
are allowed within tuple.

So we should use a 1D array instead (s in this example)
Or use an array outside the tuple. (ar in this example)

*/

range r3=1..n*m;

tuple t
{
  key string name;
  int x[r3];
}

{t} s=...;
{string} names={i.name | i in s};

// 3D arrays that can replace the 2D arrays within tuple set
int ar[names][r1][r2]=...;

dexpr int valueofx[i in names][a in r1][b in r2]=item(s,<i>).x[(a-1)*m+b];

dvar int A12;
dvar int B23;
subject to
{
  A12==valueofx["A"][1][2];
  B23==valueofx["B"][2][3];
}

// Here let us check that the array 2D and the array 1D contain the same values
assert forall(i in names,a in r1,b in r2) valueofx[i][a][b]==ar[i][a][b];

/*

and the .dat is

s={<"A",[1,2,3,4,5,6,7,8,9,10,11,12]>,
<"B",[21,22,23,24,25,26,7,8,9,10,11,34]>};

ar=[[[1,2,3,4],[5,6,7,8],[9,10,11,12]],[[21,22,23,24],[25,26,7,8],[9,10,11,34]]];

*/
