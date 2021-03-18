unit dev_kup4rs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, ext_global,
  dev_base_form, Vcl.StdCtrls, Vcl.Buttons, Vcl.Samples.Spin, Vcl.Mask;

type
  TfrmKUP4RS = class(TfrmBase)
    lblIn: TLabel;
    lblSw: TLabel;
    btnIn1: TSpeedButton;
    btnIn2: TSpeedButton;
    btnIn3: TSpeedButton;
    btnIn4: TSpeedButton;
    btnIn5: TSpeedButton;
    btnIn6: TSpeedButton;
    btnIn7: TSpeedButton;
    btnIn8: TSpeedButton;
    btnSw1: TSpeedButton;
    btnSw2: TSpeedButton;
    btnSw3: TSpeedButton;
    btnSw4: TSpeedButton;
    lbl17: TLabel;
    seNumber: TSpinEdit;
    lblVer: TLabel;
    medtVer: TMaskEdit;
    chkPowLine: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TimerMessage(var T: TMessage); message WM_USER + 1;
  end;

  TKUP4RS = class(TBaseDevice)
    function OnDataReceive(pd: PByte; PacketSize: Integer; MaxSize: Integer; var AnswerSize: Integer): HRESULT; override; stdcall;
  end;

const
  gKUP4RS: TGUID = '{FA28155C-2CF0-4A5A-A4F9-723656F33218}';  // ���������� �������������, ������������ �� Ctrl+Shift+G

implementation

{$R *.dfm}
uses
  IdGlobal;

type
  TWaitTime = class(TThread)
    FBtn: TSpeedButton;
    FHWND: HWND;
    constructor Create(btn: TSpeedButton; w: hwnd);
    procedure Execute; override;
  end;


{ TKUP4RS }

function TKUP4RS.OnDataReceive(pd: PByte; PacketSize, MaxSize: Integer; var AnswerSize: Integer): HRESULT;
var
  TR, TA: TArray<Byte>;
  bSendAnswer: Boolean;
  upsl_b, upsl_ch: Byte;
  tmp: string;
  FMyForm: TfrmKUP4RS;
  bat: Double;
  batInt: Integer;
  i: Integer;
  ver: string;
  FTime: TDateTime;
  Y, MM, D, H, M, S, MS: Word;
  b1, b2 : TSpeedButton;
begin
  Result := inherited;

  FMyForm := TfrmKUP4RS(MyForm);
  // �������������� ��������� � ���� ������ ����
  TR := TArray<Byte>(pd);

  // �������� CRC ������
  if GET_CRC(TR, PacketSize) <> TR[PacketSize - 1] then
    Exit;
  // �������� ����� ���������� � ������ �����
  if TR[0] <> $E0 + FMyForm.seNumber.Value then
    Exit;


  // �������� ����� �� ������

  case TR[1] of
    PCKT_TYPE:
      begin
  // ��������� ��������� ������� ���� ����������
        TA := TArray<Byte>.Create($E0, $81, $03, $09, $00, $00, $00);

      end;
    PCKT_WRITE_DATA:
      begin
        TA := TArray<Byte>.Create($E0, $84, $06, TR[3], TR[4], $44, $44, $D4, $01, $00);

        if FMyForm.chkPowLine.Checked then
          SetBit(TA[7], 0);                //     0 -> 1
        // ������ ��������� ������ �������
        if FMyForm.btnIn5.Down then
          ResetBit(TA[5], 6);              //     6 -> 0

        if FMyForm.btnIn6.Down then
          ResetBit(TA[5], 2);              //     2 -> 0

        if FMyForm.btnIn7.Down then
          ResetBit(TA[6], 6);              //     6 -> 0

        if FMyForm.btnIn8.Down then
          ResetBit(TA[6], 2);              //     2 -> 0
       // ������ ��������� ������ ����
        if FMyForm.btnSw1.Down then
          SetBit(TA[5], 4);                //     4 -> 1

        if FMyForm.btnSw2.Down then
          SetBit(TA[5], 0);                //     0 -> 1

        if FMyForm.btnSw3.Down then
          SetBit(TA[6], 4);                //     4 -> 1

        if FMyForm.btnSw4.Down then
          SetBit(TA[6], 0);                //     0 -> 1
        // ���������� ��������� �������������
        if FMyForm.btnIn1.Down then
          ResetBit(TA[7], 2);              //     2 -> 0

        if FMyForm.btnIn2.Down then
          ResetBit(TA[7], 4);              //     4 -> 0

        if FMyForm.btnIn3.Down then
          ResetBit(TA[7], 6);              //     6 -> 0

        if FMyForm.btnIn4.Down then
          ResetBit(TA[7], 7);              //     7 -> 0
       // ������ ������� �� ������� ������

        for i := 0 to 1 do
        begin
          if i = 0 then
          begin
            b1 := FMyForm.btnSw1;
            b2 := FMyForm.btnSw2;
          end
          else
          begin
            b1 := FMyForm.btnSw3;
            b2 := FMyForm.btnSw4;
          end;

          if (TR[3 + i] and $0D) = $01 then          // ����� 00001101
          begin
            SetBit(TA[5 + i], 0);
            b2.Down := True;
            if (TR[3 + i] and $03) = $03 then
              TWaitTime.Create(b2, FMyForm.Handle);
          end;

          if (TR[3 + i] and $0F) = $02 then          // ����� 00001111
          begin
            ResetBit(TA[5 + i], 0);
            b2.Down := False;
          end;

          if (TR[3 + i] and $D0) = $10 then          // ����� 11010000
          begin
            SetBit(TA[5 + i], 0);
            b1.Down := True;
            if (TR[3 + i] and $30) = $30 then
              TWaitTime.Create(b1, FMyForm.Handle);
          end;

          if (TR[3 + i] and $F0) = $20 then         // ����� 11110000
          begin
            ResetBit(TA[5 + i], 0);
            b1.Down := False;
          end;


        end;
        end;

        // ������ ������� ������� ������ ���� btnSW1 ����� 3 �������
        //  TWaitTime.Create(FMyForm.btnSW1, FMyForm.Handle);


    PCKT_VERSION:
      begin
        TA := TArray<Byte>.Create($E0, $8D, $02, $00, $00, $00);
        // ������ ������ ����������
        ver := FMyForm.medtVer.EditText;
        TA[3] := Fetch(ver,'.').ToInteger;
        TA[4] := ver.ToInteger;
      end

  else
    Exit;
  end;

  // ������������ ���������� ����� ���������� � ������ ����
  TA[0] := $E0 + FMyForm.seNumber.Value;

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


{ TWaitTime }

constructor TWaitTime.Create(btn: TSpeedButton; w: hwnd);
begin
  FBtn := btn;
  FHWND := W;
  inherited Create;
end;

procedure TWaitTime.Execute;
begin
  // ������������ ����� ���������� ������
  FreeOnTerminate := True;
  // ������� 3 �������
  sleep (3000);
  // ������� ��������� �� ������� ������
  PostMessage(FHWND, WM_USER + 1, Integer(FBTN), 0);
end;

procedure TfrmKUP4RS.TimerMessage(var T: TMessage);
begin
  TSpeedButton(T.WParam).Down := False;
end;

end.
