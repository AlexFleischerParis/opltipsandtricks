     execute
    {

    // return a string for the display of array a
    function displayScriptArray1D(a)
    {
    var res="[";
    for(var i=1;i<=a.length-2;i++) res=res+a[i]+",";
    res=res+a[a.length-1];
    res=res+="]";
    return res;
    }

    // return the scripting array with the values that are in the OPL array _array  with the indexes _index
    function copyToScriptArray1D(_array,_index)
    {
    var res=new Array(Opl.card(_index));
    var j=0;
    for(var i in _index)
    {
      j++;
      res[j]=_array[i];
    }
    return res;
    };

    // return the scripting array with the values that are in the OPL array _array  with the indexes _index
    function copyFromScriptArray1D(scriptingArray,oplArray,_index)
    {

    var j=0;
    for(var i in _index)
    {
      j++;
      oplArray[i]=scriptingArray[j];
    }

    };

    }

    {string} s={"A","B","C"};

    int a[i in s]=ord(s,i);
    string b[i in s]=i;

    range rc=1..10;
    range rd=1..2;
    int c2[1..10];
    string d2[1..2];

    execute
    {

    var a2=copyToScriptArray1D(a,s);
    writeln("a2 = ",displayScriptArray1D(a2));

    var b2=copyToScriptArray1D(b,s);
    writeln("b2 = ",displayScriptArray1D(b2));

    var c=new Array(10);
    for(var i=1;i<=10;i++) c[i]=10*i;

    var d=new Array(2);
    d[1]="Hello";
    d[2]="World";

    copyFromScriptArray1D(c,c2,rc);
    copyFromScriptArray1D(d,d2,rd);

    writeln("c2 = ",c2);
    writeln("d2 = ",d2);


    }
/*
which gives

 

    a2 = [0,1,2]
    b2 = [A,B,C]
    c2 =  [10 20 30 40 50 60 70 80 90 100]
    d2 =  ["Hello" "World"]
*/
