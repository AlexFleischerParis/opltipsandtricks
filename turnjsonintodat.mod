/*

 common question : I have a json file and I need to turn that into a .dat so that I can run OPL

Let me show you the way.

You have

Nurses.json

    {"Nurses":[
    {"name":"Anne",
    "seniority":11,
    "qualification":1,
    "payRate":25
    },
    {"name":"Bethanie",
    "seniority":4,
    "qualification":5,
    "payRate":28
    },
    {"name":"Betsy",
    "seniority":2,
    "qualification":2,
    "payRate":17
    }
    ]
    }

 

and

Spokes.json

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

 

then if you run readJSON.py

    import json

    def JSonToTupleSet(jsonfilename,datname):
        with open(jsonfilename) as data_file:    
             data = json.load(data_file)
     
        # write that into a .dat
     
        res = open(datname, "w")

        quote='"'


        for i in data:
            ii=data[i]
        
            res.write(i);
            res.write("={")
            res.write("\n")

            for j in ii:
          
              res.write("<")
              for j2 in j:
                 jj=j[j2]
             
                 if (jj==jj):
                     if (type(jj)==str):
                       res.write("\"")
                     res.write(str(jj))
                     if (type(jj)==str):
                        res.write("\"")
                     res.write(",")
              res.write(">,")    
              res.write("\n")
        
     
            res.write("};")
       
        res.close()


    JSonToTupleSet("Nurses.json","nurses.dat")
    JSonToTupleSet("Spokes.json","spokes.dat")

 

then you ll get

Nurses.dat

    Nurses={
    <"Anne",11,1,25,>,
    <"Bethanie",4,5,28,>,
    <"Betsy",2,2,17,>,
    };

and

Spokes.dat

    Spokes={
    <"A",360,1080,>,
    <"B",400,1150,>,
    };


*/
