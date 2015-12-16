program task;

const
  n = 10;
  
type
  massive = array [1..n] of real; 
  solutions = array [1..3, 1..n] of real;
  series = array [1..3] of real;

var
  x: massive;
  y: solutions;
  a: series;
  b, h, {коэффициенты} fi, ksi: real;
  
procedure input(var b, h: real; var a: series);
var
  i: integer;
begin
  writeln('Введите коэффициенты b и h:');
  readln(b, h);
  writeln('Введите 3 значения a');
  for i := 1 to 3 do
    readln(a[i]);
  writeln('- - - - - - - - - - -');
end;

function F(a, x: real): real;
begin
  if ((1 + a * a + x * x) <> 0) then 
    F := (exp(x) + exp(-a)) / (1 + a * a + x * x)
  else writeln('невозможно найти значение функции');
end;

function fiFunction (i: integer; y: solutions): real;
var
  j: integer;
  fi: real;
begin
  for j := 1 to n do
    fi := fi + y[i][j] * y[i][j];
  fiFunction := fi;
end;

function ksiFunction (i: integer; y: solutions): real; 
var
  max: real;
  j: integer;
begin
  max := y[1][1];
    
  for j := 1 to n do
  begin
    y[i][j] := y[i][j] * y[i][j];
    if (y[i][j] > max) then max := y[i][j];
  end;
  result := max;
end;


procedure output(i: integer; a, fi, ksi: real);
begin
  writeln(i, '-я серия корней:');
  writeln('a = ', a);
  writeln('fi = ', fi:0:3);
  writeln('ksi = ', ksi:0:3);
  writeln();
end;

procedure computingSolution (b, h, fi, ksi: real; a: series; var y: solutions; x: massive);
var
  i, j: integer;
begin
  for i := 1 to 3 do
    begin
      for j := 1 to n do
        begin
          x[j] := b + j * h;
          y[i][j] := F(a[i], x[j]);
          fi := fiFunction(i, y);
          ksi := ksiFunction(i, y);
        end;
      output(i, a[i], fi, ksi);
    end;
end;

BEGIN
  input(b, h, a);
  computingSolution(b, h, fi, ksi, a, y, x);
END.
