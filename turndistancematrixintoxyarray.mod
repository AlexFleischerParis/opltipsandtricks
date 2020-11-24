using CP;

int million=1000000;

execute
{
  cp.param.timelimit=60;
}

// number of points
int n=...;

// arry of (n-1) *n / 2 distances
int dist[1..(n-1)*n div 2]=...;

tuple edge
{
  int i;
  int j;
}

setof(edge) Edges       = {<i,j> | ordered i,j in 1..n};
setof(edge) Edges2       = {<i,j> | i,j in 1..n};  // node n+1 is node 1

// first let us turn dist into the same array of Edges
int         diste[<i,j> in Edges] = dist[1+ord(Edges,<i,j>)];
// And now a 2D array for point i to point j
int         dist2[i in 1..n][j in 1..n] = (i==j)?0:((i<j)?diste[<i,j>]:diste[<j,i>]);

// The decision variables : x and y 
dvar int x[1..n] in -million..million;
dvar int y[1..n] in -million..million;

// minimize max of the difference of given distances and computed distances out of x and y
minimize max(ordered i,j in 1..n) abs(dist2[i][j]-sqrt((x[i]-x[j])^2+(y[i]-y[j])^2));

subject to
{
  // to break symmetry
  x[1]==0;
  y[1]==0;
}

range points=1..n;
// Display graph
execute
{

var o=new IloOplOutputFile("c:\\temp\\paramdisplaypoints.txt");


for(var i in points) 
{
 o.write(x[i]);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in points) 
{
 o.write(y[i]);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in points) 
{
 o.write(2);
 if (i!=n) o.write(",");
}
o.writeln();


o.close();

IloOplExec("C:\\Python36\\python.exe c:\\temp\\displaypoints.py",false);

}
