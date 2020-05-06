// use output form a first model as input into a second model

    main {
      var source1 = new IloOplModelSource("sub1.mod");
      var cplex = new IloCplex();
      var def1 = new IloOplModelDefinition(source1);
      var opl1 = new IloOplModel(def1,cplex);
      var data1= new IloOplDataElements();
      data1.maxOfx=5;
      opl1.addDataSource(data1);
      opl1.generate();
      if (cplex.solve()) {
         writeln("OBJ = " + cplex.getObjValue());
         opl1.postProcess();

      } else {
         writeln("No solution");
      }
       var source2 = new IloOplModelSource("sub2.mod");
      var cplex = new IloCplex();
      var def2 = new IloOplModelDefinition(source2);
      var opl2 = new IloOplModel(def2,cplex);
      var data2= new IloOplDataElements();
      data2.maxOfx=opl1.y.solutionValue; // transfer solution of model1 to input for model2
      opl2.addDataSource(data2);
      opl2.generate();

      if (cplex.solve()) {
         opl2.postProcess();
      } else {
         writeln("No solution");
      }

      opl1.end();
      opl2.end();
     
    }

/*
will give


    x= 5
    y= 10
    x= 10
    y= 30

sub.mod multiplies 5 by 2 and gives 10 which is the input for sub2.mod that will multiply 10 by 3 

*/
