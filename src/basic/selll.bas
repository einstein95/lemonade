0  REM  PROGRAM:      SELLL
1  REM  LAST UPDATE:  7/7/80
2  REM 
3  REM   AUTHOR:  BOB JAMISON
4  REM   ASSOCIATED PROGRAMS AND FILES:  NONE
5  REM   DOCUMENTATION AVAILABLE FROM MECC UNDER NAME: SELL
10  REM   PROGRAM 3 OF A 4 PROGRAM "SELL" SERIES FOR ELEMENTARY
20  REM   STUDENTS DEVELOPED BY BOB JAMISON, ALEXANDRIA, MN.
30  REM   FOR MECC, UNDER THE MECC-UNIVAC MINI-GRANT PROGRAM.  
40  REM   THIS IS AN ECONOMICS SIMULATION/GAME WHERE STUDENTS  
50  REM   LEARN TO MANAGE AN IMAGINARY BUSINESS. THE MAIN EMPHASIS
60  REM   OF THIS PROGRAM IS TO LET STUDENTS INVESTIGATE THE CONCEPTS
70  REM   OF PRODUCTION, ADVERTISING AND PRICING AND HOW THESE RELATE
80  REM   TO THE PROFIT A BUSINESS MAKES. THIS PROGRAM IS INTENDED
90  REM   TO BE AN INTRODUCTION TO "MARKET" OR "SELL BICYCLES" IN
100  REM   WHICH THE COMPETITION BETWEEN COMPANIES IS INTRODUCED.
130  NORMAL : TEXT : HOME : SPEED= 255
135  DIM A(30),L(30),G(30),H(30),B(30),S(30),P(30)
140  REM   INITIALIZING VARIABLES
150 P9 = 10: REM   'BEST PRICE' FOR SELLING LEMONADE
160 S3 = .15: REM   EACH ADVERTISING SIGN COST 15 CENTS
170 S2 = 30: REM   NUMBER SOLD AT 'BEST PRICE ' AND NO ADVERTISING
175 A2 = 2.00: REM   ALL STANDS ARE GIVEN TWO DOLLARS IN ASSETS
180 SP = 100: REM    SPEED FOR SLOW PRINTING (LINES 890, ...) 
194 C9 = .5: REM   INCREASE TO INCREASE THE EFFECTS OF FIRST SIGNS
195 C2 = 1: REM   INCREASE TO RAISE THE LIMITS OF THE NUMBER SOLD
200  DEF  FN LNGTH(X) =  LEN ( STR$ (X))
202  TEXT : HOME : SPEED= 255: NORMAL 
203  VTAB (5): HTAB (11): PRINT "THE LEMONADE STAND"
209  VTAB 10: PRINT "DO YOU NEED INSTRUCTIONS? ";
220  CALL  - 868: INPUT "";Y$
230  IF  MID$ (Y$,1,1) = "N" THEN 500
231  IF  MID$ (Y$,1,1) = "Y" THEN 240
232  PRINT : PRINT "PLEASE ANSWER YES OR NO."
233  GOTO 209
240  HOME : PRINT 
250  PRINT "     IN THIS COMPUTER SIMULATION YOU"
253  PRINT 
255  PRINT "WILL MAKE DECISIONS THAT ARE SIMILAR"
258  PRINT 
260  PRINT "TO THOSE YOU MIGHT MAKE IN RUNNING A"
263  PRINT 
265  PRINT "REAL LEMONADE STAND.  YOU HAVE AN"
268  PRINT 
270  PRINT "IMAGINARY LEMONADE STAND IN A TOWN WE"
273  PRINT 
275  PRINT "WILL CALL 'LEMONSVILLE, MINNESOTA'."
290  PRINT : PRINT "YOU MAY RUN THIS SIMULATION WITH AS"
295  PRINT : PRINT "MANY STANDS AS YOU WISH, HOWEVER, WHAT"
300  PRINT : PRINT "ONE STAND DOES HAS NO EFFECT ON THE"
310  PRINT : PRINT "OTHER LEMONADE STANDS."
314  GOSUB 35000: HOME 
320  PRINT : PRINT "EACH DAY, YOU MUST DECIDE:"
325  PRINT : PRINT "(1)  HOW MUCH LEMONADE TO MAKE,"
330  PRINT : PRINT "(2)  HOW MANY ADVERTISING SIGNS TO MAKE"
335  PRINT : HTAB (6): PRINT "(15 CENTS EACH), AND,"
340  PRINT : PRINT "(3)  HOW MUCH TO CHARGE FOR YOUR"
345  PRINT : HTAB (6): PRINT "LEMONADE."
350  PRINT : PRINT "TRY TO MANAGE YOUR LEMONADE STAND"
360  PRINT : PRINT "EFFICIENTLY SO AS TO MAKE THE "
361  PRINT : PRINT "GREATEST POSSIBLE PROFITS.": GOSUB 35000: HOME 
500  HOME : VTAB 8: PRINT "ARE YOU": PRINT : PRINT "   1) STARTING A NEW SESSION, OR": PRINT : PRINT "   2) CONTINUING AN OLD SESSION"
501  VTAB 14: PRINT "(ENTER 1 OR 2) ?";: CALL  - 868:ZM = 23: GOSUB 40000: IF ZN <  > 1 AND ZN <  > 2 THEN 501
502 B = ZN
519  HOME : VTAB (5)
520  PRINT "HOW MANY LEMONADE STANDS ARE THERE? ";
530  GOSUB 40000:N = ZN
531  VTAB (6): POKE 34,6
532  IF N = 0 THEN  PRINT : PRINT "OOPS!  TRY AGAIN.": GOTO 520
534  IF N < 1 OR N > 10 THEN  PRINT : PRINT "THIS PROGRAM ONLY WORKS WITH": PRINT "1 TO 10 STANDS.  TRY AGAIN.": GOTO 520
535  HOME : POKE 34,0: VTAB (5): PRINT "HOW MANY LEMONADE STANDS ARE THERE? ";N;"   "
536  FOR I = 1 TO N
537 A(I) = A2
538  NEXT I
540  IF B = 1 THEN 690
550  REM   INPUT VALUES FROM THE PREVIOUS RUN
560  PRINT : PRINT "LAST DAY WAS DAY NUMBER";
570  INPUT D
572  IF D <  = 0 THEN  PRINT : PRINT "DON'T BE RIDICULOUS": GOTO 560
580  FOR I = 1 TO N
590  PRINT : PRINT "ASSETS FOR LEMONADE STAND #";I
595  PRINT : PRINT "AFTER DAY ";D;" WERE ($)";
600  INPUT A(I)
602  IF A(I) < 0 THEN  PRINT : PRINT "DON'T BE RIDICULOUS": GOTO 590
605 B(I) = 0
610  NEXT I
620  GOTO 705
690  PRINT : PRINT : PRINT "'ASSETS' ARE WHAT YOUR COMPANY IS WORTH."
692  PRINT "EACH STAND STARTS OUT WITH $";A2;" IN"
696  PRINT : PRINT "ASSETS, AND YOU CAN NOT SPEND MORE THAN"
697  PRINT : PRINT "THE ASSETS YOU HAVE AT ANY TIME."
698  GOSUB 35000: HOME 
705 D = D + 1
720  IF D > 2 THEN 740
721 C = 2
730  GOTO 782
740  IF D > 7 THEN 743
741 C = 4
742  GOTO 780
743 C = 5
780  REM 
782 C1 = C * .01
785 R1 = 1
790  REM   INPUT VALUES
800  IF D > 2 THEN 2000: REM   AFTER 2 DAYS RANDOM EVENTS CAN HAPPEN
802  GOTO 807
805 Q =  PEEK (37): IF Q = 0 THEN 807
806  GOSUB 35000: HOME 
807  FOR I = 1 TO N
810 G(I) = 1
820 H(I) = 0
830  HOME : PRINT "DAY ";D;":  YOUR COST FOR MAKING LEMONADE"
835  HTAB 8 +  LEN ( STR$ (D)): PRINT "IS ";C;" CENTS PER GLASS."
840  PRINT 
850  VTAB 6: PRINT "LEMONADE STAND #";I
855  IF A(I) < C1 THEN B(I) = 1
860  IF B(I) = 0 THEN 890
865  PRINT : PRINT "YOU DO NOT HAVE ENOUGH MONEY TO STAY IN"
870  PRINT : PRINT "BUSINESS.  YOU ARE BANKRUPT.  THERE ARE"
875  PRINT : PRINT "NO DECISIONS FOR YOU TO MAKE."
878  GOSUB 35000: HOME 
880  GOTO 1030
890  SPEED= SP: VTAB 6:ZD = A(I): GOSUB 45000:L1 =  LEN (ZD$): HTAB 30 - L1: PRINT "$";ZD$;"  ASSETS": SPEED= 255
891  VTAB 24: HTAB 10: PRINT "(TYPE 'END' TO STOP)";: HTAB 1
892  VTAB 8: POKE 33,21: PRINT "HOW MANY GLASSES OF  LEMONADE DO YOU WISH TO MAKE? ";: POKE 33,40
895  GOSUB 40000:L(I) = ZN
901  IF L(I) >  = 0 AND L(I) <  = 1000 THEN 905
902  VTAB 21: HTAB 1: PRINT "PLEASE BE REASONABLE.": GOSUB 35000: VTAB 8: CALL  - 958: GOTO 891
905  IF L(I) <  >  INT (L(I)) THEN 902
906  SPEED= SP:ZD = L(I) * C1: GOSUB 45000: VTAB 7: HTAB 30 - L1 - ( LEN (ZD$) > L1) * ( LEN (ZD$) - L1): PRINT "-";: HTAB 31 -  LEN (ZD$): PRINT ZD$;"  LEMONADE"
907  VTAB 8: HTAB 31 - L1: PRINT  LEFT$ ("-------",L1)
908 ZD = A(I) - L(I) * C1: GOSUB 45000: VTAB 9: HTAB 30 -  LEN (ZD$): PRINT "$";ZD$
909  SPEED= 255
910  IF L(I) * C1 <  = A(I) THEN L1 =  LEN (ZD$): VTAB 13: CALL  - 958: GOTO 950
915  REM 
920  VTAB 21: PRINT "I DON'T THINK YOU CAN AFFORD THAT MANY."
931  GOSUB 35000: VTAB 7: CALL  - 958: GOTO 891
950  POKE 33,21: VTAB 13: PRINT "HOW MANY ADVERTISING SIGNS (";S3 * 100;" CENTS EACH)": VTAB 15: HTAB 1: PRINT "DO YOU WANT? ";: CALL  - 868: POKE 33,40
952  GOSUB 40000:S(I) = ZN
961  IF S(I) >  = 0 AND S(I) <  = 50 THEN 965
962  VTAB 21: PRINT "PLEASE BE REASONABLE.": GOSUB 35000: VTAB 21: CALL  - 868: GOTO 950
965  IF S(I) <  >  INT (S(I)) THEN 962
966  SPEED= SP:ZD = S3 * S(I): GOSUB 45000: VTAB 10: HTAB 30 - L1 - ( LEN (ZD$) > L1) * ( LEN (ZD$) - L1): PRINT "-";: HTAB 31 -  LEN (ZD$): PRINT ZD$;"  SIGNS"
967  VTAB 11: HTAB 31 - L1: PRINT  LEFT$ ("-------",L1)
968 ZD = A(I) - L(I) * C1 - S(I) * S3: GOSUB 45000: VTAB 12: HTAB 30 -  LEN (ZD$): PRINT "$";ZD$;"  BALANCE"
969  SPEED= 255
970  IF A(I) - L(I) * C1 - S(I) * S3 >  - .001 THEN 1010
980  VTAB 21: PRINT "SORRY, BUT YOU CAN'T AFFORD THAT MANY.": GOSUB 35000: POKE 33,19: POKE 32,21: VTAB 10: PRINT : VTAB 10: HTAB 1: CALL  - 958: POKE 32,0: POKE 33,40: VTAB 21: HTAB 1: CALL  - 868: GOTO 950
1010  VTAB (18): PRINT "WHAT PRICE (IN CENTS) DO YOU WISH TO"
1012  PRINT "CHARGE FOR LEMONADE? ";
1013  CALL  - 868: GOSUB 40000:P(I) = ZN
1020  IF P(I) >  = 0 AND P(I) <  = 100 THEN 1024
1021  VTAB 22: PRINT "PLEASE BE SERIOUS.": GOSUB 35000: VTAB 18: CALL  - 958: GOTO 1010
1024  IF P(I) <  >  INT (P(I)) THEN 1021
1025  GOTO 1050
1030  NEXT I
1040  GOTO 1100
1050  VTAB 22: PRINT "DO YOU WANT TO CHANGE": PRINT "ANYTHING (YES OR NO) ?";: CALL  - 868: INPUT "";Y$:Y$ =  LEFT$ (Y$,1): IF Y$ <  > "Y" AND Y$ <  > "N" THEN 1050
1060  IF Y$ = "N" THEN 1030
1070  TEXT : VTAB 7: CALL  - 958: GOTO 810
1100  REM   PRINT OUT  
1101  HOME : IF R = 2 THEN 2290
1103  IF R = 3 THEN 2350
1105  FOR Z2 = 1 TO  INT (N - 1) / 3 + 1
1120  HOME 
1130  PRINT  TAB( 10);"DAILY FINANCIAL REPORT": PRINT  TAB( 12);"FOR 'LEMONSVILLE'"
1140  PRINT  TAB( 18);"DAY ";D
1150  PRINT : PRINT : PRINT "STAND  GLASSES   SIGNS    PRICE  GLASSES        MADE             (CENTS)  SOLD"
1170  VTAB 15: PRINT "STAND  INCOME  EXPENSES  PROFIT  ASSETS         TODAY"
1180  REM   CALCULATE NUMBER OF GLASSES SOLD, PROFIT ETC.
1181  IF R = 3 THEN 2365
1185  FOR Z3 = 1 TO 3
1186 I = (Z2 - 1) * 3 + Z3: IF I > N THEN 1392
1187  IF R2 = 2 THEN 1260
1190  IF P(I) >  = P9 THEN 1220
1200 N1 = (P9 - P(I)) / P9 * .8 * S2 + S2
1210  GOTO 1230
1220 N1 = (P9 ^ 2 * S2 / P(I) ^ 2): REM    NUMBER SOLD IF P(I)>=0.P.
1230 N2 = R1 * (N1 + N1 * (1 -  EXP ( - S(I) * C9) * C2))
1240 N2 =  INT (N2 * G(I)): REM   CORRECTION FACTOR IF SOME SALES ARE LOST.
1250  IF N2 <  = L(I) THEN 1270: REM   IS SALES >=PRODUCTION
1260 N2 = L(I)
1270 M =  INT (.001 + (N2 * P(I))) / 100: REM   INCOME
1271 ZD = M: GOSUB 45000:M$ = ZD$: IF M < 1 AND M >  = 0 THEN M$ = "0" + M$
1280 E =  INT ((S(I) * S3 + L(I) * C1) * 100) / 100
1281 ZD = E: GOSUB 45000:E$ = ZD$: IF E < 1 AND E >  = 0 THEN E$ = "0" + E$
1290 P1 =  INT (100 * (M - E) + .5) / 100: REM    PROFIT
1291 ZD = P1: GOSUB 45000:P$ = ZD$: IF P1 < 1 AND P1 >  = 0 THEN P$ = "0" + P$
1300 A(I) =  INT (100 * (A(I) + P1)) / 100: REM   ASSETS
1301 ZD = A(I): GOSUB 45000:A$ = ZD$: IF A(I) < 1 AND A(I) >  = 0 THEN A$ = "0" + A$
1310  IF H(I) = 1 THEN 2300
1320  PRINT 
1321  IF B(I) <  > 1 THEN 1330
1326  VTAB (7 + 2 * Z3): PRINT  TAB( 3);I;"   ***BANKRUPT***": VTAB (16 + 2 * Z3): PRINT  TAB( 3);I
1327  GOTO 1390
1330  VTAB 7 + 2 * Z3: PRINT  TAB( 4 -  FN LNGTH(I));I; TAB( 12 -  FN LNGTH(L(I)));L(I); TAB( 21 -  FN LNGTH(S(I)));S(I); TAB( 30 -  FN LNGTH(P(I)));P(I); TAB( 38 -  FN LNGTH(N2));N2
1334  VTAB 16 + 2 * Z3: PRINT  TAB( 4 -  FN LNGTH(I));I; TAB( 13 -  LEN (M$));"$";M$; TAB( 22 -  LEN (E$));"$";E$; TAB( 31 -  LEN (P$));"$";P$; TAB( 39 -  LEN (A$));"$";A$
1390  NEXT Z3
1392  GOSUB 35000: HOME : NEXT Z2
1393 Q = 0: FOR I = 1 TO N:Q = Q + B(I): NEXT I: IF Q <  > N THEN 1397
1394  VTAB (5): PRINT "ALL YOUR STANDS ARE BANKRUPT.  IF I"
1395  PRINT : PRINT "WERE YOU, I'D GIVE UP SELLING LEMONADE."
1396  GOTO 1500
1397 R1 = 1
1398 R2 = 0
1400  IF D <  > 2 THEN 1450
1410  PRINT : PRINT "YOUR MOTHER QUIT GIVING YOU FREE SUGAR."
1420  PRINT : PRINT "YOUR COST IS NOW 4 CENTS FOR EACH GLASS"
1430  PRINT : PRINT "YOU MAKE."
1450  IF D <  > 7 THEN 1480
1460  PRINT : PRINT "INFLATION CAUSES YOUR LEMONADE MIX TO"
1470  PRINT : PRINT "GO UP.  YOUR COST IS NOW 5 CENTS PER"
1475  PRINT : PRINT "GLASS."
1480  GOTO 705
1500  VTAB 24: PRINT "PRESS SPACE BAR TO CONTINUE";: GET A$: TEXT : HOME : SPEED= 255: NORMAL : GOTO 43000
2000  REM   RANDOM EVENTS
2010 X =  INT (6 *  RND (1)) + 1
2020  ON X GOTO 2100,2200,2300,2400,805,805
2100  IF X1 = 1 THEN 805
2110  PRINT : PRINT "THERE IS A 50% CHANCE OF RAIN TODAY,"
2115  PRINT : PRINT "AND THE WEATHER IS COOL."
2120 R1 = .5
2130 X1 = 1
2140  GOTO 805
2200  IF X2 = 1 THEN 805
2210  PRINT : PRINT "THE STREET DEPARTMENT IS WORKING ON"
2220  PRINT : PRINT "YOUR STREET TODAY, SO THERE WILL BE"
2225  PRINT : PRINT "NO TRAFFIC ON YOUR STREET."
2230  IF  RND ( - 1) < .5 THEN 2233
2231 R2 = 2
2232  GOTO 2250
2233 R1 = .1
2250 X2 = 1
2260  GOTO 805
2290  PRINT : PRINT "THE STREET CREW COMES TO YOUR STAND"
2295  PRINT : PRINT "AT LUNCHTIME AND BUYS ALL THE "
2296  PRINT : PRINT "LEMONADE YOU HAD MADE.": VTAB 24: PRINT "PRESS SPACE BAR TO CONTINUE";: GET A$
2297  GOTO 1105
2300  IF X3 = 1 THEN 805
2310 X3 = 1
2320 R3 = 3
2340  GOTO 805
2350  PRINT : PRINT "A SEVERE THUNDERSTORM HITS YOUR TOWN"
2355  PRINT : PRINT "JUST AS YOU SET UP YOUR STANDS."
2360  PRINT : PRINT "YOUR LEMONADE AND SIGNS ARE RUINED."
2361  VTAB 24: PRINT "PRESS SPACE BAR TO CONTINUE";: GET A$
2362  HOME 
2363  GOTO 1105
2365 R3 = 0
2370  FOR J = 1 TO N
2371 G(J) = 0
2372  NEXT J
2380  GOTO 1320
2400  IF X4 = 1 THEN 805
2410 X4 = 1
2430  PRINT : PRINT "A HEAT WAVE IS PREDICTED FOR TODAY."
2440 R1 = 2
2450  GOTO 805
3000  END 
20300  REM    ENTER STATEMENT
20310  REM    ENTRY CONDITIONS  - ZT= # OF SECONDS TO ALLOW
20320  REM    EXIT - ZA$=INPUT, ZC= # OF SECONDS IT TOOK, (ZC=-256 IF WENT OVER TIME LIMIT)
20340 ZT = ZT * 60
20350 ZZ$ = "":ZC = 0: POKE  - 16368,0
20360 ZC = ZC + 1: IF ZC > ZT THEN ZC =  - 15104: GOTO 20470
20370  IF  PEEK ( - 16384) < 128 THEN 20360
20380 ZZ =  PEEK ( - 16384) - 128: IF ZZ = 13 THEN 20470
20390  IF ZZ <  > 8 THEN 20460
20400  IF  LEN (ZZ$) = 0 THEN 20440
20410  IF  LEN (ZZ$) = 1 THEN 20450
20420 ZZ$ =  LEFT$ (ZZ$, LEN (ZZ$) - 1)
20430  HTAB  POS (0): PRINT " ";: HTAB  POS (0): POKE  - 16368,0: GOTO 20360
20440  POKE  - 16368,0: GOTO 20360
20450 ZZ$ = "": GOTO 20430
20460 ZZ$ = ZZ$ +  CHR$ (ZZ): PRINT  CHR$ (ZZ);: POKE  - 16368,0:ZC = ZC + 2: GOTO 20360
20470  PRINT  CHR$ (13);:ZC = ZC / 59:ZA$ = ZZ$
20480  POKE  - 16368,0: RETURN 
35000  REM  SPACE BAR
35010  VTAB 24: CALL  - 868: POKE  - 16368,0: HTAB 7: PRINT "PRESS ";: INVERSE : PRINT "SPACE BAR";: NORMAL : PRINT " TO CONTINUE";
35020  WAIT  - 16384,128: POKE  - 16368,0: HTAB 1: CALL  - 868: RETURN 
40000 CH =  PEEK (36):CV =  PEEK (37)
40001  INPUT "";ZN$: IF  LEN (ZN$) <  >  LEN ( STR$ ( VAL (ZN$))) THEN 40003
40002  IF  VAL (ZN$) <  > 0 OR ZN$ = "0" THEN 40006
40003  IF  LEFT$ (ZN$,1) = "E" THEN  TEXT : HOME : GOTO 43050
40004  VTAB ZM: PRINT "THAT IS NOT A NUMBER - TRY AGAIN";: GOSUB 40010: GOTO 40001
40006  VTAB ZM: CALL  - 868: VTAB CV + 1 + (CV < 23):ZN =  VAL (ZN$): RETURN 
40010  VTAB CV + 1: POKE 36,CH: CALL  - 868: RETURN 
43000  REM    END OF PROGRAM 
43010  TEXT : HOME 
43020  VTAB 10: PRINT "DO YOU WANT TO TRY"
43030  VTAB 12: CALL  - 868: INPUT "AGAIN (YES OR NO) ?";R$:R$ =  LEFT$ (R$,1): IF R$ <  > "Y" AND R$ <  > "N" THEN 43030
43040  HOME : IF R$ = "Y" THEN  HGR : HCOLOR= 3: SCALE= 1: ROT= 0: GOTO 1000
43050  IF  PEEK (1023) <  > 123 THEN  END 
43055 D$ =  CHR$ (13) +  CHR$ (4)
43060  PRINT D$;"RUN HELLO"
45000  REM   DOLLAR FIXER
45001 ZD =  INT (ZD * 100 + .5) / 100:ZD$ =  STR$ (ZD)
45002  FOR ZE = 1 TO  LEN (ZD$)
45003  IF  MID$ (ZD$,ZE,1) = "." THEN 45006
45004  NEXT ZE
45005 ZD$ = ZD$ + ".00": GOTO 45010
45006  IF ZE + 2 =  LEN (ZD$) THEN 45010
45007 ZD$ = ZD$ + "0"
45010  RETURN 
50000 CH =  PEEK (36):CV =  PEEK (37): RETURN 
50001  VTAB CV + 1: POKE 36,CH: CALL  - 868: RETURN 
50002  POKE 34,ZC - 1: VTAB ZC: HOME : POKE 34,0: VTAB CV + 2: RETURN 
