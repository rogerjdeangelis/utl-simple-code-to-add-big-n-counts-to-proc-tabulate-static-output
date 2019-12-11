Simple code to add count big n to proc tabulate static output

github
https://tinyurl.com/tq5ty3p
https://github.com/rogerjdeangelis/utl-simple-code-to-add-big-n-counts-to-proc-tabulate-static-output

Solution by
Keintz, Mark
mkeintz@wharton.upenn.edu

data have;
  informat drug $9. SEX $2. dose;
  input Drug  sex dose;
cards4;
  Apc      F 152
  Apc      F 213
  Apc      F 324
  Apc      M 535
  Benedril M 111
  Benedril F 222
  Benedril F 334
  Cafeine  M 145
  Cafeine  M 251
  Cafeine  F 312
  Cafeine  F 425
  Cafeine  M 542
  Detene   F 153
  Detene   M 214
  Detene   F 425
  Detene   M 551
  Efane    F 162
  Efane    M 274
  Efane    F 535
;;;;
run;


*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;


WORK.HAVE total obs=19

Obs    DRUG        SEX    DOSE

  1    Apc          F      152
  2    Apc          F      213
  3    Apc          F      324
  4    Apc          M      535
  5    Benedril     M      111
  6    Benedril     F      222
  7    Benedril     F      334
  8    Cafeine      M      145
  9    Cafeine      M      251
 10    Cafeine      F      312
 11    Cafeine      F      425
 12    Cafeine      M      542
 13    Detene       F      153
 14    Detene       M      214
 15    Detene       F      425
 16    Detene       M      551
 17    Efane        F      162
 18    Efane        M      274
 19    Efane        F      535

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;


------------------------------------------------------------------------------------
|            |     Apc     |  Benedril   |   Cafeine   |   Detene    |    Efane    |
|------------+-------------+-------------+-------------+-------------+-------------|
|SEX         |          N=4|          N=3|          N=5|          N=4|          N=3|
|F           |          689|          556|          737|          578|          697|
|M           |          535|          111|          938|          765|          274|
|Sum         |        1,224|          667|        1,675|        1,343|          971|
------------------------------------------------------------------------------------


*
 _ __  _ __ ___   ___  ___ ___
| '_ \| '__/ _ \ / _ \/ __/ __|
| |_) | | | (_) |  __/\__ \__ \
| .__/|_|  \___/ \___||___/___/
|_|
;

proc format;
  picture nequal low-high ='00,000' (prefix='N=');
run;

proc tabulate data=have noseps;
  class drug sex;
  var dose;
  tables  all='SEX'*N=' '*f=nequal13.0
          (sex=' ' all='Sum')*dose=' '*sum=' '*f=comma10.0
          ,drug=' ' / RTS=14 ;
run;


