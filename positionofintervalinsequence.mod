

    using CP;

    int n=5;

    range r=1..n;
    range r0=0..n;

    dvar interval itvs[i in r] size i;

    dvar sequence  seq in all(i in r)itvs[i] types all(i in r)i;

    dvar int nextType[i in r];
    dvar int rank[i in r0];
    dvar int rankbis[i in r] in r;
    dvar int typeInSequence[r] in r; // compute the type of ith interval in the sequence

    subject to
    {

    // input

    noOverlap(seq);
    startBeforeStart(itvs[1],itvs[3]);
    startBeforeStart(itvs[3],itvs[5]);
    startBeforeStart(itvs[5],itvs[2]);
    startBeforeStart(itvs[2],itvs[4]);

    // and then let s compute typeInSequence

    forall(i in 1..n) nextType[i]==(typeOfNext(seq,itvs[i],0));

    rank[1]==1;
    forall(i in 1..n)  (nextType[i]!=0) => (rank[i]+1==rank[nextType[i]]);

    forall(i in r) rankbis[i]==rank[i];

    inverse(rankbis,typeInSequence);

     

    }

    execute
    {
    writeln("ranks = ",rankbis);
    writeln("typeInSequence = ",typeInSequence);

    }
    
/*

which gives

 

    ranks =  [1 4 2 5 3]
    typeInSequence =  [1 3 5 2 4]
*/