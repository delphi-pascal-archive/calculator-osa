unit uWork6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, TeEngine, Series,
  TeeProcs, Chart, Grids, TheGeneral, Main;

type
  TWorkForm6 = class(TForm)
    ScrollBox1: TScrollBox;
    sg: TStringGrid;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Panel1: TPanel;
    Label2: TLabel;
    RunB: TBitBtn;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    XEdit: TLabeledEdit;
    ScrollBox2: TScrollBox;
    Image: TImage;
    SGD: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RunBClick(Sender: TObject);
    procedure sgKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1Click(Sender: TObject);
  private
    procedure readM();
    procedure ML();
    procedure MN();
  public
    { Public declarations }
  end;

var
  WorkForm6: TWorkForm6;
  x, y: m1;
  i, j, n: integer;
  c, z, l, xn: real;

implementation

{$R *.dfm}

procedure TWorkForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm6.sgClick(Sender: TObject);
begin
  sg.Cells[0, 0] := 'X';
  sg.Cells[1, 0] := 'Y';
  for i := 0 to SGD.ColCount - 1 do
  for j := 0 to SGD.RowCount - 1 do
  SGD.Cells[i, j] := '';
  sg.RowCount := StrToInt(Edit1.Text) + 1;
  SGD.RowCount := StrToInt(Edit1.Text) + 1;
  SGD.ColCount := StrToInt(Edit1.Text);
end;

procedure TWorkForm6.FormCreate(Sender: TObject);
begin
  sgClick(Sender);
end;

procedure TWorkForm6.readM;
begin
  try
    Series1.Clear;
    n := StrToInt(prv(Edit1.Text));
    xn := StrToFloat(prv(XEdit.Text));
    for i := 0 to n - 1 do//считывание матриц
    begin
      x[i] := StrToFloat(prv(SG.Cells[0, i + 1]));
      y[i] := StrToFloat(prv(SG.Cells[1, i + 1]));
      Series1.AddXY(StrToFloat(prv(SG.Cells[0,i + 1])), StrToFloat(prv(SG.Cells[1,i + 1])));
    end;
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TWorkForm6.RunBClick(Sender: TObject);
begin
  Prepare(Image);
  ReadM;
  if RadioButton1.Checked then MN;
  if RadioButton2.Checked then ML;
  EndComment(Image);
end;

procedure TWorkForm6.ML;
var
  c, z, L: real;
  R: string;
begin
  Comment(Image, ' ', 'Глобальная интерполяция функции, заданной таблично, применяя многочлен Лагранжа.');
  Comment(Image, ' ', 'Дано значение в точке x=' + FloatToStr(StrToFloat(prv(XEdit.Text))));
  Comment(Image, 'L(x)_i=((x-x0)*(x-x1)*String( . . . )*(x-x_(i-1))*(x-x_(i+1))*String( . . . )*(x-x_(n-1)))/((x_i-x0)*(x_i-x1)*String( . . . )*(x_i-x_(i-1))*(x_i-x_(i+1))*String( . . . )*(x_i-x_(n-1)))',
  'Для нахождения каждого многочлена степени n  будем использовать ');
  Comment(Image, 'L(x)=y0*L(x)_0+y1*L(x)_1+String( . . . )+y_(n-1)*L(x)_(n-1)', 'Многочлен Лагранжа ');
  try
    L := 0;
    for j := 1 to n do
    begin
      c := 1;
      z := 1;
      for i := 0 to n - 1 do
      if i <> j - 1 then
      begin
        c := c * (xn - x[i]);
        z := z * (x[j - 1] - x[i]);
      end;
      if z = 0 then L := L + c / 000000000000000.1 else L := L + (c / z) * y[j - 1];

      if j = 1 then
      R := ReplaceText(FloatToStr(y[j - 1]), ',', '.', True) + '*' +
      ReplaceText(FloatToStr(c / z), ',', '.', True) else
      R := R + '+' + ReplaceText(FloatToStr(y[j - 1]), ',', '.', True) + '*' +
      ReplaceText(FloatToStr(c / z), ',', '.', True);

      if j < 6 then
      Comment(Image, 'L' + IntToStr(j - 1) + '(' + ReplaceText(prv(XEdit.Text), ',', '.', False) +
      ')=' + ReplaceText(FloatToStr(c / z), ',', '.', False), ' ');
      if j = 6 then Comment(Image, '....', ' ');
    end;
    Comment(Image, 'L(' + ReplaceText(prv(XEdit.Text), ',', '.', False) + ')=' + R, ' ');
    Comment(Image, ' ', 'Ответ: значение функции в точке ' + prv(XEdit.Text) + ' равно ' + FloatToStr(L));
  except
    showmessage('Ошибка!');
  end;
end;

procedure TWorkForm6.MN;
var
  x, y: array [1..100] of currency;
  i, j: integer;
  h1, h2, t, Xx, Yy: real;
  Enable: boolean;
begin
  Comment(Image, ' ', 'Глобальная интерполяция функции, заданной таблично, применяя многочлен Ньютона.');
  Comment(Image, ' ', 'Дано значение в точке x=' + FloatToStr(StrToFloat(prv(XEdit.Text))));
  try 
    n := StrToInt(Edit1.Text);
    Xx := StrToFloat(prv(xEdit.Text));
    for j := 1 to n do//считывание X,Y
    begin
      x[j] := StrToFloat(prv(SG.Cells[0,j]));
      y[j] := StrToFloat(prv(SG.Cells[1,j]));
    end;
    Yy := y[1];
    Enable := true;
    h1 := x[2] - x[1];
    for i := 3 to n do
    begin
      h2 := x[i] - x[i - 1];
      if h1 <> h2 then
      begin
        showmessage('Невозможно составить многочлен Ньютона: шаг H <> const!');
        Enable := false;
        exit;
      end;
      h1 := h2;
    end;
    Comment(Image, 'N(x0+t*h)=y0+t*Delta*y0+(t*(t-1))/(2!)*Delta^2*y0+String(. . .)+(t*(t-1)+String(. . .)+(t-n+1))/(n!)*Delta^n*y0',
    'Общий вид многочлена Ньютона ');
    Comment(Image, ReplaceText(FloatToStr(x[2]), ',', '.', False) + '-' +
    ReplaceText(FloatToStr(x[1]), ',', '.', True) + '=' +
    ReplaceText(FloatToStr(h1), ',', '.', False), 'Находим шаг h=');
    Comment(Image, 'Delta^n*y_i=Delta^(n-1)*y_(i+1)-Delta^(k-1)*y_i', 'Конечные разности n-ого порядка ');
    Comment(Image, 'i=0,1,...,k-1', ' ');
    if Enable then
    begin
      for j := 1 to n do
      for i := 1 to n - j do
      begin
        y[i] := y[i + 1] - y[i]; //находим dY на каждом шаге
        SGD.Cells[j - 1, i] := FloatToStr(y[i]);
        SGD.Cells[n - j - 1, 0] := 'Delta^' + IntToStr(i) + ' Y';
      end;
      t := (Xx - x[1]) / h1;
      Comment(Image, 't=(x-x0)/h=(' + ReplaceText(FloatToStr(Xx), ',', '.', False) +
      '-' + ReplaceText(FloatToStr(x[1]), ',', '.', True) + ')/' +
      ReplaceText(FloatToStr(h1), ',', '.', True) + '=' +
      ReplaceText(FloatToStr(t), ',', '.', False), ' ');
      SGD.Visible := True;
      Xx := Yy + t * StrToFloat(SGD.Cells[0, 1]);
      for i := 2 to n - 1 do
      begin
        h2 := t;
        for j := 1 to i - 1 do h2 := h2 * (t - j);
        h2 := h2 / fact(i) * StrToFloat(SGD.Cells[i - 1, 1]);
        Xx := Xx + h2;
      end;
      Comment(Image, ' ', 'Ответ: значение функции в точке ' + prv(XEdit.Text) + ' равно ' + FloatToStr(Xx))
    end;
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TWorkForm6.sgKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TWorkForm6.RadioButton1Click(Sender: TObject);
begin
  if RadioButton2.Checked then SGD.Visible := False;
  RunB.Enabled := True;
end;

end.
