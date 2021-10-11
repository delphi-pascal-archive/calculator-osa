unit uWork7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, TheGeneral,
  TeEngine, Series, TeeProcs, Chart, Calculations;

type
  TWorkForm7 = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    ScrollBox2: TScrollBox;
    Image: TImage;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Panel5: TPanel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    LH: TLabeledEdit;
    RunB: TBitBtn;
    XEdit: TLabeledEdit;
    Panel2: TPanel;
    eFunc: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunBClick(Sender: TObject);
    procedure XEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WorkForm7: TWorkForm7;

implementation

uses Main;

{$R *.dfm}

procedure TWorkForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm7.RunBClick(Sender: TObject);
var
  h, xx: extended;
  f, f1, f2: extended;
  i, n: integer;
  x, y: array [0..10000] of extended;
  s: string;
begin
  try
    Prepare(Image);
    Comment(Image, 'f(x)=' + eFunc.Text, 'Вычисление 1-ой производной функции, заданной аналитически: ');
    Comment(Image, 'x=' + ReplaceText(prv(XEdit.Text), ',', '.', False), ' ');
    Comment(Image, 'Delta&x=' + ReplaceText(prv(LH.Text), ',', '.', False), 'Приращение функции (шаг):  ');
    Comment(Image, 'f(x)`~~(f(x+Delta&x)-f(x-Delta&x))/(2*Delta&x)',
    'Используем симметричную разностную формулу приближенного вычисления производной ');

    xx := StrToFloat(prv(XEdit.Text));
    h := StrToFloat(prv(LH.Text));
    s := eFunc.Text;
    i := 0;
    preparation(s, ['x'], MainForm.t1);

    if recogn(ChangeVar(s, 'x', xx + h), f1) then
    if recogn(ChangeVar(s, 'x', xx - h), f2) then
    f := (f1 - f2)/2*h;

    Comment(Image, 'f(' + ReplaceText(prv(XEdit.Text), ',', '.', False) + ')`~~(' +
    ReplaceText(FloatToStr(f1), ',', '.', True) + '-' +
    ReplaceText(FloatToStr(f2), ',', '.', True) + ')/(' +
    ReplaceText(FloatToStr(2*h), ',', '.', True) +')~~' +
    ReplaceText(FloatToStr(f), ',', '.', False), ' ');

    if StrToFloat(prv(Edit2.Text)) > 10000 then Edit2.Text := '10000';
    x[0] := StrToFloat(prv(Edit2.Text));
    if recogn(ChangeVar(s, 'x', x[0]), y[0]) then
    Series1.Clear;
    repeat
      Application.ProcessMessages;
      inc(i);
      x[i] := x[i - 1] + abs(h);
      if recogn(ChangeVar(s, 'x', x[i]), y[i]) then
    until x[i] >= StrToFloat(prv(Edit3.Text));
    n := i;
    for i := 0 to n do Series1.AddXY(x[i], y[i]);

    Comment(Image, 'f(' + ReplaceText(prv(XEdit.Text), ',', '.', False) +
    ')`=' + ReplaceText(FloatToStr(f), ',', '.', False), 'Ответ: ');
    EndComment(Image);
  except
    showmessage('Ошибка ввода!');
    EndComment(Image);
  end;
end;

procedure TWorkForm7.XEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

end.
