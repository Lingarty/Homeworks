program A2;

//Задание: проверить периодичность последовательности

const 
  nmax = 1000;
  
type
  mySequence = array [1..nmax] of integer;
  
var
  a: mySequence;
  n, period: integer;
  isPeriodic: boolean;
  
procedure reading(a: mySequence; n: integer);
var 
  i: integer;
begin
  writeln ('Введите длину последовательности');
  readln(n);
  writeln('Введите элементы последовательности');
  for i := 1 to n do
    readln(a[i]);
end;

function isPeriodicF(a: mySequence; n: integer; var k: integer): boolean;
var
  i, c {если в каком-то месте правило периодичности нарушится, с <> n - k}: integer;
  b: boolean;
begin
  for k := 1 to (n div 2) do
    begin
      for i := 1 to (n - k) do
        if (a[i] = a[i + k]) then inc(c);
      if (c = n - k) then 
        begin
          period := k;
          b := true;
        end
        else b := false;
    end;
    isPeriodicF := b;
end;

procedure writing(a: boolean; b: integer);
begin
  if a then writeln ('Последовательность периодична, и её период равен', b)
    else writeln ('Последовательность не периодична');
end;

begin
  reading(a, n);
  isPeriodic := isPeriodicF(a, n, period);
  writing(isPeriodic, period);
end.
