unit HeadMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  THeadMenuStructure = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadMenuStructure: THeadMenuStructure;

implementation

{$R *.dfm}

uses ShowLogin, ChangeComboBoxExt, RenameLoginPassword, Converter;

//
//**********************************************************************

procedure THeadMenuStructure.FormCreate(Sender: TObject);
begin
 Button1.Enabled := True;
end;
//***********************************************************************

// Смена логина и пароля

procedure THeadMenuStructure.Button1Click(Sender: TObject);
begin
//  RenameLogPass.Visible := True;
  RenameLogPass.Show;
  RenameLogPass.EditLog.SetFocus;
  HeadMenuStructure.Close;
end;


// Редактирование расширения видеофайлов
procedure THeadMenuStructure.Button2Click(Sender: TObject);
begin
  ChangesComboBoxExt.Show;
  ChangesComboBoxExt.SetFocus;
  HeadMenuStructure.Close;
end;


// Отмена операций
procedure THeadMenuStructure.Button3Click(Sender: TObject);
begin
 HeadMenuStructure.Close;
 ShowsLogin.EditLogin.Clear;
 ShowsLogin.EditPassword.Clear;
 ShowsLogin.Close;
 ShowsLogin.BtnOk.Enabled := False;
 Form1.BtnReset.Click;
end;

end.
