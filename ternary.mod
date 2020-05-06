/* 
 
 With CPO we can write

    using CP;

    dvar  int x in -10..10;


    dexpr int y=(x>=0)?2:3;

    subject to
    {
      y==3;
    }

    execute
    {
      writeln("x=",x);
    }

We can read the definition of y as if (x>=0 then y is 2 else y is 3

But with CPLEX that does not work.We get an error, decision variable x not allowed

 

But we can write
*/
 

    dvar  int x in -10..10;

    dexpr int y=(x>=0)*2+(x<=-1)*3;


    subject to
    {
      y==3;
    }

    execute
    {
      writeln("x=",x);
    }

