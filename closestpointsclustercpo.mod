// Finding a cluster of closest points 

using CP;

int scale=1000000;

int nbdim=2;
int m=8;
int n=50;

range dim=1..nbdim;
range points=1..n;

float x[p in points][d in dim]=rand(scale)/scale;

float distance[p1 in points][p2 in points]=sqrt(sum(d in dim)((x[p1][d]-x[p2][d])^2));

// which point for as the m th point ?
dvar int which[1..m] in points;

dexpr float maxDist=max(ordered i,j in 1..m) distance[which[i]][which[j]];

minimize maxDist;
subject to
{
  allDifferent(which);
}

{int} chosenPoints={which[k] | k in 1..m};

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

