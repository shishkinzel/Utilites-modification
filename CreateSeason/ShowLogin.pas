unit ShowLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdHashMessageDigest;

type
  TShowsLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditLogin: TEdit;
    EditPassword: TEdit;
    Label3: TLabel;
    BtnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EditLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);

  private

    var
       actualityPasLog : Boolean;
  public
   var
      fCustomLogin , fCustomPassword : string;
      constLogin, constPassword : string;
  end;

var
  ShowsLogin: TShowsLogin;

implementation

{$R *.dfm}

uses Converter, HeadMenu, HashParse;

procedure TShowsLogin.FormCreate(Sender: TObject);
var
  key : Integer;
begin
  BtnOk.Enabled := False;
  EditPassword.Enabled := False;
end;

procedure TShowsLogin.BtnOkClick(Sender: TObject);
begin
  if (fLogin = fCustomLogin) and (fPassword = fCustomPassword) then
    begin
      HeadMenuStructure.Show;
      fVisibleAccess := False;
      EditLogin.Clear;
      EditPassword.clear;
      BtnOk.Enabled := False;
      ShowsLogin.Close;
    end
    else
    begin
    EditLogin.Clear;
    EditPassword.Clear;
    ShowMessage('Не верный пароль или логин');
    end;
  ShowsLogin.Close;
end;

procedure TShowsLogin.EditLoginKeyPress(Sender: TObject; var Key: Char);
begin
   case Key of
    '0'..'9','a'..'z','A'..'Z',#8:;
    #32 : key:=#0;
    #13:
       begin
         EditPassword.Enabled := True;
         EditPassword.SetFocus;
       end
    else
    Key := #0;
   end;
   fCustomLogin := EditLogin.Text;
end;

procedure TShowsLogin.EditPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9','a'..'z','A'..'Z':;
    #8:;
    #32 : key:=#0;
    #13: begin
           if fSetChecked then
             fCustomPassword := Hashmd5(EditPassword.Text)
           else
               fCustomPassword := EditPassword.Text;
           BtnOk.Enabled := True;
           BtnOk.SetFocus;
         end;
    else
    Key := #0;
   end;

end;

end.
