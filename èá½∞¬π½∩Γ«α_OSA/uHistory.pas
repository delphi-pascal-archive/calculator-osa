unit uHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  THistoryForm = class(TForm)
    Panel1: TPanel;
    CloseButton: TButton;
    Button1: TButton;
    ListBox1: TListBox;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoryForm: THistoryForm;
  i: integer;
  
implementation

uses Main;

{$R *.dfm}

procedure THistoryForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure THistoryForm.FormShow(Sender: TObject);
begin
  ListBox1.SetFocus;
end;

procedure THistoryForm.Button1Click(Sender: TObject);
begin
  try
    if ListBox1.ItemIndex <> -1 then
    MainForm.load(listbox1.items[listbox1.ItemIndex]);
  except
    ListBox1.Items.Delete(listbox1.ItemIndex);
    showmessage('Ошибка открытия файла! Возможно файл был удалён...');
  end;
end;

procedure THistoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  for i := 0 to ListBox1.Count - 1 do
  MainForm.f.WriteString('History', 'F' + inttostr(i), ListBox1.Items[i]);
end;

procedure THistoryForm.FormActivate(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure THistoryForm.ListBox1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex <> -1 then
  ListBox1.Hint := ListBox1.Items.Strings[ListBox1.ItemIndex];
end;

procedure THistoryForm.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1Click(Sender);
  HistoryForm.SetFocus;
end;

procedure THistoryForm.FormCreate(Sender: TObject);
var
  s: string;
begin
  for i := 0 to 13 do
  begin
    s := MainForm.f.ReadString('History', 'F' + IntToStr(i), s);
    if s <> '' then listbox1.Items.Add(s);
  end;
end;

end.
