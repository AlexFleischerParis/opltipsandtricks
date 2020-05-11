using CP;

execute
{
  cp.param.optimalitytolerance=0;
}

int n=50;

int m=1000;

int pointx[i in 1..n]=rand(m);
int pointy[i in 1..n]=rand(m);

dvar int x1 in 0..m;
dvar int y1 in 0..m;

dvar int x2 in 0..m;
dvar int y2 in 0..m;

// largest empty box
maximize((x2 - x1) * (y2 - y1));

subject to
{
 x1<=x2;
 y1<=y2; 

forall(i in 1..n) 
   (x1 >= pointx[i]) ||  (x2 <= pointx[i]) || (y1 >= pointy[i]) ||  (y2 <= pointy[i]);
            
       
}

// Gives optimal solution in less than 1 s
