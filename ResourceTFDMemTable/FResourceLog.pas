unit FResourceLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageJSON, System.JSON;

type
  TFResource = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlMiddle: TPanel;
    splTop: TSplitter;
    splBottom: TSplitter;
    dbgrdResource: TDBGrid;
    dbnvgrTop: TDBNavigator;
    dsTable: TDataSource;
    lblBottom: TLabel;
    edtBottom: TEdit;
    fdmtblTop: TFDMemTable;
    fdmtblTopID: TFDAutoIncField;
    fdmtblTopDate: TDateField;
    fdmtblTopResource: TStringField;
    fdmtblTopWWW: TStringField;
    fdmtblTopLogin: TStringField;
    fdmtblTopPassoword: TStringField;
    fdmtblTopComment: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FResource: TFResource;

implementation

{$R *.dfm}



procedure TFResource.FormCreate(Sender: TObject);
begin
  if FileExists('client.FDS') then
    fdmtblTop.LoadFromFile('client', sfJSON) // client.FDS
  else
  begin
    raise exception.Create('Файл - client.FDS, не найден');
  end;
end;


procedure TFResource.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fdmtblTop.SaveToFile('client.FDS', sfJSON);
end;
end.
