 /*
 
 Many OPL users asked me about range arrays.

They want to write something like

    {string} centuries={"XIX","XX"};

    range years[centuries]=[1800..1899,1900..1999];

    execute
    {
    writeln(years);
    }

But with CPLEX 12.10 that's not allowed and you get an error.

Instead you could write

*/

    {string} centuries={"XIX","XX"};

    int yearsLB[centuries]=[1800,1900];
    int yearsUB[centuries]=[1899,1999];

    execute
    {
    for(var i in centuries) writeln(i, " : from ",yearsLB[i], " to ",yearsUB[i]);
    }

/*
which gives

    XIX : from 1800 to 1899
    XX : from 1900 to 1999
    
    */

