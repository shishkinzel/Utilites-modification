unit HashParse;

interface

uses
  System.SysUtils, IdHashMessageDigest;

   function Hashmd5(StringHash : string) : string;
   function parsePassLog( const fValue, fDoubleVal: string):Integer;

implementation

//  функция получение хеш-кода
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
//****************************** Функция сравнения строковых данных ***********************
function parsePassLog(const fValue, fDoubleVal: string):Integer;
begin
   Result := CompareStr(fValue, fDoubleVal);
end;
end.
