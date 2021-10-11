unit uPlug;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, Search;

type
  TPlugForm = class(TForm)
    PlugList: TListBox;
    RealPlugList: TListBox;
    RunPluginButton: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    cmbCopy: TSpeedButton;
    Edit: TsDirectoryEdit;
    ListBox: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbCopyClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadPlugin(fileName: string);
    procedure PluginClick(sender: TObject);
    procedure DetectPlugin;
    procedure InstallPlugin(i: integer);
    procedure DeletePlugin(i: integer);
  end;

var
  PlugForm: TPlugForm;
  i: integer;

implementation

uses Main;

{$R *.dfm}

procedure TPlugForm.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TPlugForm.SpeedButton2Click(Sender: TObject);
begin
  if PlugForm.Width <> 180 then
  PlugForm.Width := 180
  else PlugForm.Width := 484;
end;

procedure TPlugForm.FormCreate(Sender: TObject);
begin
  PlugForm.Width := 180;
  with MainForm do
  begin
    PlugForm.Top := f.ReadInteger('Plug', 'Top', PlugForm.Top);
    PlugForm.Left := f.ReadInteger('Plug', 'Left', PlugForm.Left);
    if f.ReadBool('Plug', 'Show', PlugForm.Visible) then
    begin
      PlugForm.Show;
      ac39.Checked := True;
    end;
  end;
end;

procedure TPlugForm.DetectPlugin;
var
  SearchRec: TSearchRec; //������ ��� ������
begin
  if FindFirst('*.mplu',faAnyFile, SearchRec) = 0 then //���� ������ ����
  begin
    LoadPlugin(SearchRec.name); //��������� ������ ��������� ����
    while FindNext(SearchRec) = 0 do LoadPlugin(SearchRec.name); //��������� �����������
    FindClose(SearchRec); //��������� �����
  end;
end;

procedure TPlugForm.LoadPlugin(FileName: string);
var
  PluginName: function: PChar; //���������� �������, ������� ����� ���������� ��� ��a����
  Handle: THandle;  //����� dll
begin
  Handle :=  LoadLibrary(Pchar(FileName));  //��������� dll
  if Handle <> 0 then //���� ������, �� ��� ������...
  begin
    @PluginName := GetProcAddress(handle,'PluginName');  //�������� ���������
    if @PluginName <> nil then
    begin
      PlugList.Items.Add(PluginName);
      RealPlugList.Items.Add(FileName);
    end
    else  //���� �� ������, ��� ������...
    begin
      ShowMessage('������ ����������� ��������:'+chr(13)+'������� ������������� ������!');
      exit;
    end;
    FreeLibrary(handle);  //���������� dll
    RunPluginButton.onClick := PluginClick;  //��� ������ �� ����������
    PlugList.OnDblClick := PluginClick;
  end;
end;

procedure TPlugForm.PluginClick(sender: TObject);
var
  PluginExec: function(AObject : TObject): boolean; //���������� �������, ������� ����� ��������� ��a���
  PluginType: function: PChar;  //���������� �������, ������� ����� ���������� ��� ��a����
  FileName: string;  //��� dll
  Handle: THandle;  //����� dll
begin
  try
    with (sender as TSpeedButton) do FileName := RealPlugList.Items[PlugList.ItemIndex]; //�������� ��� dll
  except
    with (sender as TListBox) do FileName := RealPlugList.Items[PlugList.ItemIndex];
  end;
  Handle := LoadLibrary(Pchar(FileName));  //��������� dll
  if Handle <> 0 then //���� �� � �������, �� ��� ������
  begin //��������� �������
    @PluginExec := GetProcAddress(Handle, 'PluginExec');
    @PluginType := GetProcAddress(Handle,'PluginType');
    //� ������, � ����������� �� ����, ������� ������ �� ��������...
    if PluginType = 'SELF' then PluginExec(SELF) else
    if PluginType = 'FORM' then PluginExec(MAINFORM) else
    if PluginType = 'NIL' then PluginExec(nil); //���� ��a���� �� ���� �� �����, �� �� ���� �� �������
  end;
  FreeLibrary(Handle); //���������� dll
end;

procedure TPlugForm.FormShow(Sender: TObject);
begin
  PlugList.Clear;
  RealPlugList.Clear;
  DetectPlugin;
  PlugList.ItemIndex := 0;
end;

procedure TPlugForm.cmbCopyClick(Sender: TObject);
begin
  for i := 0 to ListBox.Count - 1 do
  InstallPlugin(i);
  PlugForm.FormShow(Sender);
end;

procedure TPlugForm.SpeedButton3Click(Sender: TObject);
begin
 if RealPlugList.ItemIndex <> -1 then DeletePlugin(RealPlugList.ItemIndex);
 FormShow(Sender);
end;

procedure TPlugForm.EditExit(Sender: TObject);
begin
  if Edit.Text <> '' then
  begin
    ListBox.Clear;
    SearchInFolder(Edit.Text,'*.mplu', 0, ListBox.Items);
  end;
end;

procedure TPlugForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.ac39.Checked := False;
end;

procedure TPlugForm.InstallPlugin(i: integer);
begin
  if CopyFile(PAnsiChar(Edit.Text+'\' + ListBox.Items[i]),
  PAnsiChar(MainForm.CurrentDir + '\' + ListBox.Items[i]), True) = False then
  showmessage('�� ������� ����������� ����!');
end;

procedure TPlugForm.SpeedButton1Click(Sender: TObject);
begin
  if ListBox.ItemIndex <> -1 then InstallPlugin(ListBox.ItemIndex);
  FormShow(Sender);
end;

procedure TPlugForm.DeletePlugin(i: integer);
begin
  if Windows.DeleteFile(PAnsiChar(MainForm.CurrentDir + '\' +
  RealPlugList.Items[i])) = False then showmessage('�� ������� ������� ����!');
end;

procedure TPlugForm.SpeedButton5Click(Sender: TObject);
begin
  for i := 0 to RealPlugList.Count - 1 do
  DeletePlugin(i);
  FormShow(Sender);
end;

end.
