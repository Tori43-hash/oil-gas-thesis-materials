  rem ¬ο δ ©«  ANOMALNE.BAS
5 REM ƒ„„€—…‘… €‘—…’› ”‹’€– €€‹›• …”’…‰
  REM    α®αβ Ά¨«  αβ. ƒ-90-01 ƒ ΅¤γ««¨­  ‘.M.
10 INPUT " ‚‡‘’ …€‡“…‰ ‘’“’“› M0="M0
   INPUT " ‚‡‘’ …„…‹€‡“…‰ ‘’“’“› M1="M1
   INPUT " ƒ€„…’ „€—…‘ƒ „€‚‹… ‘„‚ƒ€ H="H
   INPUT " ƒ€„…’ „€‚‹… / ‘’“’“› Hm="Hm
   INPUT " –€…‘’ K="K
   INPUT " €„“‘ ’“€ ’€  RK="RK
   INPUT " €„“‘ ‘‚€†› RC="RC
   INPUT " €—€‹… ‡€—…… 1="K1
   INPUT " …—… ‡€—…… ="M
   INPUT " €ƒ ‹="L
20 NM=M1/(2*3.14*K*HM)
30 NG=M0/(2*3.14*K*H)
40 N=((HM-H)*M0+(M0-M1)*H)/(HM-H)
   Z=(M0-M1)/(HM-H)
53 FOR QH=K1 TO M STEP L
70 E=QH/(2*3.14*K)
80 RM=NM*QH
90 RG=NG*QH
100 F=M1*LOG(RM/Rc)
110 L=M0*LOG(RK/RG)
120 X=N*LOG((Z*E+RG)/(Z*E+RM))
125 U=N*LOG((Z*E+RK)/(Z*E+RM))
126 IF RG<RK THEN GOTO 152
127 P=E*(F+U)
150 PRINT " RM,RG,QH,P=";USING" ##.#####^^^^";RM;RG;QH;P
151 GOTO 154
152 P=E*(F+L+X)
153 PRINT "RM,RG,QH,P=";USING" ##.####^^^^";RM;RG;QH;P
154 NEXT  QH
160 END

