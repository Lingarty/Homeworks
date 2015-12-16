program intersection;

const
  nmax = 50;

type
  mas = array [1..nmax] of integer;

var 
  n, m, l{Длины массивов}: byte;
  a, b, c: mas;

procedure input(var n, m: byte; var a, b: mas);
var
  i: integer;
begin
  writeln ('Введите длину первого массива (максимум 50 элементов)');
  readln (n);
  writeln ('Введите длину второго массива (максимум 50 элементов)');
  readln (m);
  writeln ('Введите элементы первого массива');
  for i := 1 to n do 
    readln (a[i]);
  writeln ('Введите элементы второго массива');
  for i := 1 to m do 
    readln (b[i]);
end;

procedure bubbleSort (var a: mas; n: integer);
var
  i, k, v: integer;
begin
  for k := 1 to (n - 1) do 
    for i := 1 to (n - 1) do
      if (a[i] > a[i + 1]) then 
        begin
          v := a[i];
          a[i] := a[i + 1];
          a[i + 1] := v;
        end;
end;

procedure findEqual (var a, b, c: mas; var l: byte);
var
  i, j, k, q {Считает,сколько раз увеличивался х}, x {Индекс для первого массива}: byte;
begin
  k := 1; 
  j := 1; 
  x := 1; 
  
  for i := 1 to n*m do
    begin
      if (a[x] = b[j]) then
        begin
          c[k] := a[x];
          inc(l);
          inc(x); 
          inc(q);
        end
      else 
        begin
          inc(j);
        end;
      if (j = m + 1) then
        begin
          j := 1;
          inc(x); 
          inc(q);
        end;
        if (q = 5) then break;
    end;
end;

procedure output(c: mas; l: byte);
var
  i: byte;
begin
  writeln ('Числа, которые содержатся в обоих массивах:');
  for i := 1 to l do
    write (c[i], ' ');
end;

begin
  input(n, m, a, b);
  bubbleSort(a, n);
  bubbleSort(b, m);
  findEqual(a, b, c, l);
  output(c, l);
end.
