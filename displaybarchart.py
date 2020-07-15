import matplotlib.pyplot as plt

plt.style.use('ggplot')

f = open("c://temp//parambarchart.txt", "r")
title=f.readline()
xlabel=f.readline()
ylabel=f.readline()
xstring=f.readline()
ystring=f.readline()
f.close();

x =  xstring.split(",")
values = [float(i) for i in ystring.split(",")]

x_pos = [i for i, _ in enumerate(x)]

plt.bar(x_pos, values, color='green')
plt.xlabel(xlabel)
plt.ylabel(ylabel)
plt.title(title)

plt.xticks(x_pos, x)

plt.show()
