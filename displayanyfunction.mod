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
  

    int nbSegments=100;

    float x2[i in 0..nbSegments]=i;
    float y2[i in 0..nbSegments]=(i mod 2==0)?i:-i;  // Here is the function

    string pythonpath="C:\\Python36\\python.exe";
    string pythonfile="C:\\temp\\DisplayXY.py";
    execute
    {


    displayXY(x2,y2,pythonpath,pythonfile);
    } 
