unit Converter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.ExtCtrls, SortedBubble,
  Vcl.Buttons, IniFiles, DateUtils;


type
  TForm1 = class(TForm)
    ListBoxWind: TListBox;
    BtnSelectCase: TButton;
    Label1: TLabel;
    ComboBoxExt: TComboBox;
    BtnStart: TButton;
    Label2: TLabel;
    EditSeson: TEdit;
    BtnConverter: TButton;
    BtnReset: TButton;
    BtnCancel: TButton;
    BtnQuit: TButton;
    BtnAddExt: TButton;
    PanelSorted: TPanel;
    BtnYes: TButton;
    BtnNo: TButton;
    Label3: TLabel;
    BtnHelp: TButton;
    BtnInformation: TButton;
    PanelSeson: TPanel;
    PanelExt: TPanel;
    PanelInformation: TPanel;
    PanelControl: TPanel;
    ChBoxSetCustom: TCheckBox;
    PanelSettingCustom: TPanel;
    Label4: TLabel;
    PanelDefault: TPanel;
    Label5: TLabel;
    BitBtnResetDefault: TBitBtn;
    BtnSer: TButton;
    EditSer: TEdit;
    LbNumEpisod: TLabel;
    LbNumEp: TLabel;
    procedure BtnSelectCaseClick(Sender: TObject);
//    procedure BtnSortedSetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure EditSesonKeyPress(Sender: TObject; var Key: Char);
    procedure BtnQuitClick(Sender: TObject);
    procedure BtnConverterClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnAddExtClick(Sender: TObject);
    procedure BtnYesClick(Sender: TObject);
    procedure BtnNoClick(Sender: TObject);
    procedure BtnInformationClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BitBtnResetDefaultClick(Sender: TObject);
    procedure BtnSerClick(Sender: TObject);
    procedure EditSerKeyPress(Sender: TObject; var Key: Char);
//    procedure EditSesonEnter(Sender: TObject);

  private
      SesonArray : array of string;
      OldFilePath, NewFilePath : string;
      NewFile : string;
      extSeson : string;
      sFileRec : TSearchRec;
      sPath : string;
  public
    { Public declarations }
    openingPath : WideString;
  end;
  const
   SettingsFileName = 'config.ini';


var
  Form1: TForm1;
  countComBox : Integer; // ���������� ����� � ������ ComboBoxExt
  fVisibleAccess :boolean = True; // ���� �������� ����������
  fSetChecked : Boolean; // ���� ���������������� ��������, ������ � ������
  fLogin, fPassword : string; // ����� � ������
  fEditSer : Integer = 0;  // �������� �������� ��������� �����

implementation

{$R *.dfm}

uses ShowLogin, BtnHelp, HeadMenu, RenameLoginPassword;
//************************************************************
//START*****************START*************START***************
//************************************************************

// ����������� �����
//***************************************************
 procedure TForm1.FormCreate(Sender: TObject);
 var
   SettingsIni : TIniFile;
   fExt : string;
   i : Integer;
begin
 ComboBoxExt.Enabled := True;
// ������ �� ����� config.ini ���� �� ����������
//*******************************************************************************
 SettingsIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + SettingsFileName);
// settingsIni.EraseSection('TIME CREATE');
// SettingsIni.WriteDateTime('TIME CREATE','�������� ����� ����/�����',Time);
 countComBox := SettingsIni.ReadInteger('���������� �������������','�����  ',countComBox);
   for i := 0 to (countComBox - 1) do
     begin
       fExt := SettingsIni.ReadString('���������� �����������','���������� �'+IntToStr(i+1)+' ','');
       comboBoxExt.items.Add(fExt);
     end;

//********************************** ������ � ���������� �� ��������� ****************************
   fSetChecked := SettingsIni.ReadBool('CustomSet', '���������������� ��������� ', False);
   fLogin := SettingsIni.ReadString('Login', 'LogCustom', 'admin');
   fPassword := SettingsIni.ReadString('Password', 'PassCustom', 'admin');
   ChBoxSetCustom.Checked := fSetChecked;
 //************************ new ***************************************
   openingPath := SettingsIni.ReadString('OpeningPath', ' ��������� ����� ��� ������ ', '');
//************************************************************************************************

 BtnSelectCase.Visible := False;
 ListBoxWind.Enabled := False;
 BtnInformation.Enabled := True;
 BtnHelp.Enabled := True;
 BtnCancel.Enabled := False;
 BtnReset.Enabled := False;
 ChBoxSetCustom.Enabled := False;
 SettingsIni.Free;
end;

//****************************************************

// ��������� ������
//*******************************************************
procedure TForm1.BtnStartClick(Sender: TObject);
begin
  ListBoxWind.Clear;
  extSeson := ComboBoxExt.Text;
  if not(ComboBoxExt.Text = '')  then
    begin
      BtnSelectCase.Visible := True;
      BtnSelectCase.Enabled := True;
      PanelSorted.Visible := False;
      ComboBoxExt.Enabled := False;
      BtnCancel.Enabled := True;
    end
  else exit;
end;

//******************************************************************************************
// ��������� ������ ����� � ������������
procedure TForm1.BtnSelectCaseClick(Sender: TObject);
var
 counterI : Integer;
 i : Integer;
begin
  ListBoxWind.Clear;
      if SelectDirectory('�������� ����� � ������������',openingPath,sPath)  then
         begin
          sPath := sPath + '\';
          Form1.Caption := '����� ����������� - ' + sPath;

          // ������������ ������ �����������
          counterI := FindFirst(sPath + extSeson,faAnyFile, sFileRec);
          if counterI = 0 then
            begin
              ListBoxWind.Items.Clear;
              ListBoxWind.Items.add(sFileRec.Name);
              while 0 = FindNext(sFileRec) do
                begin
                  ListBoxWind.Items.add (sFileRec.Name);
                end;
              // ��������� ������
              for i := 0 to (ListBoxWind.Count - 1) do
                begin
                SetLength(SesonArray,ListBoxWind.Count);
                SesonArray[i] := ListBoxWind.Items[i];
                end;
//          BtnSortedSet.Enabled := True;  {�������� ��������}
            ComboBoxExt.Enabled := False;
            BtnSelectCase.Enabled := False;
            BtnStart.Enabled := False;
            BtnReset.Enabled := True;
            BtnCancel.Enabled:= True;
            PanelSorted.Visible :=True;
            end
          else
            begin
              ListBoxWind.Clear;
              MessageDlg('� ��������� ����� ��� �����������', mtWarning, mbOKCancel,0);
              BtnSelectCase.Enabled := False;
              BtnSelectCase.Visible := False;
              BtnStart.Enabled := True;
              ComboBoxExt.ItemIndex := -1;
              ComboBoxExt.Enabled := True;
              FindClose(sFileRec);
            end;
         end;
end;


procedure TForm1.BtnSerClick(Sender: TObject);
var
  i : Integer;
  key : Char;
begin
  EditSer.Visible := True;
  EditSer.Clear;
  EditSer.SetFocus;
 {
  ShowMessage('���������� fEditSer = '+ IntToStr(fEditSer));
end;
}
{  if (EditSer.Text in ['0'..'9']) then
    begin
     fEditSer := StrToInt(Editser.Text);
     ShowMessage('���������� fEditSer = '+ fEditSer);
    end;
 }
end;

//********************************************************************************************


//*************************************************************************
// ����� ������ ������

procedure TForm1.EditSesonKeyPress(Sender: TObject; var Key: Char);
begin
// � ���� ����� ����� ������ ������ ����� �����
    case Key of
    '0'..'9',#8:;
    #32 : key:=#0;
    #13: BtnConverter.Visible := True
    else
    Key := #0;
    end;
end;
//*************************************************************************

//*******************RESET************************************************
// ��������� ��������� ������ �����
procedure TForm1.BtnResetClick(Sender: TObject);

begin
  BtnStart.Enabled := True;
  ComboBoxExt.Enabled := True;
  ComboBoxExt.SetFocus;
  PanelSorted.Visible := False;
  PanelSeson.Visible := False;
  BtnConverter.Visible := False;
  EditSeson.Clear;
  SesonArray := nil;
  ListBoxWind.Clear;
//******************* ����� ������ ������ ����� *********************************
  LbNumEpisod.Visible := False;
  LbNumEp.Visible := False;
  fEditSer := 0;
  EditSer.Visible := False;
  EditSer.Clear;
  BtnSer.Enabled := True;
//******************************************************************************
end;
//************************************************************************

//*****************CANCEL******************CANCEL*************************
// ��������� ��������� ������ ������
procedure TForm1.BtnCancelClick(Sender: TObject);
begin
  EditSeson.Clear;
  PanelSorted.Visible := False;
  PanelSeson.Visible := False;
  BtnConverter.Visible := False;
  BtnSelectCase.Visible := False;
  BtnStart.Enabled := True;
  ComboBoxExt.ItemIndex := -1;
  ComboBoxExt.Enabled := True;
  ComboBoxExt.SetFocus;
  SesonArray := nil;
  fEditSer := 0;
  LbNumEpisod.Visible := False;
  LbNumEp.Visible := False;
  BtnSer.Enabled := True;
//******************* ����� ������ ������ ����� *********************************
  LbNumEpisod.Visible := False;
  LbNumEp.Visible := False;
  fEditSer := 0;
  EditSer.Visible := False;
  EditSer.Clear;
  BtnSer.Enabled := True;
//*******************************************************************************
end;


//*******************************************
// ��������� ��������� ������ �����
procedure TForm1.BtnQuitClick(Sender: TObject);
begin
ShowMessage('������� � ���� ������� �����!!! ����, ���� ....');
SesonArray := nil;
Form1.Close;
end;
//********************************************


//******* CONVERTER******************************
procedure TForm1.BtnConverterClick(Sender: TObject);
var
  counFile : Integer; // ������� ������
  k,i,j : Integer;
  epizNomber : string; // ����� �������
  nomberSeson : string; // ����� ������
begin
  k := MessageDlg('��� ���� ������ ����� ?',mtConfirmation, mbYesNo,0);
  if k = 7 then
    begin
     ShowMessage('������ �� ������.');
//      Form1.Close;

//     BtnReset.Enabled := True;
//     BtnReset.SetFocus;
     BtnResetClick(nil);
           exit;
    end;

  if (EditSeson.Text = '') or (EditSeson.Text = '0')  then
    begin
      EditSeson.Clear;
      BtnConverter.Enabled := False;
      EditSeson.SetFocus;
    end
    else
      begin
      delete(extSeson, 1, 1);
      nomberSeson := EditSeson.Text;
      counFile := ListBoxWind.Count;
      if StrToInt(nomberSeson) < 10 then
        nomberSeson := 's0' + nomberSeson
      else
        nomberSeson := 's' + nomberSeson;
      epizNomber := '';
// ��������� ������ �����

      for i := 1 to counFile  do
        begin
        OldFilePath :=sPath + ListBoxWind.Items[i - 1];
        if (i + fEditSer) < 10 then
          epizNomber := 'e0' + IntToStr(i + fEditSer)
        else
        epizNomber := 'e' + IntToStr(i + fEditSer);
//         NewFile :=sPath + 'ooo' + IntToStr(i) + '.' + ExtractFileExt (WindFile.Items[i]);
         NewFile :=nomberSeson + epizNomber  + extSeson;
         NewFilePath :=sPath + nomberSeson + epizNomber + extSeson;
         ListBoxWind.Items[i - 1] := NewFile;
          RenameFile (OldFilePath, NewFilePath);
        end;

      end;
  fEditSer := 0;
end;

//**************************ShowsLogin or HeadMenuStructure **************************************
// �������� ������ �����
procedure TForm1.BtnAddExtClick(Sender: TObject);
begin
  if fVisibleAccess then
      begin
        ShowsLogin.Show;
        ShowsLogin.EditLogin.SetFocus;
      end
  else
  HeadMenuStructure.Show;
end;


//***************************NewSorted************************************************************
procedure TForm1.BtnYesClick(Sender: TObject);
var
  i : Integer;
begin
   BubbleStr(SesonArray);
   ListBoxWind.Clear;
   for i := 0 to (Length(SesonArray) - 1) do
     begin
       ListBoxWind.Items.Add(sesonArray[i]);
     end;
//   BtnSortedSet.Enabled := False;
   EditSeson.Enabled := True;
   PanelSeson.Visible :=True;
   EditSeson.Enabled := True;
   EditSeson.SetFocus;
   ComboBoxExt.Enabled := False;
   BtnSelectCase.Enabled := False;
   BtnStart.Enabled := False;
   SesonArray := nil;
end;

//******************************NoNewSorted*******************************************************
procedure TForm1.BtnNoClick(Sender: TObject);
begin
   EditSeson.Enabled := True;
   PanelSeson.Visible :=True;
   EditSeson.Enabled := True;
   EditSeson.SetFocus;
   ComboBoxExt.Enabled := False;
   BtnSelectCase.Enabled := False;
   BtnStart.Enabled := False;
   SesonArray := nil;
end;
//******************************************************************************

//***********************************������ ����������**************************

// **********************************������ �������***********************************************
procedure TForm1.BtnInformationClick(Sender: TObject);
begin
  ShowMessage('����� ��������� �������������:'+#10+'1. ��� �������������� ������ ����������� �'
               +#10+
              '   ������� ���� SxxExx, �� ����- ����� ������, ����� �������.'+#10+
               '2. ������ ������ ������������ � ����������� KODI.'+#10+
               'Kodi (����� XBMC) � ���������� ������������������ ����������'+#10+
               '� ����������� ����������� ��� ����������� HTPC � '+#10+
               '�������� �������� �����.'+#10+
               '����������� ��������� ��������� ��������� ����� ��������� '+#10+
               '������������, ������������ � �������, ������������ �� '+#10+
               '����������,���������� �����,� ��������� ��� � ��������� ����.'+#10+
               '����� ����������� � ������� ���. ���������� ������������ '+#10+
               'Windows Media Center �� Microsoft � Front Row �� Apple. '+#10+
               'Kodi ������������ ���������������� �������� ���� ����������.'#10+
               '������������� Kodi ���������� ��� ���������� ���������� '+#10+
               '��� ������� ��������� Xbox. �� ������ �� ������������ Linux,'+#10+
               'OS X (Snow Leopard, Leopard, Tiger, Apple TV), Apple iOS, Windows,'+#10+
               'Android � Raspberry Pi.'+#10+
               '�� ������ 14 ������ ��������� XBMC (�� Xbox Media Center).');
end;
//************************************************************************************************

//**************************************������ ������*********************************************
procedure TForm1.BtnHelpClick(Sender: TObject);
var i:integer;
begin
  PanelHelp.Show;
end;


//********************************* ����� � ��������� ���������� *********************************
procedure TForm1.BitBtnResetDefaultClick(Sender: TObject);
var
  i :integer;
  SettingsIni : TIniFile;
begin
     i := MessageDlg('�������� � ��������� ����������.'+#10+
                     '�� ������� ???', mtWarning, mbYesNo, 0);
     case i of
       7 : abort;


// ************������ ������������ �� ��������� **************************************************
//*******************************************************************************
       6:
          begin
            SettingsIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + SettingsFileName);
            DeleteFile(ExtractFilePath(Application.ExeName) + SettingsFileName);
//********************************** ������ � ���������� �� ��������� ****************************
            fSetChecked := SettingsIni.ReadBool('CustomSet', '���������������� ��������� ', False);
            fLogin := SettingsIni.ReadString('Login', 'LogCustom', 'admin');
            fPassword := SettingsIni.ReadString('Password', 'PassCustom', 'admin');
            ChBoxSetCustom.Checked := fSetChecked;
            ComboBoxExt.Clear;
            RenameLogPass.BtnApplayLog.Visible := False;
            fVisibleAccess := True;

            SettingsIni.Free;
          end;
//************************************************************************************************
     end;
end;
//************************************************************************************************

//*********************** ����� ����� ����� **********************************************
procedure TForm1.EditSerKeyPress(Sender: TObject; var Key: Char);
 var
  i : Integer;
begin

     case Key of
       '0'..'9',#8:;
       'a'..'z','A'..'Z',#32 : key:=#0;
       #13:
         begin
           i := StrToInt('0' + EditSer.Text);
           if i < 2 then
             begin
               fEditSer := 0;
               EditSer.Visible := False;
               EditSer.Clear;
             end
           else begin
              fEditSer := i-1;
              EditSer.Visible := False;
              EditSer.Clear;
              BtnSer.Enabled := False;
              ShowMessage('�������� �������� ��������� ����� ���������� !!!' +#10+
                         '������ ��������� ����� ������� - '  +IntToStr(i));
              LbNumEpisod.Visible := true;
              LbNumEp.Visible := True;
              LbNumEp.Caption := IntToStr(i);
              BtnCancel.Enabled := True;
           end;


         end
    else
      begin
        Key := #0;
      end;
  end;


end;
//****************************************************************************************
end.
