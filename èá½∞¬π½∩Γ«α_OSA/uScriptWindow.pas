unit uScriptWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, Buttons, ToolWin;

type
  TScriptForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo: TRichEdit;
    VarMemo: TRichEdit;
    ScrollBox2: TScrollBox;
    RunB: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    RLE: TLabeledEdit;
    BitBtn51: TBitBtn;
    Label2: TLabel;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunBClick(Sender: TObject);
    procedure MemoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure VarMemoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Add(const st: String;func: boolean);
  public
    
  end;

var
  ScriptForm: TScriptForm;
  b: Boolean;
  
implementation

uses Main, Calculations, TheGeneral;

{$R *.dfm}

procedure TScriptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TScriptForm.RunBClick(Sender: TObject);
var
  x, Fx: extended;
  i, c: integer;
  f, p, v: string;
  t1: TNewValue;
  ErrorCode: Byte;
begin
  try
    c := SendMessage(memo.Handle, EM_LINEFROMCHAR, memo.SelStart, 0);
    F := memo.Lines[c];
    if VarMemo.Lines.Count > 0 then
    begin
      t1.Col := VarMemo.Lines.Count - 1;
      for i := 0 to t1.Col do
      begin
        v := VarMemo.Lines[i];
        p := VarMemo.Lines[i];
        Delete(v, 1, pos('=', v)); Delete(p, pos('=', p), length(p));
        if (p = ' ')or((p >= 'A')and(p <= 'Z'))or((p >= 'a')and(p <= 'z')) then
        begin
          showmessage('Константа должна содержать только буквы русского алфавита!');
          break;
        end
        else
        begin
          t1.Value[i] := p;
          t1.Number[i] := StrToFloat(v);
        end;
      end;
    end;
    preparation(f, [' '], t1);
    if recogn(ChangeVar(f, ' ', x), Fx) then RLE.Text := FloatToStr(Fx)
    else RLE.Text := 'невозможно вычислить выражение!';
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TScriptForm.MemoKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    #13: RunB.Click;
    '.', ',': key := DecimalSeparator;
  end;
end;

procedure TScriptForm.Add(const st: String;func: boolean);
var
  tmp, s: string;
  i, p: integer;
begin
  p := Memo.SelStart;
  s := st; Delete(s, pos('&', s), 1);
  for i := 1 to Memo.SelStart do tmp := tmp + Memo.Text[i];
  if func then tmp := tmp + ' ' + s + '(' else
  if (s = '*')or(s = '/')or(s = '+')or(s = '-')
  then tmp := tmp +  ' ' + s
  else tmp := tmp + s;
  if Memo.SelLength > 0 then
  for i := Memo.SelStart+1 to Memo.SelStart + Memo.SelLength do
  tmp := tmp + Memo.Text[i];
  if func then tmp := tmp + ') ' else
  if (s = '*')or(s = '/')or(s = '+')or(s = '-')
  then tmp := tmp + ' ';
  if Memo.SelStart < Length(Memo.Text) then
  for i := Memo.SelStart + Memo.SelLength + 1 to Length(Memo.Text) do
  tmp := tmp + Memo.Text[i];
  Memo.Text := tmp;
  if (func)or(s = '*')or(s = '/')or(s = '+')or(s = '-') then
  Memo.SelStart := p + Length(s) + 2 else Memo.SelStart := p + Length(s);
  Memo.SetFocus;
end;

procedure TScriptForm.BitBtn1Click(Sender: TObject);
begin
  Add((Sender as TBitBtn).Caption, True);
end;

procedure TScriptForm.BitBtn2Click(Sender: TObject);
begin
  Add((Sender as TBitBtn).Caption, False);
end;

procedure TScriptForm.BitBtn20Click(Sender: TObject);
begin
  Memo.Clear;
end;

procedure TScriptForm.BitBtn29Click(Sender: TObject);
begin
  keybd_event(VK_BACK, 0, 0, 0);
  keybd_event(VK_BACK, 0, KEYEVENTF_KEYUP, 0);
  memo.SetFocus;
end;

procedure TScriptForm.FormShow(Sender: TObject);
begin
  Memo.SetFocus;
end;

procedure TScriptForm.MemoChange(Sender: TObject);
var
  tmp: TRichEdit;
  i: Word;
  s: String;
  pos: Word;
begin
  if b then
  begin
    b := False;
    tmp := Sender as TRichEdit;
    pos := tmp.SelStart;
    s := tmp.Text;

    tmp.Lines.BeginUpdate;
    for i := 1 to Length(s) do
    begin
      tmp.SelStart := i-1;
      tmp.SelLength := 1;
      if (s[i] = '(') or (s[i] = ')') or (s[i] = '[') or (s[i] = ']') then
        tmp.SelAttributes.Color := clTeal
      else if (s[i] >= '0') and (s[i] <= '9') then
        tmp.SelAttributes.Color := clMaroon
      else if ((s[i] >= 'a') and (s[i] <= 'z')) or ((s[i] >= 'A') and (s[i] <= 'Z')) or (s[i] = '_') then
        tmp.SelAttributes.Color := clNavy
      else if (s[i] = '+') or (s[i] = '-') or (s[i] = '*') or (s[i] = '/') or (s[i] = '^') or (s[i] = '=') then
        tmp.SelAttributes.Color := clBlack
      else tmp.SelAttributes.Color := clRed;
    end;
    tmp.Lines.EndUpdate;
    tmp.SelStart := pos;
    b := True;
  end;
end;

procedure TScriptForm.FormCreate(Sender: TObject);
begin
  b := True;
end;

procedure TScriptForm.BitBtn53Click(Sender: TObject);
begin
  VarMemo.Clear;
end;

procedure TScriptForm.VarMemoKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '.', ',': key := DecimalSeparator;
  end;
end;

end.
