unit uWork4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, TeEngine, Main,
  Series, TeeProcs, TheGeneral, Chart;

type
  TWorkForm4 = class(TForm)
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    Image: TImage;
    sg: TStringGrid;
    Chart1: TChart;
    Panel1: TPanel;
    RunB: TBitBtn;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    XEdit: TLabeledEdit;
    Label1: TLabel;
    Series1: TFastLineSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RunBClick(Sender: TObject);
    procedure sgKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LinearInterpolation();
    procedure Square_lawInterpolation();
  end;
  
var
  WorkForm4: TWorkForm4;

implementation
uses
  uWork3;

{$R *.dfm}

procedure TWorkForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm4.sgClick(Sender: TObject);
begin
  sg.Cells[0, 0] := 'X';
  sg.Cells[1, 0] := 'Y';
  sg.RowCount := StrToInt(Edit1.Text) + 1;
end;

procedure TWorkForm4.FormCreate(Sender: TObject);
begin
  sgClick(Sender);
end;

procedure TWorkForm4.RunBClick(Sender: TObject);
begin
  Prepare(Image);
  if RadioButton1.Checked then LinearInterpolation;
  if RadioButton2.Checked then Square_lawInterpolation;
end;

procedure TWorkForm4.LinearInterpolation;
var
  x, y: m1;
  i, j: integer;
  a, b, d: real;
  z: string;//для преобразования x[i] и y[i] в строки
begin
  Comment(Image, ' ', 'Линейная интерполяция функции, заданной таблично.');
  Comment(Image, ' ', 'Дано значение в точке x=' + FloatToStr(StrToFloat(prv(XEdit.Text))));
  for i := 1 to sg.RowCount - 1 do
  begin
    x[i] := 0;
    y[i] := 0;
  end; //очистка массивов Х и У
  series1.Clear; //очистка поля вывода и графич. области
  try
    for i := 1 to sg.RowCount - 1 do
    begin {3}
      x[i] := StrToFloat(prv(sg.Cells[0, i]));
      y[i] := StrToFloat(prv(sg.Cells[1, i]));
    end; //ввод табличных значений
    j := 0; //решение
    for i := 1 to sg.RowCount - 2 do
    begin {4}
      d := x[i + 1] - x[i];
      if d = 0 then
      begin
        showmessage('Деление на 0!');
        EndComment(Image);
        exit;
      end
      else
      if (x[i] <= StrToFloat(prv(XEdit.Text)))and(StrToFloat(prv(XEdit.Text)) <= x[i + 1]) then
      begin
        a := (y[i + 1] - y[i]) / d;
        b := y[i] - a * x[i];
        Comment(Image, '(y-y_(i-1))/(y_i-y_(i-1))=(x-x_(i-1))/(x_i-x_(i-1))', 'Используем уравнеие прямой, проходящей через 2 точки ');
        Comment(Image, 'a_i=(y_i-y_(i-1))/(x_i-x_(i-1))=(' +
        ReplaceText(FloatToStr(y[i + 1]), ',', '.', True) +
        '-' + ReplaceText(FloatToStr(y[i]), ',', '.', True) + ')/(' +
        ReplaceText(FloatToStr(x[i + 1]), ',', '.', True) + '-' +
        ReplaceText(FloatToStr(x[i]), ',', '.', True) + ')=' +
        ReplaceText(FloatToStr(a), ',', '.', False), ' ');
        Comment(Image, 'b_i=y_(i-1)-a_i*x_(i-1)=' + ReplaceText(FloatToStr(y[i]), ',', '.', True) + '-' +
        ReplaceText(FloatToStr(a), ',', '.', True) + '*' +
        ReplaceText(FloatToStr(x[i]), ',', '.', True) + '=' + ReplaceText(FloatToStr(b), ',', '.', False), ' ');
        if b >= 0 then z := '+' else z := '';
        series1.AddXY(x[i], y[i]); //рисование графика
        series1.AddXY(x[i + 1], y[i + 1]);
        Comment(Image, ' ', 'Ответ: для [' + FloatToStr(x[i]) + ';' + FloatToStr(x[i + 1]) +
        ']  ' + 'F(' + FloatToStr(StrToFloat(prv(XEdit.Text))) + ')=' +
        FloatToStr(a) + 'x' + z + FloatToStr(b) +
        '=' + FloatToStr(a * StrToFloat(prv(XEdit.Text)) + b));
        EndComment(Image);
        exit;
      end
      else
      if j < sg.RowCount - 3 then
      inc(j) else showmessage('Данная точка находится вне заданных значений!');
    end; //конец    
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TWorkForm4.sgKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TWorkForm4.Square_lawInterpolation;
var
  i: integer;
begin
  Comment(Image, ' ', 'Квадратичная интерполяция функции, заданной таблично.');
  Comment(Image, ' ', 'Дано значение в точке x=' + FloatToStr(StrToFloat(prv(XEdit.Text))));
  n := 3;
  try
    for i := 1 to n do
    begin
      b[i] := StrToFloat(prv(sg.Cells[1, i]));
      a[i, 3] := 1;
      a[i, 2] := StrToFloat(prv(sg.Cells[0, i]));
      a[i, 1] := a[i, 2] * a[i, 2];
      series1.AddXY(StrToFloat(prv(sg.Cells[0, i])), StrToFloat(prv(sg.Cells[1, i]))); //рисование графика
    end;
  except
    showmessage('Ошибка ввода!');
  end;
  x := MG(a, b, n, -1, image, True);
  Comment(Image,('F(' + ReplaceText(prv(XEdit.Text), ',', '.', False)
   + ')=' + ReplaceText(FloattoStr(x[1]), ',', '.', True) + '*(x^2)+' +
   ReplaceText(FloattoStr(x[2]), ',', '.', True) +
  '*x+' + ReplaceText(FloattoStr(x[3]), ',', '.', True) + '=' +
  ReplaceText(
  FloatToStr(x[1] * StrToFloat(prv(XEdit.Text)) * StrToFloat(prv(XEdit.Text)) +
  x[2] * StrToFloat(prv(XEdit.Text)) + x[3]), ',', '.', False)), 'Ответ: ');
  EndComment(Image);
end;

procedure TWorkForm4.RadioButton2Click(Sender: TObject);
begin
  Edit1.Text := '3';
  RunB.Enabled := True;
  UpDown1.Enabled := False;
end;

procedure TWorkForm4.RadioButton1Click(Sender: TObject);
begin
  RunB.Enabled := True;
  UpDown1.Enabled := True;
end;

end.
