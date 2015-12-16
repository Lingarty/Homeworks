program A3;

const
  nmax = 1000;
  
type
  mas = array [1..nmax] of integer;
  
var
  a: mas;
  n, l: integer;
  
procedure reading(var a: mas; var n: integer);
var 
  i: integer;
begin
  writeln ('Введите последовательность, 0 - конец ввода');
  for i := 1 to nmax do
    begin
      readln (a[i]);
      inc(n);
      if (a[i] = 0) then break;
    end;
end;

procedure searching(var a: mas; var n, l: integer);
var
  i, k {длина текущей ступеньки}: integer;
begin
  k := 1;
  for i := 1 to n - 1 do
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
  writeln ('Длина наибольшей ступеньки равна ', l);
end;

BEGIN
  reading(a, n);
  searching(a, n, l);
  showLength(l);
END.
