  
/*
in https://www.linkedin.com/pulse/making-decision-optimization-simple-alex-fleischer/

Flow control and incremental changes

we saw how to do incremental changes with OPL CPLEX

 

A common question I got is how to do many changes and not only one ?

 

Users tend to write

 

    thisOplModel.ctKids1.UB=2*(40*thisOplModel.nbBus40+thisOplModel.nbBus30*30);
     thisOplModel.ctKids2.LB=2*(40*thisOplModel.nbBus40+thisOplModel.nbBus30*30);

but this does not work since as soon as you set the first UB the model gets infeasible and you cannot get the second value in the second line.

 

What should be done instead is go through a buffer:

 

    var buffer=2*(40*thisOplModel.nbBus40+thisOplModel.nbBus30*30);
        
        thisOplModel.ctKids1.UB=buffer;
        thisOplModel.ctKids2.LB=buffer;

regards

 

*/

 

//complete example

 

        int nbKids=300;
        float costBus40=500;
        float costBus30=400;
         
        dvar int+ nbBus40;
        dvar int+ nbBus30;
         
        minimize
         costBus40*nbBus40  +nbBus30*costBus30;
         
        subject to
        {
         ctKids1:40*nbBus40+nbBus30*30<=nbKids;
         ctKids2:nbKids<=40*nbBus40+nbBus30*30;
        }

        execute
        {
        writeln("nbBus40 = ",nbBus40);
        writeln("nbBus30 = ",nbBus30);
        }

        main
        {
        thisOplModel.generate();

        cplex.solve();
        thisOplModel.postProcess();

        //now 600 kids instead of 300
        writeln("now 600 kids instead of 300");
            
        //thisOplModel.ctKids1.UB=600;
        //thisOplModel.ctKids2.LB=600;
        
        // The following two lines do not work
        
        //thisOplModel.ctKids1.UB=2*(40*thisOplModel.nbBus40+thisOplModel.nbBus30*30);
        //thisOplModel.ctKids2.LB=2*(40*thisOplModel.nbBus40+thisOplModel.nbBus30*30);
        
        var buffer=2*(40*thisOplModel.nbBus40+thisOplModel.nbBus30*30);
        
        thisOplModel.ctKids1.UB=buffer;
        thisOplModel.ctKids2.LB=buffer;

        cplex.solve();
        thisOplModel.postProcess();

        }

