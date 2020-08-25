execute
{
  includeScript("opl_popup.js");
  var res=showOption("Do you want to solve this ?","Question","Yes","No");
  if (res==0) writeln("This is a yes");
  else writeln("This is a no");
}
