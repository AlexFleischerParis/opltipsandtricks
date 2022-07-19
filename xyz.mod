dvar float x;
dvar float y;
dvar float z;

maximize x+y+z;
subject to
{
  z<=4;
  
  // x<=y<=z; does not work and should be turn into 2 constraints
  
  x<=y;
  y<=z;
  
}

/*

gives

x = 4;
y = 4;
z = 4;

*/
