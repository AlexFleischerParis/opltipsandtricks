

    execute
    {

    function displayScriptArray1D(a)
    {
    var res="[";
    for(var i=1;i<=a.length-2;i++) res=res+a[i]+",";
    res=res+a[a.length-1];
    res=res+="]";
    return res;
    }


    // return a string for the display of array a that has n dimensions
    function displayScriptArraynD(a,n)
    {
    if (n==1) return displayScriptArray1D(a);

    var res="[";
    for(var i=1;i<=a.length-2;i++) res=res+displayScriptArraynD(a[i],n-1)+",";
    res=res+displayScriptArraynD(a[a.length-1],n-1);
    res=res+="]";
    return res;
    }

    }

    execute
    {
    var a2D=new Array(3);

    a2D[1]=new Array(1);
    a2D[2]=new Array(2);
    a2D[3]=new Array(3);

    a2D[1][1]="A";
    a2D[2][1]=1;
    a2D[2][2]=3;
    a2D[3][1]="B";
    a2D[3][2]=2;
    a2D[3][3]=4;

    writeln("a2D=",displayScriptArraynD(a2D,2));

    var a3D=new Array(2);

    a3D[1]=new Array(2);
    a3D[2]=new Array(2);


    a3D[1][1]=new Array(2);;
    a3D[1][2]=new Array(2);;
    a3D[2][1]=new Array(2);;
    a3D[2][2]=new Array(2);;

    for(var i=1;i<=2;i++) for(var j=1;j<=2;j++) for(var k=1;k<=2;k++) a3D[i][j][k]=4*(i-1)+2*(j-1)+k-1;

    writeln("a3D=",displayScriptArraynD(a3D,3));


    }

/*gives

 

    a2D=[[A],[1,3],[B,2,4]]
    a3D=[[[0,1],[2,3]],[[4,5],[6,7]]]
    
    */

