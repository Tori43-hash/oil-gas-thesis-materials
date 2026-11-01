program practica_renm;
VAR
   RE,rol,M,W,H,E,Q,MU,G,V,L,ROP,PU,PG,PX,PRAV,LEV,LEV1,PZAB,PZAB1,PZAB0:REAL;
   GP,T,C,A1,A2,Pagr,RON,A,V_PR,P_UST,L_TR,N0,MUL,ROPES,K_TR,K_PR,K,D:REAL;
   N,POTERY,LYAMBDA,Qagr:real;
   f1:text;

   PROCEDURE PZABOY(Q,V,MU:REAL);
   BEGIN
   PRAV:=5.25*SQR(E)*Q*MU/(SQR(1-SQR(MU))*SQR(PG)*PG*V);
   PZAB1:=PG/1.07;
   PZAB0:=0;
   REPEAT
      LEV1:=PZAB1/PG*SQR(PZAB1/PG-1)*(PZAB1/PG-1);
      IF LEV1<PRAV THEN PZAB1:=PZAB1*2;
	 UNTIL LEV1>PRAV;
   REPEAT
      PZAB:=(PZAB1+PZAB0)/2;write(pzab);
      LEV:=PZAB/PG*SQR(PZAB/PG-1)*(PZAB/PG-1);
      IF LEV>PRAV THEN
         BEGIN
            PZAB1:=PZAB;
         END
                   ELSE
                      BEGIN
                         PZAB0:=PZAB;
                      END;
   UNTIL ABS(LEV-PRAV)<1E-10;
   END;
BEGIN
   assign(f1,'prf');
   rewrite(f1);
   write(' Œ®¤ã«ì ã¯àã£®áâ¨ ¯®à®¤ (Œ ) E=10^4 -->');
   readln(E);
   E:=E*1e6;
   write(' ®à¨áâ®áâì ¯¥áª  ¢ âà¥é¨­¥ ¯®á«¥ ¥¥ § ªëâ¨ï M=0.22-0.30 -->');
   readln(M);
   write(' ‘®¤¥à¦ ­¨¥ ¯¥áª  (ª£/¬^3) Gp=');
   readln(Gp);
   write(' «®â­®áâì ª¢ àæ¥¢®£® ¯¥áª  (ª£/¬^3) RoPes=');
   readln(RoPes);
   write(' ’¥¬¯ § ª çª¨ á¬¥á¨ («/á) Q=');
   readln(Q);
   write(' à®­¨æ ¥¬®áâì ª®««¥ªâ®à  (¬ª¬^2) K=');
   readln(K);
   write(' „¨ ¬¥âà íªá¯«ã â æ¨®­­®© ª®«®­­ë (¬) D=');
   readln(D);
   write(' «®â­®áâì ­¥äâ¨ (ª£/¬^3) Ron=');
   readln(Ron);
   write(' Ž¡ê¥¬ ¦¨¤ª®áâ¨ ¢ âà¥é¨­¥  (¬) V=');
   readln(V);
   write(' ‚ï§ª®áâì ­¥äâ¨ (¬ *á) Mu=');
   readln(Mu);
   write(' ƒ«ã¡¨­  áª¢ ¦¨­ë (¬) L=');
   readln(L);
   write(' Š®íää¨æ¨¥­â ã áá®­   Pu=');
   readln(Pu);
   write(' ‘à¥¤­ïï â®«é¨­  ¯« áâ  H (¬) H=');
   readln(H);
   write(' «®â­®áâì £®p­ëå ¯®p®¤ (ª£/¬^3) Rop=');
   readln(Rop);

 (*  E:=1E+10;
   M:=0.3;
   GP:=250;
   Pagr:=36E6;
   ROPES:=2500;
   Q:=11.6E-3;
   K:=0.25*1E-12;
   D:=0.062;
   RON:=950;
   V:=9;
   WRITELN(Q);
   MU:=0.150;
   L:=1600;
   ROP:=2650;
   H:=16;
   PU:=0.25;
   Mp=1*)

   if Q=6 then Pagr:=70;
   if Q=8.3 then Pagr:=51;
   if Q=11.6 then Pagr:=36;
   if Q=14.6 then Pagr:=29;

   G:=9.8;
   PG:=ROP*G*L;
   PX:=PG*PU/(1-PU);
   IF PX>PG THEN WRITELN('    ’…™ˆ€ ‚…’ˆŠ€‹œ€Ÿ');
   WRITELN(f1,'   ’…™ˆ€ ƒŽˆ‡Ž’€‹œ€Ÿ');
   PZABOY(1,1,MU);
   WRITELN(f1,'  ƒŽŽ… „€‚‹…ˆ… P£.= ',PG/1E6:2:3,' Œ ');
   WRITELN(f1,'  ‡€Ž‰Ž… „€‚‹…ˆ… Ž‘‹… ‡€Š€—Šˆ 1Œ3 €‚Ž P§ ¡.= ',PZAB/1E6:2:2,' Œ ');
   L_TR:=SQRT(E/(5.6*sqr(1-SQR(PU))*H*(PZAB-PX)));
   WRITELN(f1,'  „‹ˆ€ ’…™ˆ› Ž‘‹… ‡€Š€—Šˆ 1Œ3 L= ',L_TR:4:2,' Œ');
   W:=4*(1-SQR(PU))*(PZAB-PX)*L_TR/E;
   WRITELN(f1,'  ˜ˆˆ€ ’…™ˆ› Ž‘‹… ‡€Š€—Šˆ 1Œ3 W= ',W:2:4,' Œ');
   N0:=GP/(ROPES*(GP/ROPES+1));
   WRITELN(f1,'  Žš…Œ€Ÿ „Ž‹Ÿ …‘Š€ ‚ †-’ˆ …‘ŠŽŽ‘ˆ’…‹… No= ',N0:1:3);
   MUL:=MU*EXP(3.18*N0);
   WRITELN(f1,'  ‚Ÿ‡ŠŽ‘’œ †-’ˆ …‘ŠŽŽ‘ˆ’…‹Ÿ MUG= ',MUL:2:4,'  *á');
   PZABOY(Q,V,MUL);
   WRITELN(f1,'  ‡€Ž‰Ž… „€‚‹…ˆ… Ž‘‹… ŠŽ–€ ‡€Š€—Šˆ €‚Ž P§ ¡.= ',PZAB/1E6:2:2,' Œ ');
   L_TR:=SQRT(E*V/(5.6*sqr(1-SQR(PU))*H*(PZAB-PX)));
   WRITELN(f1,'  „‹ˆ€ ’…™ˆ› ŽŠŽ—€’…‹œ€Ÿ L= ',L_TR:4:2,' Œ');
   W:=4*(1-SQR(PU))*(PZAB-PX)*L_TR/E;
   WRITELN(f1,'  ˜ˆˆ€ ’…™ˆ› ŽŠŽ—€’…‹œ€Ÿ W= ',W:2:4,' Œ');
   K_TR:=SQR(W*N0/(1-M))/12;
   WRITELN(f1,'  Žˆ–€…ŒŽ‘’œ ’…™ˆ› Kâ.= ',K_TR*1e6:1:6,' ¬ª¬2');
   K_PR:=((PI*D-SQRT(12*K_TR))*K+K_TR*SQRT(12*K_TR))/(PI*D);
   WRITELN(f1,'  ‘…„ŸŸ Žˆ–€…ŒŽ‘’œ ‹€‘’€ Ž‘‹… Ž€Ž’Šˆ K¯.= ',K_PR:2:3,' ¬ª¬2');
   ROL:=RON*(1-N0)+ROPES*N0;
   writeln(f1,'  ‹Ž’Ž‘’œ †- Ro¦=',rol:4:1);
   RE:=4*Q*ROL/PI/D/MUL;
   LYAMBDA:=64/RE;
   writeln(f1,'  LYAMBDA=',lyambda);
   A:=1;
   IF RE>200 THEN
      BEGIN
         C:=Gp/(Gp+ROpes);
	 WRITELN(f1,'  Žš…ŒŽ… ‘Ž„…†€ˆ… …‘Š€ ‚ †-’ˆ …‘ŠŽŽ‘ˆ’…‹… C= ',C:1:3);
         IF (C>0.05) AND (C<0.1) THEN
            BEGIN
              A1:=0.457*LN(RE)/LN(10)-0.04;
              A2:=0.68*LN(RE)/LN(10)-0.484;
              A:=A1+(A2-A1)/0.05*(C-0.05);
            END;
         IF (C>0.1) AND (C<0.15) THEN
            BEGIN
              A1:=0.68*LN(RE)/LN(10)-0.484;
              A2:=0.688*LN(RE)/LN(10)-0.409;
              A:=A1+(A2-A1)/0.05*(C-0.05);
            END;
         IF (C>0.15) AND (C<0.2) THEN
            BEGIN
              A1:=0.688*LN(RE)/LN(10)-0.409;
              A2:=0.618*LN(RE)/LN(10)-0.175;
              A:=A1+(A2-A1)/0.05*(C-0.05);
            END;
      END;
   WRITELN(f1,'  —ˆ‘‹Ž …‰Ž‹œ„‘€ RE= ',RE:3:2);
   WRITELN(f1,'  ŠŽ””ˆ–ˆ…’ € €‚… ',A:2:2);
	 POTERY:=A*LYAMBDA*16*SQR(Q)*L*ROL/(2*PI*SQR(SQR(D))*D)/1e6;
	 WRITELN(f1,'  Ž’…ˆ € ’…ˆ… Pâà.= ',POTERY/1e6:2:3,' Œ ');
	 P_UST:=PZAB+POTERY-ROL*G*L;
	 WRITELN(f1,'  „€‚‹…ˆ… € “‘’œ… Pãáâ.= ',P_UST/1E6:2:3,' Œ ');
   N:=P_UST/(Pagr*0.7)/1e6+1;
   WRITELN(f1,'  …Ž•Ž„ˆŒŽ… —ˆ‘‹Ž €ƒ…ƒ€’Ž‚ N= ',trunc(N)+1:3);
   V_PR:=PI*SQR(D)*L/4;
   WRITELN(f1,'  Žš…Œ Ž„€‚Ž—Ž‰ †ˆ„ŠŽ‘’ˆ V¯à.= ',V_PR:4:3,' Œ3');
   T:=(V+V_PR)/Q;
   WRITELN(f1,'  Ž„Ž‹†ˆ’…‹œŽ‘’œ €ƒ…’€ˆŸ Ž„ˆŒ €ƒ…ƒ€’ŽŒ T= ',T/60:2:3,' Œˆ');
   close(f1);
END.