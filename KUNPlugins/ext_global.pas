unit ext_global;

interface

const
  PCKT_TYPE = $01;
  PCKT_WRITE_TIME = $02;
  PCKT_READ_TIME = $03;
  PCKT_WRITE_DATA = $04;
  PCKT_CURRENT = $05;
  PCKT_OPER = $09;
  PCKT_VERSION = $0D;


// ���������� CRC ��� ������� ������
function GET_CRC (TA : TArray<Byte>; Len : Integer) : Byte;

// ���������� CRC � �������� � �����
procedure CRC (TA : TArray<Byte>;Len : Integer);
// ��������� ����
procedure SetBit(var Src: Byte; bit: Integer);
// ����� ����
procedure ResetBit(var Src : Byte; bit: Integer);

implementation

function GET_CRC (TA : TArray<Byte>;Len : Integer) : Byte;
var
 B : Byte;
 I : Integer;
begin
 B := 0;
 for i := 0 to Len - 2 do
  B := B + TA[i];
 Result := $100-B;
end;

procedure CRC (TA : TArray<Byte>;Len : Integer);
begin
 TA[Len-1] := GET_CRC(TA,Len);
end;


procedure SetBit(var Src : Byte; bit: Integer);
begin
  Src := Src or (1 shl bit);
end;

procedure ResetBit(var Src : Byte; bit: Integer);
begin
  Src := Src and not (1 shl Bit);
end;
end.

