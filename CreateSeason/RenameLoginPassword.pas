unit RenameLoginPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, IniFiles,
  IdHashMessageDigest;

type
  TRenameLogPass = class(TForm)
    Label1: TLabel;
    BtnCancel: TButton;
    BtnApplayLog: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditLog: TEdit;
    EditLogOK: TEdit;
    EditPass: TEdit;
    EditPassOK: TEdit;
    BtnVisiblePassword: TBitBtn;
    PanelLog: TPanel;
    PanelPass: TPanel;
//    procedure EditLogChange(Sender: TObject);
    procedure EditLogKeyPress(Sender: TObject; var Key: Char);
    procedure EditLogOKKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassOKKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnApplayLogClick(Sender: TObject);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisiblePasswordClick(Sender: TObject);
  private
   
    var
    RenameLogin, RenamePassword : string;       // пароль и логин
    NewRenameLogin, NewRenamePassword : string; // новые пароль и логин
  public
    { Public declarations }
  end;

  const
   SettingsFileName = 'config.ini';
var
  RenameLogPass: TRenameLogPass;

implementation

{$R *.dfm}

uses HeadMenu, HashParse, Converter;

//********************************* Конструктор формы ********************************************
procedure TRenameLogPass.FormCreate(Sender: TObject);
begin
  PanelLog.Visible := True;
  PanelPass.Visible := False;
  EditLogOK.Enabled := False;
  BtnApplayLog.Visible := False;
end;
//************************************************************************************************


//******************************* Процедура ввода и проверки логина ******************************

procedure TRenameLogPass.EditLogKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9','a'..'z','A'..'Z':;
    #8:;
    #32 : key:=#0;
    #13:
      begin
        EditLogOK.Enabled := True;
        EditLogOK.SetFocus;
      end
    else
    Key := #0;
   end;
   RenameLogin := EditLog.Text;
end;

procedure TRenameLogPass.EditLogOKKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9','a'..'z','A'..'Z':;
    #8:;
    #32 : key:=#0;
    #13:
      begin
        if (RenameLogin = EditLogOK.Text) then
        begin
         PanelLog.Visible := False;
         PanelPass.Visible := True;
         EditPass.SetFocus;
         EditPassOK.Enabled := False;
        end
        else
          begin
          ShowMessage('Проверте правильность введения данных');
          EditLog.Clear;
          EditLogOK.Clear;
          EditLog.SetFocus;
          end;
      end;
    else
    Key := #0;
   end;
end;
//************************************************************************************************


//************************************ Процедура ввода и проверки пароля *************************
procedure TRenameLogPass.EditPassKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9','a'..'z','A'..'Z':;
    #8:;
    #32 : key:=#0;
    #13:
      begin
        EditPassOK.Enabled := True;
        EditPassOK.SetFocus;
      end
    else
    Key := #0;
   end;
  RenamePassword := EditPass.Text;
end;

procedure TRenameLogPass.EditPassOKKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9','a'..'z','A'..'Z':;
    #8:;
    #32 : key:=#0;
    #13:
      begin
        if (RenamePassword = EditPassOK.Text) then
          begin
            NewRenamePassword := Hashmd5(RenamePassword);
            BtnApplayLog.Visible := True;
          end
      else
        begin
         ShowMessage('Проверте правильность введения данных');
         EditPass.Clear;
         EditPassOK.Clear;
         EditPass.SetFocus;
         Abort;
        end;
      BtnCancel.SetFocus;
      end;
    else
    Key := #0;
   end;
end;
//************************************************************************************************

//****************************************** Обработка кнопки "Отмена"****************************
procedure TRenameLogPass.BtnCancelClick(Sender: TObject);
begin
  PanelLog.Visible := True;
  PanelPass.Visible := False;
  EditLogOK.Enabled := False;
  EditLog.Clear;
  EditLogOK.Clear;
  EditPass.Clear;
  EditPassOK.Clear;
  RenameLogPass.Close;
end;
//************************************************************************************************

//**************************************** Обработка кнопки "Видимость пароля" *******************
procedure TRenameLogPass.BtnVisiblePasswordClick(Sender: TObject);
begin
  if EditPass.PasswordChar = '*' then
    begin
      EditPassOK.PasswordChar :=#0;
      EditPass.PasswordChar :=#0;
    end
  else
    begin
      EditPassOK.PasswordChar :='*';
      EditPass.PasswordChar :='*';
    end;
end;
//************************************************************************************************

//********************************** Обработка кнопки "Применить изменения" **********************
procedure TRenameLogPass.BtnApplayLogClick(Sender: TObject);
var
 fini : TIniFile;
begin
   fIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + SettingsFileName);
   fini.WriteString('Login', 'LogCustom', RenameLogin);
   fLogin := fini.ReadString('Login', 'LogCustom', 'admin');
   fini.WriteString('Password', 'PassCustom', NewRenamePassword);
   fPassword := fini.ReadString('Password', 'PassCustom', 'admin');
   fini.WriteBool('CustomSet', 'Пользовательские настройки ', True);
//   fini.WriteBool('chBoxSetCustom', 'Checked', True);
   form1.ChBoxSetCustom.Checked := true;
   fVisibleAccess := true;
   fini.Free;
//*****************************
   PanelLog.Visible := True;
   PanelPass.Visible := False;
   EditLogOK.Enabled := False;
//*****************************
   EditLog.Clear;
   EditLogOK.Clear;
   EditPass.Clear;
   EditPassOK.Clear;
//*****************************

//


//
   RenameLogPass.Visible := False;
end;

//************************************************************************************************

end.
