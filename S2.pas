program S2;

const
  nmax = 4;
  
type 
  massive = array [1..nmax] of boolean;
  mas = array [1..nmax] of integer;
  
var
  a: massive;
  b: mas;
  flag: boolean;
  
procedure readMas(var a: massive; var b: mas);
var
  i: integer;
begin
  writeln ('Введите элементы множества');
  for i := 1 to nmax do
    readln(b[i]);
  for i := 1 to nmax do
    a[i] := true;
end;

function isMassive(var a: massive; b: mas): boolean;
var
  i, j, k{для запоминания элемента}: integer;
  flag: boolean;
begin
  flag := true;
  for i := 1 to nmax do
    begin
      k := b[i];
      for j := i + 1 to nmax do
        if k = b[j] then a[i] := false;
    end;
  for i := 1 to nmax do
    if a[i] = false then flag := false;
    result := flag;
end;

BEGIN
  readMas(a, b);
  flag := isMassive(a, b);
  if flag then writeln ('Последовательность является множеством')
    else writeln ('Последовательность не является множеством');
END.
