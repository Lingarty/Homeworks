program trans_matrix;

const
  n = 3;
  
type
  matrix = array [1..n, 1..n] of integer;

var
  m, t: matrix;
  
procedure reading(var m: matrix);
var
  i,j: integer;
begin
  writeln ('Введите элементы матрицы');
  for i := 1 to n do
    for j := 1 to n do
      readln(m[i][j]);
end;

procedure transposing(var m, t: matrix);
var 
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      t[i][j] := m[j][i];
end;

procedure writing (m: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do
    begin
      for j := 1 to n do
        write (m[i][j], ' ');
      writeln();
    end;
end;

BEGIN
  reading(m);
  transposing(m, t);
  writing(m);
  writeln();
  writing(t);
END.
