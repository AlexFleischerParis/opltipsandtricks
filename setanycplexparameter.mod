 /*
 
 To set a cplex parameter, one may use a .ops file or an execute block as can be seen at https://www.ibm.com/developerworks/community/forums/html/topic?id=af1033e1-a064-4a7c-89bc-8c4123d73078&ps=25

But sometimes there is no OPL CPLEX settings:

For instance CPXPARAM_Output_CloneLog

So what do do ?

 

First find the Id in cpxconst.h that is in CPLEX_Studio129\cplex\include\ilcplex

In this case:

    #define CPXPARAM_Output_CloneLog 1132

And then

*/

    execute {

    cplex.params[1132] = 1;

    }

//Of course you should replace 1132 by the identifier you find and 1 by the value you need. 
