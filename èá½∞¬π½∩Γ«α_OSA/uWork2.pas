unit uWork2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, TheGeneral, Calculations;

type
  TWorkForm2 = class(TForm)
    ScrollBox2: TScrollBox;
    ScrollBox1: TScrollBox;
    Image: TImage;
    Panel1: TPanel;
    RadioGroup: TRadioGroup;
    Func: TLabeledEdit;
    ak: TLabeledEdit;
    bk: TLabeledEdit;
    Nk: TLabeledEdit;
    Ek: TLabeledEdit;
    RunB: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunBClick(Sender: TObject);
    procedure EkKeyPress(Sender: TObject; var Key: Char);
    procedure NkKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroupClick(Sender: TObject);
  private
    procedure Run_M_SP(param: integer);
    procedure IntegralSimpson(a, b: real; f: string; e: real);
  public
    { Public declarations }
  end;

var
  WorkForm2: TWorkForm2;
  a_s, b_s, h_s: string;

implementation

uses Main;

{$R *.dfm}

procedure TWorkForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm2.Run_M_SP(param: integer);
var
  x05, x, a, b, h, F, Fx, Ft, Ff, F1: extended;
  i, n: Integer;
  S: string;
  Draw: boolean;
begin   //метод средних прямоугольников - 1
  try   //метод трапеций - 2
    a := StrToFloat(prv(Ak.Text));
    b := StrToFloat(prv(Bk.Text));
    n := StrToInt(prv(Nk.Text));
    if n > 100000 then
    begin
      n := 100000;
      Nk.Text := '100000';
      showmessage('Слишком большое значение параметра!');
    end;
    s := Func.Text;
    if a < b then
    begin
      comment(image, 'N=' + prv(Nk.Text), 'Количество отрезков для разбиения ');
      if param = 1 then comment(image, ' ', 'Метод средних прямоугольников.')
      else comment(image, ' ', 'Метод трапеций.');
      h := (b - a) / n;
      comment(image, 'h=(b-a)/n=(' + b_s + '-' + a_s + ')/' +
      IntToStr(n) + '=' + ReplaceText(FloatToStr(h), ',', '.', False), 'Находим шаг разбиения ');
      preparation(s, ['x'], MainForm.t1);
      comment(image, 'x_i=x_(i-1)+h', 'Вычислим значения подинтегральной функции в точках разбиения ');
      x := a;
      x05 := a + h / 2;
      if param = 1 then
      begin
        comment(image, 'x_(i-1/2)=x_(i-1)+h/2', '...и полуцелых точках: ');
        comment(image, 'x=' + ReplaceText(prv(Ak.Text), ',', '.', False), 'Шаг 1: ');
        comment(image, 'x_(1/2)=' + a_s + '+(' + ReplaceText(FloatToStr(h), ',', '.', False)
         + ')/2=' + ReplaceText(FloatToStr(x05), ',', '.', False), ' ');
      end
      else comment(image, 'x=' + ReplaceText(prv(Ak.Text), ',', '.', False), 'Шаг 1: ');
      Ft := 0;
      case param of
        1: if recogn(ChangeVar(s, 'x', x05), Fx) then
        begin
          F := Fx * h; F1 := Fx;
          comment(image, 'F(' + ReplaceText(FloatToStr(x05), ',', '.', False) + ')_(1/2)='
          + ReplaceText(FloatToStr(Fx), ',', '.', False), ' ');
        end;
        2: if recogn(ChangeVar(s, 'x', x), Fx) then
        begin
          comment(image, 'F(' + ReplaceText(FloatToStr(x), ',', '.', False) + ')=' +
          ReplaceText(FloatToStr(Fx), ',', '.', False), ' ');
          Ft := Fx;
          F := 0;
          n := n + 1;
        end;
      end;
      Draw := True;
      for i := 2 to n do
      begin
        Application.ProcessMessages;
        x := x + h;
        if (i <=5)or(i >= n - 5) then
        comment(image, 'x=' + ReplaceText(FloatToStr(x), ',', '.', False), 'Шаг ' + IntToStr(i) + ': ')
        else
        if Draw then
        begin
          comment(image, '....', ' ');
          Draw := False;
        end;
        case Param of
          1: begin
               x05 := x + h / 2;
               if recogn(ChangeVar(s, 'x', x05), Fx) then F := F + H * Fx;
               if (i <=5)or(i >= n - 5) then
               begin
                 comment(image, 'x_0.5=' + ReplaceText(FloatToStr(x05), ',', '.', False), ' ');
                 comment(image, 'F(' + ReplaceText(FloatToStr(x05), ',', '.', False) + ')_(0.5)=' +
                 ReplaceText(FloatToStr(Fx), ',', '.', False), ' ');
               end;
             end;
          2: begin
               if recogn(ChangeVar(s, 'x', x), Fx) then Ff := Fx + Ft;
               if (i <=5)or(i >= n - 5) then
               comment(image, 'F(' + ReplaceText(FloatToStr(x), ',', '.', False) + ')=' +
               ReplaceText(FloatToStr(Fx), ',', '.', False), ' ');
               F := F + Ff;
               Ft := Fx;
             end;
          end;
      end;
      if Param = 2 then F := (h / 2) * F;
      if param = 1 then
      begin
        comment(image, 'Int((' + Func.Text + ')*diff(x),a,b)=h*Summa(F(x_(i-1/2)),i=1,n)',
        'Применяем формулу метода средних прямоугольников ');
        comment(image, 'Int((' + Func.Text + ')*diff(x),' +  a_s + ',' +
        b_s + ')=' + ReplaceText(FloatToStr(h), ',', '.', True) +'*Summa(F(x_(i-1/2)),i=1,'
        + prv(nk.Text) +')~~' + ReplaceText(FloatToStr(F), ',', '.', False), 'Ответ: ')
      end
      else
      begin
        comment(image, 'Int((' + Func.Text + ')*diff(x),a,b)=h*((y0+yn)/2+Summa(y_i,i=1,n-1))',
        'Применяем формулу метода трапеций ');
        comment(image, 'Int((' + Func.Text + ')*diff(x),' +  a_s + ',' + b_s + ')=' +
        ReplaceText(FloatToStr(h), ',', '.', True) + '*((' + ReplaceText(FloatToStr(F1),
        ',', '.', False) + '+' + ReplaceText(FloatToStr(Fx), ',', '.', True) + ')/2+'
        + 'Summa(F(x_i),i=2,' + prv(nk.Text) + '))~~' + ReplaceText(FloatToStr(F), ',',
        '.', False), 'Ответ: ');
      end;
    end
    else showmessage('A должно быть меньше B!');
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TWorkForm2.RunBClick(Sender: TObject);
begin
  Prepare(image);
  a_s := ReplaceText(prv(Ak.Text), ',', '.', True);
  b_s := ReplaceText(prv(Bk.Text), ',', '.', True);
  comment(image, 'Int((' + Func.Text + ')*diff(x),' +  a_s + ',' +
  b_s + ')', 'Вычисление определённого интеграла ');
  case RadioGroup.ItemIndex of
    0: Run_M_SP(1);
    1: Run_M_SP(2);
    2: try
         IntegralSimpson(StrToFloat(prv(Ak.Text)), StrToFloat(prv(Bk.Text)),
         Func.Text, StrToFloat(prv(Ek.Text)));
       except
         showmessage('Ошибка ввода!');
       end;
  end;
  EndComment(image);
end;

procedure TWorkForm2.EkKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

procedure TWorkForm2.NkKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
  else Key := #27;
  end;
end;

procedure TWorkForm2.IntegralSimpson(a, b: real; f: string; e: real);
var
  h, x, xt, s, s1, s2, s3, sign, IntS: real;
  fa, fb, Fx: extended;
  i: integer;
begin 
  i := 0;
  comment(image, 'epsilon=' + ReplaceText(FloatToStr(e), ',', '.', False), 'Погрешность вычислений ');
  comment(image, ' ', 'Метод Симпсона.');
  if (a = b) then
  begin
    IntS := 0;
    exit;
  end;
  if (a > b) then
  begin
    x := a;
    a := b;
    b := x;
    sign := -1;
  end else sign := 1;
  h := b - a;
  preparation(f, ['x'], MainForm.t1);
  if recogn(ChangeVar(f, 'x', a), Fa) then
  if recogn(ChangeVar(f, 'x', b), Fb) then
  s := Fa + Fb;
  s2 := s;
  comment(image, 'x_i=x_(i-1)+h', 'Вычислим значения подинтегральной функции в точках разбиения ');
  repeat
    s3 := s2;
    h := h / 2;
    s1 := 0;
    x := a + h;
    inc(i);
    repeat
      xt := x;
      if recogn(ChangeVar(f, 'x', x), Fx) then
      s1 := s1 + 2 * Fx;
      x := x + 2*h;
      if not(x < b) then if i < 6 then
      begin
        comment(image, 'F(' + ReplaceText(FloatToStr(xt), ',', '.', False) +
        ')=' + ReplaceText(FloatToStr(Fx), ',', '.', False),
        'Шаг ' + IntToStr(i) + ': ');
      end
      else comment(image, '....', ' ');
    until (not(x < b));
    s := s + s1;
    s2 := (s + s1) * h / 3;
    x := abs(s3 - s2) / 15;
  until (not(x > e));
  IntS := s2 * sign;
  comment(image, 'F(' + ReplaceText(FloatToStr(b), ',', '.', False) + ')=' +
  ReplaceText(FloatToStr(Fb), ',', '.', False), 'Шаг ' + IntToStr(i + 1) + ': ');
  comment(image, 'Int((' + Func.Text +
  ')*diff(x),a,b)=(h/3)*[y0+4*(y1+y3+...+y_(n-1))+2*(y2+y4+...+y_(n-2))+y_n]',
  'Применяем формулу Симпсона ');
  comment(image, 'Int((' + Func.Text + ')*diff(x),' +  a_s + ',' +
  b_s + ')=(h/3)*[' + ReplaceText(FloatToStr(Fa), ',', '.', True) +
  '+4*(y1+y3+...+y_(n-1))+2*(y2+y4+...+y_(n-2))+' +
  ReplaceText(FloatToStr(Fa), ',', '.', True) + ']~~' +
  ReplaceText(FloatToStr(IntS), ',', '.', False), 'Ответ: ');
end;

procedure TWorkForm2.RadioGroupClick(Sender: TObject);
begin
  RunB.Enabled := True;
  Nk.Enabled := True;
  case RadioGroup.ItemIndex of
    0, 1: Ek.Enabled := False;
    2: begin
         Ek.Enabled := True;
         Nk.Enabled := False;
       end;
  end;
end;

end.
