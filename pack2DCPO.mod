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
 

 
 minimize My;
 
 subject to
 {
  
   Mx<=1000;
   
   // nooverlap
   forall(ordered i,j in 1..n)
     (x2[i]<=x[j]) || (x2[j]<=x[i]) || (y2[i]<=y[j]) || (y2[j]<=y[i]);
 }  
 
 float rate=sum(i in 1..n) w[i]*l[i]/My/Mx; 
 
 execute
 {
  writeln("Rate=",rate); 
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


