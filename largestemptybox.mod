using CP;

int n=50;

int m=1000;

//int sr;
//execute
//{
//  var r=new Date();
//  sr=Opl.srand(r.getMilliseconds());
//}

int pointx[i in 1..n]=rand(m);
int pointy[i in 1..n]=rand(m);
int pointz[i in 1..n]=rand(m);

dvar int x1 in 0..m;
dvar int y1 in 0..m;
dvar int z1 in 0..m;

dvar int x2 in 0..m;
dvar int y2 in 0..m;
dvar int z2 in 0..m;

// largest empty box
maximize((x2 - x1) * (y2 - y1) * (z2-z1))/1e9;

subject to
{
 x1<=x2;
 y1<=y2; 
 z1<=z2;

forall(i in 1..n) 
   (x1 >= pointx[i]) ||  (x2 <= pointx[i]) || (y1 >= pointy[i]) ||  (y2 <= pointy[i])
   || (z1 >= pointz[i]) ||  (z2 <= pointz[i]); 
            
}

// which gives 0.18 in 2s


