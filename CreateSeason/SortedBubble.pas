unit SortedBubble;

interface

uses
      System.SysUtils;
function CompareStringFromDigital(const FirstString, SecondString : string) : Integer;
procedure BubbleStr(var SArray : array of string);
implementation

//***********FUNCTION*****************FUNCTION*******************************************
// функци€ сравнени€ двух строк  по цифрам содержащимс€ в них

function CompareStringFromDigital(const FirstString, SecondString : string) : Integer;
var
  FS, SS : String;
  iSt, jSt : String;
  iD, jD : Integer;
  i      : Integer;

 begin
  FS := FirstString;
  SS := SecondString;
  iSt := '';
  jSt := '';
  for i := 1 to Length(FS) do
    begin
	  if (FS[i] in ['0'..'9']) then
	   iSt := iSt + FS[i];
    end;
	iD := StrToInt(iSt);
  for i := 1 to Length(SS) do
    begin
	  if (SS[i] in ['0'..'9']) then
	   jSt := jSt + SS[i];
    end;
	jD := StrToInt(jSt);
  if iD > jD then
     Result := 0
  else
     Result := -1;
 end;
//*************************************************************************************


//***********PROCEDURE********************PROCEDURE************************************
//*************************************************************************************
// пузырькова€ сортировка массива строк
procedure BubbleStr(var SArray : array of string);
var
  i, j : integer;   // счетчик циклов
  N    : integer;   // максимальный индекс массива
  Rtmp : string ;   // переменна€, используема€ при перестановках
  noswap: boolean;  // значение true показывает, что при проходе не было перестановок
begin
  N := High(SArray);
	for i := 0 to N -1 do
	  begin
			noswap := true;
			for j := N-1 downto i do
				if CompareStringFromDigital(SArray[j], SArray[j + 1]) = 0 then
					begin
					// перестановка элементов SArray[j] и SArray[j + 1]
						Rtmp := SArray[j + 1];
					  SArray[j + 1] := SArray[j];
					  SArray[j] := Rtmp;
						noswap := false;
					end;
				if (noswap) then
				exit;
		end;
end;
//*************************************************************************************
end.
