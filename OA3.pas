program OA3;

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

procedure deleteElements(var a1, a2, a3: massive; var n, m, k: integer);
var
  i, j, q: integer;
begin
  i := 1;
  q := 1;
  for j := 1 to m do 
    if a1[i] = a2[j] then 
      begin
        inc(i);
      end
      else
        begin
          inc(k);
          a3[q] := a2[j];
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
  writeln ('Введите длину первого массива (должен быть короче, чем второй)');
  readln(n);
  writeln ('Введите элементы первого массива (по возрастанию)');
  readMassive(a1, n);
  writeln ('Введите длину второго массива');
  readln(m);
  writeln ('Введите элементы второго массива (по возрастанию)');
  readMassive(a2, m);
  write ('Разность массивов: ');
  deleteElements(a1, a2, a3, n, m, k);
  printMassive(a3, k);  
END.
