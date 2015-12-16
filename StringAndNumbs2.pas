program string_and_numbs_2;

const 
  nmax = 4;
  
type
  massive = array [1.. nmax] of char;
  
var
  a: massive;
  i: integer;
  flag: boolean;
  number: real;
  
procedure reading (var a: massive);
var
  i: integer;
begin
  writeln ('Введите набор символов');
  for i := 1 to nmax do
    read(a[i]);
end;

function isNumber(a: massive): boolean;
var 
  flag: array [1..nmax] of boolean;
  i, q: integer;
begin
  //допустим, все символы числа
  for i := 1 to nmax do
    flag[i] := true;
  //если это не так, для первого символа условие изменится
  for i := 1 to nmax do
    if (integer(a[i]) > 58) or (integer(a[i]) < 47) then 
      begin
        flag[i] := false;
      end;
  //проверяем, что условие осталось true для всех элементов
  for i := 1 to nmax do 
    if flag[i] = true then inc(q);
  //выводим результат
  if q = nmax then result := true
    else result := false;
end;

procedure createNumber(var number: real; a: massive);
var
  numeral, power: real;
  i: integer;
begin
  for i := 1 to nmax do
    begin
      power := exp(ln(10) * (nmax - i));
      numeral := integer(a[i]) - 48;
      number := numeral * power + number;
    end;
end;

procedure output(number: real);
begin
  if number = 0 then writeln (-1)
     else writeln (number);
end;

BEGIN
  reading(a);
  flag := isNumber(a);
  if flag then createNumber(number, a);
  output(number);
END.
