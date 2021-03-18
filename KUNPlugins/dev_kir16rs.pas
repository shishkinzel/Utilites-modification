unit dev_kir16rs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dev_base_form, Vcl.Grids, Vcl.ValEdit, Vcl.Buttons, Vcl.Samples.Spin,
  Vcl.StdCtrls, DateUtils, Vcl.Mask, Vcl.ComCtrls;

type
  TfrmKIR16RS = class(TfrmBase)
    lblVer: TLabel;
    medtVer: TMaskEdit;
    seNumber: TSpinEdit;
    lbl17: TLabel;
    btnSensor: TSpeedButton;
    lblSensor: TLabel;
    SG: TStringGrid;
    cbbPow: TComboBox;
    lblAKB: TLabel;
    CBSG: TComboBoxEx;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TKIR16RS = class(TBaseDevice)
    function OnDataReceive(pd: PByte; PacketSize: Integer; MaxSize: Integer; var AnswerSize: Integer): HRESULT; override; stdcall;
  end;

const
  gKIR16RS: TGUID = '{C8B1EF56-D63C-4711-B44A-AE6E7024286A}';  // ���������� �������������, ������������ �� Ctrl+Shift+G

implementation

{$R *.dfm}
uses
  IdGlobal, ext_global;

{ TKIR16RS }

function TKIR16RS.OnDataReceive(pd: PByte; PacketSize, MaxSize: Integer; var AnswerSize: Integer): HRESULT;
var
  TR, TA: TArray<Byte>;
  ValueLoop : Cardinal;
  bSendAnswer: Boolean;
//  tmp: string;
  FMyForm: TfrmKIR16RS;
//  bat: Double;
//  batInt: Integer;
  i: Integer;
  ver: string;
  FTime: TDateTime;
  Y, MM, D, H, M, S, MS: Word;
  FDevTimeDifference : Cardinal;
begin
  Result := inherited;
  FMyForm := TfrmKIR16RS(MyForm);
  // �������������� ��������� � ���� ������ ����
  TR := TArray<Byte>(pd);

  // �������� CRC ������
  if GET_CRC(TR, PacketSize) <> TR[PacketSize - 1] then
    Exit;
  // �������� ����� ���������� � ������ �����
  if TR[0] <> $80 + FMyForm.seNumber.Value then
    Exit;


  // �������� ����� �� ������

  case TR[1] of
    PCKT_TYPE:
      begin
  // ��������� ��������� ������� ���� ����������
        TA := TArray<Byte>.Create($80, $81, $03, $0A, $03, $01, $00);
        if FDevTimeSync then
          ResetBit(TA[5], 0);
        if FDevDataSend then
        begin
          SetBit(TA[5], 1);  // ���������� ��������� ����������� ����� ��� ���
          FDevDataSend := False;
        end;
      end;

    PCKT_WRITE_TIME:
      begin
     //������ ������� ����������
        FDevTimeSync := True;
        FDevTime := EncodeDateTime(TR[8] + 2000, TR[7], TR[6], TR[5], TR[4], TR[3], 0);
        FCompTime := Now;
        DecodeDate(FDevTime, Y, MM, D);
        DecodeTime(FDevTime, H, M, S, MS);
        TA := TArray<Byte>.Create($80, $82, $06, S, M, H, D, MM, (Y - 2000), $00);
      end;

    PCKT_READ_TIME:
      begin
     //������ ������� ����������
        FTime := (Now - FCompTime) + FDevTime;
        DecodeDate(FTime, Y, MM, D);
        DecodeTime(FTime, H, M, S, MS);
        TA := TArray<Byte>.Create($80, $83, $06, S, M, H, D, MM, (Y - 2000), $00);
      end;

    PCKT_CURRENT:
      begin
        FDevBattery := FMyForm.cbbPow.ItemIndex;
        SetLength(TA, 83);
        FTime := (Now - FCompTime) + FDevTime;
        DecodeDate(FDevTime, Y, MM, D);
        DecodeTime(FDevTime, H, M, S, MS);

        TA[0] := $80;
        TA[1] := $85;
        TA[2] := $4F;
        // �����
        TA[3] := S;
        TA[4] := M;
        TA[5] := H;
        TA[6] := D;
        TA[7] := MM;
        TA[8] := (Y - 2000);
        //************************
        // ��������� ����������� �����, ������������ � ��������
        if not(FMyForm.btnSensor.Down) then
        begin
           FDevDataSend := True;
           SetBit(TA[81],0);
        end;
        if FDevBattery <> 0 then
        begin
           FDevDataSend := True;
          case FDevBattery of
            1:
              begin
               SetBit(TA[81],5);
              end;
            2:
              begin
               SetBit(TA[81],4);
               SetBit(TA[81],5);
              end;
            3:
              begin
                SetBit(TA[81],6);
              end;
            4:
              begin
                SetBit(TA[81], 7);
              end;
          end;
        end;
       //****************************
       //���������
        for i := 0 to 15 do
        begin
          ValueLoop := StrToIntDef(FMyForm.SG.Cells[1, i + 1],0);
          Move(ValueLoop, TA[9 + (4 * i)], 4);
        end;
        // ��������� TA[73]
        FDevTimeDifference := MinutesBetween(Now, CreateDeviceTime);
        TA[73] := FDevTimeDifference mod 60;
        FDevTimeDifference := FDevTimeDifference div 60;
        Move(FDevTimeDifference, TA[74], 3);
        //**************************
      end;

    PCKT_OPER:
      begin


        TA := TArray<Byte>.Create($D8, $89, $02, $00 ,$00  , $00);

      end;

    PCKT_VERSION:
      begin
        TA := TArray<Byte>.Create($80, $8D, $02, $00, $00, $00);
        // ������ ������ ����������
        ver := FMyForm.medtVer.EditText;
        TA[3] := Fetch(ver, '.').ToInteger;
        TA[4] := ver.ToInteger;
      end;

    PCKT_WRITE_DATA:
      begin
     //������ ������� ������ ����������

        TA := TArray<Byte>.Create($D8, $84, $00, $00);
      end
  else
    Exit;
  end;

  // ������������ ���������� ����� ���������� � ������ ����
  TA[0] := $80 + FMyForm.seNumber.Value;

  AnswerSize := Length(TA);

  // �������� ��� ����� �� �������� ������ ������
  if AnswerSize > MaxSize then
  begin
    Result := 1;
    Exit;
  end;

  // ���������� �����
  CRC(TA, AnswerSize);

  // ��������� ����� ������ �� �������� �����
  move(TA[0], TR[0], AnswerSize);

end;




// ������������ ��������� ����� � ���������� TStringGrid
procedure TfrmKIR16RS.FormCreate(Sender: TObject);
var
  i, j : Integer;
begin
  inherited;
  with SG do
  begin
    ColWidths[0] := 40;
    ColWidths[1] := 95;
    ColWidths[2] := 110;
    for i := 1 to 17 do
      Cells[0, i] := i.ToString;
    for I := 1 to 2 do
      begin
        for j := 1 to 16 do
          Cells[i, j] := '0';
      end;
    Cells[0, 0] := '����';
    Cells[1, 0] := '����� ���������';
    Cells[2, 0] := '��������� ������';
  end;
 SG.DefaultRowHeight := CBSG.Height;
end;

end.
//
//procedure TForm1.FormCreate(Sender: TObject);
//begin
//  {������ combobox'� �� ��������, ��� ��� ������ combobox'�
//  ����� �������� ������ ������ grid'� !}
//  StringGrid1.DefaultRowHeight := ComboBox1.Height; {�������� combobox}
//  ComboBox1.Visible := False; ComboBox1.Items.Add('Delphi Kingdom');
//  ComboBox1.Items.Add('����������� ������');
//end;
//
//procedure TForm1.ComboBox1Change(Sender: TObject);
//begin
//  {���������� ��������� � �������� �� ComboBox � grid}
//  StringGrid1.Cells[StringGrid1.Col,
//  StringGrid1.Row] := ComboBox1.Items[ComboBox1.ItemIndex];
//  ComboBox1.Visible := False; StringGrid1.SetFocus;
//end;
//
//procedure TForm1.ComboBox1Exit(Sender: TObject);
//begin
//  {���������� ��������� � �������� �� ComboBox � grid}
//  StringGrid1.Cells[StringGrid1.Col,
//  StringGrid1.Row] := ComboBox1.Items[ComboBox1.ItemIndex];
//  ComboBox1.Visible := False; StringGrid1.SetFocus;
//end;
//
//procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
//ARow: Integer; var CanSelect: Boolean);
//var
//  R: TRect;
//begin
//  if ((ACol = 3) and (ARow <> 0)) then
//  begin
//    {������ � ��������� ComboBox ������ ��������������� ������ StringGrid}
//    R := StringGrid1.CellRect(ACol, ARow); R.Left := R.Left + StringGrid1.Left;
//    R.Right := R.Right + StringGrid1.Left; R.Top := R.Top + StringGrid1.Top;
//    R.Bottom := R.Bottom + StringGrid1.Top; ComboBox1.Left := R.Left + 1;
//    ComboBox1.Top := R.Top + 1; ComboBox1.Width := (R.Right + 1) - R.Left;
//    ComboBox1.Height := (R.Bottom + 1) - R.Top; {������� combobox}
//    ComboBox1.Visible := True; ComboBox1.SetFocus;
//  end;
//  CanSelect := True;
//end;

