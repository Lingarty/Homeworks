program OA2;

const
  nmax = 10;
  
type 
  massive = array [1..nmax] of real;
  
var
  a1, a2: massive;
  n, m {длины массивов}: integer;
  a: boolean;
  
procedure readMassive(var a: massive; var n: integer);
var
  i: integer;
begin
  for i := 1 to n do
    readln (a[i]);
end;

function includeElements(var a1, a2: massive; n, m: integer): boolean;
var
  i, j, q{сколько символов вошло на данный момент}: integer;
  answer: boolean;
begin
  i := 1;
  for j := 1 to m do
      if a1[i] = a2[j] then 
        begin
          inc(q);
          inc(i);
        end;
  if q = n then answer := true;
  includeElements := answer;
end;

BEGIN
  writeln ('Введите длину первого массива (должен быть короче, чем второй)');
  readln(n);
  writeln ('Введите элементы первого массива (по возрастанию)');
  readMassive(a1, n);
  writeln ('Введите длину второго массива.');
  readln(m);
  writeln ('Введите элементы второго массива (по возрастанию)');
  readMassive(a2, m);
  
  a := includeElements(a1, a2, n, m);
  if a then writeln('Один массив входит в другой :)')
    else writeln('Ни один массив не входит в другой :(');
END.
