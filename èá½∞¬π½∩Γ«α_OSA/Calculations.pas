unit Calculations;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Math,
  TheGeneral;

type
  TNewValue = record
    Value: array [0..100] of string;
    Number: array [0..100] of extended;
    Col: byte;
  end;

type
  TVar = set of char;
  procedure Preparation(var s: String;variables: TVar; NewValue: TNewValue);
  function ChangeVar(s: String;c: char;value: extended): String;
  function Recogn(st: String;var Num: extended): boolean;

implementation

procedure Preparation(var s: String;variables: TVar; NewValue: TNewValue);
const
  operators: set of char = ['+','-','*', '/', '^', '!'];
var
  i, j: integer;
  figures: set of char;
begin
  s := '(' + s + ')';
  figures := ['0','1','2','3','4','5','6','7','8','9', DecimalSeparator] + variables;
// " "
  repeat
    i := pos(' ', s);
    if i <= 0 then break;
    delete(s, i, 1);
  until 1 = 0;
  s := LowerCase(s);
// ".", ","
  if DecimalSeparator = '.' then
  begin
    i := pos(',', s);
    while i > 0 do
    begin
      s[i] := '.';
      i := pos(',', s);
    end;
  end
  else
  begin
    i := pos('.', s);
    while i > 0 do
    begin
      s[i] := ',';
      i := pos('.', s);
    end;
  end;
// Pi
  repeat
    i := pos('pi', s);
    if i <= 0 then break;
    delete(s, i, 2);
    insert(FloatToStr(Pi), s, i);
  until 1 = 0;
// Exponenta
  repeat
    if (pos('sec', s) > 0) then break;
    i := pos('e', s);
    if i <= 0 then break;
    delete(s, i, 1);
    insert(FloatToStr(2.71828182845905), s, i);
  until 1 = 0;
// Пользовательская константа
  repeat
    for j := 0 to NewValue.Col do
    begin
      if NewValue.Value[j] = ' ' then break;
      i := pos(NewValue.Value[j], s);
      if i <= 0 then break;
      delete(s, i, length(NewValue.Value[j]));
      if NewValue.Number[j] < 0 then
      insert('(' + FloatToStr(NewValue.Number[j]) + ')', s, i)
      else insert(FloatToStr(NewValue.Number[j]), s, i);
    end;  if i <= 0 then break;
  until 1 = 0;
// ":"
  repeat
    i := pos(':', s);
    if i <= 0 then break;
    s[i] := '/';
  until 1 = 0;
// |...|
  repeat
    i := pos('|', s);
    if i <= 0 then break;
    s[i] := 'a';
    insert('bs(', s, i + 1);
    i := i + 3;
    repeat
      i := i + 1
    until (i > Length(s))or(s[i] = '|');
    if s[i] = '|' then s[i] := ')';
  until 1 = 0;
// #...#
  i := 1;
  repeat
    if s[i] in figures then
    begin
      insert('#', s, i);
      i := i + 2;
      while (s[i] in figures) do i := i + 1;
      insert('#', s, i);
      i := i + 1;
    end;
    i := i + 1;
  until i > Length(s);
end;

function ChangeVar(s: string;c: char;value: extended): String;
var
  p: integer;
begin
  result := s;
  repeat
    p := pos(c, result);
    if p <= 0 then break;
    delete(result, p, 1);
    insert(FloatToStr(value), result, p);
  until false;
end;

function Recogn(st: String;var num: extended): boolean;
const
  pogr = 1E-10;
var
  p, p1: integer;
  i, j: integer;
  v1, v2: extended;
  func: (fNone, fSin, fCos, fTg, fCtg, fArcsin, fArccos, fArctg, fAbs, fLn, fLg, fArcCosec,
  fNot, fRTG, fGTR, fRTC, fCTR, fRTD, fDTR, fSqrt, fSec, fArcSec, fCosec, fArcctg, fRound);
  Sign: integer;
  s: String;
  s1: String;

  function FindLeftValue(p: integer; var Margin: integer; var Value: extended): boolean;
  var
    i: integer;
  begin
    i := p - 1;
    repeat
      i := i - 1
    until (i <= 0)or(s[i] = '#');
    Margin := i;
    try
      Value := StrToFloat(copy(s, i + 1, p - i - 2));
      result := true;
    except
      result := false
    end;
    delete(s, i, p - i);
  end;

  function FindRightValue(p: integer; var Value: extended): boolean;
  var
    i: integer;
  begin
    i := p + 1;
    repeat
      i := i + 1
    until (i > Length(s))or(s[i] = '#');
    i := i - 1;
    s1 := copy(s, p + 2, i - p - 1);
    result := TextToFloat(PChar(s1), value, fvExtended);
    delete(s, p + 1, i - p + 1);
  end;

  procedure PutValue(p: integer; NewValue: extended);
  begin
    insert('#' + FloatToStr(v1) + '#', s, p);
  end;

begin
  Result := False;
  s := st;
// ()
  p := pos('(', s);
  while p > 0 do
  begin
    i := p;
    j := 1;
    repeat
      i := i + 1;
      if s[i] = '(' then j := j + 1;
      if s[i] = ')' then j := j - 1;
    until (i > Length(s))or(j <= 0);
    if i > Length(s) then s := s + ')';
    if Recogn(copy(s, p + 1, i - p - 1), v1) = False then Exit;
    delete(s, p, i - p + 1);
    PutValue(p, v1);
    p := pos('(', s);
  end;
// sin, cos, tg, ctg, arcsin, arccos, arctg, abs, ln, lg, log...
  repeat
    func := fNone;

    p1 := pos('sec', s);
    if p1 > 0 then
    begin
      func := fSec;
      p := p1;
    end;

    p1 := pos('sin', s);
    if p1 > 0 then
    begin
      func := fSin;
      p := p1;
    end;

    p1 := pos('cos', s);
    if p1 > 0 then
    begin
      func := fCos;
      p := p1;
    end;

    p1 := pos('tg', s);
    if p1 > 0 then
    begin
      func := fTg;
      p := p1;
    end;

    p1 := pos('ctg', s);
    if p1 > 0 then
    begin
      func := fCtg;
      p := p1;
    end;

    p1 := pos('arctg', s);
    if p1 > 0 then
    begin
      func := fArctg;
      p := p1;
    end;
            
    p1 := pos('arcctg', s);
    if p1 > 0 then
    begin
      func := fArcctg;
      p := p1;
    end;

    p1 := pos('arcsec', s);
    if p1 > 0 then
    begin
      func := fArcSec;
      p := p1;
    end;

    p1 := pos('arcsin', s);
    if p1 > 0 then
    begin
      func := fArcsin;
      p := p1;
    end;

    p1 := pos('arccos', s);
    if p1 > 0 then
    begin
      func := fArccos;
      p := p1;
    end;

    p1 := pos('cosec', s);
    if p1 > 0 then
    begin
      func := fCosec;
      p := p1;
    end;

    p1 := pos('arccosec', s);
    if p1 > 0 then
    begin     
      func := fArcCosec;
      p := p1;
    end;

    p1 := pos('abs', s);
    if p1 > 0 then
    begin
      func := fAbs;
      p := p1;
    end;

    p1 := pos('ln', s);
    if p1 > 0 then
    begin
      func := fLn;
      p := p1;
    end;

    p1 := pos('lg', s);
    if p1 > 0 then
    begin
      func := fLg;
      p := p1;
    end;

    p1 := pos('rtg', s);
    if p1 > 0 then
    begin
      func := fRTG;
      p := p1;
    end;

    p1 := pos('not', s);
    if p1 > 0 then
    begin
      func := fNot;
      p := p1;
    end;

    p1 := pos('gtr', s);
    if p1 > 0 then
    begin
      func := fGTR;
      p := p1;
    end;

    p1 := pos('rtc', s);
    if p1 > 0 then
    begin
      func := fRTC;
      p := p1;
    end;

    p1 := pos('ctr', s);
    if p1 > 0 then
    begin
      func := fCTR;
      p := p1;
    end;

    p1 := pos('dtr', s);
    if p1 > 0 then
    begin
      func := fDTR;
      p := p1;
    end;

    p1 := pos('rtd', s);
    if p1 > 0 then
    begin
      func := fRTD;
      p := p1;
    end;

    p1 := pos('sqrt', s);
    if p1 > 0 then
    begin
      func := fSqrt;
      p := p1;
    end;

    p1 := pos('round', s);
    if p1 > 0 then
    begin
      func := fRound;
      p := p1;
    end;

    if func = fNone then break;
    case func of
      fSin, fCos, fCtg, fAbs, fNot, fSec, fRTG, fGTR, fRTC, fCTR, fDTR, fRTD: i := p + 2;
      fSqrt: i := p + 3;
      fArctg, fCosec, fRound: i := p + 4;
      fArcsin, fArccos, fArcSec, fArcctg: i := p + 5;
      fArcCosec: i := p + 7;
    else i := p + 1;
    end;
    if FindRightValue(i, v1) = false then Exit;
    delete(s, p, i - p + 1);
    case func of
      fSin: v1 := sin(v1);
      fCos: v1 := cos(v1);
      fTg: v1 := tan(v1);
      fCtg: v1 := cotan(v1);
      fArcsin: v1 := arcsin(v1);
      fArccos: v1 := arccos(v1);
      fSec: v1 := sec(v1);
      fArcSec: v1 := arcsec(v1);
      fCosec: v1 := cosecant(v1);
      fArctg: v1 := arctan(v1);
      fArcctg: v1 := arccot(v1);
      fArcCosec: v1 := arccsc(v1);
      fAbs: v1 := abs(v1);
      fLn: v1 := Ln(v1);
      fLg: v1 := Log10(v1);
      fRTG: v1 := RadToGrad(v1);
      fGTR: v1 := GradToRad(v1);
      fCTR: v1 := CycleToRad(v1);
      fRTC: v1 := RadToCycle(v1);
      fRTD: v1 := RadToDeg(v1);
      fDTR: v1 := DegToRad(v1);
      fSqrt: v1 := sqrt(v1);
      fRound: v1 := Round(v1);
      fNot: v1 := Not(Round(v1));
    end;
    PutValue(p, v1);
  until func = fNone;
// power
  p := pos('^', s);
  while p > 0 do
  begin
    if FindRightValue(p, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 1);
    v1 := Power(v1, v2);
    PutValue(i, v1);
    p := pos('^', s);
  end;
  p := pos('!', s);
  while p > 0 do
  begin
    if FindLeftValue(p, i, v1) = false then Exit;
    if v1 < 0 then Exit;
    delete(s, i, 1);
    v1 := fact(round(v1));
    PutValue(i, v1);
    p := pos('!', s);
  end;
// Процент от числа
  p := pos('pfn', s);
  while p > 0 do
  begin
    if FindRightValue(p + 2, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 3);
    v1 := PercentFromNumber(v1, v2);
    PutValue(i, v1);
    p := pos('pfn', s);
  end;
// Число1 в процент от числа2
  p := pos('ntp', s);
  while p > 0 do
  begin
    if FindRightValue(p + 2, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 3);
    v1 := NumberToPercent(v1, v2);
    PutValue(i, v1);
    p := pos('ntp', s);
  end;
// div
  p := pos('div', s);
  while p > 0 do
  begin
    if FindRightValue(p + 2, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 3);
    v1 := Round(v1) div Round(v2);
    PutValue(i, v1);
    p := pos('div', s);
  end;
// mod
  p := pos('mod', s);
  while p > 0 do
  begin
    if FindRightValue(p + 2, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 3);
    v1 := Round(v1) mod Round(v2);
    PutValue(i, v1);
    p := pos('mod', s);
  end;
// xor
  p := pos('xor', s);
  while p > 0 do
  begin
    if FindRightValue(p + 2, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 3);
    v1 := Round(v1) xor Round(v2);
    PutValue(i, v1);
    p := pos('xor', s);
  end;
// or
  p := pos('or', s);
  while p > 0 do
  begin
    if FindRightValue(p + 1, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 2);
    v1 := Round(v1) xor Round(v2);
    PutValue(i, v1);
    p := pos('or', s);
  end;
// and
  p := pos('and', s);
  while p > 0 do
  begin
    if FindRightValue(p + 2, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    delete(s, i, 3);
    v1 := Round(v1) and Round(v2);
    PutValue(i, v1);
    p := pos('and', s);
  end;
// *, /
  p := pos('*', s);
  p1 := pos('/', s);
  if (p1 > 0)and((p1 < p) or (p <= 0)) then p := p1;
  while p > 0 do
  begin
    if FindRightValue(p, v2) = false then Exit;
    if FindLeftValue(p, i, v1) = false then Exit;
    if s[i] = '*' then v1 := v1 * v2
    else
    begin
      if v2 = 0 then showmessage('Деление на 0!')
      else v1 := v1 / v2;
    end;
    delete(s, i, 1);
    PutValue(i, v1);
    p := pos('*', s);
    p1 := pos('/', s);
    if (p1 > 0)and((p1 < p)or(p <= 0)) then p := p1;
  end;
// +, -
  Num := 0;
  repeat
    Sign := 1;
    while (Length(s) > 0) and (s[1] <> '#') do
    begin
      if s[1] = '-' then Sign := -Sign
      else if s[1] <> '+' then Exit;
      delete(s, 1, 1);
    end;
    if FindRightValue(0, v1) = false then Exit;
    if Sign < 0 then Num := Num - v1 else Num := Num + v1;
  until Length(s) <= 0;

  Result := true;
end;

end.



















 