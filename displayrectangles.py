from docplex.mp.model import Model

f = open("c://temp//paramdisplayrectangles.txt", "r")

xstring=f.readline()
ystring=f.readline()
x2string=f.readline()
y2string=f.readline()

f.close();

x =  xstring.split(",")
y =  ystring.split(",")
x2 =  x2string.split(",")
y2 =  y2string.split(",")


#print(x)
#print(colors)

#realcolors=["po","go","ro","bo","yo"]

l=len(x)

import numpy as np 
import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig = plt.figure()
ax = fig.add_subplot(111)


for i in range(0,l):
    print(x[i]," ",y[i])
    print(x2[i]," ",y2[i])
    #plt.plot(int(x[i]),int(y[i]),realcolors[int(colors[i])])
    
    plt.plot([int(x[i]),int(x2[i])],[int(y[i]),int(y[i])],color='k',marker='o')
    plt.plot([int(x2[i]),int(x2[i])],[int(y[i]),int(y2[i])],color='k',marker='o')
    plt.plot([int(x2[i]),int(x[i])],[int(y2[i]),int(y2[i])],color='k',marker='o')
    plt.plot([int(x[i]),int(x[i])],[int(y2[i]),int(y[i])],color='k',marker='o')
    rect = patches.Rectangle((int(x[i]),int(y[i])), int(x2[i])-int(x[i]), int(y2[i])-int(y[i]), color='yellow')
    ax.add_patch(rect)
plt.show()    
