program MainBayTicket;

uses
  Vcl.Forms,
  FBayTicket in 'FBayTicket.pas' {frmBayTicket};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBayTicket, frmBayTicket);
  Application.Run;
end.
