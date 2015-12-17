program OA5;
  
type 
  massive = array of real;
  
var
  a1, a2, a3: massive;
  n, m, k {длины массивов}: integer;
  
procedure readMassive(var a: massive; var n: integer);
var
  i: integer;
begin
  for i := 0 to n - 1 do
    readln (a[i]);
end;

procedure bubbleSort (var a: massive; n: integer);
var
  i, k: integer;
  v: real;
begin
  for k := 0 to (n - 2) do 
    for i := 0 to (n - 2) do
      if (a[i] > a[i + 1]) then 
        begin
          v := a[i];
          a[i] := a[i + 1];
          a[i + 1] := v;
        end;
end;

function length(var n, m: integer): integer; //начальная длина массива-результата
begin
  if n > m then length := n
    else length := m;
end;

procedure findEqualElements(var a1, a2, a3: massive; var n, m, k: integer);
var
  i, j, q, l {макс длина a3}: integer;
begin
 l := length (n, m);
 SetLength(a3, l);
  while (i <= n - 1) and (j <= m - 1) do
    begin
      if a1[i] = a2[j] then
        begin
          a3[q] := a1[i];
          inc(q);
          inc(i);
          inc(k);
        end;
      inc(j);
    end;
  SetLength(a3, k);
end;

procedure printMassive(m: massive; k: integer);
var
  i: integer;
begin
  for i := 0 to k - 1 do
    write (m[i], ' ');
  writeln();
end;

BEGIN
  writeln ('Введите длину первого массива');
  readln(n);
  SetLength(a1, n);
  writeln ('Введите элементы первого массива');
  readMassive(a1, n);
  bubbleSort(a1, n);
  
  writeln ('Введите длину второго массива');
  readln(m);
  SetLength(a2, m);
  writeln ('Введите элементы второго массива');
  readMassive(a2, m);
  bubbleSort(a2, m);
  
  findEqualElements(a1, a2, a3, n, m, k);
  write ('Пересечение массивов: ');
  printMassive(a3, k);  
END.
