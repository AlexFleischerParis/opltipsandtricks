// 1) solve it to get the solution.
//
//2) solve the corresponding LP with fixed integer variables
//
//3) get dual costs

    dvar int x in 0..10;
    dvar float y in 0..10;
     
    minimize x+y;
    subject to {
      ctx :   
        x >= 1/2;
      cty:
        y>=1/2;
    }
     
    main {
      var status = 0;
      thisOplModel.generate();
      if (cplex.solve()) {
        writeln("Integer Model");   
        writeln("OBJECTIVE: ",cplex.getObjValue());   
        writeln("dual CTX:",thisOplModel.ctx.dual);
        writeln("dual CTY:",thisOplModel.cty.dual);
      }
      var xvalue=thisOplModel.x.solutionValue;
     
      thisOplModel.convertAllIntVars();
      thisOplModel.x.UB=xvalue;
      thisOplModel.x.LB=xvalue;
      if (cplex.solve()) {
        writeln("Relaxed Model");   
        writeln("OBJECTIVE: ",cplex.getObjValue());  
        writeln("dual CTX:",thisOplModel.ctx.dual);
        writeln("dual CTY:",thisOplModel.cty.dual);
      }
     
    }

/*
gives

    Integer Model
    OBJECTIVE: 1.5
    dual CTX:undefined
    dual CTY:undefined
    Relaxed Model
    OBJECTIVE: 1.5
    dual CTX:0
    dual CTY:1
    
    */

