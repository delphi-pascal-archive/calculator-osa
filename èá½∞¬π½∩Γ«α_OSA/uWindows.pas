unit uWindows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Buttons;

type
  TWindowsForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button4: TButton;
    Button3: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WindowsForm: TWindowsForm;

implementation
uses
  Main;

{$R *.dfm}

procedure TWindowsForm.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
