unit uWork1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, TheGeneral, Main;

type
  TWorkForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    Image: TImage;
    Panel1: TPanel;
    aEdit: TLabeledEdit;
    bEdit: TLabeledEdit;
    cEdit: TLabeledEdit;
    RunB: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunBClick(Sender: TObject);
    procedure cEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

  end;

var
  WorkForm1: TWorkForm1;

implementation

{$R *.dfm}

procedure TWorkForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWorkForm1.RunBClick(Sender: TObject);
var
  a, b , c, d, x1, x2: real;
  a_s, b_s, c_s: string;
begin
  try
    a := StrToFloat(prv(aEdit.Text));
    b := StrToFloat(prv(bEdit.Text));
    c := StrToFloat(prv(cEdit.Text));
    a_s := ReplaceText(prv(aEdit.Text), ',', '.', True);
    b_s := ReplaceText(prv(bEdit.Text), ',', '.', True);
    c_s := ReplaceText(prv(cEdit.Text), ',', '.', True);
    if a <> 0 then
    begin
      d := b * b - 4 * a * c;
      Prepare(image);
      comment(image, a_s + '*x^2+' + b_s + '*x+' + c_s + '=0', 'Решение квадратного уравнения вида ');
      comment(image, 'D=b^2-4*a*c=' + b_s + '^2' + '-4*' + a_s + '*' + c_s + '=' +
      ReplaceText(FloatToStr(d), ',', '.', False), 'Находим дискриминант: ');
      if d >= 0 then
      begin
        comment(image, ' ', 'Находим корни уравнения:');
        x1 :=  (- b + sqrt(d)) / (2 * a);
        x2 :=  (- b - sqrt(d)) / (2 * a);
        comment(image, 'x1=(-b+Sqrt(d))/(2*a)=(' + ReplaceText(FloatToStr(-b), ',', '.', True) + '+' +
        ReplaceText(FloatToStr(sqrt(d)), ',', '.', True) + ')/(2*' + a_s + ')=' +
        ReplaceText(FloatToStr(x1), ',', '.', False), ' ');
        comment(image, 'x2=(-b-Sqrt(d))/(2*a)=(' + ReplaceText(FloatToStr(-b), ',', '.', True) + '-' +
        ReplaceText(FloatToStr(sqrt(d)), ',', '.', True) + ')/(2*' + a_s + ')=' +
        ReplaceText(FloatToStr(x2), ',', '.', False), ' ');
      end
      else comment(image, 'D<0', 'Нет корней:');
      EndComment(image);
    end
    else showmessage('Коэффициент A не должен равняться 0!');
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TWorkForm1.cEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

end.
