program KnutMorrisPrattSearch;

procedure Prefix;
  var
    S: array[1..10000] of char;
    P: array[1..10000] of word; //массив для значений префикс-функции
    i, k, m: longint;
  
  begin
    P[1] := 0; 
    k := 0;
    for i := 2 to m do 
      begin
        while (k > 0) and (S[k + 1] <> S[i]) do
          k := P[k]; 
          if S[k + 1] = S[i] then
            k := k + 1;
        P[i] := k; 
      end;
  end;

var
  T: array[1..40000] of char;
  S: array[1..10000] of char;
  P: array[1..10000] of word; //массив для значений префикс-функции
  i, k: longint;
  m, n: longint;

begin
  writeln('Введите длину строки'); //Блок ввода данных
  readln(n);
  writeln('Введите строку T');
  for i := 1 to n do
    read(T[i]);
  writeln('Введите длину подстроки');
  readln(m);
  writeln('Введите подстроку');
  for k := 1 to m do
    read(S[k]);
  Prefix; 
  k := 0; //количество символов, совпавших на данный момент
  for i := 1 to n do
    begin
      while (k > 0) and (S[k + 1] <> T[i]) do
        k := P[k];
      if S[k + 1] = T[i] then inc(k);
    if (k = m) then 
      begin
        writeln('Подстрока S входит в текст T, начиная с ', i - m + 1, '-ого символа');
        k := P[k];
      end;
    end;
end.
