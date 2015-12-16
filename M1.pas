program M1;

const 
  n = 3;
  
type 
  matrix = array [1..n, 1..n] of integer;
  //следующие типы нужны для saddlePoints, их описание там
  line = array [1..n] of integer;
  column = array [1..n] of integer;

var 
  m: matrix;

procedure reading(var a: matrix);
var
  i, j: integer;
begin
  writeln ('Введите элементы матрицы');
    for i := 1 to n  do
      for j := 1 to n do
        readln (a[i][j]);
end;

procedure writing(maxLine, minline: line; maxColumn, minColumn: column);
var
  i, j: integer;
begin
  writeln ('Седловые точки:'); 
    for i := 1 to n do
      for j := 1 to n do
        if (minLine[i] = maxColumn[j]) or (maxLine[i] = minColumn[j]) then
          writeln('Элемент ', m[i ,j], ', расположенный в [', i, ';', j, ']');
end;

procedure saddlePoints (a: matrix);
var
  i, j: integer;
  maxLine, minline: line; //нужны для минимумов и максимумов строк
  maxColumn, minColumn: column; //нужны для минимумов и максимумов столбцов
  
begin
  for i := 1 to n do //запоминаем столбцы и строки матрицы для дальнейшего сравнения
    begin
      maxLine[i] := m[i, 1];
      minLine[i] := m[i, 1];
    end;
  for j := 1 to n do
    begin
      maxColumn[j] := m[1, j];
      minColumn[j] := m[1, j];
    end;
    
  for i := 1 to n do //проводим сравнение элементов и ищем седловые точки
    for j := 1 to n do
    begin
      if m[i, j] < minLine[i] then
        minLine[i] := m[i, j]
      else
      if m[i, j] > maxLine[i] then
        maxLine[i] := m[i, j];
      if m[i, j] < minColumn[j] then
        minColumn[j] := m[i, j]
      else
      if m[i, j] > maxColumn[j] then
        maxColumn[j] := m[i, j];
    end;
  writing(maxLine, minline, maxColumn, minColumn);
end;

BEGIN
  reading(m);
  saddlePoints(m);
END.
