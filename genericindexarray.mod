

    int scale=10000000;

    tuple t
    {
    key int x;
    int y;
    }

    {t} s={<i,1+rand(scale)> | i in 1..scale};

    execute
    {
    s;
    }

    int lastxfory[1..scale]=[i.y : i.x | i in s];

    {int} xFory[y in 1..scale]={i.x | i in s : i.y==y};
    int lastxfory_through_slicing[y in 1..scale]=(card(xFory[y])==0)?0:last(xFory[y]);

    int lastxfory_through_scripting[1..scale];

    execute generic
    {
    var d1=new Date();
    lastxfory;
    var d2=new Date();
    writeln("time generic = ",d2-d1);
    }

    execute slicing
    {
    var d1=new Date();
    lastxfory_through_slicing;
    var d2=new Date();
    writeln("time slicing = ",d2-d1);
    }

    execute scripting
    {
    var d1=new Date();
    for(var i in s) lastxfory_through_scripting[i.y]=i.x;
    var d2=new Date();
    writeln("time scripting = ",d2-d1);
    }

     

    assert forall(i in 1..scale)
    lastxfory_through_slicing[i]==lastxfory[i];

    assert forall(i in 1..scale)
    lastxfory_through_scripting[i]==lastxfory[i];

/*

which gives

    time generic = 2611
    time slicing = 95879
    time scripting = 15093

*/