// Read 2D array from Excel
//
// More tips and tricks in 
//
// https://www.linkedin.com/pulse/tips-tricks-opl-cplex-alex-fleischer/
//
// And lastmile plug-in optimization 
//
// https://www.linkedin.com/pulse/plug-in-optimization-last-mile-alex-fleischer/

{string} origin=...;
{string} destination=...;

int value[origin][destination]=...;
// transpose of value
int value2[d in destination][o in origin]=value[o][d];

execute
{
 writeln("value =",value);
 writeln("value2 =",value2);
}

/*

which gives

value = [[1 4]
         [2 5]
         [3 6]]
value2 = [[1 2 3]
         [4 5 6]]
         
*/