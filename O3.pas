program O3;

//Отсортировать массив последовательным включением элементов

const
  nmax = 5;
  
type 
  massive = array [1..nmax] of integer;

var
  m: massive;
  
procedure generateMas (var m: massive);
var
  i: integer;
begin
  randomize;
  for i := 1 to nmax do
    m[i] := random (100) - 50;
end;

procedure insertionSort(var m: massive);
var
  i, j, l, insert{для перестановки элемента}: integer;
begin
  for i := 2 to nmax do
    begin
      j := i;
      repeat
        if (m[j] >= m[i]) then
          dec(j);
      until (j = 0) or (m[j] < m[i]);
      inc(j);
    //Вставка элемента
    insert := m[i];
    for l := i downto j + 1 do
      m[l] := m[l - 1];
    m[j] := insert;
  end;
end;

procedure printMas(m: massive);
var
  i: integer;
begin
  for i := 1 to nmax do
    write (m[i], ' ');
  writeln();
end;

BEGIN
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после сортировки последовательным включением элементов:');
  insertionSort(m);
  printMas(m);
END.
