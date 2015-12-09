program O1;

//Статья на хабре про сортировки: http://habrahabr.ru/post/204600/
//задание: требуется отсортировать выбором массив
//Здесь: глупая, пузырьковая, шейкерная сортировки, чёт-нечёт, расчёска

const
  nmax = 5;
  f{фактор уменьшения, используется в расчёске} = 1.247330950103979;

type 
  massive = array [1..nmax] of integer;

var
  m: massive;
  l: integer;

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

procedure oddEvenSort(var m: massive); //Сортировка чёт-нечёт, не работает
var
  i, v {для смены мест}, l: integer;
  flag, c{для проверки чётности}: boolean;
begin
  flag := true;
  if (nmax mod 2 = 0) then c := true 
    else c := false;
  if c then 
    begin
      while (flag = false) do 
        begin
          for i := 1 to nmax - 1 do
            if m[i] > m [i + 2] then 
              begin
                v := m[i];
                m[i] := m[i + 2];
                m[i + 2] := v;
                flag := false;
              end;
          for i := 2 to nmax do
            if m[i] > m [i + 2] then 
              begin
                v := m[i];
                m[i] := m[i + 2];
                m[i + 2] := v;
                flag := false;
              end;
        end;
      end
    else
      begin
        while (flag = false) do
        begin
          for i := 1 to nmax do
            if m[i] > m [i + 2] then 
              begin
                v := m[i];
                m[i] := m[i + 2];
                m[i + 2] := v;
                flag := false;
              end;
          for i := 2 to nmax - 1 do
            if m[i] > m [i + 2] then 
              begin
                v := m[i];
                m[i] := m[i + 2];
                m[i + 2] := v;
                flag := false;
              end;
        end;
      
      for l := 1 to nmax do
        write (m[l], ' ');
      writeln();
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
  
  {writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после сортировки "чёт-нечёт":');
  oddEvenSort(m);
  printMas(m);
  writeln ('');}
  
  writeln ('Исходный массив:');
  generateMas(m);
  printMas(m);
  writeln ('Массив после сортировки "расчёска":');
  combSort(m);
  printMas(m);
  writeln ('');
END.
