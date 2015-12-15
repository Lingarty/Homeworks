program people;

const
  nmax = 100;
  
type 
  person = record
    name: string;
    age: integer;
  end;
  ages = array [1..nmax] of person; //считываем всё в массив и дальше работаем с ним
  data = file of person; //входные данные
  
var
  input: data;
  a: ages;

procedure inputData(input: data; var a: ages);
var
  i: integer;
  p: person;
begin
  reset(input);
  i := 1;
  while i <= nmax do
    begin
      read(input, p);
      a[i].name := p.name;
      a[i].age := p.age;
      inc(i);
    end;
end;

procedure sortList (var m: ages);
//шейкерная сортировка
var
  i, j, k: integer;
  v: person;
begin
  for k := 1 to nmax div 2 do
    begin
      for i := 1 to nmax - k do 
        if m[i].age > m[i + 1].age then
          begin
            v := m[i];
            m[i] := m[i + 1];
            m[i + 1] := v;
          end;
      for j := nmax - k downto 2 do 
        if m[j].age < m[j - 1].age then
          begin
            v := m[j];
            m[j] := m[j - 1];
            m[j - 1] := v;
          end;
    end;
end;

procedure outputData (var a: ages);
var
  i: integer;
begin
  for i := 1 to nmax do
    writeln (a[i].name, ' ', a[i].age);
end;

BEGIN
  assign (input, 'C:\Users\Альбина\Documents\GitHub\Homeworks\peopleList.txt');
  
  inputData (input, a);
  sortList(a);
  outputData(a);
  
  close (input);
END.
