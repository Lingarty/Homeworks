program file_task_1;

type
  fairytale = text;
  
var
  myFile: fairytale;
  lmax: byte;
  wmax: string;
  
procedure searchingWordIn(myFile: fairytale; maxLength: byte; longestWord: string);
var
  currentLength: byte;
  simbol: char;
  currentWord: string;
begin
  assign (myFile, 'C:\Users\Альбина\Documents\GitHub\Homeworks\Kolobok.txt');
  reset(myFile);
  while (not Eof(myFile)) do
    begin
      read(myFile, simbol);
      if (simbol <> ' ') then 
        begin
          inc(currentLength);
          currentWord := currentWord + simbol;
        end
      else
        begin
          if currentLength > maxLength then 
            begin
              maxLength := currentLength;
              longestWord := currentWord;
            end;
          currentLength := 0;
          currentWord := '';
        end;
    end;
  writeln ('The longest word in this file is ', longestWord);
  writeln ('and its length is ', maxlength);
  close(myFile);
end;
  
begin
  searchingWordIn(myFile, lmax, wmax);
end.
