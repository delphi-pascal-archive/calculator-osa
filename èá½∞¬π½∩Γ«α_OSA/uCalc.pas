unit uCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Calculations, ExtCtrls, ComCtrls, IniFiles, Main,
  TheGeneral, Grids, ValEdit;

type
  TCalcForm = class(TForm)
    SpeedButton15: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    SpeedButton44: TSpeedButton;
    SpeedButton45: TSpeedButton;
    procedure SpeedButton15Click(Sender: TObject);
    procedure MemoKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalcForm: TCalcForm;

implementation

  uses uScriptWindow;

{$R *.dfm}

procedure TCalcForm.SpeedButton15Click(Sender: TObject);
var
  x, Fx: extended;
  f: string;
begin
  try
    ActiveMDIChild.Cascade;
  except
    showmessage('Ошибка ввода!');
  end;
end;

procedure TCalcForm.MemoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SpeedButton15Click(Sender);
end;

procedure TCalcForm.CheckBox1Click(Sender: TObject);
begin
  if (CalcForm.Visible)and(ActiveMDIChild is TScriptForm) then
  TScriptForm(ActiveMDIChild).memo.SetFocus;
end;

procedure TCalcForm.SpeedButton13Click(Sender: TObject);
begin
  keybd_event(VK_BACK, 0, 0, 0);
  keybd_event(VK_BACK, 0, KEYEVENTF_KEYUP, 0);
  if ActiveMDIChild is TScriptForm then TScriptForm(ActiveMDIChild).memo.SetFocus;
end;

procedure TCalcForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.ac9.Checked := False;
end;

procedure TCalcForm.FormCreate(Sender: TObject);
begin
  with MainForm do
  begin
    CalcForm.Top := f.ReadInteger('Calc', 'Top', CalcForm.Top);
    CalcForm.Left := f.ReadInteger('Calc', 'Left', CalcForm.Left);
    if f.ReadBool('Calc', 'Show', CalcForm.Visible) then
    begin
      CalcForm.Show;
      ac9.Checked := True;
    end;
  end;
end;

procedure TCalcForm.LxKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', '-', #8, #13: ;
    ',', '.': if key <> DecimalSeparator then Key := DecimalSeparator;
  else Key := #27;
  end;
end;

end.
