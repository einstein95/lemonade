 10  REM SELL LEMONADE.P2
 20  REM SK RUSSELL
 30  REM (C)MECC1984
 40  REM 84/12/10SKR
 55  LOMEM: 36300: & APP,"COMMON.LIB"
 60  GOSUB 41000: & AFT,2: & CST,61967: & HSP,2,1
 65  DIM TM(2),TS(2),TP(2),CA(2),CA$(2),DE$(6),DS$(3),D$(6),NM$(3),GL(2),SI(2),EX(2),NG(2),PR(3),IN(2),PF(2),B1$(2),B2$(2),DS(2),FF$(9,2),WE$(3),CR(3),D(3),A%(4),B%(4),C%(4),D%(4),E%(6),S$(1),WI(3),WX(3),LO(2)
 70 HC = 6:OD = 53248:SS$(1) = "":SS$(0) = "es":S$(0) = "s":S$(1) = "":AF = 2.5:K1 = .05:K2 = .15:PS = .25:LP$ = "LEMON.PCK":FL$ = "LEMON.SEQ"
 80 UL = 99.99:D1 = 1:LO$ = "LSTAND.PCK": HCOLOR= 7: FOR L = 0 TO 3: READ WE$(L),CR(L),D(L),WI(L),WX(L): NEXT : FOR L = 0 TO 2: READ B%(L),D%(L): NEXT : FOR L = 0 TO 4: READ A%(L),C%(L): NEXT : FOR L = 0 TO 6: READ E%(L): NEXT 
 90  FOR L = 1 TO 6: READ DE$(L):D$(L) = DE$(L): NEXT : POKE 919,1: GOTO 1000
 100  GOSUB 900: HCOLOR= 6: FOR L1 = 0 TO 2: HPLOT 0,0 + L1 TO 279,0 + L1: HPLOT 0,20 + L1 TO 279,20 + L1: HPLOT 0,176 + L1 TO 279,176 + L1: NEXT : & CO,0,8: PRINT NM$(L)"'s BALANCE SHEET"CC$: & BOX,Z,28,279,166,3: RETURN 
 110  INVERSE : & CO,Z1,50: PRINT "cash": & CO,Z2,50: PRINT CA$(L): NORMAL : RETURN 
 120  INVERSE : & CO,Z1,60: PRINT "lemonade -": & CO,Z2,60: PRINT CG$: & CO,Z2,68: PRINT "_______": NORMAL : RETURN 
 130  INVERSE : & CO,Z2,80: PRINT B1$(L): NORMAL : GOSUB 29000: RETURN 
 140  INVERSE : & CO,Z1,110: PRINT "signs    - ": & CO,Z2,110: PRINT CS$: & CO,Z2,118: PRINT "_______": NORMAL : RETURN 
 150  INVERSE : & CO,Z1,130: PRINT "balance": & CO,Z2,130: PRINT B2$(L): NORMAL : GOSUB 29000: GOSUB 900: RETURN 
 160  & IMAGE,15,X,Y: & BOX,X + 3,Y + 14,X + 26,Y + 24,4:Z = (CO < .1): & CO,X + 5 + 4 * Z,Y + 16: PRINT CP$ MID$ ( STR$ (CO) + "0",2 + Z,2 - Z)"}"CQ$: RETURN 
 170  & HSP,1: & IMAGE,16,X,Y: & CO,X + 6,Y + 5: PRINT CP$ MID$ ( STR$ (PS),2,2)"}"CQ$: RETURN 
 200  & DFT,7,OD: & BOX,0,0,70,88,6: & BOX,70,0,90,52,6: & BOX,90,0,206,42,6: & BOX,206,0,279,52,6: & BOX,228,52,279,88,6: & BOX,0,0,279,191,29
 220  & IMAGE,5,3,2: & TAKE,28,50,63,100,50000: & PAUSE,6: & IMAGE,6,77,19: & PAUSE,6: & CLIP: & CLIP,0,0,0,279,191
 230  FOR L2 = 1 TO 2: & IMAGE,9,28,50: & PAUSE,6: & PUT,28,50,50000: & PAUSE,4: NEXT : & IMAGE,20,0,0,128: & PAUSE,6: RETURN 
 250  & DFT,7,OD: & UIM,12,AD: & DFT,7,AD:Z = 0: FOR L1 = 1 TO 14: & IMAGE,1,6,41 + Z * 2: & IMAGE,1,78,49 + Z * 2: & IMAGE,1,142,49 + Z * 2: & IMAGE,1,226,41 + Z * 2:Z =  NOT Z: & PAUSE,3: NEXT : RETURN 
 260 X1 = 0:X2 = 125:Y1 = 55 + 9 * TH:Y2 = 130: GOSUB 28000: IF TH THEN  PRINT "Several thirsty construction workers visited your stand today.": RETURN 
 270  PRINT "The road construction hurt your sales by blocking the traffic on your street.": RETURN 
 280  PRINT CA$;: & GCP,ZX,ZY: & CO,ZX - 2,ZY: RETURN 
 290  PRINT CA$;: & GCP,ZX,ZY: & CO,ZX,ZY - 4: RETURN 
 300  IF L < 36 THEN  & IMAGE,1,X - 126,5: & IMAGE,1,X,2:X = X + 8: GOTO 349
 330  & IMAGE,1,X - 126,5: & IMAGE,1,X,2: & IMAGE,1,X1,2:X = X + 8:X1 = X1 + 8
 349  RETURN 
 350 M = M + .06: & IMAGE,1,X,Y:X = X + 4:Y = Y + M: RETURN 
 450 LB =  LEN (B$):Z = 0: FOR L1 = LB TO 1 STEP  - 1:Z = L1 * ( MID$ (B$,LB - (L1 - 1),1) = ".") + Z: NEXT : IF Z = 0 THEN B$ = B$ + ".00"
 470  IF Z = 2 THEN B$ = B$ + "0"
 490  RETURN 
 500 V =  INT ((V * 100) + .5):V$ = "":A$ =  STR$ ( ABS (V)): IF V < 100 THEN A$ = "0" + A$
 520 SG$ =  MID$ (" -",(1 + ( SGN (V) =  - 1)),1):V$ = SG$ +  STR$ ( INT ( ABS (V / 100))) + "." +  RIGHT$ (A$,2):V$ = "   " + V$:V$ = "$" +  RIGHT$ (V$,6):V = V / 100: RETURN 
 550  HPLOT B1 - (2 * (PY > 8)),E1 + PY TO B2 + (2 * (PY > 8)),E1 + PY:PY = PY + 1: IF E1 + PY = 122 THEN  HCOLOR= 4
 560  IF E1 + PY = 125 THEN MT = 1:E1 = 111:B1 = 126:B2 = 140:PY = 1: HCOLOR= 6
 599  RETURN 
 600  & DFT,7,OD: & BOX,115,95,161,121,6: & BOX,115,122,159,126,4: & CLIP,5,0,122,0,130,36218: IF MT < 10 THEN  & IMAGE,11,119,B:B = B - 6
 630  IF MT >  = 5 THEN  & CLIP,5,110,122,170,130,36218: & IMAGE,10,114,93:MT =  - 1:B = 121
 640  & DFT,7,AD: RETURN 
 650 KI =  INT ( RND (1) * 4) + 21: & IMAGE,KI,168,102 - (KI = 23) - (2 * (KI = 21)): RETURN 
 660  FOR L = 0 TO 2: HPLOT X1 + L,Y1 + L TO X2 - L,Y1 + L TO X2 - L,Y2 - L TO X1 + L,Y2 - L TO X1 + L,Y1 + L: NEXT : HPLOT X1 + 3,Y1 TO X1 + 3,Y2: HPLOT X2 - 3,Y1 TO X2 - 3,Y2
 670  FOR L1 = 1 TO ST: FOR L = 0 TO 3: HPLOT X2 - L1 * 66 - L,Y1 TO X2 - L1 * 66 - L,Y2: NEXT : NEXT : RETURN 
 680  PRINT CO$: & WIND,X0,Y3 + 9,X3: & CO: & PUT,X1,Y1,AD: RETURN 
 700  HCOLOR= HC: FOR L1 = 0 TO 4: HPLOT 1 + L1,4 - L1 TO 279 - L1,4 - L1 TO 279 - L1,177 + L1 TO 1 + L1,177 + L1 TO 1 + L1,4 - L1: NEXT : & WIND,10,10,270,181: RETURN 
 750  IF ( NOT HI(L1)) THEN  GOSUB 33000: & DUN,LO$:X1 = 28:X2 = 251:Y1 = 4:Y2 = 42: GOSUB 28000: PRINT "Congratulations, "NM$(L1)"  You are a lemonade tycoon!": GOSUB 650: & IMAGE,18,147,125: GOSUB 29000:HI(L1) = 1: & PUT,X1,Y1,AD
 760  RETURN 
 800  IF ( NOT LO(L)) THEN  GOSUB 33000: & DUN,LO$: GOSUB 650:X1 = 28:X2 = 251:Y1 = 10:Y2 = 48: GOSUB 28000: PRINT NM$(L)"'s "DS$(L)" Lemonade stand has gone out of business.": GOSUB 29000:LO(L) = 1
 810  RETURN 
 850  & CLIP: & CLIP,0,0,0,279,42: & CLIPA,1,43,52,A%: & CLIPA,2,53,82,C%: & CLIP,3,110,98,170,121: & CLIPA,4,150,191,B%,36178: & CLIPA,6,83,97,E%,36258: RETURN 
 900  & AFT,2: PRINT CA$CL$CO$: & WIND: & CO: HCOLOR= 7: RETURN 
 950 LA =  LEN (NM$(L)): IF  MID$ (NM$(L),LA,1) = " " THEN NM$(L) =  MID$ (NM$(L),1,LA - 1): GOTO 950
 999  RETURN 
 1000  GOSUB 20000: GOSUB 9000:X1 = 7:Y1 = 10:X2 = 271:Y2 = 30: GOSUB 28000: PRINT "You are now open for business.": GOSUB 29000: FOR WK = 1 TO 1: FOR DY = D1 TO 5: GOSUB 6000:WK = 0: IF (BR + TY = ST) THEN DY = 5:WK = 1: POKE 902,1
 1100  NEXT : IF (BR + TY) <  > ST THEN  GOSUB 7000:W1 = W1 + 1
 1200  NEXT : GOTO 25600
 6000 DA = (W1 - 1) * 5 + DY:CO = .05 + (.01 * ( INT ((DA - 1) / 10))) + ((DA > 3) * .05):X1 = 100:X2 = 251:Y1 = 20:Y2 = 160: IF DA = 4 THEN  GOSUB 25000: PRINT CN$"Your parents stopped giving you free sugar. Your cost is now 10 cents for each glass.": GOSUB 29000
 6200  IF (DA - 1) / 10 =  INT ((DA - 1) / 10) AND DA > 10 THEN  GOSUB 25000: PRINT CN$"The cost of sugar has gone up.  Your cost is now "CO * 100" cents for each glass.": GOSUB 29000
 6250 WF =  INT (4 *  RND (1)):RC = ( RND (1) < .1):CR =  INT ( RND (1) * (CR(WF) / 10 + 1)):CR = CR / 10
 6280 BR = 0: FOR L = 0 TO ST - 1: GOSUB 900: IF (CA(L) + .005) < CO OR LO(L) THEN  GOSUB 800: GOTO 6790
 6290  IF CA(L) > UL THEN 6790
 6300  & HSP,2: PRINT CQ$NM$(L)"'s "DS$(L)" Lemonade"CC$: PRINT "DAY "DA;CC$: FOR L1 = 0 TO 2: HPLOT 0,20 + L1 TO 279,20 + L1: HPLOT 0,92 + L1 TO 279,92 + L1: NEXT 
 6310  & BOX,0,23,119,91,6 + (20 * (WF = 0)):Y = 23 + ((WF = 2) * 15) - (WF = 0):Z$ = "a " +  STR$ (CR * 100) + "%": IF CR = 0 THEN Z$ = "no"
 6350  & IMAGE,WI(WF),WX(WF) - 12,Y: & WIND,136,29,279: & CO: & HSP,1: PRINT "Weather Forecast:": PRINT : PRINT WE$(WF)" with "Z$" chance of rain": IF RC THEN  PRINT : PRINT "Road construction"
 6400  & WIND,38,103,279: FOR L1 = 1 TO 1: FOR L2 = 1 TO 1: & BOX,0,95,279,191: FOR Z = 0 TO 2: HPLOT 0,172 + Z TO 279,172 + Z: NEXT :V = CA(L): & CO: PRINT "Cash on hand: "CA$(L):X = 1:Y = 99: GOSUB 160
 6450  & HSP,1: VTAB 3: PRINT "How many glasses will you make? ";: & INP,(2,"-09"),ZN$:GL(L) =  VAL (ZN$):V = V - GL(L) * CO: GOSUB 500:EX(L) = GL(L) * CO: GOSUB 16000: IF L2 = 0 THEN 6600
 6500 X = X - 1:Y = Y + 40: GOSUB 170: VTAB 5: PRINT "How many signs will you make? ";: & INP,(2,"-09"),ZN$:SI(L) =  VAL (ZN$):EX(L) = SI(L) * PS + GL(L) * CO:V = V - SI(L) * PS: GOSUB 500: GOSUB 16000
 6600  NEXT : & HSP,1: VTAB 7: HTAB 31: PRINT "}": VTAB 7: PRINT "What price will you charge? ";: & INP,(2,"-09",1),PR$:PR(L) =  VAL (PR$) / 100: & CO,0,181: PRINT "Do you want to make any changes? ";: GOSUB 30100: IF Z$ = "Y" THEN L1 = 0
 6700  NEXT : & HSP,2: IF DA < 3 THEN  GOSUB 11000
 6750  IF DA > 2 THEN  GOSUB 12000
 6790 BR = BR + LO(L): NEXT : IF (BR + TY) = ST THEN 6999
 6800  PRINT CQ$: GOSUB 22000: FOR L = 0 TO ST - 1: IF HI(L) OR LO(L) THEN 6950
 6850 AS = (1 -  EXP ( - K2 * SI(L))):NG(L) =  INT (D *  EXP ( - K1 * (PR(L) * 100)) * (1 + AF * AS)): IF NG(L) > GL(L) THEN NG(L) = GL(L)
 6900 NG = NG + NG(L):GL = GL + GL(L):IN(L) = (NG(L) * PR(L)):PF(L) = IN(L) - EX(L):CA(L) = CA(L) + PF(L):TM(L) = TM(L) + GL(L):TS(L) = TS(L) + NG(L):TP(L) = TP(L) + PF(L)
 6950  NEXT : GOSUB 13000:TY = 0: FOR L1 = 0 TO ST - 1: IF CA(L1) > UL THEN  GOSUB 750:TY = TY + 1
 6990  NEXT : GOSUB 14000:NG = 0:GL = 0:OC = 0
 6999  RETURN 
 7000  FOR L = 0 TO ST - 1: GOSUB 900: GOSUB 700: & BOX,29,42,251,43,6: & HSP,2: & CO: PRINT "SALES REPORT FOR WEEK "W1;CC$: PRINT NM$(L)"'s"CC$: PRINT DS$(L)" Lemonade"CC$: FOR L1 = 1 TO 5: & IMAGE,15,40 * L1 + 1,138: NEXT 
 7100  IF HI(L) THEN  VTAB 10: PRINT "Tycoon"CC$: GOTO 7200
 7110  IF LO(L) THEN  VTAB 10: PRINT "Bankrupt"CC$: GOTO 7200
 7120  & WIND,30,55,279: & CO: & VSP,12: PRINT "Total glasses made"CA$;: & CO,247 - (8 * ((TM(L) > 9) + (TM(L) > 99))): PRINT TM(L): PRINT "Total glasses sold"CA$;: & CO,247 - (8 * ((TS(L) > 9) + (TS(L) > 99))): PRINT TS(L)
 7160  PRINT "Total weekly profit"CA$;:V = TP(L): GOSUB 500:TP$(L) = V$: & CO,200: PRINT TP$(L)
 7180  PRINT "Total cash on hand"CA$;: & CO,200: PRINT CA$(L)
 7200 TM(L) = 0:TS(L) = 0:TP(L) = 0: & VSP,1: GOSUB 30000: GOSUB 900: NEXT 
 7400  GOSUB 33000: & DUN,LP$:D1 = 1:X1 = 49:X2 = 244:Y1 = 80:Y2 = 118: GOSUB 28000: & CO: PRINT "Do you want to sell lemonade for another week? ";: GOSUB 30100: & PUT,X1,Y1,AD: IF Z$ = "N" THEN WK = 1
 7999  RETURN 
 8000 FG = 1:FW(0) = DA:FS(0) = ST: FOR L1 = 0 TO ST - 1:NM$(L1) =  LEFT$ (NM$(L1) + "         ",12):FF$(0,L1) =  STR$ (DS(L1)) + NM$(L1) + CA$(L1): NEXT : GOSUB 23000: RETURN 
 9000 W1 =  INT (FW(0) / 5) + 1:D1 = FW(0) - ((W1 - 1) * 5):ST = FS(0):DA = (W1 - 1) * 5 + D1
 9100  FOR L = 0 TO ST - 1:NM$(L) =  MID$ (FF$(0,L),2,12): GOSUB 950:DS(L) =  INT ( VAL ( LEFT$ (FF$(0,L),1))):DS$(L) = D$(DS(L)):CA$(L) =  MID$ (FF$(0,L),14):CA(L) =  VAL ( MID$ (FF$(0,L),15)): NEXT 
 9200  RETURN 
 11000 Z = 148: GOSUB 100:Z1 = 155:Z2 = 224: & HSP,1: & WIND,0,30,140,174: & CO:B$ =  STR$ (CA(L)): GOSUB 450: PRINT "You have $ "B$" in cash on hand.": GOSUB 110: GOSUB 29000: GOSUB 21000
 11300  VTAB 4: PRINT "You made "GL(L)" glass"SS$(GL(L) = 1)" of lemonade.  Each glass costs $ "CO" to make.": PRINT : PRINT GL(L)" X $ "CO" = "CG$: GOSUB 120
 11400  VTAB 10: PRINT : & CEW: PRINT "How much money do you have left? ": PRINT "$ ";: & INP,(6,"-09.",1),ZN$:ZN =  VAL (ZN$): IF ((ZN = B1(L) * 10) OR (ZN = B1(L) * 100)) AND (B1(L) <  > 0) THEN  PRINT : PRINT "Don't forget the decimal point.": GOSUB 30000: GOTO 11400
 11500 B$ =  STR$ (B1(L)): GOSUB 450: IF ZN$ <  > B$ THEN  PRINT : PRINT "Oops, it's "B1$(L)"."
 11700  GOSUB 130: PRINT : & BOX: & CO: PRINT "You made "SI(L)" sign"S$(SI(L) = 1)".  Each sign costs "PS * 100" cents.": PRINT : PRINT "$ "PS" X "SI(L)" = "CS$: GOSUB 140
 11800  VTAB 9: PRINT : & CEW: PRINT "How much do you have left now?": PRINT "$ ";: & INP,(6,"-09.",1),ZN$:ZN =  VAL (ZN$): IF ((ZN = B2(L) * 10) OR (ZN = B2(L) * 100)) AND (B2(L) <  > 0) THEN  PRINT : PRINT "Don't forget the decimal point.": GOSUB 30000: GOTO 11800
 11850 B$ =  STR$ (B2(L)): GOSUB 450: IF ZN$ <  > B$ THEN  PRINT : PRINT "Oops, it's "B2$(L)"."
 11900  GOSUB 150: & HSP,2: RETURN 
 12000 Z = 117: GOSUB 100:Z1 = 130:Z2 = 210: GOSUB 110:X = 17:Y = 51: GOSUB 160: & HSP,2: & CO,X + 35,Y + 14: PRINT " X "GL(L): GOSUB 21000
 12100  GOSUB 120: GOSUB 130:X = 16:Y = 110: GOSUB 170: & HSP,2: & CO,X + 36,Y + 5: PRINT " X "SI(L): GOSUB 140: GOSUB 150: PRINT CQ$: RETURN 
 13000  GOSUB 900: HCOLOR= 6: GOSUB 33000: & DUN,LO$: GOSUB 650: & CO,98,148: INVERSE : PRINT CN$"DAY"CO$: & CO,120,147: PRINT DA:L = 0:X = 69:Y = 43:I = 1: IF ST > 1 THEN L = 3:NM$(3) = "Everyone":DS$(3) = "Best"
 13100  IF ST = 1 THEN  & CO,165,147: INVERSE : PRINT  MID$ ( STR$ (PR(L)) + "00",2 + (1 * (PR(L) < .1)),1 + (1 * (PR(L) > .09)))"}": NORMAL 
 13200  GOSUB 17000:EA = 1: ON WE GOSUB 25200,25300,25400:MT = 0:B1 = 125:B2 = 138:E1 = 111:PY = 1:B = 121: GOSUB 850: IF RC THEN  & IMAGE,7,0,150
 13300 HF = NG / (GL + 1):IC = (HF < 1.5) + (HF < .75) + (HF < .5) + (HF < .25) + (EA * (HF < .01)): & UIM,WI(WE),AD: & DFT,7,AD: FOR L = 1 TO EA: IF WE <  > 0 THEN 13500
 13400  & BOX,0,0,279,191,29: FOR L2 = 0 TO 2: & IMAGE,1,L2 * 110 - (2 * (L2 = 1)),0: NEXT : IF D = 0 THEN  GOSUB 250:L = EA: GOTO 13800
 13450  FOR L2 = 0 TO 35: & MSA,0,2 AT 0,0 TO 279,40: & PAUSE,2: NEXT 
 13500  IF WE <  > 0 THEN  ON WE GOSUB 300,350,350: IF CR AND L =  INT (FD * EA) THEN  GOSUB 200:L = EA: GOTO 13800
 13600  IF MT = 0 AND OC = IC THEN  GOSUB 550:OC = 0
 13700  IF MT > 0 THEN  GOSUB 600:MT = MT + 1:OC = 0
 13800 OC = OC + 1: NEXT : IF RC AND  NOT CR THEN  GOSUB 260
 13900  GOSUB 29000: & CLIP: & CLIP,0,0,0,279,191: & DFT,7,OD: RETURN 
 14000  GOSUB 900: & BOX,50,0,229,10,3: INVERSE : & CO,0,2: PRINT CQ$"SALES REPORT, DAY "DA;CC$: NORMAL : HCOLOR= 1:X1 = 99 - 33 * ST:X2 = 279 - X1:Y0 = 13:Y1 = Y0:Y2 = 70: GOSUB 660:X = X2 - 66 * ST: HPLOT X,Y1 + 11 TO X2,Y1 + 11
 14100 Y1 = 73:Y2 = 155: HCOLOR= 6: GOSUB 660: & HSP,1: FOR L = 0 TO ST - 1: & WIND,X + L * 66,Y0 + 5,X + 64 + L * 66,Y0 + 14: & CO: PRINT CN$ LEFT$ (NM$(L), LEN (NM$(L)) - 3)CC$: NEXT : PRINT CO$
 14500  & VSP,4: & WIND,X1 + 9,Y0 + 12: & CO: PRINT CQ$"glasses": GOSUB 290: PRINT "  made": PRINT "signs made": PRINT "price"
 14600  & GCP,ZX,ZY:Y3 = ZY + 9: & WIND,ZX,Y3: & CO: PRINT CP$"glasses": GOSUB 290: PRINT "  sold": PRINT "income": PRINT "expenses": PRINT "profit": PRINT "cash": GOSUB 290: PRINT "  on hand"
 14700  FOR L = 0 TO ST - 1:V = CA(L): GOSUB 500:CA(L) = V:CA$(L) = V$:Z = 2 * LO(L):X0 = X + 8 + L * 66 - Z:X3 = X0 + 54 + Z: & WIND,X0,Y0 + 20,X3: & CO: PRINT CQ$;: IF LO(L) THEN  PRINT "Bankrupt": GOTO 14999
 14750  IF HI(L) THEN  PRINT "Tycoon": GOTO 14999
 14800 V = IN(L): GOSUB 500:IN(L) = V:IN$ = V$:V = EX(L): GOSUB 500:EX(L) = V:EX$ = V$:V = PF(L): GOSUB 500:PF(L) = V:PF$ = V$
 14900  HTAB 7 - (GL(L) > 9) - (GL(L) > 99): GOSUB 280: PRINT GL(L): HTAB 7 - (SI(L) > 9): GOSUB 280: PRINT SI(L):V = PR(L): GOSUB 500: PRINT V$: & WIND,X0,Y3 + 9,X3: & CO: & BOX,X0,Y3 + 9,X0 + 49,Y3 + 60,4: HTAB 7 - (NG(L) > 9) - (NG(L) > 99): GOSUB 280: PRINT CP$NG(L)
 14950  IF SR < (3 + (1 * (ST = 2))) THEN  GOSUB 15000: GOTO 14999
 14980  PRINT IN$: PRINT EX$: PRINT PF$: PRINT : GOSUB 290: PRINT CA$(L)
 14999  GOSUB 30000: NEXT : & VSP,1: PRINT CQ$: GOSUB 900: RETURN 
 15000 SR = SR + 1:X1 = 28:Y1 = 158:X2 = 249:Y2 = 174: GOSUB 28000: PRINT CN$"Income = Price X Glasses Sold": GOSUB 30000: GOSUB 680: VTAB 2: PRINT IN$:X1 = 28:X2 = 249:Y2 = 180: GOSUB 28000
 15100  PRINT CN$"Expenses = Advertising Costs": PRINT "           + Cost of Lemonade": GOSUB 30000: GOSUB 680: VTAB 3: PRINT EX$:X1 = 28:X2 = 249:Y2 = 174: GOSUB 28000: PRINT CN$"Profit = Income - Expenses"
 15200  GOSUB 30000: GOSUB 680: VTAB 4: PRINT PF$:X1 = 0:X2 = 279: GOSUB 28000: PRINT CN$"Cash on Hand = Old Cash on Hand + Profit": GOSUB 30000: GOSUB 680: VTAB 5: PRINT : GOSUB 290: PRINT CA$(L): RETURN 
 16000  & CO: & CEL: PRINT "Cash on hand: "V$: IF  VAL ( STR$ (CA(L))) <  VAL ( STR$ (EX(L))) THEN  & CO,0,171: & CEL: PRINT "Sorry, you can't afford that.":L2 = 0: GOSUB 30000
 16999  & HSP,2: RETURN 
 17000  INVERSE : & WIND,X + 25,Y * I + 5,X + 135,Y * I + 15: & CO: PRINT CN$NM$(L)"'S"CC$: & WIND,X + 42,Y * I + 21,X + 112,Y * I + 40: & CO: PRINT DS$(L)CC$: PRINT "Lemonade"CC$CO$: NORMAL : & WIND: RETURN 
 20000  GOSUB 33000: PRINT D$"OPEN"FL$: PRINT D$"READ"FL$: INPUT FG: IF FG > 0 THEN  FOR L1 = 0 TO FG - 1: INPUT FW(L1): INPUT FS(L1): FOR L2 = 0 TO FS(L1) - 1: INPUT FF$(L1,L2): NEXT : NEXT 
 20400  PRINT D$"CLOSE": RETURN 
 21000 V = CO * GL(L): GOSUB 500:CG = V:CG$ = V$:V = CA(L) - CG: GOSUB 500:B1(L) = V:B1$(L) = V$
 21300 V = (PS * SI(L)): GOSUB 500:CS = V:CS$ = V$:V = B1(L) - CS: GOSUB 500:B2(L) = V:B2$(L) = V$: RETURN 
 22000 WE = WF - ( RND (1) < .1) + ( RND (1) < .1):WE = WE + 3 * (WE =  - 1) - 3 * (WE = 4):CR = (CR >  RND (1)):D = D(WE) * (1 + DA / 15): IF CR AND WE = 0 THEN D = 0
 22300  IF CR AND WE > 0 THEN FD =  RND (1):D = D * FD
 22400  IF RC THEN D = D / 5:TH = ( RND (1) < .6) AND  NOT CR: IF TH THEN D = D + 5 * D(WE)
 22999  RETURN 
 23000  GOSUB 33000: PRINT : PRINT D$"OPEN"FL$: PRINT D$"WRITE"FL$: PRINT FG: FOR L1 = 0 TO FG - 1: PRINT FW(L1): PRINT FS(L1): FOR L2 = 0 TO FS(L1) - 1: PRINT FF$(L1,L2): NEXT : NEXT : PRINT D$"CLOSE": RETURN 
 25000  GOSUB 900: & BOX,0,0,279,191,3: & IMAGE,14,0,35: GOSUB 28000: & AFT,1: RETURN 
 25110  RETURN 
 25200 X =  - 97:X1 =  - 97:EA = 40: RETURN 
 25300 X =  - 45:Y = 40:M =  - 2.5:EA = 82: RETURN 
 25400 X =  - 55:Y = 32:M =  - 2.5:EA = 82: RETURN 
 25500  DATA overcast and cool,100,15,3,12,partly cloudy and warm,10,30,4,13,sunny and hot,40,45,1,31,sunny and extremely hot,70,60,2,25,1,1,0,96,100,202,2,2,0,0,90,70,206,228,279,279,3,26,88,96,208,214,250
 25550  DATA Delicious,Special,Super,Refreshing,Natural,Ice Cold
 25600  GOSUB 33000: & DUN,LP$:X1 = 56:X2 = 241:Y1 = 80:Y2 = 101: GOSUB 28000: PRINT CO$: & HSP,2: & VSP,1: PRINT "One moment please...": GOSUB 8000: & RNH,"SELL LEMONADE"
