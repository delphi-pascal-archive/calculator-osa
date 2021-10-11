unit uWork8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Calculations, TheGeneral;

type
  TWorkForm8 = class(TForm)
    ScrollBox2: TScrollBox;
    Image: TImage;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    aEdit: TLabeledEdit;
    bEdit: TLabeledEdit;
    eEdit: TLabeledEdit;
    limEdit: TLabeledEdit;
    PXEdit: TLabeledEdit;
    RunB: TBitBtn;
    RadioGroup1: TRadioGroup;
    FuncEdit: TLabeledEdit;
    PFuncEdit: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aEditKeyPress(Sender: TObject; var Key: Char);
    procedure limEditKeyPress(Sender: TObject; var Key: Char);
    procedure RunBClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    procedure mdop;
    procedure mh;
    procedure mc;
    procedure Reading;
  public
    { Public declarations }
  end;

var
  WorkForm8: TWorkForm8;

implementation

uses Main;

var
  a, b, e, F, Fa, Fc, Fb, c: extended;
  i, lim: integer;
  s: string;

{$R *.dfm}

procedure TWorkForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm8.aEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TWorkForm8.limEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8, #13: ;
  else Key := #27;
  end;
end;

procedure TWorkForm8.mdop;
begin
  try
    Comment(Image, ' ', 'Решение нелинейного уравения. Метод деления отрезка пополам.');
    Reading;
    i := 0;
    if (e = 0)or(a = b)or(b < a) then
    showmessage('Ошибка ввода!')
    else
    begin
      repeat
        Application.ProcessMessages;
        c := (a + b) / 2;
        if recogn(ChangeVar(s, 'x', a), Fa) then //вычисление функции, результат в Fa
        if recogn(ChangeVar(s, 'x', c), Fc) then
        F := Fa * Fc;
        if i < 6 then
        begin
          Comment(Image, 'x' + IntToStr(i) + '=(' + ReplaceText(FloatToStr(a), ',', '.', True) +
          '+' + ReplaceText(FloatToStr(b), ',', '.', True) + ')/2=' +
          ReplaceText(FloatToStr(c), ',', '.', False), 'Итерация №' + IntToStr(i) + ' ');
          Comment(Image, 'F=F(' + ReplaceText(FloatToStr(a), ',', '.', False) + ')*F(' +
          ReplaceText(FloatToStr(c), ',', '.', False) + ')=' + ReplaceText(FloatToStr(Fa), ',', '.', True)
          + '*+' + ReplaceText(FloatToStr(Fc), ',', '.', True) + '='
           + ReplaceText(FloatToStr(F), ',', '.', False), ' ');
        end;
        if i = 6 then Comment(Image, '....', ' ');
        if F < 0 then b := c else a := c;
        inc(i);
      until (abs(Fc) < e)or(i >= lim);
      Comment(Image, 'x=' + ReplaceText(FloatToStr(c), ',', '.', False), 'Ответ: ');
      Comment(Image,' ', 'Количество итераций ' + FloatToStr(i));
    end;
  except
    showmessage('Ошибка ввода!');
  end;
  EndComment(Image);
end;

procedure TWorkForm8.RunBClick(Sender: TObject);
begin
  Prepare(Image);
  case RadioGroup1.ItemIndex of
    0: MDOP;
    1: MH;
    2: MC;
  end;
end;

procedure TWorkForm8.mh;
begin
  try
    Comment(Image, ' ', 'Решение нелинейного уравения. Метод хорд.');
    Reading;
    i:=0;
    if (e = 0)or(a = b)or(b < a) then
    showmessage('Ошибка ввода!')
    else
    begin
      repeat
        Application.ProcessMessages;
        if recogn(ChangeVar(s, 'x', a), Fa) then //вычисление функции, результат в Fa
        if recogn(ChangeVar(s, 'x', b), Fb) then
        if (Fb - Fa) <> 0 then
        c := a - (Fa * (b - a)) / (Fb - Fa)
        else
        begin
          showmessage('Деление на 0!');
          exit;
        end;
        if recogn(ChangeVar(s, 'x', c), Fc) then
        F := Fa * Fc;

        if i < 6 then
        begin
          Comment(Image, 'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(a), ',', '.', True) +
          '-(F(' + ReplaceText(FloatToStr(a), ',', '.', False) + ')*+(' +
          ReplaceText(FloatToStr(b), ',', '.', True) + '-' + ReplaceText(FloatToStr(a), ',', '.', True) +
          '))/(F(' + ReplaceText(FloatToStr(b), ',', '.', False) + ')-F(' +
          ReplaceText(FloatToStr(a), ',', '.', False) + '))=' + ReplaceText(FloatToStr(c), ',', '.', False),
          'Итерация №' + IntToStr(i) + ' ');
          if F < 0 then
          Comment(Image, 'F(' + ReplaceText(FloatToStr(a), ',', '.', False) + ')*F(' +
          ReplaceText(FloatToStr(c), ',', '.', False) + ')<0',
          'B=X, т.к. ') else
          Comment(Image, 'F(' + ReplaceText(FloatToStr(a), ',', '.', False) + ')*F(' +
          ReplaceText(FloatToStr(c), ',', '.', False) + ')>=0',
          'A=X, т.к. ');
        end;
        if i = 6 then Comment(Image, '....', ' ');

        if F < 0 then b := c else a := c;
        inc(i);
      until (abs(Fc) < e)or(i >= lim);
      Comment(Image, 'x=' + ReplaceText(FloatToStr(c), ',', '.', False), 'Ответ: ');
      Comment(Image,' ', 'Количество итераций ' + FloatToStr(i));
    end;
  except
    showmessage('Ошибка ввода!');
  end;
  EndComment(Image);
end;

procedure TWorkForm8.Reading;
begin
    a := StrToFloat(prv(aEdit.Text));
    b := StrToFloat(prv(bEdit.Text));
    e := StrToFloat(prv(eEdit.Text));
    lim := StrToInt(prv(limEdit.Text));
    if lim > 10000 then
    begin
      lim := 10000;
      limEdit.Text := '10000';
      showmessage('Слишком большое значение параметра!');
    end;
    s := FuncEdit.Text; //ввод функции
    Comment(Image, s, 'Дана функция ');
    Comment(Image, ' ', 'AB=[' + prv(aEdit.Text) + ';' + prv(bEdit.Text) + ']');
    Comment(Image, 'epsilon=' + ReplaceText(FloatToStr(e), ',', '.', False), 'Погрешность вычислений ');
    Comment(Image, ReplaceText(IntToStr(lim), ',', '.', False), 'Максимальное количество итераций ');
    s := FuncEdit.Text; //ввод функции
    preparation(s, ['x'], MainForm.t1);
end;

procedure TWorkForm8.mc;
var
  e, Fp, Fc, c, t: extended;
  i, lim: integer;
  s1, s2: string;
begin
  try
    Comment(Image, ' ', 'Решение нелинейного уравения. Метод касательных.');
    c := StrToFloat(prv(pxEdit.Text));
    e := StrToFloat(prv(eEdit.Text));
    lim := StrToInt(limEdit.Text);
    Comment(Image, FuncEdit.Text, 'Дана функция ');
    Comment(Image, pFuncEdit.Text, 'Производная функции равна ');
    Comment(Image, ' ', 'Начальное приближение X=' + prv(pxEdit.Text));
    Comment(Image, 'epsilon=' + ReplaceText(FloatToStr(e), ',', '.', False), 'Погрешность вычислений ');
    if lim > 10000 then
    begin
      lim := 10000;
      limEdit.Text := '10000';
      showmessage('Слишком большое значение параметра!');
    end;
    s1 := FuncEdit.Text; //ввод функции
    s2 := pFuncEdit.Text; //ввод производной функции
    i := 0;
    preparation(s1, ['x'], MainForm.t1);
    preparation(s2, ['x'], MainForm.t1);
    if e = 0 then
    showmessage('Ошибка ввода!')
    else
    begin
      repeat
        Application.ProcessMessages;
        t := c;
        if recogn(ChangeVar(s1, 'x', c), Fc) then //вычисление функции
        if recogn(ChangeVar(s2, 'x', c), Fp) then
        if Fp <> 0 then c := c - Fc / Fp
        else
        begin
          showmessage('Деление на 0!');
          exit;
        end;

        if i < 6 then
        begin
          Comment(Image, 'x' + IntToStr(i) + '=' + ReplaceText(FloatToStr(t), ',', '.', True) +
          '-F(' + ReplaceText(FloatToStr(t), ',', '.', False) + ')/F(' +
          ReplaceText(FloatToStr(t), ',', '.', False) + ')`=' +
          ReplaceText(FloatToStr(c), ',', '.', False),
          'Итерация №' + IntToStr(i) + ' ');
        end;
        if i = 6 then Comment(Image, '....', ' ');

        inc(i);
      until (abs(Fc) < e)or(i >= lim);
      Comment(Image, 'x=' + ReplaceText(FloatToStr(c), ',', '.', False), 'Ответ: ');
      Comment(Image,' ', 'Количество итераций ' + FloatToStr(i));
    end;
  except
    showmessage('Ошибка ввода!');
  end;
  EndComment(Image);
end;

procedure TWorkForm8.RadioGroup1Click(Sender: TObject);
begin
   PFuncEdit.Enabled := False;
   aEdit.Enabled := True;
   bEdit.Enabled := True;
   pxEdit.Enabled := False;
   if RadioGroup1.ItemIndex = 2 then
   begin
      PFuncEdit.Enabled := True;
      aEdit.Enabled := False;
      bEdit.Enabled := False;
      pxEdit.Enabled := True;
  end;
end;

end.
