program KnutMorrisPrattSearch;

type
  str = array[1..40000] of char;
  subString = array[1..10000] of char;
  arrayOfPrefix = array[1..10000] of word; 
  
var
  T: str;             //строка
  S: subString;      //подстрока
  P: arrayOfPrefix; //массив значений префикс-функции
  k {количество символов, совпавших на данный момент}, m, n {длины строк}: longint;

procedure input(var n, m: integer; var T: str; var S: subString);
var
  i, j: longint;
begin
  writeln('Введите длину строки');
  readln(n);
  writeln('Введите строку T');
  for i := 1 to n do
    read(T[i]);
  writeln('Введите длину подстроки');
  readln(m);
  writeln('Введите подстроку');
  for j := 1 to m do
    read(S[j]);
end;

procedure Prefix(var m, k: integer; var P: arrayOfPrefix; var S: subString);
var
 i: longint;
begin
  P[1] := 0; 
  for i := 2 to m do 
    begin
      while (k > 0) and (S[k + 1] <> S[i]) do
        k := P[k]; 
        if S[k + 1] = S[i] then inc(k);
        P[i] := k; 
    end;
end;

procedure output(var k, i: longint; P: arrayOfPrefix);
begin
  writeln('Подстрока S входит в текст T, начиная с ', i - m + 1, '-ого символа');
  k := P[k];
end;

procedure searchPosition(var n, k: integer; var T: str; var S: subString);
var
  i: longint;
begin
  for i := 1 to n do
    begin
      while (k > 0) and (S[k + 1] <> T[i]) do
        k := P[k];
      if S[k + 1] = T[i] then inc(k);
       if (k = m) then output(k, i, P);
    end;
end;

begin
  input(n, m, T, S);
  Prefix(m, k, P, S); 
  searchPosition(n, k, T, S);
end.
