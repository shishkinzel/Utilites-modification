program MainResource;

uses
  Vcl.Forms,
  FResourceLog in 'FResourceLog.pas' {FResource};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFResource, FResource);
  Application.Run;
end.
