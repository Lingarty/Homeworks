program O2;

//Отсортировать массив сведением к нахождению максимума

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

procedure maxSort(var a: massive);
var 
  i, k, max, j {для запоминания номера max}, v{для смены мест элементов}: integer;
begin
  for k := 0 to nmax - 1 do
    begin
      max := -200;
      for i := 1 to nmax - k do
        if a[i] > max then
          begin
            max := a[i];
            j := i;
          end;
      v := a[nmax - k];
      a[nmax - k] := max;
      a[j] := v;
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
  writeln ('Массив после сортировки через поиск максимумов:');
  maxSort(m);
  printMas(m);
END.
