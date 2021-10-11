unit uMatrixes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, ComCtrls, TheGeneral;

type
  TMatrixForm = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    RunB: TBitBtn;
    ScrollBox2: TScrollBox;
    Image: TImage;
    GroupBox1: TGroupBox;
    UpDown2: TUpDown;
    Me1: TEdit;
    UpDown1: TUpDown;
    Ne1: TEdit;
    GroupBox2: TGroupBox;
    UpDown3: TUpDown;
    Me2: TEdit;
    UpDown4: TUpDown;
    Ne2: TEdit;
    Rg: TRadioGroup;
    ScrollBox3: TScrollBox;
    SG2: TStringGrid;
    SG1: TStringGrid;
    Le: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SG2KeyPress(Sender: TObject; var Key: Char);
    procedure RunBClick(Sender: TObject);
    procedure RgClick(Sender: TObject);
  private
    function ReadM(sg: tstringgrid;n, m: integer): string;
    function WriteM(a: m2;n, m: integer): string;
    procedure Transp;
    procedure Add(Sum: boolean);
    procedure Umn;
    procedure Umnn;
  public
    { Public declarations }
  end;

var
  MatrixForm: TMatrixForm;
  a, b: m2;
  n_1, m_1, n_2, m_2: integer;
  s1, s2, s3: string;
  t: m2;
  c: m2;

implementation

{$R *.dfm}

procedure TMatrixForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMatrixForm.SG2Click(Sender: TObject);
begin
  n_1 := StrToInt(Ne1.Text);
  m_1 := StrToInt(Me1.Text);
  SG1.RowCount := n_1;
  SG1.ColCount := m_1;
  n_2 := StrToInt(Ne2.Text);
  m_2 := StrToInt(Me2.Text);
  SG2.RowCount := n_2;
  SG2.ColCount := m_2;
end;

procedure TMatrixForm.FormCreate(Sender: TObject);
begin
  SG2Click(Sender);
end;

function TMatrixForm.WriteM(a: m2;n, m: integer): string;
var
  i, j: integer;
  s: string;
begin
  Prepare(image);
  s := '!(Matrix(' + IntToStr(m) + ',' + IntToStr(n);
  for i := 1 to n do for j := 1 to m do
  s := s + ',' + ReplaceText(FloatToStr(a[i,j]), ',', '.', False);
  WriteM := s + '))';
end;

function TMatrixForm.ReadM(sg: tstringgrid;n, m: integer): string;
var
  i, j: integer;
begin
  for i := 1 to n do for j := 1 to m do//считывание матрицы
  try //если ввод неккоректный
    t[i, j] := StrToFloat(prv(SG.Cells[j - 1, i - 1]));
  except
    t[i, j] := 0;
    showmessage('Ошибка ввода!');
  end;
  ReadM := WriteM(t, n, m);
end;

procedure TMatrixForm.SG2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TMatrixForm.RunBClick(Sender: TObject);
begin
  n_1 := StrToInt(Ne1.Text);
  m_1 := StrToInt(Me1.Text);
  n_2 := StrToInt(Ne2.Text);
  m_2 := StrToInt(Me2.Text);
  case rg.ItemIndex of
    0: add(True);
    1: add(False);
    2: umn;
    3: umnn;
    4: transp;
  end;
end;

procedure TMatrixForm.Add(Sum: boolean);
var
  i, j: integer;
begin//+/-
  if (n_1 = n_2)and(m_1 = m_2) then
  begin
    s1 := ReadM(sg1, n_1, m_1);
    a := t;
    if Sum then
    s1 := s1 + '+' + ReadM(sg2, n_2, m_2)
    else s1 := s1 + '-' + ReadM(sg2, n_2, m_2);
    b := t;
    for i := 1 to n_1 do for j := 1 to m_1 do
    if Sum then c[i, j] := a[i, j] + b[i, j] else c[i, j] := a[i, j] - b[i, j];
    Comment(image, s1 + '=' + WriteM(c, n_1, m_1), ' ');
    EndComment(Image);
  end
  else
  showmessage('Сложение и вычитание допускаются только для матриц одинакового размера!');
end;

procedure TMatrixForm.Transp;
var
  i, j: integer;
begin
  s1 := ReadM(sg1, n_1, m_1) + '^T=' ;//транспонирование
  b := t;
  for i := 1 to n_1 do for j := 1 to m_1 do a[j, i] := b[i, j];
  Comment(image, s1 + WriteM(a, m_1, n_1), ' ');
  EndComment(Image);
end;

procedure TMatrixForm.Umn;
var
  i, j, k: integer;
  s: real;
begin
  //M - столбцы
  if m_1 = n_2 then
  begin
    s1 := ReadM(SG1, n_1, m_1);
    a := t;
    s1 := s1 + '*+' + ReadM(SG2, n_2, m_2);
    b := t;//умножение
    for i := 1 to n_1 do for j := 1 to m_2 do
    begin
      s := 0;
      for k := 1 to n_2 do
      s := s + a[i, k]*b[k, j];
      c[i, j] := s;
    end;
    Comment(image, s1 + '=' + WriteM(c, n_1, m_2), ' ');
    EndComment(Image);
  end else showmessage('В 1-ой матрице должно быть столько же столбцов, сколько строк во 2-й!');
end;

procedure TMatrixForm.Umnn;
var
  i, j: integer;
  n: real;
begin
  try
    n := StrToFloat(Le.Text);//умножение на число
    s1 := ReadM(sg1, n_1, m_1) + '*+' + ReplaceText(FloatToStr(n), ',', '.', True);
    a := t;
    for i := 1 to n_1 do for j := 1 to m_1 do a[i, j] := n*a[i, j];
    Comment(image, s1 + '=' + WriteM(a, n_1, m_1), ' ');
    EndComment(Image);
  except
      showmessage('Ошибка ввода!');
  end;
end;

procedure TMatrixForm.RgClick(Sender: TObject);
begin
  RunB.Enabled := True;
  Le.Visible := False;
  if rg.ItemIndex < 3 then
  begin
    SG2.Visible := True;
    GroupBox2.Visible := True;
  end
  else
  begin
    SG2.Visible := False;
    if rg.ItemIndex = 3 then Le.Visible := True;
    GroupBox2.Visible := False;
  end;
end;

end.
