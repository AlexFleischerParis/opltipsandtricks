

    tuple edge
    {
        key int o;
        key int d;
        int weight;
    }

    {edge} edges=...;

    {int} nodes={i.o | i in edges} union {i.d | i in edges};

    range r=1..-2+ftoi(pow(2,card(nodes)));
    {int} nodes2 [k in r] = {i | i in nodes: ((k div (ftoi(pow(2,(ord(nodes,i))))) mod 2) == 1)};

    dvar boolean x[edges];

    minimize sum (e in edges) x[e]*e.weight;
    subject to
    {
    sum(e in edges) x[e]==card(nodes)-1;

    // Subtour elimination constraints.
       
    forall(k in r)  // all subsets but empty and all
        sum(e in edges:(e.o in nodes2[k]) && (e.d in nodes2[k])) x[e]<=card(nodes2[k])-1;  
       
    }

    {edge} solution={e | e in edges : x[e]==1};

    execute
    {
    writeln("minimum spanning tree ",solution);
    }


/*
which gives

    minimum spanning tree  {<1 4 8> <2 3 3> <3 5 2> <4 5 8> <4 7 7> <5 6 2> <7 8 4>
         <8 9 1> <9 10 3>}
         
         */

