program A1;

//Задача: реализовать алгоритм сложения "столбиком", т.е.
//найти запись суммы с по символьным записям слагаемых a,b
//•	В тип integer разрешено переводить лишь цифры, не записи в целом! 


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

procedure readingData(var a, b: number; n, m: integer);
var
  i, j: integer;
  k: char; //Для считывания посимвольно
begin
  writeln('Введите первое число, в конце ввода поставьте точку'); //Блок ввода
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
  writeln('Введите второе число, в конце ввода поставьте точку');
  for j := 1 to nmax - 1 do
  begin
    read(k);
    if (k = '.') then break
        else 
    begin
      b[j] := k;
      inc(m);
    end;
  end;
end;

function maxLength(var n, m: integer): integer;
var
  l: integer;
begin
  if (m > n) then l := m + 1 //определяем максимальную длину суммы
  else l := n + 1;
  maxLength := l;
end;

procedure calculating(var n, m, l: integer; a, b: number; c: sum2; d: sum1);
var
  i, j, t, {индексы массивов}
  x, y{цифры, которые складываем в данный момент}: integer;
begin
  i := n; 
  j := m;
  for t := l downto 2 do //Блок вычислений
  begin
    if (i <> 0) then //Переводим символы в цифры
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
    if (x + y < 10) then c[t] := c[t] + x + y //Проводим вычисления 
        else 
    begin
      c[t - 1] := 1;
      c[t] := c[t] + ((x + y) mod 10);
    end;
  end;
  for t := 1 to l do //Перевод числа в строку
    d[t] := chr(c[t] + 48);
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
  readingData(a, b, n, m);
  l := maxLength(n, m);
  calculating(n, m, l, a, b, c, d);
  showResult(d, l);
end.
