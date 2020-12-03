using CP;



 int n=20; // nb of rectangles
 

 
 int sizeBigSquare=10000;
 
 // length
 int l[i in 1..n]=10+rand(100);
 // width
 int w[i in 1..n]=10+rand(100);
 
 dvar int x[i in 1..n]in 0..sizeBigSquare;
 dvar int y[i in 1..n] in 0..sizeBigSquare;
 dvar boolean rota[i in 1..n]; // do we rotate?
 
 dexpr int x2[i in 1..n]=x[i]+(rota[i]==1)*w[i]+(rota[i]==0)*l[i];
 dexpr int y2[i in 1..n]=y[i]+(rota[i]==1)*l[i]+(rota[i]==0)*w[i];
 
 dexpr int Mx=max(i in 1..n) x2[i];
 dexpr int My=max(i in 1..n) y2[i];
 

 // Intervals to benefit from scheduling
 
 dvar interval itvsx[i in 1..n][j in 1..2] optional in 0..sizeBigSquare size (j==2)?l[i]:w[i];
 cumulFunction yuse=sum(i in 1..n,j in 1..2) pulse(itvsx[i,j],(j==1)?l[i]:w[i]);
 
 dvar interval itvsy[i in 1..n][j in 1..2] optional in 0..sizeBigSquare size (j==1)?l[i]:w[i];
 cumulFunction xuse=sum(i in 1..n,j in 1..2) pulse(itvsy[i,j],(j==2)?l[i]:w[i]);
 
 minimize My;
 
 subject to
 {
   
   
  
   Mx<=1000;
   
   // nooverlap
   forall(ordered i,j in 1..n)
     (x2[i]<=x[j]) || (x2[j]<=x[i]) || (y2[i]<=y[j]) || (y2[j]<=y[i]);
     
     // sched part
     
     yuse<=My+1;
     xuse<=Mx+1;
     
     forall(i in 1..n,j in 1..2) (presenceOf(itvsx[i][j])==1) => (startOf(itvsx[i][j])==x[i]);
     forall(i in 1..n,j in 1..2) (presenceOf(itvsy[i][j])==1) => (startOf(itvsy[i][j])==y[i]);
     
     forall(i in 1..n) rota[i]==presenceOf(itvsx[i][1]);
     forall(i in 1..n) rota[i]==1-presenceOf(itvsx[i][2]);
     forall(i in 1..n) rota[i]==presenceOf(itvsy[i][1]);
     forall(i in 1..n) rota[i]==1-presenceOf(itvsy[i][2]);
 }  
 
 float rate=sum(i in 1..n) w[i]*l[i]/My/Mx; 
 
 
 execute
 {
  writeln("Rate=",rate); 
  yuse;
  xuse;
 }   
 execute
 {
 var o=new IloOplOutputFile("c:\\temp\\paramdisplayrectangles.txt");

    
    var xstring="";
    var ystring="";
    var xstring2="";
    var ystring2="";
    for(var k=1;k<=n;k++)
    {
             
              xstring=xstring+x[k];
              if (k!=n) xstring=xstring+",";
              ystring=ystring+y[k];
              if (k!=n) ystring=ystring+","; 
              
              xstring2=xstring2+x2[k];
              if (k!=n) xstring2=xstring2+",";
              ystring2=ystring2+y2[k];
              if (k!=n) ystring2=ystring2+","; 
              
              
                      
    }
    o.write(xstring);
    o.writeln();
    o.write(ystring);
    o.writeln();
    o.write(xstring2);
    o.writeln();
    o.write(ystring2);
    o.writeln();
    o.close();

    IloOplExec("C:\\Python36\\python.exe c:\\temp\\displayrectangles.py",false);
 
}



