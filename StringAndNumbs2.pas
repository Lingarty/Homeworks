program string_and_numbs_2;

const 
  nmax = 4;
  
type
  massive = array [1.. nmax] of char;
  
var
  a: massive;
  i: integer;
  flag: boolean;
  number, numeral, power: real;
  
procedure reading (var simbol: char);
begin
  writeln ('Введите символ');
  readln(simbol);
end;

function isNumber(simbol: char): boolean;
var 
  flag: boolean;
begin
  if (integer(simbol) < 58) and (integer(simbol) > 47) then flag := true
    else flag := false;
  isNumber := flag;
end;

BEGIN
  for i := 1 to nmax do
    begin
      reading(a[i]);
      flag := isNumber(a[i]);
      if flag then 
        begin
          power := exp(ln(10) * (nmax - i));
          numeral := integer(a[i]) - 48;
          number := numeral * power + number;
        end
        else break;
   end;
   if number = 0 then writeln (-1)
     else writeln (number);
END.
