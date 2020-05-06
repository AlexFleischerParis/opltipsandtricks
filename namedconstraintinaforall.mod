 /*
 
 labeled constraints work fine in a forall block:

 

    range M=1..2;

    dvar int x[M];

     

    subject to {

    forall (m in M)
    {
    ct1:

     ((x[m])>=2);

     

    ct2:

     ((x[m])>=3);

    }
    }

However sometimes for some reason, some users prefer to use named constraints.

But

    range M=1..2;

    dvar int x[M];

    constraint ct1[M];
    constraint ct2[M];

    subject to {

    forall (m in M)
    {
    ct1[m]=

     ((x[m])>=2);

     

    ct2[m]=

     ((x[m])>=3);

    }
    }

leads to an error. Because today we cannot use named constraint in a forall.

Instead we should write:

*/

    range M=1..2;

    dvar int x[M];

    constraint ct1[M];
    constraint ct2[M];

    subject to {

    forall (m in M)

    ct1[m]=

     ((x[m])>=2);


    forall (m in M)

    ct2[m]=

     ((x[m])>=3);


    }


