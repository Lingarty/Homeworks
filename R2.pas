program R2;

type
  point = record
    r: integer;
    fi: integer;
    x: real;
    y: real;
  end;
  coordinates = array of point; 

var
  n, k, b {к-ты ур-я}: integer;
  a: coordinates;
  points: boolean;

procedure readPoints(var a: coordinates; n: integer);
var
  i: integer;
begin
  SetLength(a, n);
  for i := 0 to n - 1 do
    begin
      write(i + 1, '. r = ');
      read(a[i].r);
      write('   fi = ');
      read(a[i].fi);
      writeln();
      
      a[i].x := a[i].r * cos(a[i].fi); //переводим в декартовы координаты для удобства вычислений
      a[i].y := a[i].r * sin(a[i].fi);
    end;
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
  writeln('Введите количество точек');
  readln(n);
  writeln('Введите координаты точек.');
  readPoints(a, n);
    
  writeln ('Введите кэффициенты k и b уравнения прямой y = kx + b:');
  write('k = ');
  read(k);
  write('b = ');
  read(b);
  writeln();
  
  points := areBelongs(a, n, k, b);
  
  if points then writeln ('Ура! Все введённые точки лежат на заданной окружности! С:')
    else writeln ('Что-то пошло не так. Какая-то точка, если не они все, не лежат на заданной окружности :С');
END.
