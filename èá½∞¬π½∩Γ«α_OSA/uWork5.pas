unit uWork5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeEngine, Series, TeeProcs, Chart, StdCtrls, Buttons,
  Calculations, Grids, ComCtrls, TheGeneral, Menus;

type
  TWorkForm5 = class(TForm)
    ScrollBox2: TScrollBox;
    Chart1: TChart;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    eFunc: TLabeledEdit;
    Series1: TFastLineSeries;
    Panel3: TPanel;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    LH: TLabeledEdit;
    Panel6: TPanel;
    sg: TStringGrid;
    Panel7: TPanel;
    Edit3: TEdit;
    UpDown1: TUpDown;
    Series2: TFastLineSeries;
    eFunc2: TLabeledEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eFuncKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure sgKeyPress(Sender: TObject; var Key: Char);
    procedure sgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    procedure RND();
    procedure DI();
    procedure DT();
  public
    { Public declarations }
  end;

var
  WorkForm5: TWorkForm5;
  i: integer;
  s, s1: String;

implementation

uses Main;

{$R *.dfm}

procedure TWorkForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm5.RND();
const
  left = -10;
  right = 10;
  YScale = 50;
var
  i: integer;
  Num: extended;
  XScale: real;
begin
  s := eFunc.Text;
  s1 := eFunc2.Text;
  series2.Title := 'F(x) = ' + eFunc2.Text;
  preparation(s, ['x'], MainForm.t1); preparation(s1, ['x'], MainForm.t1);
  XScale := Chart1.Width / (right - left);
  randomize;
  for i := round(left * XScale) to round(right * XScale) do
  begin
    if recogn(ChangeVar(s, 'x', i / XScale), Num) then
    series1.AddXY((-1)*round(i / left * XScale),(-1)*round(Chart1.Height / 2 - Num * YScale));
    if recogn(ChangeVar(s1, 'x', i / XScale), Num) then
    series2.AddXY((-1)*round(i / left * XScale),(-1)*round(Chart1.Height / 2 - Num * YScale));
  end;
end;

procedure TWorkForm5.eFuncKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then BitBtn1.Click;
end;

procedure TWorkForm5.BitBtn1Click(Sender: TObject);
begin
  series1.Clear; series2.Clear;
  try
    series2.Title := ' ';
    case RadioGroup1.ItemIndex of
      0: RND;
      1: DI;
      2: DT;
    end;
    series1.Title := 'F(x) = ' + eFunc.Text;
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TWorkForm5.RadioGroup1Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  Panel4.Visible := True;
  case RadioGroup1.ItemIndex of
    0: begin
         Panel5.Visible := False;
         Panel2.Visible := True;
         Panel6.Visible := False;
         eFunc2.Enabled := True;
       end;
    1: begin
         Panel5.Visible := True;
         Panel2.Visible := True;
         Panel6.Visible := False;
         eFunc2.Enabled := False;
       end;
    2: begin
         Panel5.Visible := False;
         Panel2.Visible := False;
         Panel6.Visible := True;
       end;
  end;
end;

procedure TWorkForm5.sgKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TWorkForm5.DI;
var
  h: extended;
  F: extended;
  i, n: integer;
  x, y: array [0..10000] of extended;
begin
  s := eFunc.Text;
  i := 0;
  preparation(s, ['x'], MainForm.t1);
  if StrToFloat(prv(Edit2.Text)) > 10000 then Edit2.Text := '10000';
  x[0] := StrToFloat(prv(Edit1.Text));
  if recogn(ChangeVar(s, 'x', x[0]), y[0]) then
  h := StrToFloat(prv(LH.Text));
    repeat
      Application.ProcessMessages;
      inc(i);
      x[i] := x[i - 1] + abs(h);
      if recogn(ChangeVar(s, 'x', x[i]), y[i]) then
    until x[i] >= StrToFloat(prv(Edit2.Text));
  n := i;
  for i := 0 to n do
  Series1.AddXY(x[i], y[i]);
end;

procedure TWorkForm5.DT;
begin
  for i := 0 to  StrToInt(Edit3.Text) do
  Series1.AddXY(StrToFloat(prv(SG.Cells[0,i + 1])), StrToFloat(prv(SG.Cells[1,i + 1])));
end;

procedure TWorkForm5.sgClick(Sender: TObject);
begin
  sg.Cells[0, 0] := 'X';
  sg.Cells[1, 0] := 'Y';
  sg.RowCount := StrToInt(Edit3.Text) + 1;
end;

procedure TWorkForm5.FormCreate(Sender: TObject);
begin
  sgClick(Sender);
end;

procedure TWorkForm5.N1Click(Sender: TObject);
begin
  Chart1.UndoZoom;
end;

end.
