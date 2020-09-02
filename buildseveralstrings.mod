int n=10;
range r=1..n;
int m=3;
range r2=0..m-1;
int a[i in r]=i mod m;

// Now suppose we want to display 3 strings to find the set of i according to a

// We can use OPL and then build the strings

{int} ipera[v in r2]={i | i in r : a[i]==v};

execute
{
  for(var j in r2) 
  {
    write(j," : ")
    for(var k in ipera[j]) write(k," ");
    writeln();
  }
  writeln();
}

// But many users tend to prefer OPL scripting and write

execute
{
  for(var j in r2)
  {
    write(j," : ")
    for(var k in r) if (a[k]==j) write(k," ");
    writeln();
  }
  writeln();
}

// which use 2 loops and is not efficient

// They do not know about  IloOplOutputString that could help them build
// many strings in parallel

execute
{
  var output=new Array(m);
  for(var j in r2) 
  {
    output[j]=new IloOplOutputString();
    output[j].write(j," : ");
  }  
  
  for(var k in r) output[a[k]].write(k," ");
  for(var j in r2) output[j].writeln();
  
  
  for(var j in r2) write(output[j].getString());
}

/*

which gives

0 : 3 6 9 
1 : 1 4 7 10 
2 : 2 5 8 

0 : 3 6 9 
1 : 1 4 7 10 
2 : 2 5 8 

0 : 3 6 9 
1 : 1 4 7 10 
2 : 2 5 8 


*/
