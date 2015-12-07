program semestr1;

const
  n = 10;

type
  mas = array [1..n] of real;
  korni = array [1..3, 1..n] of real;
  series = array [1..3] of real;

var
  x: mas;
  y: korni;
  a: series;
  b, h, max, fi, psi: real;
  i, j: integer;

function F(a, x: real): real;
begin
  if ((1 + a * a + x * x) <> 0) then 
    F := (exp(x) + exp(-a)) / (1 + a * a + x * x)
  else writeln('невозможно найти значение функции');
end;

function fiFunction (y: korni; i: integer): real;
begin
  fi := 0;
  
  for j := 1 to n do //фи для серии
    fi := fi + y[i][j];
    
  fiFunction := fi;
end;

function psiFunction (y: korni; i: integer): real; 
begin
  max := y[1][1];
    
  for j := 1 to n do //пси для серии
  begin
    y[i][j] := y[i][j] * y[i][j];
    if (y[i][j] > max) then max := y[i][j];
  end;
  
  psiFunction := max;
end;

begin
  writeln('Введите b и h - коэффициенты');
  readln(b, h);
  writeln('Введите 3 значения a');
  for i := 1 to 3 do
    readln(a[i]);
  writeln('- - - - - - - - - - -');
  
  for i := 1 to 3 do 
  begin
    for j := 1 to n do
    begin
      x[j] := b + j * h;
      y[i][j] := F(a[i], x[j]); // посчитали значения функции для серии корней
    end;
    
    fi := fiFunction (y, i);
    
    psi := psiFunction (y, i);
    
    writeln(i, '-я серия корней:'); //блок вывода
    writeln('a = ', a[i]);
    writeln('fi = ', fi:0:3);
    writeln('psi = ', psi:0:3);
    writeln();
  end;
end.
