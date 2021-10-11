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
    1: Label1.Caption := '� ����������� ����� ����� ����� �� �������' +
                    #13 + '����� 0: ��������� ������������� ���������' +
                    #13 + '������ ���� �� 0. ';
    2: Label1.Caption := '��� ��������� ���������� ���������� ��' +
                    #13 + '���������� �������� ������� F1.';
    3: Label1.Caption := '�� ������ �������� ���������!' +
                    #13 + '��������� "�������� ����������"' +
                    #13 + '����� ����� ���� "�����" ��� ������� �' +
                    #13 + '����������� ����.';
    4: Label1.Caption := '�������� ������������ ������, ��' +
                    #13 + '��������� ������� ������� ����������' +
                    #13 + '���������� ��������. ������� � ��������' +
                    #13 + '1500-2000, ���������� ����� ������' +
                    #13 + '��������������� �����.' +
                    #13 + '����������� ��������� ���������� �������� 10000.';
    5: Label1.Caption := '�������� ������, ������������ ���������' +
                    #13 + '����������� ����� ������ ��������, ��������' +
                    #13 + '������� � ���������. ��� ����� �����' +
                    #13 + '��������������� ������ ����������, ���������' +
                    #13 + '���������� � �������� �����������. ��������' +
                    #13 + '������� ���������.';
    6: Label1.Caption := '����������� ������ ������������ ���' +
                    #13 + '�������� ���������� ���������� ��������������' +
                    #13 + '���������.';
  end;
end;

procedure TTipsForm.FormShow(Sender: TObject);
begin
  Label1.Caption := '"OSA" - "Opened Source Algorithms"' + #13 +
  '"�������� �������� ���������",' + #13 +
  '���������-����������� ��� ����������' + #13 +
  '��������� �������������� ��������' + #13 +
  '���������� ��������.';
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
