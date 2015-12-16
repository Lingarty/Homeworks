program A1;

const
  nmax = 1000;

type
  number = array [1..nmax - 1] of char;
  sum1 = array [1..nmax] of char;
  sum2 = array [1..nmax] of integer;

var
  a, b: number;
  c: sum2; //Сумма - число
  d: sum1; //Сумма - строка
  n{длина a}, m{длина b}, l{длина c}: integer;

procedure input(var a: number; var n: integer);
var
  i: integer;
  k: char; //Для считывания посимвольно
begin
  for i := 1 to nmax - 1 do
    begin
      read(k);
      if (k = '.') then break
        else 
          begin
            a[i] := k;
            inc(n);
          end;
    end;
  readln();
end;

function maxLength(var n, m: integer): integer; 
//задаёт максимальную длину суммы
var
  l: integer;
begin
  if (m > n) then l := m + 1 
  else l := n + 1;
  maxLength := l;
end;

procedure convertCharToInt(var i, j, x, y: integer; var a, b: number);
//Перевод символов в цифры
begin
  if (i <> 0) then 
    begin
      x := ord(a[i]) - 48;
      dec(i);
    end
    else x := 0;
      if (j <> 0) then
        begin
          y := ord(b[j]) - 48;
          dec(j);
        end
        else y := 0; 
end;

procedure convertIntToChar(var l: integer; var c: sum2; var d: sum1);
//Перевод числа в строку
var
  t: integer;
begin
  for t := 1 to l do 
    d[t] := chr(c[t] + 48);
end;

procedure calculating(var n, m, l: integer; a, b: number; var c: sum2; var d: sum1);
var
  i, j, t, {индексы массивов}
  x, y{цифры, которые складываем в данный момент}: integer;
begin
  i := n; 
  j := m;
  for t := l downto 2 do
  begin
    convertCharToInt(i, j, x, y, a, b);
    if (x + y < 10) then c[t] := c[t] + x + y //Проводим вычисления 
        else 
    begin
      c[t - 1] := 1;
      c[t] := c[t] + ((x + y) mod 10);
    end;
  end;
  convertIntToChar(l, c, d);
end;

procedure showResult(d: sum1; l: integer);
var
  t: integer;
begin
  writeln('Сумма введённых чисел равна '); //Блок вывода
  if (d[1] <> '0') then 
    for t := 1 to l do
      write(d[t])
  else 
    for t := 2 to l do
      write(d[t]);
end;

begin
  writeln('Введите первое число, в конце ввода поставьте точку');
  input(a, n);
  writeln('Введите второе число, в конце ввода поставьте точку');
  input(b, m);
  l := maxLength(n, m);
  calculating(n, m, l, a, b, c, d);
  showResult(d, l);
end.
