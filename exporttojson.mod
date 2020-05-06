

    tuple spoke
    {
    string name;
    int minDepTime;
    int maxArrTime;
    }

    {spoke} Spokes={<"A",360,1080>,<"B",400,1150>};

    execute
    {
    var f=new IloOplOutputFile("Spokes.json");
    f.write("{");
    f.write("\"Spokes\":");
    f.writeln("[");

    for(var i in Spokes)
    {
    f.write("{");

    for(var j=0;j<Spokes.getNFields();j++)
    {
      f.write("\"",Spokes.getFieldName(j),"\":");
      var value=i[Spokes.getFieldName(j)];
      var ty=typeof(value);
      if (ty=="string") f.write("\"");
      f.write(value);
     
      if (ty=="string") f.write("\"");
      if (j!=Spokes.getNFields()-1) f.write(",");
      f.writeln();
    }


    if (i!=Opl.last(Spokes)) f.writeln("},");
    else f.writeln("}");
    }


    f.writeln("]");
    f.writeln("}");
    f.close();

    }

/* 

gives

    {"Spokes":[
    {"name":"A",
    "minDepTime":360,
    "maxArrTime":1080
    },
    {"name":"B",
    "minDepTime":400,
    "maxArrTime":1150
    }
    ]
    }
    
    */

