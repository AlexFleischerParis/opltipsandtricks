 /*
 
 I am often asked how to turn a tuple set into a 2 dimension array in OPL.

You have something like

    tuple t
    {
     int field1;
     int field2;
     int field3;
    }

    {t} s={<1,2,3>,<2,3,8>};

and you need a 2D array

 

I generally offer 2 options:

1) Use a non generic way which relies on ternary operators

/*

    tuple t
    {
     int field1;
     int field2;
     int field3;
    }

    {t} s={<1,2,3>,<2,3,8>};
    int a[i in 1..2][j in 1..3]=
    (j==1)?item(s,i-1).field1
    :(j==2)?item(s,i-1).field2
    :(j==3)?item(s,i-1).field3:-1;

    execute
    {
    writeln("s = ",s);

    writeln("a = ",a);
    }

    tuple t2
    {
     string city1;
     string city2;
     
    }

    {t2} s2={<"London","Paris">,<"Paris","Geneva">,<"Brussels","Paris">};
    string a2[i in 1..3][j in 1..2]=
    (j==1)?item(s2,i-1).city1
    :(j==2)?item(s2,i-1).city2
    :"ko";


    execute
    {
    writeln("s2 = ",s2);

    writeln("a2 = ",a2);
    }

which gives

    s =  {<1 2 3> <2 3 8>}
    a =  [[1 2 3]
             [2 3 8]]
    s2 =  {<"London" "Paris"> <"Paris" "Geneva"> <"Brussels" "Paris">}
    a2 =  [["London" "Paris"]
             ["Paris" "Geneva"]
             ["Brussels" "Paris"]]

*/

//2) A generic way which relies on scripting

    execute
    {
    // turn tupleset tupleSet into an array, array has already the right size

    function turnTupleSetInto2DArray(tupleSet,array)
    {
    var nbFields=tupleSet.getNFields();
    var rank=0;
    for(var i in tupleSet)
    {
    rank++;
    for(var j=0;j<nbFields;j++)
    {


    var value=i[tupleSet.getFieldName(j)];

    array[rank][j+1]=value;

    }
    }
    }
    }

     

    tuple t
    {
     int fieldl1;
     int field2;
     int field3;
    }

    {t} s={<1,2,3>,<2,3,8>};
    int a[1..2][1..3];

    execute
    {
    writeln("s = ",s);
    turnTupleSetInto2DArray(s,a);
    writeln("a = ",a);
    }

    tuple t2
    {
     string city1;
     string city2;
     
    }

    {t2} s2={<"London","Paris">,<"Paris","Geneva">,<"Brussels","Paris">};
    string a2[1..3][1..2];

    execute
    {
    writeln("s2 = ",s2);
    turnTupleSetInto2DArray(s2,a2);
    writeln("a2 = ",a2);
    }

/*
which gives

    s =  {<1 2 3> <2 3 8>}
    a =  [[1 2 3]
             [2 3 8]]
    s2 =  {<"London" "Paris"> <"Paris" "Geneva"> <"Brussels" "Paris">}
    a2 =  [["London" "Paris"]
             ["Paris" "Geneva"]
             ["Brussels" "Paris"]]
             
             */

