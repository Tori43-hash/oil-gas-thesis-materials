PROCEDURE SLINE(R,X1,Y1,X2,Y2:integer);
Var
f,fv2,fn2,xv2,yv2,xn2,yn2,fv1,fn1,xv1,yv1,xn1,yn1,d:real;
q1,q2,w1,w2:integer;
label
5,6;
begin
if x1=x2 then begin f:=3*Pi/2 end else
f:=arctan((y1-y2)/(x2-x1));if x1>x2 then begin q1:=x1;q2:=x2;w1:=y1;w2:=y2;
x1:=q2;x2:=q1;y1:=w2;y2:=w1 end else begin x1:=x1;x2:=x2;y1:=y1;y2:=y2 end;
fv2:=(f-0.2);fn2:=(f+0.2);xv2:=x2-9*Cos(fv2);yv2:=y2+9*Sin(fv2);
xn2:=x2-9*Cos(fn2);yn2:=y2+9*sIN(FN2);fv1:=Pi/2-f-0.2;fn1:=Pi/2-f+0.2;
xv1:=x1+9*Sin(fv1);yv1:=y1-9*Cos(fv1);xn1:=x1+9*Sin(fn1);yn1:=y1-9*Cos(fn1);
Line(X1,y1,x2,y2);if R=1 then goto 5 else
Line(round(xv2),round(yv2),x2,y2);line(x2,y2,round(xn2),round(yn2));
if r=2 then goto 6 else
5:Line(x1,y1,round(xv1),round(yv1));Line(x1,y1,round(xn1),round(yn1));
6:end;