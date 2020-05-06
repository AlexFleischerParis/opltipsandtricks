{string} options={"OPL" , "Python", "Java", "C++/C/C#", "Julia", "Other"};
float percent[options]=[32, 25, 16,  14, 4, 9];
string lastOption=last(options);

execute
{

var o=new IloOplOutputFile("c:\\temp\\parampiechart.txt");
o.writeln("Which API do you use when you call CPLEX ?");


for(var i in options) 
{
 o.write(i);
 if (i!=lastOption) o.write(",");
}
o.writeln();

for(var i in options) 
{
 o.write(percent[i]);
 if (i!=lastOption) o.write(",");
}
o.writeln();
o.close();

IloOplExec("C:\\Python36\\python.exe c:\\temp\\displaypiechart.py");
}



