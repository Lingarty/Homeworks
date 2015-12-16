program file_task_2;

var
  myFile: text;
  s: integer;

function sumNumbers(f: text): integer;
var
  sum, num: integer;
begin
  assign(f, 'C:\Users\Альбина\Documents\GitHub\Homeworks\inputF2.txt');
  reset(f);
  while not eof(f) do
    begin
      read(f, num);
      sum := sum + num;
    end;
  close(f);
  sumNumbers := sum;
end;

BEGIN
  s := sumNumbers(myFile);
  writeln('Сумма введённых чисел равна ', s);
END.
