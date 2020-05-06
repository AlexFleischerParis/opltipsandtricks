// multiply by 3

    float maxOfx = ...;
        dvar float x;
        dvar float y;

        maximize y;
        subject to {
          ct:x<=maxOfx;
          y==3*x;
        }

        execute
        {
        writeln("x= ",x);
        writeln("y= ",y);
        }

