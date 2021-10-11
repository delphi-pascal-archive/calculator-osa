program OSA;

uses
  Forms,
  Classes,
  Main in 'Main.pas' {MainForm},
  uWork1 in 'uWork1.pas' {WorkForm1},
  uWork2 in 'uWork2.pas' {WorkForm2},
  uWork3 in 'uWork3.pas' {WorkForm3},
  uWork4 in 'uWork4.pas' {WorkForm4},
  TheGeneral in 'TheGeneral.pas',
  uWork5 in 'uWork5.pas' {WorkForm5},
  Calculations in 'Calculations.pas',
  uWork6 in 'uWork6.pas' {WorkForm6},
  uWork7 in 'uWork7.pas' {WorkForm7},
  uWork8 in 'uWork8.pas' {WorkForm8},
  uHistory in 'uHistory.pas' {HistoryForm},
  uPlug in 'uPlug.pas' {PlugForm},
  Search in 'Search.pas',
  uNM in 'uNM.pas' {NMForm},
  uScriptWindow in 'uScriptWindow.pas' {ScriptForm},
  uAbout in 'uAbout.pas' {AboutForm},
  uTips in 'uTips.pas' {TipsForm},
  uArithmetics in 'uArithmetics.pas' {ArithmeticsForm},
  uMatrixes in 'uMatrixes.pas' {MatrixForm};

{$R *.res}

{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.Title := 'OSA';
  Application.HelpFile := 'HELP.HLP';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TTipsForm, TipsForm);
  Application.CreateForm(THistoryForm, HistoryForm);
  Application.CreateForm(TPlugForm, PlugForm);
  Application.CreateForm(TNMForm, NMForm);
  Application.CreateForm(TArithmeticsForm, ArithmeticsForm);
  Application.Run;
end.
