/*

Many users use dexpr (decision expressions) to factor some formula out of
decision variables. For instance

dexpr float y[i in 1..n]=2*x[i]; where x is a dvar (decision variable) array

But many ignore that dexpr can also be used to factor formula without 
any decision variable

*/

int n=200;

// This float v would use much more memory and time
// float v[i in 1..n][j in 1..n][k in 1..n]=(i+0.5)*j*k;

// This dexpr v will compute v only when needed
dexpr float v[i in 1..n][j in 1..n][k in 1..n]=(i+0.5)*j*k;

dvar float x;

subject to
{
  x==v[1][2][3];
}

float res1=v[1][2][3];
float res2;
execute
{ 
  writeln("x=",x);
  writeln("res=",res1);
  res2=v[1][2][3];
  writeln("res2=",res2);
}

assert x==res1;
assert x==res2;

/*

gives

x=9
res=9
res2=9

Many other tips and tricks at 

https://www.linkedin.com/pulse/tips-tricks-opl-cplex-alex-fleischer/

*/


