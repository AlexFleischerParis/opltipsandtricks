 /*
 
 Suppose we want to increase cost in a loop, we used to be able to write

    tuple bus
    {
     key int sizeBus;
     float costBus;
    }

    {bus} buses={<40,500>,<30,400>};


    // Now suppose we need to increase cost 20%

    execute
    {
    for(var b in buses) b.costBus=1.2*b.costBus;

    writeln(buses);
    }

But for many years now this gives an error about b being used already. And that's safe.

 

What we can write instead:
*/
 

    tuple bus
    {
     key int sizeBus;
     float costBus;
    }

    {bus} buses={<40,500>,<30,400>};


    // Now suppose we need to increase cost 20%
    range rangeBuses=0..card(buses)-1;

    execute
    {
    for(var indexbus in rangeBuses)
    {
        var b=Opl.item(buses,indexbus);
        b.costBus=1.2*b.costBus;
    }
    writeln(buses);
    }

/*
which works and gives

 

    {<40 600> <30 480>}

Not as easy to write as before but that leads to less bugs. (Less bugs but as many buses) 

*/
