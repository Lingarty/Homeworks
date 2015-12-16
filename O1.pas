program O1;

//Статья на хабре про сортировки: http://habrahabr.ru/post/204600/
//задание: требуется отсортировать обменом массив 
//(скорее всего пузырьком,но хотелось попробовать всё, что есть в статье)

const
  nmax = 5;
  f{фактор уменьшения, используется в расчёске} = 1.247330950103979;

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


procedure stupidSort(var a: massive); 
var
  i, k, v {Ведро для смены мест}: integer;
begin
  for k := 1 to nmax * nmax do
    for i := 1 to nmax - 1 do
      begin
        if a[i] > a[i + 1] then
          begin
            v := a[i];
            a[i] := a[i + 1];
            a[i + 1] := v;
            break;
          end;
      end;
end;


procedure bubbleSort(var m: massive);
var
  k{коэффициент, "укорачивающий" массив}, i,
  v{'ведро' для перекладывания элментов}: integer;
begin
  for k := 1 to nmax - 1 do
    begin
      for i := 1 to nmax - k do
        if m[i] > m[i + 1] then
          begin
            v := m[i];
            m[i] := m[i + 1];
            m[i + 1] := v;
          end;
    end;
end;


procedure shakeSort(var m: massive);
var
  i, j, k, v: integer;
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


{тут начинаются вспомогательные процедуры для чёт/нечёт}

function isEven: boolean; //кол-во элементов чётно?
begin
  if nmax mod 2 = 0 then result := true
    else result := false;
end;

procedure evenStep(var m: massive; var s: integer); //чётный шаг
var
  k {нечётный шаг}, v {для перестановки}, n {номер последнего элемента в поиске}: integer;
  b: boolean;
begin
  k := 2;
  b := isEven;
  if b then n := nmax - 2
    else n := nmax - 1;
  while (k <= n) do
    begin
      if m[k] > m[k + 1] then
        begin
          v := m[k];
          m[k] := m[k + 1];
          m[k + 1] := v;
          inc(s);
        end;
        k := k + 2;
    end;
end;

procedure oddStep(var m: massive; var s: integer); //нечётный шаг
var
  k {нечётный шаг}, v {для перестановки}, n {номер последнего элемента в поиске}: integer;
  b: boolean;
begin
  k := 1;
  b := isEven;
  if b then n := nmax - 1
    else n := nmax - 2;
  while (k <= n) do
    begin
      if m[k] > m[k + 1] then
        begin
          v := m[k];
          m[k] := m[k + 1];
          m[k + 1] := v;
          inc(s);
        end;
      k := k + 2;
    end;
end;

procedure oddEvenSort(var m: massive); //Сортировка чёт-нечёт
var
  s1, s2 {сколько перестановок за нечёт/чёт цикл}: integer;
  flag: boolean;
begin
  while (flag = false) do
    begin
      oddStep(m, s1);
      evenStep(m, s2);
      if (s1 = 0) and (s2 = 0) then flag := true
        else 
          begin
            s1 := 0;
            s2 := 0;
          end;
    end;
end;


procedure combSort(var m: massive); //сортировка расчёской
var
  i, s {разрыв между проверяемыми элементами}, v: integer;
begin
  s := round(nmax / f);
  while s <> 1 do
    begin
      for i := 1 to nmax - s do
        if m[i] > m[i + s] then 
          begin
            v := m[i];
            m[i] := m[i + s];
            m[i + s] := v;
          end;
      s := s - 1;
    end;
    bubbleSort(m);
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
  writeln ('Демонстрация работы различных алгоритмов сортировки выбором.');
  writeln ('');
  
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после "глупой" сортировки:');
  stupidSort(m);
  printMas(m);
  writeln ('');
  
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после "пузырьковой" сортировки:');
  bubbleSort(m);
  printMas(m);
  writeln ('');
  
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после "шейкерной" сортировки:');
  shakeSort(m);
  printMas(m);
  writeln ('');
  
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после сортировки "чёт-нечёт":');
  oddEvenSort(m);
  printMas(m);
  writeln ('');
  
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после сортировки "расчёска":');
  combSort(m);
  printMas(m);
  writeln ('');
END.
