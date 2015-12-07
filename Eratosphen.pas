program Resheto;

type
  mas = array[2..32000] of integer;

var 
  a: mas;
  i, n, x: integer; 
  
begin
  writeln ('Введите диапазон поиска');
  readln(n);
  for i := 2 to ((n + 1) div 2) do 
    begin
      x := i * 2;
      while (x <= n) do 
        begin
          a[x] := 1;
          x := x + i;
        end;
      x := 0;
    end;
  for i := 2 to n do
   if a[i] = 0 then write(i,' ');
end.
