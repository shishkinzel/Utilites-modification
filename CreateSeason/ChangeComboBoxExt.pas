unit ChangeComboBoxExt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Vcl.ExtCtrls, Vcl.FileCtrl;

type
  TChangesComboBoxExt = class(TForm)
    MemoComboBox: TMemo;
    Label1: TLabel;
    BtnAdd: TButton;
    EditAdd: TEdit;
    Label2: TLabel;
    EditDelete: TEdit;
    BtnDelete: TButton;
    BtnReset: TButton;
    BtnApply: TButton;
    ButtonClear: TButton;
    pnldown: TPanel;
    edtPath: TEdit;
    lblPath: TLabel;
    btnCurrent: TButton;
    btnEnter: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EditAddKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure EditDeleteKeyPress(Sender: TObject; var Key: Char);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure btnCurrentClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
 
  end;

var
  ChangesComboBoxExt: TChangesComboBoxExt;

implementation

{$R *.dfm}

uses HeadMenu, Converter;

// ����������� �����
//*********************************GREATE****************************************

procedure TChangesComboBoxExt.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  MemoComboBox.Enabled := False;
  BtnAdd.Enabled := False;
  BtnDelete.Enabled := False;
  BtnApply.Enabled := False;
  countComBox := Form1.ComboBoxExt.Items.Count;
  MemoComboBox.Clear;
  for i := 1 to countComBox  do
    begin
    MemoComboBox.Lines.Add( Form1.ComboBoxExt.Items[i - 1]);
    end;
end;
//*******************************************************************************


// ��������� ��������� ������� ����� ���������� ����������
//****************************BntAdd****************************************
procedure TChangesComboBoxExt.EditAddKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'a'..'z',#8:;
    #32 : key:=#0;
    #13:
        begin
          if EditAdd.Text <> '' then
            begin
              BtnAdd.Enabled := True;
              BtnAdd.SetFocus;
            end
          else
            begin
              EditDelete.SetFocus;
            end;
        end
    else
    Key := #0;
    end;
end;
//****************************************************************************

// ��������� ������� ���������� ���������� ����������
//***************************************************************************
procedure TChangesComboBoxExt.BtnAddClick(Sender: TObject);
var
  sExt : string;
begin
  sExt := EditAdd.Text;
  if not(EditAdd.Text = '') then
     begin
       sExt := '*.' + Copy(sExt, 1, 4);
       MemoComboBox.Lines.add(sExt);
       Inc(countComBox);
       BtnApply.Enabled := True;
       EditAdd.SetFocus;
       BtnAdd.Enabled := False;
       EditAdd.Clear;
     end
   else
       ShowMessage('�������� ������������ �������� ������');
end;
//************************************************************************

// ��������� ������ �����
//************************************************************************
procedure TChangesComboBoxExt.BtnResetClick(Sender: TObject);
begin
  Form1.BtnResetClick(nil);
  ChangesComboBoxExt.Close;
end;

//*************************************************************************

// ���� � ���� EditDelete
//********************************************************************************
procedure TChangesComboBoxExt.EditDeleteKeyPress(Sender: TObject; var Key: Char);
begin
   case Key of
    'a'..'z',#8:;
    #32 : key:=#0;
    #13: BtnDelete.Enabled := True
    else
    Key := #0;
    end;
end;
//*********************************************************************************

//
//**********************************************************************************
procedure TChangesComboBoxExt.BtnDeleteClick(Sender: TObject);
var
  booleanExt : Boolean;
  sExt : string;
  i : Integer ;
  begin
  booleanExt := True;
  sExt := EditDelete.Text;
  if not(EditDelete.Text = '') then
     begin
       sExt := '*.' + Copy(sExt, 1, 4);
       for i := 0 to (countComBox - 1) do
           if MemoComboBox.Lines[i] = sExt then
             begin
               booleanExt := False;
               MemoComboBox.Lines.Delete(i);
               Dec(countComBox);
               BtnApply.Enabled := True;
               EditDelete.Clear
             end;
        if booleanExt then
           begin
             ShowMessage('������ ���������� �� ����������' + #10
                         + '�������� ������������ �������� ������');
             EditDelete.Clear;
           end;
     end
   else
       ShowMessage('�� �� ����� ����������');

  end;


//****************************************************************************

//
//*****************************************************************************


procedure TChangesComboBoxExt.BtnApplyClick(Sender: TObject);
var
  i : Integer;
  SettingsIni : TIniFile;
begin
  countComBox := MemoComboBox.Lines.Count;
  SettingsIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + SettingsFileName);
//  DeleteFile(ExtractFilePath(Application.ExeName) + SettingsFileName);
  Form1.ComboBoxExt.Clear;
  for i := 0 to (countComBox - 1) do
  begin
    Form1.ComboBoxExt.AddItem(MemoComboBox.Lines[i],nil);
//******************************������ � ���� config.ini *****************************************
    SettingsIni.WriteString('���������� �����������','���������� �'+IntToStr(i+1)+' ',
                             MemoComboBox.Lines[i]);
  end;

  SettingsIni.WriteInteger('���������� �������������','�����  ',countComBox);

//******************  ������ ������ ����� �� ��������� *************************

//   SettingsIni.WriteString('Path', '��������� ����� ��� ������ ', Form1.openingPath);

//******************************************************************************
  SettingsIni.Free;
  BtnAdd.Enabled := False;
//  countComBox := 0;
  ChangesComboBoxExt.Close;
end;



//*****************************������� ComboBoxExt ***********************************************
procedure TChangesComboBoxExt.ButtonClearClick(Sender: TObject);
var
  SettingsIni : TIniFile;
begin
   MemoComboBox.Clear;
//   DeleteFile(ExtractFilePath(Application.ExeName) + SettingsFileName);
   SettingsIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + SettingsFileName);
   SettingsIni.EraseSection('���������� �����������');
   SettingsIni.EraseSection('���������� �������������');
   form1.ComboBoxExt.clear;
   countComBox := 0;
   BtnApply.Enabled := True;
   BtnApply.SetFocus;
end;
//************************************************************************************************

//******************* ��������� ������ ����� �� ���������
procedure TChangesComboBoxExt.btnCurrentClick(Sender: TObject);
var
s: string;
begin
  if SelectDirectory('�������� �������', '', s)
  then
  begin
   edtPath.Text := s;
   btnEnter.Enabled := True;
  ShowMessage('��������� ������� => '+ edtPath.Text);
  end
  else ShowMessage('����� �������� ���������');
end;

//******************************************************************************

//************** ������ ��������� ����� �� ��������� ************
 procedure TChangesComboBoxExt.btnEnterClick(Sender: TObject);
 var
  SettingsIni : TIniFile;
begin
 SettingsIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + SettingsFileName);
  Form1.openingPath := edtPath.Text;
  btnEnter.Enabled := False;
  btnClose.Enabled := True;
  SettingsIni.WriteString('OpeningPath', '��������� ����� ��� ������ ', Form1.openingPath);
  SettingsIni.Free;
end;
//****************************************************************



procedure TChangesComboBoxExt.btnCloseClick(Sender: TObject);
var
i : Integer;
begin
BtnApplyClick(nil);
end;
end.
