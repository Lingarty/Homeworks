program Task_4;

const
  nmax = 50;

type
  mas = array [1..nmax] of integer;

var 
  i, j, k, {Индексы} n, m, l,{Длины массивов} v {Ведро для сортировки}, x, q: byte;
  a, b, c: mas;

begin
  writeln ('Введите длину первого массива (максимум 50 элементов)');  //Блок считывания данных
  readln (n);
  writeln ('Введите длину второго массива (максимум 50 элементов)');
  readln (m);
  writeln ('Введите элементы первого массива');
  for i := 1 to n do 
    readln (a[i]);
  writeln ('Введите элементы второго массива');
  for j := 1 to m do 
    readln (b[j]);
    
  for k := 1 to (n - 1) do //Блок сортировки массивов
    for i := 1 to (n - 1) do
      if (a[i] > a[i + 1]) then 
        begin
          v := a[i];
          a[i] := a[i + 1];
          a[i + 1] := v;
        end;
  
  for k := 1 to (m - 1) do 
    for j := 1 to (m - 1) do
      if (b[j] > b[j + 1]) then 
        begin
          v := b[j];
          b[j] := b[j + 1];
          b[j + 1] := v;
        end;
  
  l := 0; //Длина массива-ответа
  k := 1; //Счётчик массива-ответа
  j := 1; //Индекс для второго массива
  x := 1; //Индекс для первого массива (как i)
  q := 0; //Считает,сколько раз увеличивался х
  
  for i := 1 to n*m do
    begin
      if (a[x] = b[j]) then
        begin
          c[k] := a[x];
          inc(k);
          inc(l);
          inc(x); inc(q);
        end
      else 
        begin
          inc(j);
        end;
      if (j = m + 1) then
        begin
          j := 1;
          inc(x); inc(q);
        end;
        if (q = 5) then break;
    end;
  
  writeln ('Числа, которые содержатся в обоих массивах:');  //Вывод на экран
  for k:= 1 to l do
    write (c[k], ', ');
end.
