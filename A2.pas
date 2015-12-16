program A2;

//Задание: проверить периодичность последовательности

const 
  nmax = 1000;
  
type
  mySequence = array [1..nmax] of integer;
  
var
  a: mySequence;
  n, period: integer;
  seq: boolean;
  
procedure reading(var a: mySequence; var n: integer);
var 
  i: integer;
begin
  writeln ('Введите длину последовательности');
  readln(n);
  writeln('Введите элементы последовательности');
  for i := 1 to n do
    readln(a[i]);
end;

function isPeriodicF(a: mySequence; n: integer; var period: integer): boolean;
var
  i, k, c {если в каком-то месте правило периодичности нарушится, с <> n - k}: integer;
  b: boolean;
begin
  k := 1;
  while k <= (n div 2) do
    begin
      for i := 1 to (n - k) do
        if (a[i] = a[i + k]) then inc(c);
      if (c = n - k) then 
        begin
          period := k;
          b := true;
          break;
        end
        else 
          begin
            b := false;
            inc(k);
          end;
    end;
    isPeriodicF := b;
end;

procedure writing(a: boolean; b: integer);
begin
  if a then writeln ('Последовательность периодична, и её период T = ', b)
    else writeln ('Последовательность не периодична');
end;

begin
  reading(a, n);
  seq:= isPeriodicF(a, n, period);
  writing(seq, period);
end.
