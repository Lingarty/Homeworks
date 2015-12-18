program OF4;

type 
  numbers = file of real;
  
var
  f1, f2, f3: numbers;
  n, m, k {длины массивов}: integer;

procedure setLengthOfSeq(f: numbers; var n: integer);
//устанавливает длину массива
var
  a: real;
begin
  reset (f);
  while not eof(f) do
    begin
      read(f, a);
      inc(n);
    end;
  close(f);
end;

procedure writelnFile(f: numbers; n: integer); 
//вспомогательная процедура для вывода на экран данных файла
var
  i: integer;
  r: real;
begin
  reset(f);
  for i := 1 to n do
    begin
      read(f, r);
      write (r, ' ');
    end;
  writeln();
  close(f);
end;

procedure intersectionOfElements(var f1, f2, f3: numbers; var n, m, k: integer);
var
  i: integer;
  a, b {текущие элементы}: real;
begin
  reset(f1);
  reset(f2);
  rewrite(f3);
  
  read(f1, a);
  read (f2, b);
    
  for i := 1 to n + m do
    begin
     if a = b then 
        begin
          write (f3, a);
          inc(k);
          if (not Eof (f1)) then read(f1, a);
          if (not Eof (f2)) then read (f2, b);
        end
        else if (a > b) then
          begin
            if (not Eof (f2)) then read (f2, b);
          end
          else 
            begin
              if (not Eof (f1)) then read(f1, a);
            end;
    end;
  close(f1); 
  close(f2);
  close(f3);
end;

BEGIN
  assign(f1, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF4-1.dat');
  assign(f2, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF4-2.dat');
  assign(f3, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF4-3.dat');
  
  setLengthOfSeq(f1, n);
  setLengthOfSeq(f2, m);
  
  writelnFile(f1, n);
  writelnFile(f2, m);
  
  intersectionOfElements(f1, f2, f3, n, m, k);
  
  writeln ('Пересечение последовательностей записано в файл OF4-3.txt');
  writelnFile(f3, k);
END.
