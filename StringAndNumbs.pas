program string_and_numbs_1;

var
  simbol: char;
  flag: boolean;
  
procedure reading (var simbol: char);
begin
  writeln ('Введите символ');
  readln(simbol);
end;

function isNumber(simbol: char): boolean;
var 
  flag: boolean;
begin
  if (integer(simbol) < 58) and (integer(simbol) > 47) then flag := true;
  isNumber := flag;
end;

BEGIN
  reading(simbol);
  flag := isNumber(simbol);
  if flag then writeln (integer(simbol))
    else writeln (-1);
END.
