from docplex.mp.model import Model

f = open("c://temp//paramdisplaypoints.txt", "r")

xstring=f.readline()
ystring=f.readline()
colorstring=f.readline()
f.close();

x =  xstring.split(",")
y =  ystring.split(",")
colors =  colorstring.split(",")

#print(x)
#print(colors)

realcolors=["po","go","ro","bo","yo"]

l=len(x)

import numpy as np 
import matplotlib.pyplot as plt

for i in range(0,l):
    print(x[i]," ",y[i])
    plt.plot(int(x[i]),int(y[i]),realcolors[int(colors[i])])
plt.show()    
