program R3;

type
  point = record
    x: integer;
    y: integer;
  end;
  coordinates = array of point; 

var
  n, r: integer;
  a: coordinates;
  points: boolean;

procedure readPoints(var a: coordinates; n: integer);
var
  i: integer;
begin
  SetLength(a, n);
  for i := 0 to n - 1 do
    begin
      write(i + 1, '. x = ');
      read(a[i].x);
      write('   y = ');
      read(a[i].y);
      writeln();
    end;
end;

function areBelongs(a: coordinates; n, r: integer): boolean;
var
  i: integer;
  flag: boolean;
begin
  flag := true;
  for i := 0 to n - 1 do
    if (a[i].x*a[i].x + a[i].y*a[i].y) <> r*r then flag := false;
  result := flag;
end;

BEGIN
  writeln('Введите количество точек');
  readln(n);
  writeln('Введите координаты точек.');
  readPoints(a, n);
  writeln ('Введите радиус окружности');
  readln(r);
  
  points := areBelongs(a, n, r);
  if points then writeln ('Ура! Все введённые точки лежат на заданной окружности! С:')
    else writeln ('Что-то пошло не так. Какая-то точка, если не они все, не лежат на заданной окружности :С');
END.
