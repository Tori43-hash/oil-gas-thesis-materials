rem " €’€ ‚„  …’„“ •…€"
PRINT "‚‚…„’… —‘‹ ’—… ‚„ N"
INPUT "N= ";N
DIM P(N),T(N),L(N)
PRINT "‚‚…„’… …‡“‹’€’› ‘›’€, ‚… T ‚ α¥ª, „€‚‹……  ‚  "
FOR I=1 TO N
INPUT " T(I)= ";T(I)
INPUT " P(I)= ";P(I)
NEXT I
PRINT "‚‚…„’… ‚… ’€ ’ ‚ α¥ª"
INPUT " TP= ";TP
PRINT "‚‚…„’… ‘…„‰ „…’ Q ‚ ¬3/αγβ."
INPUT " Q= ";Q
PRINT "‚‚…„’… „€‚‹…… ‚ €—€‹… ’€ ­ ‚  "
INPUT " P­= ";PN
PRINT "‚‚…„’… „€‚‹…… ‚ –… ’€ ª ‚  "
INPUT " Pª= ";PK
S1=0:S2=0:S3=0:S4=0
FOR I =1 TO N
L(I)=LOG((TP+T(I))/T(I))
S1=S1+L(I)
S2=S2+L(I)^2
S3=S3+P(I)*L(I)
S4=S4+P(I)
NEXT I
P0=(S2*S4-S1*S3)/(S1^2-N*S2)
M=(N*S3-S4*S1)/(S1^2-N^2)
E=0.183*Q/N
S=1.151*((P0-PK)/M-LOG(TP/60-2.63))
DP=0.87*S*M
PR=Q/(P0-(PN+PK)/2)
PRINT "P0= "P0;"M= "M;"E= "E
PRINT "S= "S;"PR= "PR;"DP= "DP
END