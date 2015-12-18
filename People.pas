program people;

const
  maxAge = 120;
  
type 
  ageDiapason = 1..maxAge;
  person = record
    name: string[50];
    age: ageDiapason;
  end;
  ages = array of person; //считываем всё в массив и дальше работаем с ним
  data = file of person; 
  
var
  f: data;
  a: ages;
  n: byte;

procedure input(f: data; var a: ages; var n: byte);
var
  i: byte;
  p: person;
begin
  reset(f);
  n := 50;
  SetLength(a, n);
   for i := 0 to n - 1 do
    begin
      read(f, p);
      a[i].name := p.name;
      a[i].age := p.age;
    end;
  close (f);
end;

procedure countSort(var a: ages; n: byte); //сортировка подсчётом
var
  i, j: byte;
  b: array of person; //для отсортированного массива
  c: array [0..maxAge - 1] of byte; //для счётчика
begin
  SetLength(b, n);
  for i := 0 to n - 1 do
    c[a[i].age] := c[a[i].age] + 1;
  for j := 1 to maxAge - 1 do
    c[j] := c[j] + c[j - 1];
  for i := n - 1 downto 0 do
    begin
      c[a[i].age] := c[a[i].age] - 1;
      b[c[a[i].age]] := a[i];
    end;
    a := b;
end;

procedure output(a: ages; n: byte);
var
  i: byte;
begin
  for i := 0 to n - 1 do
    writeln (a[i].name, ' ', a[i].age);
end;

BEGIN
  assign (f, 'C:\Users\Альбина\Documents\GitHub\Homeworks\peopleList.dat');
  input(f, a, n);
  countSort(a, n);
  output(a, n);
END.
