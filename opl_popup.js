// https://github.com/c3c/OPL-goodies

/* 
 * Window dialogs for use in OPL models
 * By Cedric Van Bockhaven
 */

// Init windows theme
IloOplCallJava(
  "javax.swing.UIManager", 
  "setLookAndFeel", 
  "(Ljava/lang/String;)V", 
  IloOplCallJava("javax.swing.UIManager", "getSystemLookAndFeelClassName", ""));

// Window dialogs

/*
 * dialog types
 * error : 1
 * info : 2
 * warning: 3
 * question : 4
 */

function alert(msg) {
  showMessage(msg, "Alert", 3);
}

function confirm() {
  // in JS this would be boolean, yes/true and no/false, in Java it's inverse
  return 1-showOption(msg, title);
}

function showMessage(msg, title, type) {
  if (!type) type = 2;
  IloOplCallJava(
    "javax.swing.JOptionPane", "showMessageDialog", 
    "(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V", null, msg, title, type-1);
}

function showOption(msg, title, opt1, opt2, opt3) {
  if (!opt1) opt1 = "OK";
  if (!opt2) opt2 = "Cancel";
  
  var options = new Array(opt1, opt2);
  if (opt3) options.push(opt3);
  
  var res = IloOplCallJava(
    "javax.swing.JOptionPane", 
    "showOptionDialog", 
    "(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;IILjavax/swing/Icon;[Ljava/lang/Object;Ljava/lang/Object;)I", 
    null, msg, title, 
    options.length == 2 ? 0 /*YES_NO_OPTION*/ : 1 /*YES_NO_CANCEL_OPTION*/, 3 /*QUESTION_MESSAGE*/,
    null, options, options[options.length-1] /*ca marche pas*/);
  
  return res >= 0 ? res : options.length-1;
}