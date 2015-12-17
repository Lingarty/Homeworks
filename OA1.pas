program OA1;

const
  nmax = 5;

type 
  massive = array [1..nmax] of real;

var
  heapOfSocks: massive;
  sock, position: integer;
  thisSock: boolean;
  
procedure generateMas (var heapOfSocks: massive);
var
  i: integer;
begin
  randomize;
  for i := 1 to nmax do
    heapOfSocks[i] := random (100) - 50;
end;

procedure shakeSort(var heapOfSocks: massive);
var
  i, j, k: integer;
  v: real;
begin
  for k := 1 to nmax div 2 do
    begin
      for i := 1 to nmax - k do //идём от начала к концу, попутно сортируем
        if heapOfSocks[i] > heapOfSocks[i + 1] then
          begin
            v := heapOfSocks[i];
            heapOfSocks[i] := heapOfSocks[i + 1];
            heapOfSocks[i + 1] := v;
          end;
      for j := nmax - k downto 2 do //возвращаясь назад, сортируем с конца
        if heapOfSocks[j] < heapOfSocks[j - 1] then
          begin
            v := heapOfSocks[j];
            heapOfSocks[j] := heapOfSocks[j - 1];
            heapOfSocks[j - 1] := v;
          end;
    end;
end;

procedure findSockInHeap(var heapOfSocks: massive; var sock, position: integer); //2 алгоритма: для чётной и нечётной длины
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
      if heapOfSocks[mid] = sock then
        begin
          found := true;
          position := mid;
        end
        else if heapOfSocks[mid] < sock then left := mid + 1
          else right := mid - 1;
    end;
end;

function isInMas(var heapOfSocks: massive; sock: integer): boolean;
var
  i: integer;
  answer: boolean;
begin
  for i := 1 to nmax do
    if heapOfSocks[i] = sock then
      begin
        answer := true;
        break;
      end;
  result := answer;
end;

procedure printMas(heapOfSocks: massive);
var
  i: integer;
begin
  for i := 1 to nmax do
    write (heapOfSocks[i], ' ');
  writeln();
end;

BEGIN
  writeln ('Дихотомический (бинарный) поиск');
  writeln();
  generateMas(heapOfSocks);
  shakeSort(heapOfSocks);
  write ('Дан массив чисел: ');
  printMas(heapOfSocks);
  write ('Выберите и введите элемент, который будем искать: ');
  while not thisSock do //заставляем пользователя вводить число, пока он не введёт элемент массива
    begin
       readln(sock);
        thisSock := isInMas(heapOfSocks, sock);
        if not thisSock then writeln('Введёное число находится вне границ массива, введите ЧИСЛО ИЗ МАССИВА');
    end;
  findSockInHeap(heapOfSocks, sock, position); //ищем индекс элемента в массиве
  writeln('Искомый элемент находится на ', position, ' месте'); //выводим ответ
END.
