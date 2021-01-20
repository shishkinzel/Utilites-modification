program ConverterToKODI;

uses
  Vcl.Forms,
  Converter in 'Converter.pas' {Form1},
  ShowLogin in 'ShowLogin.pas' {ShowsLogin},
  RenameLoginPassword in 'RenameLoginPassword.pas' {RenameLogPass},
  ChangeComboBoxExt in 'ChangeComboBoxExt.pas' {ChangesComboBoxExt},
  HeadMenu in 'HeadMenu.pas' {HeadMenuStructure},
  BtnHelp in 'BtnHelp.pas' {PanelHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TShowsLogin, ShowsLogin);
  Application.CreateForm(TRenameLogPass, RenameLogPass);
  Application.CreateForm(TChangesComboBoxExt, ChangesComboBoxExt);
  Application.CreateForm(THeadMenuStructure, HeadMenuStructure);
  Application.CreateForm(TPanelHelp, PanelHelp);
  Application.Run;
end.
