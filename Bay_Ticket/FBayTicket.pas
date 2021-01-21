unit FBayTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.WinXCalendars, Vcl.StdCtrls;

type
  TfrmBayTicket = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnExit: TButton;
    btnStart: TButton;
    clndrpckrDeparture: TCalendarPicker;
    clndrpckrBay: TCalendarPicker;
    cbbDay: TComboBox;
    procedure btnStartClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure clndrpckrDepartureChange(Sender: TObject);
    procedure edtDateKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBayTicket: TfrmBayTicket;

implementation

{$R *.dfm}

procedure TfrmBayTicket.btnExitClick(Sender: TObject);
begin
  frmBayTicket.Close;
end;

procedure TfrmBayTicket.btnStartClick(Sender: TObject);
var
  day: Integer;
begin
  day := StrToIntDef(cbbDay.Text, 0);
  if day <> 0 then
  begin
    lbl4.Visible := True;
    clndrpckrBay.Visible := True;
    day := StrToInt(cbbDay.Text);
    clndrpckrBay.Date := clndrpckrDeparture.Date - (day - 1);
  end
  else
  begin
    cbbDay.Clear;
    ShowMessage('Введите корректные данные в поле ' + #10 + '"Количество cуток"');
    cbbDay.SetFocus;
  end;
end;

procedure TfrmBayTicket.clndrpckrDepartureChange(Sender: TObject);
begin
  cbbDay.Text := '';
  cbbDay.SetFocus;
end;

procedure TfrmBayTicket.edtDateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnStartClick(nil);
end;

end.

