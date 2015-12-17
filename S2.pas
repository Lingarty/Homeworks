program S2;

const
  n = 1000;

type
  multiplicity = array [1..n] of boolean;
  
var
  bArray: multiplicity;
  command, navigator {для повторения работы программы}: byte;
  number: integer;
  
  
function isCommand(var command: byte): boolean;
var
  i: integer;
  answer: boolean;
begin
  for i := 0 to 4 do
    if command = i then
      begin
        answer := true;
        break;
      end;
  result := answer;
end;

procedure inputCommand(var command: byte);
var
  input: boolean;
begin
  writeln('Для дальнейших действий, выберите операцию над множеством:');
  writeln();
  writeln('1. Проверить, есть ли в множестве такой элемент');
  writeln('2. Добавить элемент');
  writeln('3. Удалить элемент');
  writeln('4. Показать множество');
  writeln('0. Завершить работу с программой');
  
  while not input do //заставляем пользователя вводить число, пока он не введёт номер команды
    begin
      readln(command);
        input := isCommand(command);
        if not input then writeln('Введёное число не является командой! Сделайте вдох, затем выдох, соберитесь и введие НОМЕР ОПЕРАЦИИ НАД МНОЖЕСТВОМ');
    end;
end;

procedure existence(var number: integer; bArray: multiplicity); //проверка существования элемента
begin
  writeln();
  writeln ('Введите число');
  readln(number);
  if bArray[number] then writeln ('Введёное число является элементом множества')
    else writeln ('Введёное число не является элементом множества');
  writeln();
end;

procedure add(var number: integer; var bArray: multiplicity);
begin
  writeln();
  writeln ('Введите число');
  readln(number);
  if bArray[number] then writeln ('Введёное число уже является элементом множества')
    else 
      begin
        bArray[number] := true;
        writeln ('Число ', number, ' добавлено в множество');
      end;
end;

procedure delete(var number: integer; var bArray: multiplicity);
begin
  writeln();
  writeln ('Введите число');
  readln(number);
  if bArray[number] then
    begin
      bArray[number] := false;
      writeln ('Число ', number, ' удалено из множества');
    end
    else writeln ('Введёное число и так не является элементом множества'); 
end;

procedure printArray(bArray: multiplicity);
var
  i: integer;
begin
  writeln('Элементы данного множества: ');
  for i := 1 to n do
    if bArray[i] = true then write (i, ' ');
  writeln();
  writeln();
end;

procedure continueProcess(var navigator: byte);
begin
  writeln ('Вы хотите продолжить работу?');
  writeln ('1. Да');
  writeln ('2. Нет');
  readln(navigator);
end;
  
procedure choosingCommand(var command: byte); //выбор действия над множеством
begin
  if command = 1 then 
    begin
      existence(number, bArray);
      continueProcess(navigator);
    end
    else if command = 2 then
      begin
        add(number, bArray);
        continueProcess(navigator);
      end
      else if command = 3 then
        begin
          delete(number, bArray);
          continueProcess(navigator);
        end
        else if command = 4 then
          begin
            printArray(bArray);
            continueProcess(navigator);
          end;
end;

BEGIN
  while (navigator <> 2) do
    begin
      inputCommand(command);
      choosingCommand(command);
    end;
END.
