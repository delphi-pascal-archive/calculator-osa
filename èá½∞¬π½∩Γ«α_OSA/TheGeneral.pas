unit TheGeneral; {Анализ входных данных}

interface

uses
  SysUtils, ExtCtrls;

type m2 = array [0..100, 0..100] of real;
     m1 = array [0..100] of real;

  function NumberToPercent(n1, n2: extended): extended;
  function PercentFromNumber(p, n: extended): extended;
  function Fact(k: extended): extended;
  function prv(s: string): string;
  function Step(a: real;n: integer): real;
  function ReplaceText(s1, s2, s3: string; p: boolean): string;
  function MG(a: m2;b: m1;n, opt: integer;image: TImage; cm: boolean): m1;
  procedure MK(a: m2;b: m1;n: integer;Image: TImage);

  procedure Prepare(ImageO: TImage);
  external 'Graphic.dll';
  procedure EndComment(Image: TImage);
  external 'Graphic.dll';
  procedure Comment(Image: TImage;Expression, Comment: string);
  external 'Graphic.dll';

implementation

var
  p: real;

function NumberToPercent(n1, n2: extended): extended;
begin
  Result := n1/(n2/100);
end;

function PercentFromNumber(p, n: extended): extended;
begin
  Result := (n/100)*p;
end;

function Fact(k: extended): extended;
begin //факториал
  if k = 1 then fact := 1
  else fact := k * fact(k - 1);
end;

function prv(s: string): string;
begin
  if s = '' then prv := '0' else prv := s;
end;

function Step(a: real;n: integer): real;
var
  i: integer;
begin //возведение в целую степень
  Result := 1;
  for i := 1 to n do
  Result := Result * a;
end;

function ReplaceText(s1, s2, s3: string; p: boolean): string;
begin //замена символов в строке: S1 - исходная строка; S2 - заменяемая подстрока; S3 - на что заменять
  if p then if StrToFloat(s1) < 0 then s1 := '(' + s1 + ')';
  Result := S1;
  if Pos(S2, Result) <> 0 then
  begin
    Insert(S3, Result, Pos(S2, Result));
    Delete(Result, Pos(S2, Result), 1);
  end;
end;

function MG(a: m2;b: m1;n, opt: integer;image: TImage; cm: boolean): m1;
var
  i, j, k: integer;
  pb, c, s: real;
  s1: string;
  x: m1;
begin
  k := 1; //прямой ход метода Гаусса
  repeat {C}
    j := k + 1;
    if a[k, k] = 0 then
    begin{перестановка уравнений}
      for i := 1 to n do
      begin
        p := a[k, i];
        a[k, i] := a[n, i];
        a[n, i] := p;
        if opt < 0 then
        begin
          pb := b[k];
          b[k] := b[n];
          b[n] := pb;
        end;
      end;
    end;{перестановка уравнений}
    repeat{B}
      if a[k, k] = 0 then  c := a[j, k] / 0.00000001 else c := a[j, k] / a[k, k];
      a[j, k] := 0;
      i := k + 1;
      repeat{A}
        a[j, i] := a[j, i] - c * a[k, i];
        i := i + 1;
      until i > n;{A}
      b[j] := b[j] - c * b[k];
      j := j + 1;
    until j > n;
    k := k + 1;
  until k > n - 1;

  s1 := '!(Matrix(' + IntToStr(n) + ',' + IntToStr(n);
  for i := 1 to n do for j := 1 to n do
  s1 := s1 + ',' + ReplaceText(FloatToStr(a[i,j]), ',', '.', False);
  if Cm then
  begin
    Comment(image,'!(Matrix(4,4,a_(11),a_(12),...,a_(1*n),0,a_(22),...,a_(2*n),...,...,...,...,0,0,...,a_(n*n)))',
    'Применяем прямой ход метода Гаусса. Он заключается в приведении исходной матрицы А к виду ');
    Cm := False;
  end;
  if n < 13 then
  Comment(image,'A=' + s1 + '))', 'После применения прямого хода метода Гаусса получаем ');

  if opt > 0 then
  begin
    p := 1;//нахождение определителя
    s1 := ReplaceText(FloatToStr(a[1, 1]), ',', '.', True);
    for i := 1 to n do
    begin
      p := p * a[i, i];
      if i > 1 then s1 := s1 + '*+' + ReplaceText(FloatToStr(a[i, i]), ',', '.', True);
    end;
    if opt = 2 then if n < 13 then
    Comment(Image,'Delta&A=' + s1 + '=' + ReplaceText(FloatToStr(p), ',', '.', False),
    'Определитель для данной матрицы равен произведению диагональных элементов ');
  end;

  if opt = -1 then
  begin
  //Метод Гаусса: обратный ход
  if a[n, n] = 0 then x[n] := b[n] / 0.00000000000001
  else x[n] := b[n] / a[n, n];
  i := n - 1;
  repeat
    j := i + 1;
    s := 0;{?}
    repeat
      s := s + a[i, j] * x[j];
      inc(j);
    until j > n ; {?}
    if a[i, i] = 0 then x[i] := (b[i] - s) / 0.00000000000001
    else x[i] := (b[i] - s) / a[i, i];
    i := i - 1;
  until i < 1;
  Result := x;
  end;
end;

procedure MK(a: m2;b: m1;n: integer;Image: TImage);
var
  j1, i: integer;
  d: real;
  av: m2;
  bv, x: m1;
begin //Метод Крамера
  Comment(Image, ' ', 'Решение СЛАУ методом Крамера.');
  bv := b;
  av := a; //запомнить нач. А и B
  MG(a, b, n, 2, image, True);
  d := p;
  for j1 := 1 to n do
  begin
    for i := 1 to n do a[i, j1] := b[i];
    MG(a, b, n, 1, image, False); if n < 13 then
    Comment(Image,'Delta&' + IntToStr(j1) + '=' + ReplaceText(FloatToStr(p), ',', '.', False), ' ');
    if d = 0 then x[j1] := p / 0.00000000001 else x[j1] := p / d;
    b := bv;
    a := av; //возврат к нач.значениям
  end; if n < 13 then
  Comment(Image, 'x_i=(Delta&A)/(Delta&i)', 'Вычисляем корни уравнения ');
  Comment(Image, ' ', 'Ответ: ');
  for j1 := 1 to n do
  Comment(Image,'x' + IntToStr(j1) + '=' + ReplaceText(FloatToStr(x[j1]), ',', '.', False), ' ');
end;

end.
 