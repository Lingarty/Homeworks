program A3;

const
  nmax = 1000;
  
type
  mas = array [1..nmax] of integer;
  
var
  a: mas;
  n, l: integer;
  
procedure reading(var a: mas; n: integer);
var 
  i: integer;
begin
  writeln ('Введите последовательность'); //Ввод последовательности
  for i := 1 to nmax do
    begin
      readln (a[i]);
      inc(n);
      if (a[i] = 0) then break;
    end;
end;

procedure searching(var a: mas; n, l: integer);
var
  i, k: integer;
begin
  for i := 1 to n - 1 do //Поиск наибольшей ступеньки
    if (a[i] < a[i + 1]) then inc(k)
      else 
        if (l < k) then
          begin
            l := k;
            k := 0;
          end
          else k := 0;
end;

procedure showLength(l: integer);
begin
  writeln ('Длина наибольшей ступеньки равна ', l); //Вывод длины
end;

begin
  reading(a, n);
  searching(a, n, l);
  showLength(l);
end.
