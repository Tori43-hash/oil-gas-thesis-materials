
PROCEDURE GrInit;
VAR
  GraphDriver : Integer;
  GraphMode   : Integer;
  ErrorCode   : Integer;
BEGIN
  GraphDriver := 9;GraphMode:=2;
  InitGraph(GraphDriver,GraphMode,'');
  ErrorCode :=GraphResult;
  if ErrorCode <> grOk then
   begin
    WriteLn('ошибка графики:',GraphErrorMsg(ErrorCode));
    WriteLn('Программа остановлена.' );
    Halt( 1 )
   end {if}
END;

