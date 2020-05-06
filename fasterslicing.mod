/*

 For performance tuning I recommend this pdf : https://www-01.ibm.com/support/docview.wss?uid=swg27039021&aid=1

Very often slicing within CPLEX extraction takes some time because we ask again and again the same slicing question.

 

For instance

 

    int n=10000;
    int m=100;
    int l=100;

    int v[i in 1..n]=rand(m);

    dvar boolean x[1..n];
    dvar int y[1..l][0..m-1];

    subject to
    {

    forall(k in 1..l,j in 0..m-1) y[k][j]==k+sum(i in 1..n:v[i]==j) x[i];

    }

takes 2 minutes and 10 sec

 

What we should do then is save the slicing results in sets so that we do not compute those in forall.

 */

    int n=10000;
    int m=100;
    int l=100;

    int v[i in 1..n]=rand(m);

    {int} vPerm[j in 0..m-1]={i | i in 1..n : v[i]==j};

    dvar boolean x[1..n];
    dvar int y[1..l][0..m-1];

    subject to
    {

    forall(k in 1..l,j in 0..m-1) y[k][j]==k+sum(i in vPerm[j]) x[i];

    }

 
/*
takes 2 sec.

 

The trick is that we saved

    {int} vPerm[j in 0..m-1]={i | i in 1..n : v[i]==j};

in order not to recompute this 100 times and the code is nearly 100 times faster 

*/
