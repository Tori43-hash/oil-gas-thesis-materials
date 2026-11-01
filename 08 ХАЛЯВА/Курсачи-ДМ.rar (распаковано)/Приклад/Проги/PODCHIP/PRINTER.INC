PROCEDURE CopyToPRN(x1,y1,x2,y2:Integer; Bk1,Bk2:Word; Inverse:Boolean; Mode:Byte);
      VAR
         ScanLine:Integer;
         n1,n2:Byte;
FUNCTION ConstructByte(x,y:Integer):Byte;
   CONST Bits:array [0..7] of Byte=(128,64,32,16,8,4,2,1);
     VAR
        P:Word;
        CByte,Bit:Byte;
        YY:Integer;
BEGIN
     CByte:=0;
     For Bit:=0 to 7 do
       Begin
          YY:=y+bit;
          p:=GetPixel(x,yy);
         If (yy<=y2)and(p<>bk1)and(p<>bk2) then Inc(cbyte,bits[bit]);
       End;
    ConstructByte:=cbyte;
END;

PROCEDURE DoLine;
      VAR
         XPixel:Integer;
         PrintByte:Byte;
BEGIN
     If Mode=1 then Write(Lst,#27'L')
               else Write(Lst,#27'*',Chr(Mode));
     Write(Lst,Chr(n1),Chr(n2));
     For XPixel:=x1 to x2 do
       Begin
         PrintByte:=ConstructByte(XPixel,ScanLine);
         If Inverse then PrintByte:=not PrintByte;
         Write(Lst,Chr(PrintByte));
       End;
     Write(Lst,#10);
END;

LABEL Quit;
BEGIN
      Mode:=Mode mod 7;
     If Mode in [0,5] then Mode:=4;
     Write(Lst,#27'3'#24);
      n1:=Lo(Succ(x2-x1));
      n2:=Hi(Succ(x2-x1));
     ScanLine:=y1;
     While ScanLine<y2 do
       Begin
         If KeyPressed and (ReadKey=#27) then goto quit;
         DoLine;
         Inc(ScanLine,8);
       End;
Quit:Write(Lst,#27#2);
END;