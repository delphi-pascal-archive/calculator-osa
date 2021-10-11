unit uWork3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, TheGeneral, Main;

type
  TWorkForm3 = class(TForm)
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    Image: TImage;
    SGX: TStringGrid;
    SGB: TStringGrid;
    SGA: TStringGrid;
    Panel1: TPanel;
    Nle: TLabeledEdit;
    UpDown2: TUpDown;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label2: TLabel;
    RadioButton4: TRadioButton;
    EPS: TLabeledEdit;
    MX: TLabeledEdit;
    RunB: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SGAClick(Sender: TObject);
    procedure SGAKeyPress(Sender: TObject; var Key: Char);
    procedure MXKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure RunBClick(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ReadM(v: integer);
    procedure MGZ();
  end;

var
  WorkForm3: TWorkForm3;
  a, xe: m2;
  b, x, y: m1;
  n, k: integer;
  c, p, pb, s: real;
  s1, s2, s3, s4: string;

implementation

{$R *.dfm}

procedure TWorkForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm3.SGAClick(Sender: TObject);
var
  i, j: integer;
begin
  SGA.Cells[0,0] := ' A';
  SGB.Cells[0,0] := ' B';
  SGX.Cells[0,0] := 'Начальные X';
  n := StrToInt(Nle.Text);
  SGA.RowCount := n + 1;
  SGA.ColCount := n + 1;
  SGB.RowCount := n + 1;
  SGX.RowCount := n + 1;
  for i := 1 to n do SGA.Cells[0,i] := ' ' + IntToStr(i);
  for j := 1 to n do SGA.Cells[j,0] := ' ' + IntToStr(j);
end;

procedure TWorkForm3.SGAKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TWorkForm3.MXKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8, #13: ;
  else Key := #27;
  end;
end;

procedure TWorkForm3.FormCreate(Sender: TObject);
begin
  SGAClick(Sender);
end;

procedure TWorkForm3.ReadM(v: integer);
var
  i, j: integer;
begin
  n := StrToInt(prv(Nle.Text));
  for i := 1 to n do for j := 1 to n do//считывание матрицы А
  try //если ввод неккоректный
    a[i, j] := StrToFloat(prv(SGA.Cells[j, i]));
    if v > 0 then
    begin
      B[i] := StrToFloat(prv(SGB.Cells[0, i]));
      if v = 2 then x[i] := StrToFloat(prv(SGX.Cells[0, i]));
    end;
  except
  on EconvertError do
    begin
      a[i, j] := 0;
      B[i] := 0;
      showmessage('Ошибка ввода!');
    end;
  end;
  Prepare(image);
  s1 := '!(Matrix(' + IntToStr(n) + ',' + IntToStr(n);
  s2 := '!(Matrix(1,' + IntToStr(n);
  s3 := s2;
  for i := 1 to n do
  begin
    for j := 1 to n do
    s1 := s1 + ',' + ReplaceText(FloatToStr(a[i,j]), ',', '.', False);
    if v = 2 then
    begin
      s2 := s2 + ',' + ReplaceText(FloatToStr(b[i]), ',', '.', False);
      s3 := s3 + ',x' + IntToStr(i);
    end;
  end;
  if v = 1 then Comment(image,'A=' + s1 + '))', ' ')
  else Comment(image, s1 + '))*+' + s3 + '))=' + s2 + '))', ' ');
end;

procedure TWorkForm3.RunBClick(Sender: TObject);
var
  i: integer;
begin
  if RadioButton1.Checked then
  begin
    ReadM(1);
    Comment(Image,' ', 'Нахождение определителя матрицы.');
    MG(a, b, n, 2, image, True);
    EndComment(Image);
  end;
  if RadioButton2.Checked then
  begin
    ReadM(2);
    MK(a, b, n, Image);
    EndComment(Image);
  end;
  if RadioButton3.Checked then
  begin
    ReadM(2);
    Comment(Image,' ', 'Решение СЛАУ методом Гаусса.');
    x := MG(a, b, n, -1, image, True);
    Comment(Image,'x_' + IntToStr(n),
    'Применяем обратный ход метода Гаусса. Он заключается в последовательном вычислении искомых неизвестных, начиная с ');
    Comment(Image,'x_1', 'и заканчивая ');
    Comment(Image,' ', 'Ответ:');
    for i := 1 to n do
    Comment(Image,'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(x[i]), ',', '.', False), ' ');
    EndComment(Image);
  end;
  if RadioButton4.Checked then
  begin
    ReadM(2);
    MGZ;
    Comment(Image,' ', 'Ответ:');
    for i := 1 to n do
    Comment(Image,'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(x[i]), ',', '.', False), ' ');
    EndComment(Image);
  end;
end;

procedure TWorkForm3.MGZ;
var
  e, t: real;
  i, j, k, r1, p: integer;
  tx: m1;
  Enable, L: boolean;
begin
  ReadM(2);
  Enable := False; L := True;
  t := 0;
  for i := 1 to n do
  for j := 1 to n do
  if i <> j then t := t + abs(a[i, j]);
  for i := 1 to n do
  if abs(a[i, i]) >= t then Enable := True;

  if Enable = False then
  if MessageBox(0,'Итерационный процесс для данной СЛАУ' +
                                #13 + 'не является сходящимся, т.к.' +
                                #13 + 'модули диагональных коэффициентов' +
                                #13 + 'для 1 из уравнений системы меньше' +
                                #13 + 'сумм модулей всех остальных коэффициентов.' +
                                #13 + 'Это условие является достаточным для' +
                                #13 + 'сходимости метода, но для некоторых' +
                                #13 + 'систем итерации сходятся и при' +
                                #13 + 'нарушении данного условия.' +
                                #13 + 'Продолжить вычисление?','Предупреждение',
                                MB_YesNo + MB_ICONQUESTION) = ID_YES then Enable := True;
  if Enable then
  begin
    try
      e := StrToFloat(prv(EPS.Text));
      p := StrToInt(prv(MX.Text));
      Comment(Image,' ', 'Решение СЛАУ методом Гаусса-Зейделя.');
      Comment(Image,'epsilon=' + ReplaceText(FloatToStr(e), ',', '.', False), 'Погрешность вычислений ');
      Comment(Image,ReplaceText(FloatToStr(p), ',', '.', False), 'Максимально допустимое количество итераций равно ');
      Comment(Image,' ', 'Заданы следующие начальные приближения:');
      for i := 1 to n do
      Comment(Image,'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(x[i]), ',', '.', False), ' ');
      if p > 10000 then
      begin
        MX.Text := '10000';
        p := 10000;
        showmessage('Слишком большое значение параметра!');
      end;
    except
      showmessage('Ошибка ввода!');
    end; //Метод Гаусса-Зейделя
    s := 0;
    k := 0;
    r1 := 0;
    t := 0;
    Comment(Image,' ', 'Подставив начальные значения в СЛАУ, получим новые приближения...');
    try
      for i := 1 to n do tx[i] := 0;
      repeat
        inc(k);
        Application.ProcessMessages;
        for i := 1 to n do
        begin
          for j := 1 to n do if (i <> j) then s := s + a[i, j] * x[j];
          if a[i, i] = 0 then x[i] := (b[i] - s) / 1 else x[i] := (b[i] - s) / a[i, i];
          s := 0;
          if k < 6 then
          begin
            if i = 1 then
            begin
              Comment(Image,' ', 'Итерация №' + IntToStr(k));
              Comment(Image,'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(x[i]), ',', '.', False), ' ');
            end
          else
          Comment(Image,'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(x[i]), ',', '.', False), ' ');
          end
          else
          if L then
          begin
            Comment(Image,'...', ' ');
            L := False;
          end;
          inc(r1);
          if r1 = n then
          begin
            if abs(x[i] - t) <= e then exit;
            t := x[i];
            r1 := 0;
          end;
        end;
      until (k = p);
    except
      showmessage('Ошибка! Возможно, переменные вышли за пределы допустимых значений...');
    end;
  end;
end;

procedure TWorkForm3.RadioButton3Click(Sender: TObject);
begin
  RunB.Enabled := True;
  SGX.visible := False;
  EPS.visible := False;
  MX.visible := False;
  if RadioButton1.Checked then SGB.visible := False;
  if (RadioButton2.Checked)or(RadioButton3.Checked) then SGB.visible := True;
  if RadioButton4.Checked then
  begin
    SGB.visible := False;
    SGX.visible := True;
    SGB.visible := True;
    EPS.visible := True;
    MX.visible := True;
  end;
end;

end.
