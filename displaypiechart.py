import matplotlib.pyplot as plt

f = open("c://temp//parampiechart.txt", "r")
title=f.readline()
xstring=f.readline()
ystring=f.readline()
f.close();

x =  xstring.split(",")
sizes = [float(i) for i in ystring.split(",")]

labels = [i for i in x]



fig1, ax1 = plt.subplots()
ax1.pie(sizes, labels=labels, autopct='%1.1f%%',
        shadow=True, startangle=90)
ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

fig1.suptitle(title, fontsize=16)

plt.show()
