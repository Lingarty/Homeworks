program OF4;

type 
  numbers = file of real;
  
var
  f1, f2, f3: numbers;
  n, m, k {длины массивов}: integer;

procedure writeSequenseInFile(var f: numbers; n: integer);
var
  a, i: integer;
begin
  rewrite(f);
  for i := 1 to n do
    begin
      read(a);
      write (f, a);
    end;
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
end;

BEGIN
  assign(f1, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF4-1.txt');
  assign(f2, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF4-2.txt');
  assign(f3, 'C:\Users\Альбина\Documents\GitHub\Homeworks\OF4-3.txt');
  
  writeln ('Введите длину первого массива.');
  readln(n);
  writeln ('Введите элементы первого массива (по возрастанию)');
  writelnFile(f1, n);
  writeln ('Введите длину второго массива.');
  readln(m);
  writeln ('Введите элементы второго массива (по возрастанию)');
  writeSequenseInFile(f2, m);
  intersectionOfElements(f1, f2, f3, n, m, k);
  writeln ('Пересечение последовательностей записано в файл OF4-3.txt');
  
  close(f1); 
  close(f2);
  close(f3);
END.
