program arrays;

const
  n = 15;

type
  str = array [1..n] of char;

var
  t, s: str;
  k, l{кол-ва символов}, m {ответ}: integer;

procedure input(var t: str; var k: integer);
var
  i: integer;
begin
  i := 1;
  read(t[i]);
  while (i <> n) do 
    if (t[i] = '.') then break 
      else 
        begin
          inc(i);
          inc(k);
          read(t[i]);
        end; 
  readln();
end;

procedure findEqual(var m: integer);
var
  i, j {индексы}, r {просто коэффициент}: integer;
begin
  m := -1;
  j := 1; //индекс подстроки
    
  for i := 1 to k do
    begin
      while (j <= l)do
        begin
          if (t[i] = s[j]) then 
            begin
              m := i;
              inc(j);
            end
          else 
            begin 
              inc(r);
              j := 1;
              break;
            end;
          break;
        end;
    end;
end;

procedure output(var m: integer);
begin
  if (m = -1) then writeln('s не входит в t')
  else writeln('Индекс вхождения: ', m - l + 1);
end;

begin 
  writeln('Введите строку t, в конце введите "."');
  input(t, k);
  writeln('Введите строку s, в конце введите "."');
  input(s, l);
  findEqual(m);  
  output(m);
end.
