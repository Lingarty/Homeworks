program M2;
 
const 
  n = 3;
  
type 
  matrix = array [1..n, 1..n] of integer;

var 
  m: matrix;
  square: boolean;

procedure reading(var a: matrix);
var
  i, j: integer;
begin
  writeln ('Введите элементы матрицы');
    for i := 1 to n  do
      for j := 1 to n do
        readln (a[i][j]);
end;

function isMagic(m: matrix): boolean;
type 
  line = array [1..n] of integer; //для подсчёта сумм по строкам
  column = array [1..n] of integer; //для подсчёта сумм по столбцам
  
var
  i, j: integer;
  lineSum: line;
  columnSum: column;
  
begin
  for i := 1 to n do
    for j := 1 to n do
      begin
        lineSum[i] := lineSum[i] + m[i,j];
        columnSum[j] := columnSum[j] + m[i,j];
      end;
  for i := 1 to n do
    if lineSum[i] <> columnSum[i] then isMagic := false
      else isMagic := true;
end;

procedure writing(square: boolean);
begin
  if square then writeln ('Введённая матрица является магическим квадратом')
    else writeln ('Введённая матрица не является магическим квадратом')
end;

BEGIN
  reading(m);
  square := isMagic(m);
  writing(square);
END.
