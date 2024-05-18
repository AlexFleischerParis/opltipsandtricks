import json
def JSonToTupleSet(jsonfilename,datname):
        with open(jsonfilename) as data_file:    
             data = json.load(data_file)
     
        # write that into a .dat
     
        res = open(datname, "w")

        quote='"'

        print(data)


        for i in data:
            print(i)
            ii=data[i]
        
            res.write(i);
            res.write("={")
            res.write("\n")

            for j in ii:
          
              res.write("<")
              for j2 in j:
                 print("j2=",j2)
                 
                 jj=j[j2]
                 print("type",type(jj))
             
                 if (jj==jj):
                     if (type(jj)==str) or (type(jj)==list):
                       res.write("\"")
                     res.write(str(jj))
                     if (type(jj)==str) or (type(jj)==list):
                        res.write("\"")
                     res.write(",")
              res.write(">,")    
              res.write("\n")
        
     
            res.write("};")
       
        res.close()


JSonToTupleSet("spokes.json","spokes.dat")
    
