   REM €‘—…’ €€…’‚ ƒ„…‘‘’“‰‰ …”€–
  DATA 1368,1650,.146,.073,.062,6,.0045,20E6,2700,1000,100,.82,22,.425,2E6,.675
  DATA .035,550E6,1.5,9.5,3.5E6,.0055,26,55,.4184,200E6
  READ  CKB,H,D,DH,DB,N,D0,P1,RP,RB,C0,K,I,R,G1,B,E,G2,A,QT,P2,A1,PU,L,FS,E1
  GOTO 1
  input" N CKB  = "CKB
  input" ƒ‹“€ H= "H
  input" „€…’ ‘. ‹› D= "D
  input" „€. ’ DH= "DH
  input" „€. ’ ‚“’. DB= " DB
  input" —‘‹ €‘€„ N= " N
  input" „€…’ ’‚…‘’ €‘€„ D0= "D0
  input" ……€„ „€‚‹… ‚ €‘€„€• P1= " P1
  input" ‹’‘’ ƒ‰ „› RP= "RP
  input" ‹’‘’ ‚„› RB= "RB
  input" €‘‘‚€ –…’€– …‘€ C0= "C0
  input" ””. K= "K
  input" ””. I= "I
  input" ””. R= "R
  input" ””. ““ƒ‘’ …’€‹‹€ G1= "G1
  input" ””. B= "B
  input" ””. ƒ„€‚‹. ‘’‚‹… E= "E
  input" ””. ’…“—…‘’ G2= "G2
  input" ‡€€‘ —‘’ A= "A
  input" ‚…‘ ƒƒ …’€ ’ QT= "QT
  input" ’… „€‚‹. ‚ „… P2= "P2
  input" ’‹™€ ‘’… ’ A1= "A1
  input" „€‚‹. € “‘’… PU= "PU
  input" „‹€ …‡› ’ L= "L
  input" ‹™€„ ……—ƒ ‘…—… FS= "FS
  input" „“‹ ““ƒ‘’ E1= "E1
1  PI=3.14 : G=9.8
  F=PI*D0/4
  C=C0/(C0+RP)
  RCM=C*(RP-RB)
  Q=N*K*F*10*SQR(20*G*P1/RCM)
  V1=PI*D^2*H/4
  V=2.3*V1
  M=1.3*V*C0
  L1=I*K*R*D0*SQR(20*P1/G1*B)
  P3=8.1*E*RCM*10^(-3)*(Q*10^(-3))^2*H/DB*10^(-2)^5
  P4=0.05*P3
  P=P1+P2+P3+P4
  G3=0.5*G2
  PBH=2*A1*G3/DB
  G4=PI*(DH^2-DB^2)*G2/4
  L2=G4/(A*QT*G)
  FK=PI*(DH^2-DB^2)/4
  M1=QT*H/2-P4*FS+FK*(PU-P3/2)
  L3=M1*H/(E1*FK)
  PRINT" ‘‚ N-->"CKB
  PRINT" €‘•„ €—…‰ †„‘’ Q= "Q"(α¬^3/α)"
  PRINT" … ‚„› V= "V"(¬^3)"
  PRINT" €‘‘€ …‘€ M= "M"(ª£)"
  PRINT" ƒ‹“€ ‚… L1= "L1"(¬)"
  PRINT" ’… „€‚‹… P= "P"( )"
  PRINT" ‚“’. „€‚‹. PBH="PBH"( )"
  PRINT" €‘. „‹€ „‚…‘ L2="L2"(¬)"
  PRINT" “„‹…… ’ L3="L3"(¬)"
  STOP








sts:in{noiεYvuyqεI{l:inoj:TY:_tlshutwtn:l{hs{xv(Ψεεεε6Dx[xuo