program R4;

//тест R4.dat в папке testData

type
  points = 1..100;
  abiturient = record
    name: string[50];
    hasMedal: boolean;
    mark1: points;
    mark2: points;
    mark3: points;
    totalPoints: integer;
  end;
  data = file of abiturient;
  abiturients = array of abiturient;
  
var
 f: data;
 a: abiturients;
 n: integer; //число студентов

procedure readAbiturients(f: file of abiturient; var a: abiturients; var n: integer);
var 
  i: integer;
  abit: abiturient;
begin
  reset(f);
  SetLength(a, 255);
  while not eof(f) do
    begin
      read(f, abit);
      a[i].name := abit.name;
      a[i].hasMedal := abit.hasMedal;
      a[i].mark1 := abit.mark1;
      a[i].mark2 := abit.mark2;
      a[i].mark3 := abit.mark3;
      a[i].totalPoints := a[i].mark1 + a[i].mark2 + a[i].mark3; 
      inc(i);
    end;
    n := i;
  SetLength(a, n);
end;

function isStudent(abit: abiturient): boolean;
var
  flag: boolean;
begin
  if (abit.hasMedal and ((abit.mark1 > 85) or (abit.mark2 > 85) or (abit.mark3 > 85))) //имеет медаль и одна из оценок '5'
    or(abit.totalPoints > 255) //набрал проходной балл
      then flag := true;
  result := flag;
end;

procedure writeStudents(a: abiturients; n: integer);
var
  flag: boolean;
  i: integer;
begin
  for i := 0 to n - 1 do
    begin
      flag := isStudent(a[i]);
      if flag then writeln (a[i].name);
    end;
end;

procedure enrollment (var f: file of abiturient);
begin
  reset(f);
  while (not Eof(f)) do
    begin
      readAbiturients(f, a, n);
      writeStudents(a, n);
    end;
  close (f);
end;  

BEGIN
  assign (f, 'C:\Users\Альбина\Documents\GitHub\Homeworks\R4.dat');
  enrollment(f);
END. 
