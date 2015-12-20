program OA4;
  
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

procedure unionOfElements(var a1, a2, a3: massive; var n, m, k: integer);
var
  i, q {индекс для a2}: integer;
begin
  k := n * m;
  q := 1;
  SetLength(a3, k);
  k := 0;
  for i := 0 to n * m - 1 do
    begin
      while (a2[q] < a1[i]) do
        if k <= m then 
        begin
          begin
            inc(k);
            a3[k] := a2[q];
            inc(q);
          end;
          if a2[q] = a1[i] then 
            inc(q);
          inc(k);
          a3[k] := a1[i];
        end 
          else 
            begin
              inc(k);
              a3[k] := a2[q];
              inc(q);
            end;
    end;
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
  writeln ('Введите элементы первого массива (по возрастанию)');
  readMassive(a1, n);
  writeln ('Введите длину второго массива');
  readln(m);
  SetLength(a2, m);
  writeln ('Введите элементы второго массива (по возрастанию)');
  readMassive(a2, m);
  write ('Объединение массивов: ');
  unionOfElements(a1, a2, a3, n, m, k);
  printMassive(a3, k);  
END.
