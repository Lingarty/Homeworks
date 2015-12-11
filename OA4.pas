program OA4;

const
  nmax = 10;
  
type 
  massive = array [1..nmax] of real;
  
var
  a1, a2, a3: massive;
  n, m, k {длины массивов}: integer;
  
procedure readMassive(var a: massive; var n: integer);
var
  i: integer;
begin
  for i := 1 to n do
    readln (a[i]);
end;

procedure unionOfElements(var a1, a2, a3: massive; var n, m, k: integer);
var
  i, q {индекс для a2}: integer;
begin
  k := 0;
  q := 1;
  for i := 1 to n do
    begin
      while (a2[q] < a1[i]) and (k <= m) do
        begin
          inc(k);
          a3[k] := a2[q];
          inc(q);
        end;
      if a2[q] = a1[i] then 
        inc(q);
      inc(k);
      a3[k] := a1[i];
    end;
  while (q <= m) do
    begin
      inc(k);
      a3[k] := a2[q];
      inc(q);
    end;
end;

procedure printMassive(m: massive; k: integer);
var
  i: integer;
begin
  for i := 1 to k do
    write (m[i], ' ');
  writeln();
end;

BEGIN
  writeln ('Введите длину первого массива');
  readln(n);
  writeln ('Введите элементы первого массива (по возрастанию)');
  readMassive(a1, n);
  writeln ('Введите длину второго массива');
  readln(m);
  writeln ('Введите элементы второго массива (по возрастанию)');
  readMassive(a2, m);
  write ('Объединение массивов: ');
  unionOfElements(a1, a2, a3, n, m, k);
  printMassive(a3, k);  
END.
