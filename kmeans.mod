using CP;

execute
{
  cp.param.timelimit=400;
}

int n=100;
range points=1..n;

int m=4;
range M=1..m;

int p=4;

int r=100;

range R=1..r;

int clusterx[k in M]=rand(p*r);
int clustery[k in M]=rand(r*p);

int cluster[i in 1..n]=1+rand(m);
int pointx[i in 1..n]=clusterx[cluster[i]]+rand(r);
int pointy[i in 1..n]=clustery[cluster[i]]+rand(r);


// which centers for clusters
dvar int cx[M];
dvar int cy[M];
// which cluster for each point
dvar int x[points] in M;

// distance from points to cluster center
dexpr float d[i in points]=(cx[x[i]]-pointx[i])^2+(cy[x[i]]-pointy[i])^2;
// total distance
dexpr float totald=sum(i in points) d[i];
minimize totald;
subject to
{
  x[1]==1;
  //forall(i in points) x[i]==cluster[i];
}  

// display


execute
{

var o=new IloOplOutputFile("c:\\temp\\paramdisplaypoints.txt");


for(var i in points) 
{
 o.write(pointx[i]);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in points) 
{
 o.write(pointy[i]);
 if (i!=n) o.write(",");
}
o.writeln();

for(var i in points) 
{
 o.write(x[i]);
 if (i!=n) o.write(",");
}
o.writeln();


o.close();

IloOplExec("C:\\Python36\\python.exe c:\\temp\\displaypoints.py",false);

}







