program OF1;

type 
  numbers = file of real;
  
var
  f1, f2: numbers;
  n, m {длины массивов}: integer;
  a: boolean;

function includeElements(var f1, f2: numbers; n, m: integer): boolean;
var
  j, q{сколько символов вошло на данный момент}: integer;
  a, b{текущие элементы}: real;
  answer: boolean;
begin
  reset(f1);
  reset(f2);
  read(f1, a);
  for j := 1 to m do
    begin
      read(f2, b);
      if a = b then
        begin
          inc(q);
          if (q < 3) then read(f1, a);
        end;
    end;
  close(f1); 
  close(f2);
  if q = n then answer := true;
  includeElements := answer;
end;

BEGIN
  assign(f1, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF1-1.dat');
  assign(f2, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF1-2.dat');
  if includeElements(f1, f2, n, m) then writeln('Один массив входит в другой :)')
    else writeln('Ни один массив не входит в другой :(');
END.
