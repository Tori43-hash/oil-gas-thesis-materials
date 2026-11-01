        PRINT"     €‘—…’ „€‚‹…ˆŸ ‚ ’Ž—Š… M ‹€‘’€ "
	PRINT"      ˆ ““ƒŽ-‚Ž„Ž€ŽŽŒ …†ˆŒ…"
	PRINT"         ˆ €Ž’… Ž„Ž‰ ‘Š‚€†ˆ›"

REM	INPUT" (¬3/áãâ) q="Q
REM	INPUT" (á§) mu="MU
REM	INPUT" (¤ àá¨) k="K
REM	INPUT" (¬) h="H
REM	INPUT" (¬) r="R
REM	INPUT"  m="M
REM        INPUT" (1/Œ ) b¦="BG
REM	INPUT" (1/Œ ) bc="BC
REM	INPUT" (£®¤ë) t="T
REM	INPUT" (Œ ) Po="Po
	DATA 30,2,.2,3,100,.16,1E-10,1.1E-10,5,12
	DATA 35,3,.25,8,120,.15,1E-10,1.3E-10,4,13
	DATA 40,4,.3,7,125,.17,1E-10,1.5E-10,3,14
	DATA 45,5,.35,6,140,.18,1E-10,1.6E-10,4,15
        DATA 50,4.5,.4,5,200,.20,1E-10,1.8E-10,6,16
        DATA 55,3,.5,10,250,.19,1E-10,2.0E-10,8,17
        DATA 55,3.5,.3,4,200,.18,1E-10,2.2E-10,7,18
        DATA 50,2.5,.25,7,250,.15,1E-10,2.4E-10,5,19
        DATA 60,4,.4,6,300,.16,1E-10,2.6E-10,6,20
        DATA 40,5,.5,8,250,.16,1E-10,2.2E-10,4,20
        DATA 35,2.5,.6,5,400,.15,1E-10,2.4E-10,3,21
	DATA 30,2,.1,9,270,.15,1E-10,2.1E-10,7,20
	PRINT"---------------------------------------------------------------"
	PRINT "  N   Q   MU     K     H   R     M      BG       BC     T  Po"	
	PRINT"    ¬3/áãâ á§  „ àá¨   ¬   ¬           1/      1/    £®¤ Œ "
        PRINT"---------------------------------------------------------------"
	for i=1 to 12
	READ Q,MU,K,H,R,M,BG,BC,T,PO	
        PRINT USING" ##";I;USING" ### ";Q;USING" #.## ";MU;K;USING" ### ";H;R;
   	PRINT USING" #.## ";M;USING" #.#^^^^ " ;BG;BC;USING" ## ";T;Po
        next i : RESTORE : INPUT" „€‹œ˜… ?-->"TT :
	PRINT:PRINT"                Ž’‚…’"
	FF$=" ###.##^^^^ "	: L=1
        PRINT "  N    b*(1/ )     KAPPA       A      -Ei(-A)  dP(Œ ) Pm(Œ )"
	print
        FOR L=1 TO 12
   	READ Q,MU,K,H,R,M,BG,BC,T,PO
        Q=Q/86400 : MU=MU/1000 : K=K/1E12 : T=T*86400*300
	BB=BG*M+BC : KAP=K/MU/(BG*M+BC)
	A=R*R/4/KAP/T : GOSUB 1 : B=S : DELP=-Q*MU/4/3.14/K/H*B/1E6
 	Pm=Po-DELP
	PRINT USING"###";L;USING FF$;BB;KAP;A;USING" ##.### ";-B;DELP;PM
	NEXT L
	STOP

   1	S=0.577216+LOG(A): II=1 : CC=1 : I=1
   2    II=II*I
	CC=(-1)*CC*A/II/I
	S=S+CC
	IF CC>=0.0001 THEN I=I+1: GOTO 2
        RETURN	

