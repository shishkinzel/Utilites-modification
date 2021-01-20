unit BtnHelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPanelHelp = class(TForm)
    PnHelp: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PanelHelp: TPanelHelp;

implementation

{$R *.dfm}

uses Converter;

procedure TPanelHelp.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  PnHelp.Visible := True;
end;

end.
