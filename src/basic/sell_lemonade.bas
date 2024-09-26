 20  REM SELL LEMONADE
 30  REM SK RUSSELL
 40  REM (C) MECC 1984
 50  REM 84/12/10SKR
 55  LOMEM: 36300: & APP,"COMMON.LIB"
 60  GOSUB 41000: & AFT,2: & CST,61967: & HSP,1,2
 70  DIM CA(2),CA$(2),DE$(6),DS$(3),D$(6),NM$(3),DS(2),FF$(9,2),D(3),S$(1),LS$(11):HC = 6:S$(0) = "s":S$(1) = "":D = 6:LQ$ = "GAMES.SEQ":LP$ = "LEMON.PCK":LR$ = "LEMON.SEQ":LO$ = "LSTAND.PCK": HCOLOR= 7:DA = 1:W1 = 1
 90  FOR L = 0 TO 2:CA(L) = 4:V = CA(L): GOSUB 500:CA(L) = V:CA$(L) = V$: NEXT : FOR L = 1 TO 6: READ DE$(L):D$(L) = DE$(L): NEXT : FOR L = 0 TO 11: READ LS$(L): NEXT : POKE 919,1: GOTO 1000
 500 V =  INT ((V * 100) + .5):V$ = "":A$ =  STR$ ( ABS (V)): IF V < 100 THEN A$ = "0" + A$
 520 SG$ =  MID$ (" -",(1 + ( SGN (V) =  - 1)),1):V$ = SG$ +  STR$ ( INT ( ABS (V / 100))) + "." +  RIGHT$ (A$,2):V$ = "   " + V$:V$ = "$" +  RIGHT$ (V$,6):V = V / 100: RETURN 
 700  HCOLOR= HC: FOR L1 = 0 TO 4: HPLOT 1 + L1,4 - L1 TO 279 - L1,4 - L1 TO 279 - L1,177 + L1 TO 1 + L1,177 + L1 TO 1 + L1,4 - L1: NEXT : & WIND,10,10,274,181: RETURN 
 900  & AFT,2: PRINT CA$CL$CO$: & WIND: & CO: HCOLOR= 7: RETURN 
 950 LA =  LEN (NM$(L)): IF LA = 0 THEN 999
 960  IF  MID$ (NM$(L),LA,1) = " " THEN NM$(L) =  MID$ (NM$(L),1,LA - 1): GOTO 950
 970  IF  MID$ (NM$(L),1,1) = " " THEN NM$(L) =  MID$ (NM$(L),2,LA - 1): GOTO 950
 999  RETURN 
 1000  IF  PEEK (901) = 0 THEN  GOSUB 5000:FL$ = LR$: GOSUB 11000: GOSUB 33000: POKE 901,1: POKE 902,0: & RNH,"SELL LEMONADE.P2"
 1200  POKE 901,0: & PUT,56,80,AD:FL$ = LR$: GOSUB 20000: GOSUB 12000: IF DA > 1 THEN  GOSUB 25100: GOSUB 8000
 1300  GOSUB 33000: & DUN,LP$: GOTO 25650
 5000  & CLIP: & CLIP,0,0,0,279,191:X1 = 28:Y1 = 10:X2 = 258:Y2 = 39: & BOX,21,10,259,30,6:NS = 1:FL$ = LQ$: GOSUB 20000: IF FG > 0 THEN  GOSUB 28000: PRINT "Do you wish to continue a saved game? ";: GOSUB 30100: & PUT,X1,Y1,AD: IF Z$ = "Y" THEN NS = 0: GOSUB 10000
 5310  IF  NOT NS THEN 5900
 5400 X2 = 251: GOSUB 28000: PRINT "How many lemonade stands will you have? ";: & INP,(1,"-13",1),ST$:ST =  INT ( VAL (ST$))
 5500  & PUT,X1,Y1,AD: FOR L = 0 TO ST - 1:X1 = 28:Y1 = 10:X2 = 251:Y2 = 29: GOSUB 28000: PRINT "Here is stand #"L + 1"'s sign."CC$: FOR L2 = 1 TO 1: & BOX,97,45,200,52,7: & BOX,100,62,205,75,7
 5600  FOR L1 = 1 TO 1:X1 = 42:X2 = 240:Y1 = 130:Y2 = 159: GOSUB 28000: PRINT "Type the owner's": PRINT "first name: ";: & INP,(9,"-AZ-az'. -",1),NM$(L): GOSUB 950: & PUT,X1,Y1,AD: IF NM$(L) = "" THEN L1 = 0: GOTO 5600
 5650  GOSUB 28000: PRINT "Type the owner's": PRINT "last initial: ";: & INP,(1,"-AZ",1),LN$:NM$(L) = NM$(L) + " " + LN$ + "."
 5700  & PUT,X1,Y1,AD: NEXT :X1 = 21:X2 = 258:Y1 = 86:Y2 = 168: GOSUB 28000: FOR L1 = 1 TO D: VTAB 1 + L1 - 3 * (L1 > 3): HTAB 1 + 13 * (L1 > 3): PRINT L1". "DE$(L1): NEXT 
 5710  VTAB 6: PRINT "Which word would you like on your sign? ";:ZB = 1:ZT = D:ZC = 0: GOSUB 30200:DS$(L) = DE$(ZN):X = 69:Y = 43:I = 1: GOSUB 17000
 5720  & PUT,X1,Y1,AD:X1 = 42:X2 = 237:Y1 = 130:Y2 = 159: GOSUB 28000: PRINT "Do you want to make any changes? ";: GOSUB 30100: & PUT,X1,Y1,AD: IF Z$ = "Y" THEN L2 = 0
 5750  NEXT : FOR L1 = 1 TO 6: IF D$(L1) = DS$(L) THEN DS(L) = L1
 5800  NEXT :DE$(ZN) = "":D = D - 1: IF ZN < D + 1 THEN  FOR L1 = ZN TO D:DE$(L1) = DE$(L1 + 1): NEXT 
 5810  NEXT : & PUT,X1,Y1,AD
 5900 X1 = 28:Y1 = 10:X2 = 251:Y2 = 30:X = 69:Y = 43: IF ST <  > 1 THEN  GOSUB 16000
 5950  FOR L = 0 TO ST - 1:I = L + 1: GOSUB 17000: NEXT : GOSUB 28000: PRINT "One moment please...": RETURN 
 8000  FOR L = 0 TO ST - 1: GOSUB 950: GOSUB 900: & BOX,0,0,279,180,3:HC = 0:X1 = 4:X2 = 275:Y1 = 2:Y2 = 178:Z = 1: GOSUB 8900:HC = 6:X1 = 11:X2 = 268:Y1 = 6:Y2 = 174:Z = 1: GOSUB 8900: INVERSE 
 8100  & AFT,1: & WIND,15,15: & CO: PRINT "The official lemonade"CC$: PRINT :X = 4 * (((CA(L) / W1) < 7.5) + ((CA(L) / W1) < 15)): PRINT CN$LS$(X)CC$CO$: PRINT : PRINT "is hereby given to"CC$: PRINT : PRINT NM$(L)"'s "CC$: PRINT DS$(L)" Lemonade"CC$
 8200 Y1 = 99:Y2 = 3:X1 = 5:X2 = 10: FOR L1 = 0 TO 4: HPLOT 139 - X1 - X2 * (L1 - 2 * (L1 = 3) - 4 * (L1 = 4)),Y1 + L1 * Y2 TO 139 + X1 + X2 * (L1 - 2 * (L1 = 3) - 4 * (L1 = 4)),Y1 + L1 * Y2: NEXT 
 8300  PRINT : PRINT : FOR L1 = X + 1 TO X + 3: PRINT : PRINT LS$(L1)CC$: NEXT : NORMAL : GOSUB 29000: NEXT : GOSUB 900: RETURN 
 8900  HCOLOR= HC: FOR Q = 0 TO Z: HPLOT X1 + Q,Y1 + Q TO X2 - Q,Y1 + Q TO X2 - Q,Y2 - Q TO X1 + Q,Y2 - Q TO X1 + Q,Y1 + Q: NEXT : RETURN 
 9000  GOSUB 900: GOSUB 700: & DFT,7,53248: & CLIP,0,0,0,279,191: & IMAGE,8,5,10: & CO,90,10: PRINT "Remember, if you": & PAUSE,10: & IMAGE,13,5,10: & IMAGE,17,45,55: & WIND,85,40,260,181: & CO: PRINT "make the right amount of lemonade,": & PAUSE,10: PRINT : PRINT 
 9500  & IMAGE,17,50,80: PRINT "sell it at the right price, and": & PAUSE,10: PRINT : PRINT : & IMAGE,17,45,100: PRINT "advertise well,": & PAUSE,10: & WIND,20,140,269,181: & CO: PRINT "you will be a success in the lemonade business--unless, of course, it rains."
 9600  GOSUB 30000: GOSUB 900: RETURN 
 10000  FOR L1 = 1 TO 1: GOSUB 900: GOSUB 700: & CO,0,10: PRINT "SAVED GAMES"CC$: FOR L2 = 0 TO FG - 1: PRINT : & CO,10 + (8 * (L2 < 9)),L2 * 10 + 30
 10400  PRINT L2 + 1". ";: FOR L = 0 TO FS(L2) - 1:NM$(L) =  MID$ (FF$(L2,L),2,12): GOSUB 950: PRINT  LEFT$ (NM$(L), LEN (NM$(L)) - 3 * (FS(L2) = 3))" ";: NEXT : PRINT : PRINT : NEXT 
 10500  & CO,10,160: PRINT "Which number? ";:ZB = 1:ZT = FG:ZC = 1: GOSUB 30200: IF ZN$ = "" THEN NS = 1: GOTO 10999
 10600  GOSUB 900: GOSUB 700: & CO: PRINT "LAST WEEKLY SALES REPORT"CC$: & CO,45,25: PRINT "Stands": & CO,160,25: PRINT "Cash on hand"
 10700  & WIND,40,40,269,181: & CO: FOR L2 = 0 TO FS(ZN - 1) - 1:NM$(L) =  MID$ (FF$(ZN - 1,L2),2,12): GOSUB 950: PRINT NM$(L)"'s": PRINT D$( INT ( VAL ( LEFT$ (FF$(ZN - 1,L2),1)))): PRINT "Lemonade        " MID$ (FF$(ZN - 1,L2),14): PRINT : NEXT 
 10800  & WIND,10,150,269,181: & CO: PRINT "Is this the game you want to continue? ";: GOSUB 30100: IF Z$ = "N" THEN L1 = 0
 10900  NEXT :SS = ZN - 1:W1 =  INT ((FW(SS) / 5)) + 1:D1 = FW(SS) - ((W1 - 1) * 5) + 1:ST = FS(SS):DA = (W1 - 1) * 5 + D1
 10910  FOR L = 0 TO ST - 1:NM$(L) =  MID$ (FF$(SS,L),2,12): GOSUB 950:DS(L) =  INT ( VAL ( LEFT$ (FF$(SS,L),1))):DS$(L) = D$(DS(L)):CA$(L) =  MID$ (FF$(SS,L),14):CA(L) =  VAL ( MID$ (FF$(SS,L),15)): NEXT : GOSUB 24000
 10999  GOSUB 900: GOSUB 33000: & DUN,LO$:KI =  INT ( RND (1) * 4) + 21: & IMAGE,KI,168,102 - (KI = 23) + (2 * (KI = 21)): RETURN 
 11000 FG = 1:FW(0) = DA:FS(0) = ST: FOR L1 = 0 TO ST - 1:NM$(L1) =  LEFT$ (NM$(L1) + "          ",12):FF$(0,L1) =  STR$ (DS(L1)) + NM$(L1) + CA$(L1): NEXT : GOSUB 23000: RETURN 
 12000 W1 =  INT (FW(0) / 5) + 1:D1 = FW(0) - ((W1 - 1) * 5) + 1:ST = FS(0):DA = (W1 - 1) * 5 + (D1 - 1)
 12100  FOR L = 0 TO ST - 1:NM$(L) =  MID$ (FF$(0,L),2,12): GOSUB 950:DS$(L) = D$( INT ( VAL ( LEFT$ (FF$(0,L),1)))):DS(L) =  INT ( VAL ( LEFT$ (FF$(0,L),1))):CA$(L) =  MID$ (FF$(0,L),14):CA(L) =  VAL ( MID$ (FF$(0,L),15)): NEXT : RETURN 
 15000 FL$ = LQ$: GOSUB 20000: IF FG = 10 THEN SS = 0: GOSUB 24000: GOSUB 20000
 15200 FG = FG + 1:FW(FG - 1) = DA:FS(FG - 1) = ST: FOR L1 = 0 TO ST - 1:NM$(L1) =  LEFT$ (NM$(L1) + "            ",12):FF$(FG - 1,L1) =  STR$ (DS(L1)) + NM$(L1) + CA$(L1): NEXT : GOSUB 23000: RETURN 
 16000  GOSUB 900: & BOX,0,0,279,191,3:X = 60:Y = 45: FOR L2 = 1 TO ST: & IMAGE,19,X,Y * L2: NEXT : RETURN 
 17000  INVERSE : & WIND,X + 25,Y * I + 5,X + 135,Y * I + 15: & CO: PRINT CN$NM$(L)"'S"CC$: & WIND,X + 42,Y * I + 21,X + 112,Y * I + 40: & CO: PRINT DS$(L)CC$: PRINT "Lemonade"CC$CO$: NORMAL : & WIND: RETURN 
 20000  GOSUB 33000: PRINT D$"OPEN"FL$: PRINT D$"READ"FL$: INPUT FG: IF FG > 0 THEN  FOR L1 = 0 TO FG - 1: INPUT FW(L1): INPUT FS(L1): FOR L2 = 0 TO FS(L1) - 1: INPUT FF$(L1,L2): NEXT : NEXT 
 20400  PRINT D$"CLOSE": RETURN 
 23000  GOSUB 33000: PRINT : PRINT D$"OPEN"FL$: PRINT D$"WRITE"FL$: PRINT FG: FOR L1 = 0 TO FG - 1: PRINT FW(L1): PRINT FS(L1): FOR L2 = 0 TO FS(L1) - 1: PRINT FF$(L1,L2): NEXT : NEXT : PRINT D$"CLOSE": RETURN 
 24000  FOR L1 = 0 TO FS(SS) - 1:FF$(SS,L1) = "": NEXT :FG = FG - 1: IF SS < FG THEN  FOR L1 = SS TO FG - 1:FW(L1) = FW(L1 + 1):FS(L1) = FS(L1 + 1): FOR L2 = 0 TO FS(L1) - 1:FF$(L1,L2) = FF$(L1 + 1,L2): NEXT : NEXT 
 24100  GOSUB 23000: RETURN 
 25100  IF  PEEK (902) = 1 THEN  GOSUB 33000: & DUN,LP$: GOTO 25199
 25110 IN = 1:X1 = 49:X2 = 237:Y1 = 80:Y2 = 110: GOSUB 28000: PRINT "Do you want to save your game? ";: GOSUB 30100: & PUT,X1,Y1,AD: IF Z$ = "Y" THEN  GOSUB 15000:Y2 = 100:X2 = 237: GOSUB 28000: PRINT "Your game is saved.": POKE 902,1: GOSUB 29000: & PUT,X1,Y1,AD
 25199  RETURN 
 25550  DATA  Delicious,Special,Super,Refreshing,Natural,Ice Cold,ENTREPRENEUR'S AWARD,HIGH PROFITS,AND,AN OUTSTANDING PERFORMANCE.,HIGH POTENTIAL AWARD,RESPECTABLE PROFITS,AND,A GOOD PERFORMANCE
 25560  DATA GOOD TRY AWARD,LOW PROFITS,BUT,ADMIRABLE EFFORTS
 25600  GOSUB 900: GOSUB 33000: & DUN,LP$: IF DA > 1 THEN  GOSUB 25100
 25650 X1 = 63:X2 = 209:Y1 = 80:Y2 = 118: GOSUB 28000: PRINT "Do you want to sell lemonade again? ";: GOSUB 30100: & PUT,X1,Y1,AD: IF Z$ = "Y" THEN 25710
 25700 Z$ = "E": GOSUB 9000
 25710  GOSUB 33000: IF Z$ = "Y" THEN  & TAKE,63,80,69,81,AD: GOTO 40100
 25720  GOSUB 900: GOTO 40000
