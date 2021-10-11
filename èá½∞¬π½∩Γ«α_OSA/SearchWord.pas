unit SearchWord;

interface

uses
  Windows, Classes, StdCtrls, ComCtrls;

function FindInMemo(Memo: TRichEdit; const FindText: string; FindDown, MatchCase: Boolean): Boolean;

implementation  

function FindInMemo(Memo: TRichEdit; const FindText: string; FindDown, MatchCase: Boolean): Boolean;
{���� ������ �������, �� ��������� True, ����� - False;
 FindText : ������� ������;
 FindDown : True - ����� ���� �� ������� �����;
            False - ����� ����� �� ������� �����;
 MatchCase : True - � ������ �������� ����,
             False - �� �������� ������� ����.
 ���� � Memo ����� ����������� ����, �� ����� ���������� �������� - ����� ����� ������,
 �� ������� �� ��� ��� ����. ��� ���, ��� ����������� ������
 �������� ScrollBars � Memo ������� � ssBoth (�� ��� ssHorizontal)}

function PosR2L(const FindStr, SrcStr: string): Integer;
{����� ���������� ��������� ��������� FindStr � ������ SrcStr}
var
   ps, L: Integer;
function InvertSt(const S: string): string;
{�������� ������ S}
var
   i: Integer;
begin
 L := Length(S);
 SetLength(Result, L);
 for i := 1 to L do Result[i] := S[L - i + 1];
end;

begin
 ps := Pos(InvertSt(FindStr), InvertSt(SrcStr));
 if ps <> 0 then
 Result := Length(SrcStr) - Length(FindStr) - ps + 2
 else Result := 0;
end;

function MCase(const s: string): string;
{������� ��������� ���� � ��������;
 ������� ���������� ���� ������� �� �����������}
var
   i: Integer;
begin
 Result := s;
 for i := 1 to Length(s) do
 begin
  case s[i] of
  'A'..'Z',
  '�'..'�': Result[i] := Chr(Ord(s[i]) + 32);
  '�': Result[i] := '�';
  '�': Result[i] := '�';
  '�': Result[i] := '�';
  '�': Result[i] := '�';
  '�': Result[i] := '�';
  '�': Result[i] := '�';
  '�': Result[i] := '�';
  end;
 end;
end;

var
   Y, X, SkipChars: Integer;
   FindS, SrcS: string;
   P: TPoint;
begin
 Result := False;
 if MatchCase then FindS := FindText else FindS := MCase(FindText);
 P := Memo.CaretPos;
 if FindDown then
{����� ������ � ���� �� ������� �����}
 for Y := P.y to Memo.Lines.Count do
 begin
  if Y <> P.y then SrcS := Memo.Lines[Y] else
{���� ��� �� ������, � ������� ������ ����, �� ���� �� ���� ������,
����� �������� ������ �� ������� �� �����}
  SrcS := Copy(Memo.Lines[Y], P.x + 1, Length(Memo.Lines[Y]) - P.x + 1);
  if not MatchCase then SrcS := MCase(SrcS);
  X := Pos(FindS, SrcS);
  if X <> 0 then
  begin
   if Y = P.y then Inc(X, P.x);
   P := Point(X, Y);
   Result := True;
   Break; {����� �� �����}
  end
 end
 else
{����� ����� � ����� �� ������� �����}
 for Y := P.y downto 0 do
 begin
  if Y <> P.y then SrcS := Memo.Lines[Y]
{���� ��� �� ������, � ������� ������ ����, �� ���� �� ���� ������}
  else
{����� �������� ������ �� ������ �� ������� ����� ���������� �����}
  SrcS := Copy(Memo.Lines[Y], 1, P.x - Memo.SelLength);
  if not MatchCase then SrcS := MCase(SrcS);
  X := PosR2L(FindS, SrcS);
  if X <> 0 then
  begin
   P := Point(X, Y);
   Result := True;
   Break; {����� �� �����}
  end
 end;
 if Result then
 begin
{���� ����� ������ - �������� ���}
  SkipChars := 0;
  for y := 0 to P.Y - 1 do Inc(SkipChars, Length(Memo.Lines[y]));
  Memo.SelStart := SkipChars + (P.Y * 2) + P.X - 1;
  Memo.SelLength := Length(FindText);
 end;
end;

end.






























  






