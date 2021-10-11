unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomizeDlg, ToolWin, ActnMan, ActnCtrls, ActnMenus, ExtCtrls,
  XPStyleActnCtrls, ActnList, ImgList, StdActns, ComCtrls, Menus, IniFiles,
  Grids, StdCtrls, ClipBrd, ComObj, Printers, Jpeg, uPlug, StdStyleActnCtrls,
  Calculations;

type
  TMainForm = class(TForm)
    ActionManager: TActionManager;
    Menu: TActionMainMenuBar;
    CustomizeDlg: TCustomizeDlg;
    ImageList1: TImageList;
    ac39: TAction;
    ac32: TAction;
    ac33: TAction;
    ac34: TAction;
    aExit: TFileExit;
    ac1: TAction;
    ac2: TAction;
    ac3: TAction;
    ac4: TAction;
    ac5: TAction;
    ac6: TAction;
    ac7: TAction;
    ac8: TAction;
    ac9: TAction;
    ac15: TWindowClose;
    HelpTopicSearch1: THelpTopicSearch;
    HelpContents1: THelpContents;
    ac31: TAction;
    About: TAction;
    ac25: TAction;
    StBar: TStatusBar;
    ac35: TAction;
    SaveDialog: TSaveDialog;
    ac16: TAction;
    ac17: TAction;
    ac18: TWindowCascade;
    ac19: TWindowTileHorizontal;
    ac20: TWindowTileVertical;
    ac21: TWindowMinimizeAll;
    ac22: TAction;
    ac23: TAction;
    Special: TActionToolBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ac26: TAction;
    ac27: TAction;
    ac28: TAction;
    ac29: TAction;
    ac30: TAction;
    ac24: TAction;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    ac10: TAction;
    ac11: TAction;
    ac12: TAction;
    ac13: TAction;
    ac14: TAction;
    N9: TMenuItem;
    OpenDialog: TOpenDialog;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    ac36: TAction;
    PrintDialog: TPrintDialog;
    ac37: TAction;
    ac38: TAction;
    Image1: TImage;
    Action1: TAction;
    ac40: TAction;
    FontDialog: TFontDialog;
    ac41: TAction;
    ac42: TAction;
    Label1: TLabel;
    ac45: TEditCut;
    ac46: TEditCopy;
    ac47: TEditPaste;
    ac48: TEditSelectAll;
    ac49: TEditUndo;
    ac50: TEditDelete;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    ac43: TAction;
    ac44: TAction;
    procedure ac1Execute(Sender: TObject);
    procedure ac35Execute(Sender: TObject);
    procedure ac6Execute(Sender: TObject);
    procedure ac16Execute(Sender: TObject);
    procedure ac17Execute(Sender: TObject);
    procedure ac22Execute(Sender: TObject);
    procedure ac23Execute(Sender: TObject);
    procedure AboutExecute(Sender: TObject);
    procedure ac2Execute(Sender: TObject);
    procedure ac25Execute(Sender: TObject);
    procedure ac4Execute(Sender: TObject);
    procedure ac8Execute(Sender: TObject);
    procedure ac5Execute(Sender: TObject);
    procedure ac7Execute(Sender: TObject);
    procedure ac27Execute(Sender: TObject);
    procedure ac26Execute(Sender: TObject);
    procedure ac28Execute(Sender: TObject);
    procedure ac29Execute(Sender: TObject);
    procedure ac30Execute(Sender: TObject);
    procedure ac24Execute(Sender: TObject);
    procedure ActionManagerUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ac9Execute(Sender: TObject);
    procedure ac31Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ac3Execute(Sender: TObject);
    procedure ac10Execute(Sender: TObject);
    procedure ac11Execute(Sender: TObject);
    procedure ac12Execute(Sender: TObject);
    procedure ac13Execute(Sender: TObject);
    procedure ac14Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure CustomizeDlgClose(Sender: TObject);
    procedure ac34Execute(Sender: TObject);
    procedure ac32Execute(Sender: TObject);
    procedure SpecialClick(Sender: TObject);
    procedure ac33Execute(Sender: TObject);
    procedure HelpContents1Execute(Sender: TObject);
    procedure ac36Execute(Sender: TObject);
    procedure ac37Execute(Sender: TObject);
    procedure ac38Execute(Sender: TObject);
    procedure ac39Execute(Sender: TObject);
    procedure ac40Execute(Sender: TObject);
    procedure ac41Execute(Sender: TObject);
    procedure ac42Execute(Sender: TObject);
    procedure ac43Execute(Sender: TObject);
    procedure ac44Execute(Sender: TObject);
  private
    procedure showhint(Sender: TObject);
    function SaveReport(FileName: string): string;
  public
    f: TIniFile;
    CurrentDir: string;
    ChildCount: integer;
    t1: TNewValue;
    procedure CreateWork(const childName: string; p: smallint);
    function TrueSave(FileName, Format: string): string;
    procedure saveGrid(Grid: TStringGrid);
    procedure loadGrid(Grid: TStringGrid);
    procedure saveScript(FileName: string);
    procedure SaveData(FileName: string; WorkType: smallint);
    procedure load(FileName: string);
    procedure printed(Image: TImage);
  end;

  procedure SaveToJPG(Image: TImage; FileName: String); external 'Graphic.dll';
  procedure Prepare(ImageO: TImage); external 'Graphic.dll';
  procedure EndComment(Image: TImage); external 'Graphic.dll';
  procedure Comment(Image: TImage;Expression, Comment: string); external 'Graphic.dll';

  const act = 44;

var
  MainForm: TMainForm;
  type_f, i, j, k: integer;
  ff: TextFile;
  t: double;
  temp: string;
  kf: smallint;
  R: boolean;

implementation

uses
  uCalc, uHistory, uNM, uScriptWindow, SearchWord, uAbout, uTips, uArithmetics,
  uWork1, uWork2, uWork3, uWork4, uWork5, uWork6, uWork7, uWork8, uMatrixes;

{$R *.dfm}
           //PAnsiChar(GetCurrentDir())
function L1InvokeHelpMacro(const i_strMacro: String;const i_bForceFile: Boolean): Boolean;
begin
  if i_bForceFile then Application.HelpCommand(HELP_FORCEFILE, 0);
  Result:=Application.HelpCommand(HELP_COMMAND, Longint(PChar(i_strMacro)));
  //Приведение типа PChar здесь необязательно.
end;

procedure TMainForm.CreateWork(const childName: string; p: smallint);
var
  Child: TForm;
begin 
  case p of
    1: Child := TWorkForm1.Create(Application);
    2: Child := TWorkForm2.Create(Application);
    3: Child := TWorkForm3.Create(Application);
    4: Child := TWorkForm4.Create(Application);
    5: Child := TWorkForm5.Create(Application);
    6: Child := TWorkForm6.Create(Application);
    7: Child := TWorkForm7.Create(Application);
    8: Child := TWorkForm8.Create(Application);
    9: Child := TScriptForm.Create(Application);
    10: Child := TMatrixForm.Create(Application);
  end;
    Child.Caption := Child.Caption + childName;
end;

procedure TMainForm.ac1Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 1);
end;

procedure TMainForm.ac6Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 2);
end;

procedure TMainForm.ac2Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 3);
end;

procedure TMainForm.ac4Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 4);
end;

procedure TMainForm.ac8Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 5);
end;

procedure TMainForm.ac5Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 6);
end;

procedure TMainForm.ac7Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1),7);
end;

procedure TMainForm.ac3Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 8);
end;

procedure TMainForm.ac42Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 9);
end;

procedure TMainForm.ac43Execute(Sender: TObject);
begin
  CreateWork('Документ №' + IntToStr(MDIChildCount + 1), 10);
end;

procedure TMainForm.ac35Execute(Sender: TObject);
begin
  SaveDialog.Filter := '*.jpg;*.wmf|*.jpg;*.wmf|*.*|*.*';
  if SaveDialog.Execute then
  SaveReport(SaveDialog.Filename);
end;

function TMainForm.TrueSave(FileName, Format: string): string;
begin
  if POS('.', FileName) > 0 then
  DELETE(FileName, POS('.', FileName), Length(FileName));
  Result := FileName + Format;  
  ActiveMDIChild.Caption := Result;
end;

procedure TMainForm.ac16Execute(Sender: TObject);
begin
  Next;
end;

procedure TMainForm.ac17Execute(Sender: TObject);
begin
  Previous;
end;

procedure TMainForm.ac22Execute(Sender: TObject);
begin
  for i := 0 To MDIChildCount - 1 do
  if Assigned(MDIChildren[i]) then MDIChildren[i].WindowState := wsNormal;
end;

procedure TMainForm.ac23Execute(Sender: TObject);
begin
  for i := 0 to MDIChildCount - 1 do MDIChildren[i].Close;
end;

procedure TMainForm.AboutExecute(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.ac25Execute(Sender: TObject);
begin
  CustomizeDlg.Show;
end;

procedure TMainForm.ac27Execute(Sender: TObject);
begin
  Special.Align := alLeft;
end;

procedure TMainForm.ac26Execute(Sender: TObject);
begin
  Special.Align := alTop;
end;

procedure TMainForm.ac28Execute(Sender: TObject);
begin
  Special.Align := alRight;
end;

procedure TMainForm.ac29Execute(Sender: TObject);
begin
  Special.Align := alBottom;
end;

procedure TMainForm.ac30Execute(Sender: TObject);
begin
  if Special.Visible then Special.Visible := False else Special.Visible := True;
end;

procedure TMainForm.ac24Execute(Sender: TObject);
begin
  if ac24.Checked then StBar.Visible := True else StBar.Visible := False;
end;

procedure TMainForm.ActionManagerUpdate(Action: TBasicAction;
  var Handled: Boolean);
var
  buttons: TKeyBoardstate;
begin
  GetKeyBoardstate(buttons); {определяем состояние клавиш}
  if buttons[VK_NUMLOCK] and 255 <> 0 then
  StBar.Panels[0].Text := 'NUM' else StBar.Panels[0].text := '';
  if buttons[VK_CAPITAL] and 255 <> 0 then
  StBar.Panels[1].Text := 'CAPS' else StBar.Panels[1].Text := '';
  StBar.Panels[2].Text := IntToStr(MDIChildCount);
  ac29.Enabled := False;
  ac26.Enabled := False;
  ac27.Enabled := False;
  ac28.Enabled := False;
  if Special.Visible then
  begin
    ac29.Enabled := True;
    ac26.Enabled := True;
    ac27.Enabled := True;
    ac28.Enabled := True;
  end;
  ac10.Enabled := False;
  ac11.Enabled := False;
  ac12.Enabled := False;
  ac13.Enabled := False;
  if Menu.Visible then
  begin
    ac10.Enabled := True;
    ac11.Enabled := True;
    ac12.Enabled := True;
    ac13.Enabled := True;
  end;
  ac35.Enabled := False;
  ac34.Enabled := False;
  ac22.Enabled := False;
  ac23.Enabled := False;
  ac16.Enabled := False;
  ac17.Enabled := False;
  ac36.Enabled := False;
  ac37.Enabled := False;
  ac38.Enabled := False;
  ac44.Enabled := False;
  if MDIChildCount <> 0 then
  begin
    ac16.Enabled := True;
    ac34.Enabled := True;
    ac22.Enabled := True;
    ac23.Enabled := True;
    ac17.Enabled := True;
    ac37.Enabled := True;
    ac38.Enabled := True;
    if not(ActiveMDIChild is  TScriptForm) then
    begin
      ac35.Enabled := True;
      ac36.Enabled := True;
      ac44.Enabled := True;
    end;
  end;
end;

procedure TMainForm.showhint(Sender: TObject);
begin
  StBar.Panels[3].Text := Application.Hint;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  t: integer;
  N: boolean;
  st: string;
begin
  Application.OnHint:=ShowHint;
  f := TIniFile.Create(PAnsiChar(GetCurrentDir()) + '\main.ini');
  GetDir(0, CurrentDir);
  for i := 1 to act do
  (FindComponent(Format('Ac%d', [i])) as TAction).ShortCut:=
  TextToShortCut(
  f.readString('Actions',(FindComponent(Format('Ac%d', [i])) as TAction).Name, st));
  k := 0;
  Menu.Visible := f.ReadBool('ToolBars', 'Menu', Menu.Visible);
  Menu.Align := alLeft;
  if f.ReadInteger('ToolBars', 'MenuTop', t) = 1 then Menu.Align := alTop;
  if f.ReadInteger('ToolBars', 'MenuBottom', t) = 1 then Menu.Align := alBottom;
  if f.ReadInteger('ToolBars', 'MenuRight', t) = 1 then Menu.Align := alRight;
  Special.Visible := f.ReadBool('ToolBars', 'Special', Special.Visible);
  ac24.Checked := f.ReadBool('ToolBars', 'StatusBar', StBar.Visible);
  StBar.Visible := ac24.Checked;
  Special.Align := alBottom;
  if f.ReadInteger('ToolBars', 'SpecialTop', t) = 1 then Special.Align := alTop;
  if f.ReadInteger('ToolBars', 'SpecialLeft', t) = 1 then Special.Align := alLeft;
  if f.ReadInteger('ToolBars', 'SpecialRight', t) = 1 then Special.Align := alRight;
  CustomizeDlg.ActionManager.LoadFromFile(CurrentDir + '\Menu.mn');
  Menu.AnimationStyle := asDefault;
  if f.ReadBool('MenuAnimation','asFade',N) then Menu.AnimationStyle := asFade;
  if f.ReadBool('MenuAnimation','asNone',N) then Menu.AnimationStyle := asNone;
  if f.ReadBool('MenuAnimation','asSlide',N) then Menu.AnimationStyle := asSlide;
  if f.ReadBool('MenuAnimation','asUnFold',N) then Menu.AnimationStyle := asUnFold;
  Top := f.ReadInteger('MainForm', 'Top', Top);
  Left := f.ReadInteger('MainForm', 'Left', Left);
  Width := f.ReadInteger('MainForm', 'Width', Width);
  Height := f.ReadInteger('MainForm', 'Height', Height);
  with FontDialog.Font do
  begin
    Size := f.Readinteger('FontDialog', 'fontSize', Size);
    Name := f.ReadString('FontDialog','font', Name);
    if (f.ReadBool('FontDialog', 'fsBold', N))or(f.ReadBool('FontDialog', 'fsItalic', N))
    then
    begin
      if f.ReadBool('FontDialog', 'fsBold', N) then Style := Style + [fsBold];
      if F.ReadBool('FontDialog', 'fsItalic', N) then Style := Style + [fsItalic];
    end else Style := [];
  end;
  if (Top = 0)or(Left = 0) then MainForm.Position := poScreenCenter
  else MainForm.Position := poDesigned;
end;

procedure TMainForm.ac9Execute(Sender: TObject);
begin
  if ac9.Checked then ArithmeticsForm.Show else ArithmeticsForm.Close;
end;

procedure TMainForm.ac31Execute(Sender: TObject);
begin
  TipsForm.ShowModal;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  N: boolean;
begin
  f.WriteBool('ToolBars', 'Special', Special.Visible);
  f.WriteString('ToolBars', 'SpecialTop', '0');
  f.WriteString('ToolBars', 'SpecialLeft', '0');
  f.WriteString('ToolBars', 'SpecialRight', '0');
  if Special.Align = alTop then f.WriteString('ToolBars', 'SpecialTop', '1');
  if Special.Align = alLeft then f.WriteString('ToolBars', 'SpecialLeft', '1');
  if Special.Align = alRight then f.WriteString('ToolBars', 'SpecialRight', '1');
  f.WriteBool('ToolBars', 'Menu', Menu.Visible);
  f.WriteString('ToolBars', 'MenuTop', '0');
  f.WriteString('ToolBars', 'MenuBottom', '0');
  f.WriteString('ToolBars', 'MenuRight', '0');
  if Menu.Align = alTop then f.WriteString('ToolBars', 'MenuTop', '1');
  if Menu.Align = alBottom then f.WriteString('ToolBars', 'MenuBottom', '1');
  if Menu.Align = alRight then f.WriteString('ToolBars', 'MenuRight', '1');
  f.WriteBool('ToolBars', 'StatusBar', StBar.Visible);

  f.WriteBool('Plug', 'Show', PlugForm.Visible);
  f.WriteInteger('Plug', 'Top', PlugForm.Top);
  f.WriteInteger('Plug', 'Left', PlugForm.Left);
  f.WriteBool('NM', 'Show', NMForm.Visible);
  f.WriteInteger('NM', 'Top', NMForm.Top);
  f.WriteInteger('NM', 'Left', NMForm.Left);
  f.WriteBool('ArithmeticsForm', 'Show', ArithmeticsForm.Visible);
  f.WriteInteger('ArithmeticsForm', 'Top', ArithmeticsForm.Top);
  f.WriteInteger('ArithmeticsForm', 'Left', ArithmeticsForm.Left);
  f.WriteInteger('MainForm', 'Top', Top);
  f.WriteInteger('MainForm', 'Left', Left);
  f.WriteInteger('MainForm', 'Width', Width);
  f.WriteInteger('MainForm', 'Height', Height);
  HistoryForm.Close;
end;

procedure TMainForm.ac10Execute(Sender: TObject);
begin
  Menu.Align := alTop;
end;

procedure TMainForm.ac11Execute(Sender: TObject);
begin
  Menu.Align := alLeft;
end;

procedure TMainForm.ac12Execute(Sender: TObject);
begin
  Menu.Align := alRight;
end;

procedure TMainForm.ac13Execute(Sender: TObject);
begin
  Menu.Align := alBottom;
end;

procedure TMainForm.ac14Execute(Sender: TObject);
begin
  if Menu.Visible then Menu.Hide else Menu.Show;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if Special.Visible then
  begin
    Special.Hide; Special.Show;
    if StBar.Visible then
    begin
      StBar.Hide; StBar.Show;
    end;
  end;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
  if menu.Visible then menu.Hide else menu.Show;
end;

procedure TMainForm.CustomizeDlgClose(Sender: TObject);
begin
  CustomizeDlg.ActionManager.SaveToFile(CurrentDir + '\Menu.mn');
  f.WriteBool('MenuAnimation', 'asFade', False);
  f.WriteBool('MenuAnimation', 'asNone', False);
  f.WriteBool('MenuAnimation', 'asSlide', False);
  f.WriteBool('MenuAnimation', 'asUnFold', False);
  //настройки анимации меню
  if Menu.AnimationStyle = asFade then f.WriteBool('MenuAnimation', 'asFade', True);
  if Menu.AnimationStyle = asNone then f.WriteBool('MenuAnimation', 'asNone', True);
  if Menu.AnimationStyle = asSlide then f.WriteBool('MenuAnimation', 'asSlide', True);
  if Menu.AnimationStyle = asUnFold then f.WriteBool('MenuAnimation', 'asUnFold', True);
  for i := 1 to act do//Горячие клавиши
  f.WriteString('Actions',(FindComponent(Format('ac%d', [i])) as TAction).Name,
  ShortCutToText((FindComponent(Format('ac%d', [i])) as TAction).ShortCut));
end;

procedure TMainForm.ac34Execute(Sender: TObject);
var
  i: smallint;
begin
  SaveDialog.Filter := 'Файлы данных (*.math)| *.math|Все файлы (*.*)|*.*';
  try
    if SaveDialog.Execute then
    begin
      assignfile(ff, TrueSave(SaveDialog.Filename, '.math'));
      rewrite(ff);
      if ActiveMDIChild is TWorkForm1 then i := 1;
      if ActiveMDIChild is TWorkForm2 then i := 2;
      if ActiveMDIChild is TWorkForm3 then i := 3;
      if ActiveMDIChild is TWorkForm4 then i := 4;
      if ActiveMDIChild is TWorkForm5 then i := 5;
      if ActiveMDIChild is TWorkForm6 then i := 6;
      if ActiveMDIChild is TWorkForm7 then i := 7;
      if ActiveMDIChild is TWorkForm8 then i := 8;
      if ActiveMDIChild is TScriptForm then i := 9;
      if ActiveMDIChild is TMatrixForm then i := 10;
      SaveData(TrueSave(SaveDialog.Filename, '.math'), i);
    end;
  except
    showmessage('Невозможно сохранить данный файл!');
  end;
end;

procedure TMainForm.load(FileName: string);
begin
  try
    assignfile(ff, FileName);
    reset(ff);
    readln(ff, type_f);
    CreateWork(FileName, type_f);
    readln(ff, temp);
    case type_f of
      1: begin
           TWorkForm1(ActiveMDIChild).aEdit.Text := temp; readln(ff, temp);
           TWorkForm1(ActiveMDIChild).bEdit.Text := temp; readln(ff, temp);
           TWorkForm1(ActiveMDIChild).cEdit.Text := temp;
         end;
      2: begin
           TWorkForm2(ActiveMDIChild).ak.Text := temp; readln(ff, temp);
           TWorkForm2(ActiveMDIChild).bk.Text := temp; readln(ff, temp);
           TWorkForm2(ActiveMDIChild).nk.Text := temp; readln(ff, temp);
           TWorkForm2(ActiveMDIChild).Func.Text := temp;
         end;
      3: begin
           TWorkForm3(ActiveMDIChild).NLE.Text := temp; readln(ff, temp);
           TWorkForm3(ActiveMDIChild).EPS.Text := temp; readln(ff, temp);
           TWorkForm3(ActiveMDIChild).MX.Text := temp;
           LoadGrid(TWorkForm3(ActiveMDIChild).SGA);
           LoadGrid(TWorkForm3(ActiveMDIChild).SGB);
           LoadGrid(TWorkForm3(ActiveMDIChild).SGX);
         end;
      4: begin
           TWorkForm4(ActiveMDIChild).xEdit.Text := temp; readln(ff, temp);
           TWorkForm4(ActiveMDIChild).Edit1.Text := temp;
           LoadGrid(TWorkForm4(ActiveMDIChild).SG);
         end;
      5: begin
           TWorkForm5(ActiveMDIChild).eFunc.Text := temp; readln(ff, temp);
           TWorkForm5(ActiveMDIChild).eFunc2.Text := temp; readln(ff, temp);
           TWorkForm5(ActiveMDIChild).Edit1.Text := temp; readln(ff, temp);
           TWorkForm5(ActiveMDIChild).Edit2.Text := temp; readln(ff, temp);
           TWorkForm5(ActiveMDIChild).Edit3.Text := temp; readln(ff, temp);
           TWorkForm5(ActiveMDIChild).LH.Text := temp;
           LoadGrid(TWorkForm5(ActiveMDIChild).SG);
         end;
      6: begin
           TWorkForm6(ActiveMDIChild).xEdit.Text := temp; readln(ff, temp);
           TWorkForm6(ActiveMDIChild).Edit1.Text := temp;
           LoadGrid(TWorkForm6(ActiveMDIChild).SG);
         end;
      7: begin
           TWorkForm7(ActiveMDIChild).Edit2.Text := temp; readln(ff, temp);
           TWorkForm7(ActiveMDIChild).Edit3.Text := temp; readln(ff, temp);
           TWorkForm7(ActiveMDIChild).XEdit.Text := temp; readln(ff, temp);
           TWorkForm7(ActiveMDIChild).LH.Text := temp; readln(ff, temp);
           TWorkForm7(ActiveMDIChild).eFunc.Text := temp;
         end;
      8: begin
           TWorkForm8(ActiveMDIChild).aEdit.Text := temp; readln(ff, temp);
           TWorkForm8(ActiveMDIChild).bEdit.Text := temp; readln(ff, temp);
           TWorkForm8(ActiveMDIChild).eEdit.Text := temp; readln(ff, temp);
           TWorkForm8(ActiveMDIChild).limEdit.Text := temp; readln(ff, temp);
           TWorkForm8(ActiveMDIChild).pxEdit.Text := temp; readln(ff, temp);
           TWorkForm8(ActiveMDIChild).pFuncEdit.Text := temp; readln(ff, temp);
           TWorkForm8(ActiveMDIChild).FuncEdit.Text := temp;
         end;
      9: begin
           TScriptForm(ActiveMDIChild).RLE.Text := temp; readln(ff, temp);
           TScriptForm(ActiveMDIChild).Memo.Text := temp; readln(ff, temp);
           TScriptForm(ActiveMDIChild).VarMemo.Text := temp;
         end;
      10: begin
           TMatrixForm(ActiveMDIChild).Ne1.Text := temp; readln(ff, temp);
           TMatrixForm(ActiveMDIChild).Me1.Text := temp; readln(ff, temp);
           TMatrixForm(ActiveMDIChild).Ne2.Text := temp; readln(ff, temp);
           TMatrixForm(ActiveMDIChild).Me2.Text := temp;
           LoadGrid(TMatrixForm(ActiveMDIChild).SG1);
           LoadGrid(TMatrixForm(ActiveMDIChild).SG2);
           readln(ff, temp); TMatrixForm(ActiveMDIChild).Le.Text := temp;
         end;
    end;
      closefile(ff);
  except
    showmessage('Ошибка открытия файла!');
  end;
end;

procedure TMainForm.ac32Execute(Sender: TObject);
var
  R: boolean;
begin
  try//Недавние документы
    R := True;
    if OpenDialog.Execute then
    begin
      Load(OpenDialog.Filename);
      for i := 0 to HistoryForm.ListBox1.Count - 1 do
      if OpenDialog.Filename = HistoryForm.ListBox1.Items[i] then R := False;
      if R then if HistoryForm.ListBox1.Count < 14 then
      HistoryForm.ListBox1.Items.Add(OpenDialog.Filename)
      else
      HistoryForm.ListBox1.Items[k] := OpenDialog.Filename;
      if k > 14 then k := 0 else inc(k);
    end;
  except
    showmessage('Ошибка открытия файла!');
    ac32.Execute;
  end;
end;

procedure TMainForm.saveGrid(Grid: TStringGrid);
begin
  writeln(ff, Grid.colcount); writeln(ff, Grid.rowcount);
  for i := 0 to Grid.colcount - 1 do for j := 0 to Grid.rowcount - 1 do
  writeln(ff, Grid.cells[i, j]);
end;

procedure TMainForm.loadGrid(Grid: TStringGrid);
var
  tempstr: string;
begin
  readln(ff, i); Grid.colcount := i;
  readln(ff, i); Grid.rowcount := i;
  for i := 0 to Grid.colcount - 1 do for j := 0 to Grid.rowcount - 1 do
  begin
    readln(ff, tempstr); Grid.cells[i, j] := tempstr;
  end;
end;

procedure TMainForm.SpecialClick(Sender: TObject);
begin
  if Special.Visible then
  begin
    Special.Hide; Special.Show;
  end;
end;

procedure TMainForm.ac33Execute(Sender: TObject);
begin
  HistoryForm.Show;
end;

procedure TMainForm.HelpContents1Execute(Sender: TObject);
begin
  L1InvokeHelpMacro('', True);
end;

procedure TMainForm.ac36Execute(Sender: TObject);
var
  temp, caption: string;
  Wrd: OleVariant;
begin
  try
    caption := ActiveMDIChild.Caption;
    temp := SaveReport('~temp');
    Image1.Picture.LoadFromFile(temp);
    ClipBoard.Assign(Image1.Picture);
    assignfile(ff, temp);
    erase(ff);
    Wrd := CreateOleObject('Word.Application');//Создаем объект
    Wrd.Visible := True;// Делаем видимым приложение,
    Wrd.Documents.Add;// открываем шаблон документа
    Wrd.Selection.Paste;
    Wrd.Activate;
    ActiveMDIChild.Caption := caption;
  except
    showmessage('Не удаётся выполнить действие...');
  end;
end;

function TMainForm.SaveReport(FileName: string): string;
begin
  Result := TrueSave(Filename, '.jpg');
  if ActiveMDIChild is TWorkForm1 then
  SaveToJPG(TWorkForm1(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TWorkForm2 then
  SaveToJPG(TWorkForm2(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TWorkForm3 then
  SaveToJPG(TWorkForm3(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TWorkForm4 then
  SaveToJPG(TWorkForm4(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TWorkForm5 then
  begin
    TWorkForm5(ActiveMDIChild).Chart1.SaveToMetafile(TrueSave(Filename, '.wmf'));
    Result := TrueSave(Filename, '.wmf');
  end;
  if ActiveMDIChild is TWorkForm6 then
  SaveToJPG(TWorkForm6(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TWorkForm7 then
  SaveToJPG(TWorkForm7(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TWorkForm8 then
  SaveToJPG(TWorkForm8(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
  if ActiveMDIChild is TMatrixForm then
  SaveToJPG(TMatrixForm(ActiveMDIChild).Image, TrueSave(Filename, '.jpg'));
end;

procedure TMainForm.ac37Execute(Sender: TObject);
begin
  PrintDialog.Execute;
end;

procedure TMainForm.ac38Execute(Sender: TObject);
var
  x, y, i: longint;
begin
  if ActiveMDIChild is TWorkForm1 then printed(TWorkForm1(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm2 then printed(TWorkForm2(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm3 then printed(TWorkForm3(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm4 then printed(TWorkForm4(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm6 then printed(TWorkForm6(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm7 then printed(TWorkForm7(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm8 then printed(TWorkForm8(ActiveMDIChild).Image);
  if ActiveMDIChild is TMatrixForm then printed(TMatrixForm(ActiveMDIChild).Image);
  if ActiveMDIChild is TWorkForm5 then TWorkForm5(ActiveMDIChild).Chart1.Print;
  if ActiveMDIChild is TScriptForm then with TScriptForm(ActiveMDIChild) do
  begin
    Printer.Canvas.Font := Memo.Font;
    Printer.BeginDoc;
    x := 0; y := 0;//координаты начала вывода текста
    for i := 0 to Memo.Lines.Count - 1 do
    begin       
      Printer.Canvas.TextOut(x, y, Memo.Lines[i]);//TextExtent - высота строки
      y := y + Printer.Canvas.TextExtent(Memo.Lines[i]).cy;//на след. строку
    end;
    Printer.EndDoc;
  end;
end;

procedure TMainForm.printed(Image: TImage);
var
  ScaleX, ScaleY: Integer;
  R: TRect;
begin
  SaveToJPG(Image, '~temp.jpg');
  Image.Picture.LoadFromFile('~temp.jpg');
  Printer.BeginDoc;
  with Printer do
  try
    ScaleX := GetDeviceCaps(Handle, logPixelsX) div PixelsPerInch;
    ScaleY := GetDeviceCaps(Handle, logPixelsY) div PixelsPerInch;
    R := Rect(0, 0, Image.Picture.Width * ScaleX, Image.Picture.Height * ScaleY);
    Canvas.StretchDraw(R, Image.Picture.Graphic);
  finally
    EndDoc;
  end;
  AssignFile(ff, '~temp.jpg');
  Erase(ff);
end;

procedure TMainForm.ac39Execute(Sender: TObject);
begin
  if ac39.Checked then PlugForm.Show else PlugForm.Close;
end;

procedure TMainForm.ac40Execute(Sender: TObject);
begin
  if ac40.Checked then NMForm.Show else NMForm.Close;
end;

procedure TMainForm.ac41Execute(Sender: TObject);
begin
  if FontDialog.Execute then with FontDialog.Font do
  begin
    f.WriteInteger('FontDialog', 'FontSize', Size);
    f.WriteString('FontDialog', 'Font', Name);
    f.WriteBool('FontDialog', 'fsBold', False);
    f.WriteBool('FontDialog', 'fsItalic', False);
    if style = [fsBold] then f.WriteBool('FontDialog','fsBold',True);
    if style = [fsItalic] then f.WriteBool('FontDialog', 'fsItalic',True);
    if style = [fsItalic, fsBold] then
    begin
      f.WriteBool('FontDialog', 'fsItalic', True);
      f.WriteBool('FontDialog', 'fsBold', True);
    end;
  end;
end;

procedure TMainForm.saveScript(FileName: string);
begin
  if ActiveMDIChild is TScriptForm then
  TScriptForm(ActiveMDIChild).memo.Lines.SaveToFile(FileName);
end;

procedure TMainForm.SaveData(FileName: string; WorkType: smallint);
begin
  writeln(ff, WorkType);
  case WorkType of
  1: begin
       writeln(ff, TWorkForm1(ActiveMDIChild).aEdit.Text);
       writeln(ff, TWorkForm1(ActiveMDIChild).bEdit.Text);
       writeln(ff, TWorkForm1(ActiveMDIChild).cEdit.Text);
     end;
  2: begin
       writeln(ff, TWorkForm2(ActiveMDIChild).ak.Text);
       writeln(ff, TWorkForm2(ActiveMDIChild).bk.Text);
       writeln(ff, TWorkForm2(ActiveMDIChild).nk.Text);
       writeln(ff, TWorkForm2(ActiveMDIChild).Func.Text);
     end;
  3: begin
       writeln(ff, TWorkForm3(ActiveMDIChild).NLE.Text);
       writeln(ff, TWorkForm3(ActiveMDIChild).EPS.Text);
       writeln(ff, TWorkForm3(ActiveMDIChild).MX.Text);
       saveGrid(TWorkForm3(ActiveMDIChild).SGA);
       saveGrid(TWorkForm3(ActiveMDIChild).SGB);
       saveGrid(TWorkForm3(ActiveMDIChild).SGX);
     end;
  4: begin
       writeln(ff, TWorkForm4(ActiveMDIChild).xEdit.Text);
       writeln(ff, TWorkForm4(ActiveMDIChild).Edit1.Text);
       saveGrid(TWorkForm4(ActiveMDIChild).SG);
     end;
  5: begin
       writeln(ff, TWorkForm5(ActiveMDIChild).eFunc.Text);
       writeln(ff, TWorkForm5(ActiveMDIChild).eFunc2.Text);
       writeln(ff, TWorkForm5(ActiveMDIChild).Edit1.Text);
       writeln(ff, TWorkForm5(ActiveMDIChild).Edit2.Text);
       writeln(ff, TWorkForm5(ActiveMDIChild).Edit3.Text);
       writeln(ff, TWorkForm5(ActiveMDIChild).LH.Text);
       saveGrid(TWorkForm5(ActiveMDIChild).SG);
     end;
  6: begin
       writeln(ff, TWorkForm6(ActiveMDIChild).xEdit.Text);
       writeln(ff, TWorkForm6(ActiveMDIChild).Edit1.Text);
       saveGrid(TWorkForm6(ActiveMDIChild).SG);
     end;
  7: begin
       writeln(ff, TWorkForm7(ActiveMDIChild).Edit2.Text);
       writeln(ff, TWorkForm7(ActiveMDIChild).Edit3.Text);
       writeln(ff, TWorkForm7(ActiveMDIChild).XEdit.Text);
       writeln(ff, TWorkForm7(ActiveMDIChild).LH.Text);
       writeln(ff, TWorkForm7(ActiveMDIChild).eFunc.Text);
     end;
  8: begin
       writeln(ff, TWorkForm8(ActiveMDIChild).aEdit.Text);
       writeln(ff, TWorkForm8(ActiveMDIChild).bEdit.Text);
       writeln(ff, TWorkForm8(ActiveMDIChild).eEdit.Text);
       writeln(ff, TWorkForm8(ActiveMDIChild).limEdit.Text);
       writeln(ff, TWorkForm8(ActiveMDIChild).pxEdit.Text);
       writeln(ff, TWorkForm8(ActiveMDIChild).pFuncEdit.Text);
       writeln(ff, TWorkForm8(ActiveMDIChild).FuncEdit.Text);
     end;
  9: begin
       writeln(ff, TScriptForm(ActiveMDIChild).RLE.Text);
       writeln(ff, TScriptForm(ActiveMDIChild).Memo.Text);
       writeln(ff, TScriptForm(ActiveMDIChild).VarMemo.Text);
     end;
  10: begin
       writeln(ff, TMatrixForm(ActiveMDIChild).Ne1.Text);
       writeln(ff, TMatrixForm(ActiveMDIChild).Me1.Text);
       writeln(ff, TMatrixForm(ActiveMDIChild).Ne2.Text);
       writeln(ff, TMatrixForm(ActiveMDIChild).Me2.Text);
       saveGrid(TMatrixForm(ActiveMDIChild).SG1);
       saveGrid(TMatrixForm(ActiveMDIChild).SG2);
       writeln(ff, TMatrixForm(ActiveMDIChild).Le.Text);
     end;
  end;
  closefile(ff);
end;

procedure TMainForm.ac44Execute(Sender: TObject);
begin
  try
    if ActiveMDIChild is TWorkForm1 then
    ClipBoard.Assign(TWorkForm1(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TWorkForm2 then
    ClipBoard.Assign(TWorkForm2(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TWorkForm3 then
    ClipBoard.Assign(TWorkForm3(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TWorkForm4 then
    ClipBoard.Assign(TWorkForm4(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TWorkForm5 then
    TWorkForm5(ActiveMDIChild).Chart1.CopyToClipboardMetafile(True);
    if ActiveMDIChild is TWorkForm6 then
    ClipBoard.Assign(TWorkForm6(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TWorkForm7 then
    ClipBoard.Assign(TWorkForm7(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TWorkForm8 then
    ClipBoard.Assign(TWorkForm8(ActiveMDIChild).Image.Picture);
    if ActiveMDIChild is TMatrixForm then
    ClipBoard.Assign(TMatrixForm(ActiveMDIChild).Image.Picture);
  except
    showmessage('Не удаётся выполнить действие...');
  end;
end;

end.
