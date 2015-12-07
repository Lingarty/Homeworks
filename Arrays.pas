program arrays;

const
  n = 15;

type
  str = array [1..n] of char;

var
  t, s: str;
  i, j{индексы}, k, l{кол-во символов}, m {ответ}, r {просто коэффициент}: integer;

begin
  i := 1;
  k := 0;
    
  writeln('Введите строку t, в конце введите "."');
  
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
  
  j := 1;
  l := 0;
  
  writeln('Введите строку s, в конце введите "."');
  
  read(s[j]);
  while (j <> n) do 
    if (s[j] = '.') then break 
      else 
        begin
          inc(j);
          inc(l);
          read(s[j]);
        end; 
  
  m := -1;
  j := 1;
  r := 0;
  
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

  if (m = -1) then writeln('s не входит в t')
  else writeln('Индекс вхождения: ', m - 1);
  
end.
