unit HashParse;

interface

uses
  System.SysUtils, IdHashMessageDigest;

   function Hashmd5(StringHash : string) : string;
   function parsePassLog( const fValue, fDoubleVal: string):Integer;

implementation

//  ������� ��������� ���-����
//*****************************************************************************************
function Hashmd5(StringHash : string) : string;
begin
  Result := '';
  with TIdHashMessageDigest5.Create do
  try
    Result := AnsiLowerCase(HashStringAsHex(StringHash,nil));
  finally
    Free;
  end;
end;
//*****************************************************************************************

//*****************************************************************************************
//****************************** ������� ��������� ��������� ������ ***********************
function parsePassLog(const fValue, fDoubleVal: string):Integer;
begin
   Result := CompareStr(fValue, fDoubleVal);
end;
end.
