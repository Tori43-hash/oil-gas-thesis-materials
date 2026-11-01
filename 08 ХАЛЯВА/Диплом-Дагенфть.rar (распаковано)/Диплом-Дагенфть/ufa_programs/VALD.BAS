            print" Ž‘‹…„Ž‚€’…‹œ›… Ž–…„“› VALD"
             dim a(220),z(220,50),p4(220)
             Dim p5(220),b2(220),c1(220),c2(220)
             print" ‚‚…„…Œ ŠŽ‹ˆ—…‘’‚Ž ˆ’…‚€‹Ž‚ ,"
             PRINT" € ŠŽ’ŽŽ… €‡ˆ‚€…’‘Ÿ ˆ‘‘‹…„“…Œ€Ÿ —ˆ‘‹Ž‚€Ÿ Ž‘‹…„Ž‚€’…‹œŽ‘’œ N"                              
             INPUT" N="N
             INPUT" ¢¢¥¤¥¬ ®¡é¥¥ ç¨á«® ®¡ì¥ªâ®¢ N1="N1
             INPUT" ¢¢¥¤¥¬ ç¨á«® ®¡ìãªâ®¢ ¢ 1-®¬ ª« áá¥ N2="N2
             PRINT:PRINT"            (A(I),I=1,N1)"
              input "     ¢¢¥¤¨â¥ ¨¬ï ä ©«  á ¤ ­­ë¬¨==>"q$
              open q$ for input as #1
             FOR I=1 TO N1 :   input#1,a(i)
             rem prinT"A("I")=";:INPUT A(I)
             NEXT I
            print"        ======================================================================="
            print"         J Z(J,1) Z(J,2)  K(J)  K1(J) K2(J) K3(J)  CK1(J) CK2(J) DK(J)  U(J)"
            print"        ======================================================================="
             PRINT"         …‡“‹œ’€’› €‘—…’€ "
             P2=A(1):P1=P2
             FOR I=2 TO N1
              IF A(I)>P2 then P2=A(I):GOTO 2
              IF A(I)>=P1 GOTO 2
              P1=A(I)
           2 NEXT I
           3 P3=N:S1=(P2-P1)/P3:Z(1,1)=P1:Z(1,2)=P1+S1
             FOR J=2 TO N-1 :   Z(J,1)=1.0001*Z(J-1,2)
              Z(J,2)=Z(J,1)+S1  :       NEXT J
             Z(N,1)=1.0001*Z(N-1,2):Z(N,2)=P2
            FOR J=1 TO N :  P4(J)=0:P5(J)=0 :    NEXT J
            FOR I=1 TO N2
             FOR J=1 TO N : IF A(I)>Z(J,2) GOTO 4
              P4(J)=P4(J)+1:J=N
          4  NEXT J :   NEXT I :   N8=N2+1
            FOR I=N8 TO N1 :  FOR J=1 TO N :  IF A(I)>Z(J,2) GOTO 5
              P5(J)=P5(J)+1:J=N
          5  NEXT J :  NEXT I
            P=0:P6=P : FOR J=1 TO N:P6=P6+P4(J):P=P+P5(J):NEXT J
            FOR J=3 TO N+2: b2(J)=P4(J-2)/P6:a(J)=P5(J-2)/P:NEXT J
            a(N+4)=0:a(N+3)=0:a(2)=0:a(1)=0:B2(N+4)=0:B2(N+3)=0:B2(2)=0:B2(1)=0
            R=0:Z2=0:Z1=0:H2=0:H1=0 :  l=0
            FOR J=1 TO N
             C1(J)=B2(J)+2*B2(J+1)+4*B2(J+2)+2*B2(J+3):C1(J)=(C1(J)+B2(J+4))/10
             C2(J)=B3(J)+2*a(J+1)+4*a(J+2):C2(J)=(C2(J)+2*a(J+3)+a(J+4))/10
             IF C1(J)=0 OR C2(J)=0 THEN N=N-1:l=1:print"          -----------":GOTO 3
             D=4.342945*LOG(C1(J)/C2(J)):U=.5*D*(C1(J)-C2(J))
             H1=H1+B2(J+2):H2=H2+a(J+2): z1=z1+c1(j):z2=z2+c2(j):r=r+u
            W1=J:W2=Z(J,1):W3=Z(J,2):W4=P4(J):W5=P5(J):W6=B2(J+2)
            W7=a(J+2):W8=C1(J):W9=C2(J):W10=D:W11=U
            print"        "J;:print USING "####.#";W2;W3;W4,W5;
            print USING "###.###";W6;W7;W8,W9;:print USING "###.###";W10;
            print USING "##.###";W11
          12  NEXT J
            print"        ======================================================================="
            print"                    S =";
            print USING "####.#";P6;P;:print USING "###.###";H1;H2;Z1;Z2;
            print "       ";:print USING "##.###";R
            END
          
        
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
