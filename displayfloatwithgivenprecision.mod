

    execute
    {

    function toGivenPrecision(v, prec) {
    var m = Opl.pow(10,prec);
    var s = "" + Opl.round(m * v) / m;
    var idx = s.indexOf(".");
    if(idx >= 0 && idx+prec < s.length)
    {
    s = s.substring(0,idx+prec+1);
    }
    return (s);
    }

    var f=1.23456;
    writeln(toGivenPrecision(f,4));
    writeln(toGivenPrecision(f,3));
    writeln(toGivenPrecision(f,2));
    writeln(toGivenPrecision(f,1));


    }

/*

which gives

    1.2346
    1.235
    1.23
    1.2
*/
