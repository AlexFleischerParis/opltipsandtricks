    dvar int x in 0..3;

    maximize x;
    subject to
    {

    }

    include "sub.mod";

    execute
    {
    writeln("x=",x);
    }
