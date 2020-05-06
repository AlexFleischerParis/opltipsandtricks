// I often got that question. So let me share a small example.
//
//subb1.mod
//
//    subject to
//    {
//    x<=1;
//    }
//
//subb2.mod
//
//    subject to
//    {
//    x<=2;
//    }

//
//
//    dvar int x in 0..3;
//
//    maximize x;
//    subject to
//    {
//
//    }
//
//    include "sub.mod";
//
//    execute
//    {
//    writeln("x=",x);
//    }
//
//and then

    main
    {
    var choice=1;


    var o=new IloOplOutputFile("sub.mod",false);
    o.writeln(" ");
    if (choice==1) o.writeln("include \"subb1.mod\";");
    if (choice==2) o.writeln("include \"subb2.mod\";");
    o.close();


      var source = new IloOplModelSource("model.mod");
      var cplex = new IloCplex();
      var def = new IloOplModelDefinition(source);
      var opl = new IloOplModel(def,cplex);
     
      opl.generate();
      if (cplex.solve()) {
         writeln("OBJ = " + cplex.getObjValue());

      } else {
         writeln("No solution");
      }
     
      opl.end();
     
    }

/*
will give

    OBJ = 1

if you change choice to 2 then you will get

    OBJ = 2
*/
