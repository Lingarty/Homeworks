program R2;

//для этого теста k = 1, b = 0

type
  pointFromFile = record
    r: real;
    fi: real;
  end;
  point = record
    r: real;
    fi: real;
    x: real;
    y: real;
  end;
  data = file of pointFromFile;
  coordinates = array of point; 

var
  a: coordinates;
  f: data;
  points: boolean;
  n {кол-во координат}, k, b {к-ты ур-я}: integer;

procedure readPoints(f: data; var a: coordinates; var n: integer);
var
  i: integer;
  p: pointFromFile;
begin
  reset(f);
  SetLength(a, 255);
  while not eof(f) do
    begin
      read(f, p);
      a[i].r := p.r;
      a[i].fi := p.fi;
      a[i].x := a[i].r * cos(a[i].fi); //переводим в декартовы координаты для удобства вычислений
      a[i].y := a[i].r * sin(a[i].fi);
      inc(i);
    end;
  n := i + 1;
  SetLength(a, n);
  close(f);
end;

function areBelongs(a: coordinates; n, k, x: integer): boolean;
var
  i: integer;
  flag: boolean;
begin
  flag := true;
  for i := 0 to n - 1 do
    if (a[i].x * k + b) <> a[i].y then flag := false;
  result := flag;
end;

BEGIN
  assign(f, 'C:\Users\Альбина\Documents\GitHub\Homeworks\R2.dat');
      
  writeln ('Введите кэффициенты k и b уравнения прямой y = kx + b:');
  write('k = ');
  read(k);
  write('b = ');
  read(b);
  writeln();
  
  readPoints(f, a, n);
  points := areBelongs(a, n, k, b);
  
  if points then writeln ('Ура! Все введённые точки лежат на заданной прямой! С:')
    else writeln ('Что-то пошло не так. Какая-то точка, если не они все, не лежат на заданной прямой :С');
END.
