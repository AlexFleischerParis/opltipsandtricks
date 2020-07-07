// linearization of f(x)=1/x through a piecewise linear function
// relying on https://github.com/AlexFleischerParis/howtowithopl/blob/master/pwlwithbreakpoints.mod

// our world is not 100% linear so sometimes it's helpful to turn any non linear function
// into a piecewise linear approximation 

int sampleSize=10000;
float s=1;
float e=10;

float x[i in 0..sampleSize]=s+(e-s)*i/sampleSize;

int nbSegments=5;

float x2[i in 0..nbSegments]=(s)+(e-s)*i/nbSegments;
float y2[i in 0..nbSegments]=1/x2[i];  // y=f(x)

float firstSlope=0;
 float lastSlope=0;
 
 tuple breakpoint // y=f(x)
 {
  key float x;
  float y;
 }
 
 sorted { breakpoint } breakpoints={<x2[i],y2[i]> | i in 0..nbSegments};
 
 float slopesBeforeBreakpoint[b in breakpoints]=
 (b.x==first(breakpoints).x)
 ?firstSlope
 :(b.y-prev(breakpoints,b).y)/(b.x-prev(breakpoints,b).x);
 
 pwlFunction f=piecewise(b in breakpoints)
 { slopesBeforeBreakpoint[b]->b.x; lastSlope } (first(breakpoints).x, first(breakpoints).y);
 
 assert forall(b in breakpoints) abs(f(b.x)-b.y)<=0.001;
 
 float maxError=max (i in 0..sampleSize) abs(1/x[i]-f(x[i]));
 float averageError=1/(sampleSize+1)*sum (i in 0..sampleSize) abs(1/x[i]-f(x[i]));

execute
    {

    // turn an OPL array into a python list
    function getPythonListOfArray(_array)
    {

    var quote="\"";
    var nextline="\\\n";


    var res="[";
    for(var i in _array)
    {
    var value=_array[i];

    if (typeof(value)=="string") res+=quote;
    res+=value;
    if (typeof(value)=="string") res+=quote;
    res+=",";
    res+=nextline;
    }
    res+="]";
    return res;
    }

    // Display a function with points with x and y arrays of x and y
    function displayXY(x,y,pythonpath,pythonfile)
    {
    writeln("displayXY ",x," ",y," ",pythonpath," ",pythonfile);

    var python=new IloOplOutputFile(pythonfile);
    python.writeln("import matplotlib.pyplot as plt");
    python.writeln("x = ",getPythonListOfArray(x))
    python.writeln("y = ",getPythonListOfArray(y))
    python.writeln("plt.plot(x, y)");
    python.writeln("plt.xlabel('x - axis')");
    python.writeln("plt.ylabel('y - axis')");
    python.writeln("plt.title('xy graph')");
    python.writeln("plt.show()");
    python.close();
    IloOplExec(pythonpath+" "+ pythonfile,true);        
    }
   

    }
  

    int nbSegments2=10000;

    float x3[i in 0..nbSegments2]=(s)+(e-s)*i/nbSegments2;
    float y3[i in 0..nbSegments2]=1/x3[i];  // y=f(x)
    float y3pwl[i in 0..nbSegments2]=f(x3[i]);  // y=f(x)

    string pythonpath="C:\\Python36\\python.exe";
    string pythonfile="C:\\temp\\DisplayXY.py";
    execute
    {

    // display 1/x function
    displayXY(x3,y3,pythonpath,pythonfile);
    // display pwl approximation
    displayXY(x3,y3pwl,pythonpath,pythonfile);
    } 
