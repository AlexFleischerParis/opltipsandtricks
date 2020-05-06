

    execute
    {

    // http://cwestblog.com/2013/09/05/javascript-snippet-convert-number-to-column-name/
    function toColumnName(num) {
      for (var ret = '', a = 1, b = 26; (num -= a) >= 0; a = b, b *= 26) {
        ret = String.fromCharCode(parseInt((num % b) / a) + 65) + ret;
      }
      return ret;
    }

    // 1,1 => A1  1,4 => D1 2,27 => AA2
    function convertR1C1toA1(r,c)
    {
    return(toColumnName(c)+r);
    }

    }

    int n=100;

    int cell[i in 1..n][j in 1..n]=i*j;

    string sheetWriteString;

    execute
    {
      writeln(sheetWriteString);
    sheetWriteString=convertR1C1toA1(1,1)+":"+convertR1C1toA1(n,n);
    writeln("sheetWriteString=",sheetWriteString);
    }

