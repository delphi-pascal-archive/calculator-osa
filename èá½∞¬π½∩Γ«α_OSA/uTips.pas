unit uTips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, IniFiles;

type
  TTipsForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    cb1: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure hlp();
  public
    { Public declarations }
  end;

var
  TipsForm: TTipsForm;
  i: smallint;

implementation

uses Main;

{$R *.dfm}

procedure TTipsForm.FormDestroy(Sender: TObject);
begin
  MainForm.f.WriteBool('Tips', 'Show', cb1.Checked);
end;

procedure TTipsForm.BitBtn1Click(Sender: TObject);
begin
  hlp;
  inc(i);
end;

procedure TTipsForm.hlp;
begin
  if i > 6 then i := 1;
  case i of
    1: Label1.Caption := 'В большинство полей ввода можно не вводить' +
                    #13 + 'цифру 0: программа автоматически засчитает' +
                    #13 + 'пустое поле за 0. ';
    2: Label1.Caption := 'Для получения справочной информации по' +
                    #13 + 'выбранному элементу нажмите F1.';
    3: Label1.Caption := 'Вы можете изменять интерфейс!' +
                    #13 + 'Запустите "Редактор интерфейса"' +
                    #13 + 'через пункт меню "Опции" или выбрать в' +
                    #13 + 'контекстном меню.';
    4: Label1.Caption := 'Применяя итерационные методы, не' +
                    #13 + 'задавайте слишком большое количество' +
                    #13 + 'допустимых итераций. Начиная с значений' +
                    #13 + '1500-2000, вычисления могут занять' +
                    #13 + 'продолжительное время.' +
                    #13 + 'Максимально возможное количество итераций 10000.';
    5: Label1.Caption := 'Применяя методы, использующие начальные' +
                    #13 + 'приближения важно задать значения, наиболее' +
                    #13 + 'близкие к истинному. Для этого можно' +
                    #13 + 'воспользоваться другим алгоритмом, подставив' +
                    #13 + 'полученное в качестве приближений. Точность' +
                    #13 + 'решения повысится.';
    6: Label1.Caption := 'Используйте панель калькулятора для' +
                    #13 + 'быстрого вычисления простейших математических' +
                    #13 + 'выражений.';
  end;
end;

procedure TTipsForm.FormShow(Sender: TObject);
begin
  Label1.Caption := '"OSA" - "Opened Source Algorithms"' + #13 +
  '"Открытые Исходные Алгоритмы",' + #13 +
  'программа-калькулятор для проведения' + #13 +
  'некоторых математических расчётов' + #13 +
  'численными методами.';
  inc(i);
end;

procedure TTipsForm.FormCreate(Sender: TObject);
begin
  cb1.Checked := MainForm.f.ReadBool('Tips', 'Show', cb1.Checked);
  if cb1.Checked then TipsForm.ShowModal;
  i := 1;
  hlp;
  inc(i);
end;

end.
