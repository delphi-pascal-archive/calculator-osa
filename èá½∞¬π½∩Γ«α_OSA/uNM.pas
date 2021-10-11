unit uNM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, Buttons;

type
  TNMForm = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NMForm: TNMForm;

implementation

{$R *.dfm}

procedure TNMForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.ac40.Checked := False;
end;

procedure TNMForm.FormCreate(Sender: TObject);
begin
  with MainForm do
  begin
    NMForm.Top := f.ReadInteger('NM', 'Top', NMForm.Top);
    NMForm.Left := f.ReadInteger('NM', 'Left', NMForm.Left);
    if f.ReadBool('NM', 'Show', NMForm.Visible) then
    begin
      NMForm.Show;
      ac40.Checked := True;
    end;
  end;
end;

end.
