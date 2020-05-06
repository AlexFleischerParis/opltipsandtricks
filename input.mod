execute
    {

    function input(question)
    {
        var quote="\"";
        
        var python=new IloOplOutputFile("c:\\temp\\input.py");
        
        python.writeln("from tkinter import *");

        python.writeln("def save():");
        python.writeln("   print(popup.get())");
        python.writeln("   master.quit");

        python.writeln("master = Tk()");
        python.writeln("Label(master, text=",quote,question,quote,").grid(row=0)");


        python.writeln("popup= Entry(master)");

        python.writeln("popup.grid(row=0, column=1)");

        python.write("Button(master, text='Ok', command=master.quit).");
        python.writeln("grid(row=3, column=1, sticky=W, pady=4)");

        python.writeln("mainloop( )");

        python.writeln("res = open(",quote,"c:\\\\temp\\\\respopup.txt",quote,",",quote,"w",quote,")");
        python.writeln("res.write(popup.get())");
        
        python.writeln("res.close()");
        python.writeln("master.destroy()");
       
        python.close();
        
        IloOplExec("C:\\Python36\\python.exe c:\\temp\\input.py",true);
        var f=new IloOplInputFile("c:\\temp\\respopup.txt");
        var res=f.readline();
        f.close();
        return res;
    }


    var s=input("what is your name ?");
    writeln("hello ",s);

    } 
