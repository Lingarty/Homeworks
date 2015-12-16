program file_task_3;

const 
  nmax = 10;
  
type
  number = 1..1000;
  mas = array [1..nmax] of number;

var
  a: mas;
  myFile: text;
  
procedure writingFile(var myFile: text; a: mas);
var
  i: integer;
begin
  assign(myFile, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OutputF3.txt');
  rewrite(myFile);
  for i := 1 to nmax do
    begin
      read(a[i]);
      write(myFile, a[i], ' ');
    end;
  close(myFile);
end;

BEGIN
  writingFile(myFile, a);
END.
