program OA1;

const
  nmax = 5;

type 
  massive = array [1..nmax] of real;

var
  m: massive;
  grail, x: integer;
  b: boolean;
  
procedure generateMas (var m: massive);
var
  i: integer;
begin
  randomize;
  for i := 1 to nmax do
    m[i] := random (100) - 50;
end;

procedure shakeSort(var m: massive);
var
  i, j, k: integer;
  v: real;
begin
  for k := 1 to nmax div 2 do
    begin
      for i := 1 to nmax - k do //идём от начала к концу, попутно сортируем
        if m[i] > m[i + 1] then
          begin
            v := m[i];
            m[i] := m[i + 1];
            m[i + 1] := v;
          end;
      for j := nmax - k downto 2 do //возвращаясь назад, сортируем с конца
        if m[j] < m[j - 1] then
          begin
            v := m[j];
            m[j] := m[j - 1];
            m[j - 1] := v;
          end;
    end;
end;

procedure findGrail(var a: massive; var grail, x: integer); //2 алгоритма: для чётной и нечётной длины
var
  left, right {границы поиска}, mid {средний элемент}: integer; 
  found: boolean;
begin
  left := 1;
  right := nmax;
  found := false;
  while (left <= right) and (not found) do
    begin
      mid := (left + right) div 2;
      if a[mid] = grail then
        begin
          found := true;
          x := mid;
        end
        else if a[mid] < grail then left := mid + 1
          else right := mid - 1;
    end;
end;

function isInMas(var m: massive; grail: integer): boolean;
var
  i: integer;
  answer: boolean;
begin
  for i := 1 to nmax do
    if m[i] = grail then
      begin
        answer := true;
        break;
      end;
  result := answer;
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
  writeln ('Дихотомический (бинарный) поиск');
  writeln();
  generateMas(m);
  shakeSort(m);
  write ('Дан массив чисел: ');
  printMas(m);
  write ('Выберите и введите элемент, который будем искать: ');
  readln(grail);
  b := isInMas(m, grail);
  if b then
    begin
      findGrail(m, grail, x);
      writeln('Искомый элемент находится на ', x, ' месте');
    end
    else writeln('Введёное число находится вне границ массива');
END.
