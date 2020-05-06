

    execute
    {
    cplex.datacheck=2;
    }

    dvar float x;
    maximize x;
    subject to
    {
    ct:x+0.3333333333<=2;
    }

//works fine but in the log we get
//
//    CPLEX Warning  1036: Decimal part of coefficient for right-hand side in constraint 'ct' looks like 2/3 in single precision.

