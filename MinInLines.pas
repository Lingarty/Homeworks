program  MinInLines;

const
  n = 3;
  
type
  matrix = array [1..n, 1..n] of integer;
  line = array [1..n] of integer;

var
  m: matrix;
  min: line;
  
procedure reading(var m: matrix);
var
  i, j: integer;
begin
  writeln ('Введите элементы матрицы');
  for i := 1 to n do
    for j := 1 to n do
      readln(m[i][j]);
end;

procedure searchingMins(var min: line; m: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do
    min[i] := 32767;
  for i := 1 to n do
    for j := 1 to n do
      if m[i][j] < min [i] then min[i] := m[i][j];
end;
  
procedure writing (m: line);
var
  i: integer;
begin
  for i := 1 to n do
    writeln ('Минимум ', i, '-ой строки: ', m[i]);
end;

BEGIN
  reading(m);
  searchingMins(min, m);
  writing(min);
END.
