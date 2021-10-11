unit uArithmetics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, Buttons;

type
  TArithmeticsForm = class(TForm)
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArithmeticsForm: TArithmeticsForm;

implementation

uses uNM;

{$R *.dfm}

procedure TArithmeticsForm.FormCreate(Sender: TObject);
begin
  with MainForm do
  begin
    ArithmeticsForm.Top := f.ReadInteger('ArithmeticsForm', 'Top', ArithmeticsForm.Top);
    ArithmeticsForm.Left := f.ReadInteger('ArithmeticsForm', 'Left', ArithmeticsForm.Left);
    if f.ReadBool('ArithmeticsForm', 'Show', NMForm.Visible) then
    begin
      ArithmeticsForm.Show;
      ac9.Checked := True;
    end;
  end;
end;

procedure TArithmeticsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.ac9.Checked := False;
end;

end.
