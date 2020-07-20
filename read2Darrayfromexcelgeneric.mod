/*

In https://github.com/AlexFleischerParis/opltipsandtricks/blob/master/read2Darrayfromexcel.mod

we had to give the exact SheetRead range : 

value from SheetRead(sheet,"B2:D3");

In this example, let's see how we can compute this with prepare and invoke in OPL

.dat in

https://github.com/AlexFleischerParis/opltipsandtricks/blob/master/read2Darrayfromexcelgeneric.dat

*/

{string} origin=...;
{string} destination=...;


string sheetConnectionString="array2.xlsx";

// We compute this string out of origin and destination strings
string sheetReadString[1..1] = ...;
string theSheetReadString=sheetReadString[1];

int value[origin][destination]=...;
int value2[d in destination][o in origin]=value[o][d];

execute
{
 writeln("value =",value);
 writeln("value2 =",value2);
}

