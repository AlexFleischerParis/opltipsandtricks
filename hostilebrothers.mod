using CP;

/*

 In this case, we need to find a way to decide for the position 
 of each brother’s house on a plot of land, such that the minimum distance between 
 two brothers is maximized. 
 
 */

execute
{
  cp.param.timelimit=60; // time limit 60s
}

int n=50;
int m=100;

tuple t
{
  int i;
  int j;
}

{t} brothers={<i,j> | ordered i,j in 1..n};

dvar int x[i in 1..n]  in 0..m;
dvar int y[i in 1..n]  in 0..m;
dexpr int distance[<i,j> in brothers]=(x[i]-x[j])*(x[i]-x[j])+(y[i]-y[j])*(y[i]-y[j]);

// maximize the min distance
maximize 1/(m*m)*min(<i,j> in brothers) distance[<i,j>];

subject to
{}

/*

which gives

// solution with objective 0.0244

with a 60 s time limit 

*/
