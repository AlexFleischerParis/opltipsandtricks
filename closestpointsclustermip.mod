// Finding a cluster of closest points 

int scale=1000000;

int nbdim=2;
int m=8;
int n=50;

range dim=1..nbdim;
range points=1..n;

float x[p in points][d in dim]=rand(scale)/scale;

float distance[p1 in points][p2 in points]=sqrt(sum(d in dim)((x[p1][d]-x[p2][d])^2));

// Should we keep that point ?
dvar  boolean which[points];

dexpr float maxDist=max(ordered i,j in points) distance[i][j]*((which[i]==1) && (which[j]==1));

minimize maxDist;
subject to
{
  sum (p in points) which[p]==m;
}

execute
{
  x;
}


{int} chosenPoints={k | k in points:which[k]==1};

// Display graph
execute
{

var o=new IloOplOutputFile("c:\\temp\\paramdisplaypoints.txt");


for(var i in points) 
{
 o.write(x[i][1]*scale);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in points) 
{
 o.write(x[i][2]*scale);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in points) 
{
 if (chosenPoints.contains(i)) o.write(1);
 else o.write(2);
 if (i!=n) o.write(",");
}
o.writeln();


o.close();

IloOplExec("C:\\Python36\\python.exe c:\\temp\\displaypoints.py",false);

}
