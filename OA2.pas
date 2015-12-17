program OA2;
  
type 
  massive = array of real;
  
var
  a1, a2: massive;
  n, m {длины массивов}: integer;
  
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

function includeElements(var a1, a2: massive; n, m: integer): boolean;
var
  i, j, q{сколько символов вошло на данный момент}: integer;
begin
   while (i <= n - 1) and (j <= m - 1) do
    begin
      if (m > n) then
        begin
          if a1[i] = a2[j] then
            begin
              inc(q);
              inc(i);
            end;
          inc(j);
        end
        else
          begin
            if a1[i] = a2[j] then
              begin
                inc(q);
                inc(j);
              end;
            inc(i);
          end;
      end;
  if (q = n) or (q = m) then result := true;
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
  
  if includeElements(a1, a2, n, m) then writeln('Один массив входит в другой :)')
    else writeln('Ни один массив не входит в другой :(');
END.
