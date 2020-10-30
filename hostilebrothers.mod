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

range r=1..n;

tuple t
{
  int i;
  int j;
}

{t} brothers={<i,j> | ordered i,j in r};

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

execute
{

var o=new IloOplOutputFile("c:\\temp\\paramdisplaypoints.txt");


for(var i in r) 
{
 o.write(x[i]);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in r) 
{
 o.write(y[i]);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in r) 
{
 o.write(1);
 if (i!=n) o.write(",");
}
o.writeln();


o.close();

IloOplExec("C:\\Python36\\python.exe c:\\temp\\displaypoints.py",false);

}



