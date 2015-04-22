unit DefineClim510;

interface
uses FController, Graphics, ClimCalc,   // DefineClim65, Climat65,
   SysUtils, Chart, Series, GanttCh, GGraf, TeEngine,ComCtrls,
   FConstType, MessageU, Windows, HandClim;

// ------- ������� ����������� 403 ---------
const
     cNameIdent403=178;
     DZ_MAX_SUM_ZONE=8;

     // ������ ���������� � ��������� cDefineMech
DZM_SHEATING      = 1;
DZM_SVENTILATION  = 2;
DZM_SSCREENING    = 3;
DZM_SUC           = 4;
DZM_SCO2          = 5;
DZM_SLIGHT        = 6;
DZM_SSIO          = 7;
DZM_SFAN          = 8;
DZM_SREZ1         = 9;
DZM_SREZ2         = 10;

DZM_VALVE1      = 11;
DZM_VALVE2      = 12;
DZM_VALVE3      = 13;
DZM_VALVE4      = 14;
DZM_VALVE5      = 15;
DZM_VALVEAHU    = 16;
DZM_FRAM_NORTH  = 17;
DZM_FRAM_SOUTH  = 18;
DZM_FRAM_UC     = 19;
DZM_SPEED_AHU   = 20;

DZM_SCREEN_TG   = 21;
DZM_SCREEN_HG   = 22;
DZM_SCREEN_TV1  = 23;
DZM_SCREEN_TV2  = 24;
DZM_SCREEN_TV3  = 25;
DZM_SCREEN_TV4  = 26;
DZM_CO2         = 27;
DZM_PRES_REG    = 28;
DZM_LIGHT       = 29;
DZM_S_PUMP_AHU  = 30;

DZM_PUMP1       = 35;
DZM_PUMP2       = 36;
DZM_PUMP3       = 37;
DZM_PUMP4       = 38;
DZM_PUMP5       = 39;
DZM_PUMPAHU     = 40;

DZM_VENT        = 41;
DZM_VAG         = 42;
DZM_COOL        = 43;
DZM_SIO_PUMP    = 44;
DZM_SIO_VALVES  = 45;
DZM_AHU_VALVES  = 46;
DZM_ALARM       = 47;
DZM_EXTREG1     = 48;
DZM_EXTREG2     = 49;
DZM_EXTREG3     = 50;
DZM_EXTREG4     = 51;
DZM_EXTREG5     = 52;

DZM_REZ1        = 53;
DZM_REZ2        = 54;
DZM_REZ3        = 55;
DZM_REZ4        = 56;


DZM_SENS_TEMP1  = 64;
DZM_SENS_TEMP2  = 65;
DZM_SENS_TEMP3  = 66;
DZM_SENS_TEMP4  = 67;

DZM_SENS_HUM1   = 68;
DZM_SENS_HUM2   = 69;

DZM_SENS_INLIGHT= 70;

DZM_SENS_CO     = 71;

DZM_SENS_TOP    = 76;
DZM_SENS_SOIL   = 77;
DZM_SENS_GLASS  = 78;

DZM_SENS_FRAM_N = 81;
DZM_SENS_FRAM_S = 82;
DZM_SENS_SCR    = 83;

DZM_SENS_WATER1 = 84;
DZM_SENS_WATER2 = 85;
DZM_SENS_WATER3 = 86;
DZM_SENS_WATER4 = 87;
DZM_SENS_WATER5 = 88;

DZM_SENS_OUT    = 90;
DZM_SENS_SUN    = 91;
DZM_SENS_WIND   = 92;
DZM_SENS_WINDD  = 93;
DZM_SENS_RAIN   = 94;
DZM_SENS_OUTHUM = 95;
DZM_SENS_TSUP   = 96;
DZM_SENS_TRET   = 97;
DZM_SENS_PSUP   = 98;
DZM_SENS_PRET   = 99;
DZM_SENS_VOL    = 100;


{***********************************************************
--------------------��������� 511-----------
************************************************************}


     // ������ ���������� � ��������� cDefineMech
DZM511_SHEATING      = 1;
DZM511_SVENTILATION  = 2;
DZM511_SSCREENING    = 3;
DZM511_SUC           = 4;
DZM511_SCO2          = 5;
DZM511_SLIGHT        = 6;
DZM511_SSIO          = 7;
DZM511_SFAN          = 8;
DZM511_SREZ1         = 9;
DZM511_SREZ2         = 10;

DZM511_VALVE1      = 11;
DZM511_VALVE2      = 12;
DZM511_VALVE3      = 13;
DZM511_VALVE4      = 14;
DZM511_VALVE5      = 15;
DZM511_VALVEAHU    = 16;
DZM511_FRAM_NORTH  = 17;
DZM511_FRAM_SOUTH  = 18;
DZM511_FRAM_NORTH2 = 19;
DZM511_FRAM_NORTH3 = 20;
DZM511_FRAM_NORTH4 = 21;
DZM511_FRAM_UC     = 22;
DZM511_SPEED_AHU1  = 23;
DZM511_SPEED_AHU2  = 24;

DZM511_SCREEN_TG     = 25;
DZM511_SCREEN_HG     = 26;
DZM511_SCREEN_TV1    = 27;
DZM511_CO2           = 28;
DZM511_PRES_REG      = 29;
DZM511_LIGHT         = 30;

DZM511_PUMP1       = 35;
DZM511_PUMP2       = 36;
DZM511_PUMP3       = 37;
DZM511_PUMP4       = 38;
DZM511_PUMP5       = 39;
DZM511_PUMPAHU     = 40;

DZM511_VENT        = 41;
DZM511_VAG         = 42;
DZM511_COOL        = 43;
DZM511_SIO_PUMP    = 44;
DZM511_SIO_VALVES  = 45;
DZM511_AHU_VALVES  = 46;
DZM511_ALARM       = 47;
DZM511_EXTREG1     = 48;
DZM511_EXTREG2     = 49;
DZM511_EXTREG3     = 50;
DZM511_EXTREG4     = 51;
DZM511_EXTREG5     = 52;

DZM511_REZ1        = 53;
DZM511_REZ2        = 54;
DZM511_REZ3        = 55;
DZM511_REZ4        = 56;


DZM511_SENS_TEMP1  = 64;
DZM511_SENS_TEMP2  = 65;
DZM511_SENS_TEMP3  = 66;
DZM511_SENS_TEMP4  = 67;
DZM511_SENS_TEMP5  = 68;
DZM511_SENS_TEMP6  = 69;

DZM511_SENS_HUM1   = 70;
DZM511_SENS_HUM2   = 71;
DZM511_SENS_HUM3   = 72;
DZM511_SENS_HUM4   = 73;

DZM511_SENS_INLIGHT= 74;

DZM511_SENS_CO     = 75;

DZM511_SENS_EVAP1  = 76;
DZM511_SENS_EVAP2  = 77;

DZM511_SENS_COOL   = 78;
DZM511_SENS_OP     = 79;

DZM511_SENS_TOP    = 80;
DZM511_SENS_SOIL   = 81;
DZM511_SENS_GLASS  = 82;

DZM511_SENS_INAHU  = 83;
DZM511_SENS_OUTAHU = 84;


DZM511_SENS_FRAM_N = 85;
DZM511_SENS_FRAM_S = 86;
DZM511_SENS_SCR    = 87;

DZM511_SENS_WATER1 = 88;
DZM511_SENS_WATER2 = 89;
DZM511_SENS_WATER3 = 90;
DZM511_SENS_WATER4 = 91;
DZM511_SENS_WATER5 = 92;
DZM511_SENS_WATAHU = 93;

DZM511_SENS_OUT    = 94;
DZM511_SENS_SUN    = 95;
DZM511_SENS_WIND   = 96;
DZM511_SENS_WINDD  = 97;
DZM511_SENS_RAIN   = 98;
DZM511_SENS_OUTHUM = 99;
DZM511_SENS_TSUP   = 100;
DZM511_SENS_TRET   = 101;
DZM511_SENS_PSUP   = 102;
DZM511_SENS_PRET   = 103;
DZM511_SENS_VOL    = 104;



{***********************************************************
--------------------������������� ����� ������������-----------
************************************************************}
//begin-----------���� ������������ ������������-----------------

const DZ_SumConfig=10+46+7+26+11;

var NameConfiguration:array [1..DZ_SumConfig] of TNameConst=(
(Name:'������� ���������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:0;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ����������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:1;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:2;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� UltraClima';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:3;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� CO2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:4;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:5;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ����';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:6;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:7;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������� 1';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:8;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_NOEDIT),
(Name:'������� ������� 2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:9;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_NOEDIT),

(Name:'������������ ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:10;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:11;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:12;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:13;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:14;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:15;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:16;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ��';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:17;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ ��������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:18;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:19;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �������� �����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:20;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:21;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:22;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:23;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:24;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:25;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:26;Mech:DZM_SCO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ���������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:27;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:28;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:29;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:30;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:31;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:32;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:33;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'����� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:34;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:35;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:36;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:37;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:38;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:39;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:40;Mech:DZM_SFAN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:41;Mech:DZM_SFAN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:42;Mech:DZM_SFAN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:43;Mech:DZM_SSIO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:44;Mech:DZM_SSIO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ���������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:45;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:46;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:47;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:48;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:49;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:50;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:51;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:52;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:53;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:54;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:55;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

(Name:'������ ���������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:56;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:57;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� 50%';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:58;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� 100%';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:59;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:60;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:61;Mech:DZM_SCO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:62;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:63;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:64;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:65;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:66;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:67;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:68;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���������� ����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:69;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:70;Mech:DZM_SCO2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:71;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:72;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:73;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:74;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:75;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:76;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:77;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:78;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:79;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:80;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ��';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:81;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:82;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:83;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:84;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:85;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:86;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:87;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:88;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� �������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:89;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:90;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:91;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:92;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:93;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� �������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:94;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:95;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:96;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:97;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:98;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:99;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG)
);




var XNamesConfigC510:array [1..1] of TXNames=(
    (Name:'���� ';Frm:None;Ed:'';Index:DZ_SumConfig;Cfg:0;Kind:0)
     );

{***********************************************************
--------------------������������� ����� ������������ 511-----------
************************************************************}
//begin-----------���� ������������ ������������-----------------

const DZ511_SumConfig=10+46+7+30+11;

var NameConfiguration511:array [1..DZ511_SumConfig] of TNameConst=(
(Name:'������� ���������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:0;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ����������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:1;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:2;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� UltraClima';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:3;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� CO2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:4;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:5;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ����';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:6;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:7;Mech:0;AccessR:R_CONFIG;AccessW:RW_NOEDIT),
(Name:'������� ������� 1';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:8;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_NOEDIT),
(Name:'������� ������� 2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
    Index:9;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_NOEDIT),

(Name:'������������ ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:10;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:11;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:12;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:13;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:14;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:15;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:16;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ��';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:17;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:18;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:19;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:20;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ ��������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:21;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� AHU 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:22;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� AHU 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:23;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �������� �����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:24;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:25;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ �����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:26;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:27;Mech:DZM_SCO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ���������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:28;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:29;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:30;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:31;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:32;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:33;Mech:DZM_SREZ1;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'����� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:34;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:35;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:36;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:37;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:38;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:39;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:40;Mech:DZM_SFAN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:41;Mech:DZM_SFAN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:42;Mech:DZM_SFAN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:43;Mech:DZM_SSIO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:44;Mech:DZM_SSIO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ���������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:45;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:46;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:47;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:48;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:49;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:50;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:51;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:52;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:53;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:54;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:55;Mech:DZM_SREZ1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

(Name:'������ ���������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:56;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:57;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� 50%';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:58;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� 100%';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:59;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:60;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:61;Mech:DZM_SCO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:62;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:63;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:64;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:65;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:66;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:67;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:68;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:69;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:70;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:71;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:72;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���������� ����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:73;Mech:DZM_SLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:74;Mech:DZM_SCO2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:75;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:76;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:77;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:78;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:79;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:80;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:81;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:82;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:83;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:84;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ��';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:85;Mech:DZM_SVENTILATION;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:86;Mech:DZM_SSCREENING;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:87;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:88;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:89;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:90;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:91;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:92;Mech:DZM_SUC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� �������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:93;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:94;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:95;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� �����';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:96;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:97;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� �������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:98;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:99;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:100;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:101;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:102;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������������';Frm:CpMpN;Ed:'-����';TipSens:TipIzm;Min:0;Max:0;
    Index:103;Mech:DZM_SHEATING;AccessR:R_CONFIG;AccessW:W_CONFIG)
);




var XNamesConfigC511:array [1..1] of TXNames=(
    (Name:'���� ';Frm:None;Ed:'';Index:DZ511_SumConfig;Cfg:0;Kind:0)
     );


//===================================================================
// ============ ������ ==============================================
//===================================================================
const
     DZ_NumTimer=20;
     DZ_iTimerZone=0;
     DZ_iTimeStart=DZ_iTimerZone+1;
     DZ_iStartType=DZ_iTimeStart+2; // NEW
     DZ_iTimeEnd=DZ_iTimeStart+2;
     DZ_iTaskTemper=DZ_iTimeEnd+2;
     DZ_iTaskTVent=DZ_iTaskTemper+2;
     DZ_iTaskCO2=DZ_iTaskTVent+2;
     DZ_iOpt1Temp=DZ_iTaskCO2+2;
     DZ_iMinPipe1=DZ_iOpt1Temp+5;
     DZ_iMinOpenWin=DZ_iMinPipe1+2;
     DZ_iWinYes=DZ_iMinOpenWin+1;
     DZ_iTimeSiod=DZ_iWinYes+1;
     DZ_iScreenYes=DZ_iTimeSiod+2;
     DZ_iVentYes=DZ_iScreenYes+3;
     DZ_iDosvet=DZ_iVentYes+1;
     DZ_iMinPipe3=DZ_iDosvet+2;
     DZ_iTaskHumin=DZ_iMinPipe3+1;
     DZ_sizeTimer=DZ_iTaskHumin+1+20;
     DZ_SumTimer=26;


var  DZ_NameTimer:array [1..DZ_SumTimer] of TNameConst=(
 (Name:'����� ����';Frm:SS;Ed:'-����';TipSens:TipCalc;Min:0;Max:4;Def:HIDE_MIN_MAX;
    Index:0;GridColor:$ff0f00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ �������� ��������� (���� 0 - ����� �� �������)';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:1;GridColor:$ffef00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'��� ������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:657;Max:661;Def:0;
    Index:3;GridColor:$ffdf00;AccessR:RW_GUEST;AccessW:RW_GUEST),


 (Name:'������ ���������';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:-1;GridColor:$ffdf00;AccessR:RW_GUEST;AccessW:RW_NOEDIT),


 (Name:'������� ����������� ������� (���� 0-����� �� �������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskTemper;GridColor:clRed;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskTVent;GridColor:clRed;Mech:DZM_SVENTILATION;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ��������� ������� (���� 0-�� �� ���������)';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskHumin;GridColor:clBlue;Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_GUEST),
//6
 (Name:'������� ������� �������� ���� ';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:0;Def:0;
    Index:DZ_iTaskHumin;GridColor:clBlue;Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������������ CO2 (���� 0 - �� ���������)';Frm:SSSS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskCO2;GridColor:clYellow;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 1 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:55;Def:0;
    Index:DZ_iMinPipe1;GridColor:$ffff80;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����������� ����������� ������� 1 (���� 0,�� ����� �� ��� �� ����)  ';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:60;Def:0;
    Index:DZ_iOpt1Temp;GridColor:$2fdfef;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 2 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:55;Def:0;
    Index:DZ_iMinPipe1+1;GridColor:$ffff80;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
//11
 (Name:'����������� ����������� ������� 2 (���� 0,�� ����� �� ��� �� ����)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ_iOpt1Temp+1;GridColor:$3fafef;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ����������� ������� 3 (���� 0, �� � ��������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ_iOpt1Temp+2;GridColor:$af0fef;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ����������� ������� 4 (���� 0, �� � ��������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ_iOpt1Temp+3;GridColor:$af0fef;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 3 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'';TipSens:TipCombo;Min:0;Max:90;Def:HIDE_MIN_MAX;
    Index:DZ_iMinPipe3;GridColor:clYellow;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST ),
 (Name:'������� ������� 5 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ_iOpt1Temp+4;GridColor:$af0fef;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_GUEST),

 (Name:'����� ������ ������ (�������,� ��������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comFram;Max:comFram+2;Def:0;
    Index:DZ_iWinYes;GridColor:$ff0f00;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),

//16
 (Name:'����������� ��������� ������ ';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ_iMinOpenWin;GridColor:$ff0faf;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ���������� ���� (���� 0,�� ���������)';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:DZ_iTimeSiod;GridColor:$ffaf0f;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ������������ ������ (������,������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comScreen;Max:comScreen+2;Def:0;
    Index:DZ_iScreenYes;GridColor:$afdfaf;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ����������� ������ (������,������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comScreen;Max:comScreen+2;Def:0;
    Index:DZ_iScreenYes+1;GridColor:$afdfaf;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ������������� ������ (������,������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comScreen;Max:comScreen+2;Def:0;
    Index:DZ_iScreenYes+2;GridColor:$afdfaf;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
//21
 (Name:'����� ������������ (����,���,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comOnOff;Max:comOnOff+2;Def:0;
    Index:DZ_iVentYes;GridColor:$afefaf;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ��������� ������������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ_iDosvet+1;GridColor:clYellow;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST ),
 (Name:'������� ��������� ������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iDosvet;GridColor:clYellow;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST )
  );

//===================================================================
// ============ ������ 511 ==============================================
//===================================================================
const
     DZ511_NumTimer=20;
     DZ511_iTimerZone=0;
     DZ511_iTimeStart=DZ511_iTimerZone+1;
     DZ511_iStartType=DZ511_iTimeStart+2; // NEW
     DZ511_iTimeEnd=DZ511_iTimeStart+2;
     DZ511_iTaskTemper=DZ511_iTimeEnd+2;
     DZ511_iTaskTVent=DZ511_iTaskTemper+2;
     DZ511_iTaskCO2=DZ511_iTaskTVent+2;
     DZ511_iOpt1Temp=DZ511_iTaskCO2+2;
     DZ511_iMinPipe1=DZ511_iOpt1Temp+5;
     DZ511_iMinOpenWin=DZ511_iMinPipe1+2;
     DZ511_iWinYes=DZ511_iMinOpenWin+1;
     DZ511_iTimeSiod=DZ511_iWinYes+1;
     DZ511_iScreenYes=DZ511_iTimeSiod+2;
     DZ511_iVentYes=DZ511_iScreenYes+3;
     DZ511_iDosvet=DZ511_iVentYes+1;
     DZ511_iMinPipe3=DZ511_iDosvet+2;
     DZ511_iTaskHumin=DZ511_iMinPipe3+1;
     DZ511_iTCool=DZ511_iTaskHumin+1;
     DZ511_sizeTimer=DZ511_iTCool+2+18;
     DZ511_SumTimer=26;


var  DZ511_NameTimer:array [1..DZ511_SumTimer] of TNameConst=(
 (Name:'����� ����';Frm:SS;Ed:'-����';TipSens:TipCalc;Min:0;Max:4;Def:HIDE_MIN_MAX;
    Index:0;GridColor:$ff0f00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ �������� ��������� (���� 0 - ����� �� �������)';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:1;GridColor:$ffef00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'��� ������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:3;GridColor:$ffdf00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ����������� ������� (���� 0-����� �� �������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ511_iTaskTemper;GridColor:clRed;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ511_iTaskTVent;GridColor:clRed;Mech:DZM511_SVENTILATION;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ511_iTCool;GridColor:clRed;Mech:DZM511_SVENTILATION;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ��������� ������� (���� 0-�� �� ���������)';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ511_iTaskHumin;GridColor:clBlue;Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_GUEST),
//6
 (Name:'������� ������� �������� ���� ';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:0;Def:0;
    Index:DZ511_iTaskHumin;GridColor:clBlue;Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������������ CO2 (���� 0 - �� ���������)';Frm:SSSS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:DZ511_iTaskCO2;GridColor:clYellow;Mech:DZM511_CO2;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 1 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:55;Def:0;
    Index:DZ511_iMinPipe1;GridColor:$ffff80;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����������� ����������� ������� 1 (���� 0,�� ����� �� ��� �� ����)  ';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:60;Def:0;
    Index:DZ511_iOpt1Temp;GridColor:$2fdfef;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 2 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:55;Def:0;
    Index:DZ511_iMinPipe1+1;GridColor:$ffff80;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
//11
 (Name:'����������� ����������� ������� 2 (���� 0,�� ����� �� ��� �� ����)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ511_iOpt1Temp+1;GridColor:$3fafef;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ����������� ������� 3 (���� 0, �� � ��������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ511_iOpt1Temp+2;GridColor:$af0fef;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ����������� ������� 4 (���� 0, �� � ��������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ511_iOpt1Temp+3;GridColor:$af0fef;Mech:DZM511_VALVE4;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 3 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'';TipSens:TipCombo;Min:0;Max:90;Def:HIDE_MIN_MAX;
    Index:DZ511_iMinPipe3;GridColor:clYellow;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST ),
 (Name:'������� ������� 5 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ511_iOpt1Temp+4;GridColor:$af0fef;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ������� UC (������,� ��������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comFram;Max:comFram+2;Def:0;
    Index:DZ511_iWinYes;GridColor:$ff0f00;Mech:DZM511_FRAM_UC;AccessR:RW_GUEST;AccessW:RW_GUEST),
//16
 (Name:'����������� ��������� ������� UC ';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:90;Def:0;
    Index:DZ511_iMinOpenWin;GridColor:$ff0faf;Mech:DZM511_FRAM_UC;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ���������� ���� (���� 0,�� ���������)';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:DZ511_iTimeSiod;GridColor:$ffaf0f;Mech:DZM511_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ������������ ������ (������,������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comScreen;Max:comScreen+2;Def:0;
    Index:DZ511_iScreenYes;GridColor:$afdfaf;Mech:DZM511_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ����������� ������ (������,������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comScreen;Max:comScreen+2;Def:0;
    Index:DZ511_iScreenYes+1;GridColor:$afdfaf;Mech:DZM511_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ ������������� ������ (������,������,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comScreen;Max:comScreen+2;Def:0;
    Index:DZ511_iScreenYes+2;GridColor:$afdfaf;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
//21
 (Name:'����������� �������� AHU';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:70;Def:40;
    Index:DZ511_iVentYes;GridColor:$afefaf;Mech:DZM511_SPEED_AHU1;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ��������� ������������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ511_iDosvet+1;GridColor:clYellow;Mech:DZM511_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST ),
 (Name:'������� ��������� ������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iDosvet;GridColor:clYellow;Mech:DZM511_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST )
  );



  //====================================================================================================
// ========================= ���������� �������� 510 =================================================
//====================================================================================================

const
    DZ_SumInSens=26;
    DZ_SumOutSens=11;
    DZ_SumVisibleInSens=19;
    DZ_SumParsSens=7;



var XNamesSensC510:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ_SumInSens*12;Cfg:DZ_SumConfig;Kind:0)
     );


var NameInSensorsC510:array [1..DZ_SumVisibleInSens*DZ_SumParsSens] of TNameConst=(

(Name:'����������� ������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:0;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:2;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:3;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:4;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:6;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:8;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:10;Mech:DZM_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:12;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:14;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:15;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:16;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:18;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:20;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:22;Mech:DZM_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 3 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:24;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:26;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:27;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:28;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:30;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:32;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:34;Mech:DZM_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 4 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:36;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:38;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:39;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:40;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:42;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:44;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:46;Mech:DZM_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:48;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:50;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:51;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:52;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:54;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:56;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:58;Mech:DZM_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:60;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:62;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:63;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:64;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:66;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:68;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:70;Mech:DZM_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���������� ���� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:72;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:74;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ���������';Frm:SS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:50;
    Index:75;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:76;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ������ 1';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1000;
    Index:78;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:80;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ������ 2';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1000;
    Index:82;Mech:DZM_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'������������ ��2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:84;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:86;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ���������';Frm:SS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:50;
    Index:87;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:88;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ������ 1';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:2000;
    Index:90;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:92;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ������ 2';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:1;Max:3000;
    Index:94;Mech:DZM_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),

//(Name:'����������� ��������� 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:8;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'����������� ��������� 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:9;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

//(Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:10;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'���������� ��������';Frm:SSpS0;Ed:'��';TipSens:TipIzm;Min:-10;Max:100;
//    Index:11;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'����������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:144;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:146;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:147;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:148;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:150;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:152;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:154;Mech:DZM_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:156;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:158;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:159;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:160;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:162;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:164;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:166;Mech:DZM_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:168;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:170;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:171;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:172;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:174;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:176;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:178;Mech:DZM_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),

//(Name:'����������� ����� AHU';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:15;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'����������� ������ AHU';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:16;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'��������� ������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:204;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:206;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:207;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:208;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ������ 1';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:210;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:212;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ������ 2';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:214;Mech:DZM_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� �� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:216;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:218;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:219;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:220;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ������ 1';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:222;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:224;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ������ 2';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:226;Mech:DZM_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:228;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:230;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:231;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:232;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ������ 1';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:234;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:236;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ������ 2';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:238;Mech:DZM_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),



(Name:'����������� ������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:240;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:242;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:243;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:244;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:120;
    Index:246;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:248;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:120;
    Index:250;Mech:DZM_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:252;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:254;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:255;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:256;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:258;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:260;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:262;Mech:DZM_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 3 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:264;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:266;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:267;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:268;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:270;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:272;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:274;Mech:DZM_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 4 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:276;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:278;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:279;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:280;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:282;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:284;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:286;Mech:DZM_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 5 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:288;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:290;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:291;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:292;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:294;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:296;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:298;Mech:DZM_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG)

{
(Name:'����������� ������� 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:20;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:21;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:22;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:23;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:24;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:25;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG)}
);

//====================================================================================================
// ========================= ���������� �������� 511 =================================================
//====================================================================================================

const
    DZ511_SumInSens=30;
    DZ511_SumOutSens=11;
    DZ511_SumParsSens=7;



var XNamesSensC511:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ511_SumInSens*12;Cfg:DZ511_SumConfig;Kind:0)
     );


var NameInSensorsC511:array [1..DZ511_SumInSens*DZ511_SumParsSens] of TNameConst=(

(Name:'����������� ������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:0;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:2;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:3;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:4;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:6;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:8;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:10;Mech:DZM511_SENS_TEMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:12;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:14;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:15;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:16;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:18;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:20;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:22;Mech:DZM511_SENS_TEMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 3 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:24;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:26;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:27;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:28;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:30;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:32;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:34;Mech:DZM511_SENS_TEMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 4 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:36;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:38;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:39;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:40;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:42;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:44;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:46;Mech:DZM511_SENS_TEMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 5 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:48;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:50;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:51;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:52;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:54;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:56;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:58;Mech:DZM511_SENS_TEMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 6 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:60;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:62;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:63;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:64;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:66;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:68;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 6 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:70;Mech:DZM511_SENS_TEMP6;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'��������� ������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:72;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:74;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:75;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:76;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:78;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:80;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 1 - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:82;Mech:DZM511_SENS_HUM1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:84;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:86;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:87;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:88;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:90;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:92;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2 - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:94;Mech:DZM511_SENS_HUM2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 3 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:96;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:98;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:99;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:100;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3 - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:102;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:104;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 3 - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:106;Mech:DZM511_SENS_HUM3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 4 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:108;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:110;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:111;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:112;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4 - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:114;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:116;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 4 - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:118;Mech:DZM511_SENS_HUM4;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'���������� ���� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:120;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:122;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ���������';Frm:SS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:50;
    Index:123;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:124;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ������ 1';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1000;
    Index:126;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:128;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ���� - ������ 2';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1000;
    Index:130;Mech:DZM511_SENS_INLIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'������������ ��2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:132;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:134;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ���������';Frm:SS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:50;
    Index:135;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:136;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ������ 1';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:2000;
    Index:138;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:140;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2 - ������ 2';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:1;Max:3000;
    Index:142;Mech:DZM511_SENS_CO;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:144;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:146;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 1 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:147;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:148;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 1 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:150;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:152;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 1 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:154;Mech:DZM511_SENS_EVAP1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:156;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:158;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:159;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:160;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2 - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:162;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:164;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2 - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:166;Mech:DZM511_SENS_EVAP2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ���������� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:168;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ���������� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:170;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ���������� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:171;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ���������� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:172;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ���������� - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:174;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ���������� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:176;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ���������� - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:178;Mech:DZM511_SENS_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���������� �������� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:15*12+0;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:15*12+2;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� - ���������';Frm:SS;Ed:'Pa';TipSens:TipIzm;Min:0;Max:50;
    Index:15*12+3;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:15*12+4;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� - ������ 1';Frm:SSpS0;Ed:'Pa';TipSens:TipIzm;Min:0;Max:50;
    Index:15*12+6;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:15*12+8;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� - ������ 2';Frm:SSpS0;Ed:'Pa';TipSens:TipIzm;Min:1;Max:50;
    Index:15*12+10;Mech:DZM511_SENS_OP;AccessR:R_CONFIG;AccessW:W_CONFIG),

//(Name:'����������� ��������� 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:8;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'����������� ��������� 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:9;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

//(Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:10;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'���������� ��������';Frm:SSpS0;Ed:'��';TipSens:TipIzm;Min:-10;Max:100;
//    Index:11;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'����������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:16*12+0;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:16*12+2;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:16*12+3;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:16*12+4;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:16*12+6;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:16*12+8;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:16*12+10;Mech:DZM511_SENS_TOP;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:17*12+0;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:17*12+2;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:17*12+3;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:17*12+4;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:17*12+6;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:17*12+8;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:17*12+10;Mech:DZM511_SENS_SOIL;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:18*12+0;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:18*12+2;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:18*12+3;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:18*12+4;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:18*12+6;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:18*12+8;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:18*12+10;Mech:DZM511_SENS_GLASS;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����� AHU - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:19*12+0;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:19*12+2;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:19*12+3;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:19*12+4;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:19*12+6;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:19*12+8;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:19*12+10;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������ AHU - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:20*12+0;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:20*12+2;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:20*12+3;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:20*12+4;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:20*12+6;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:20*12+8;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:20*12+10;Mech:DZM511_SENS_INAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),


//(Name:'����������� ����� AHU';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:15;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'����������� ������ AHU';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
//    Index:16;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'��������� ������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:21*12+0;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:21*12+2;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:21*12+3;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:21*12+4;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ������ 1';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:21*12+6;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:21*12+8;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ����� - ������ 2';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:21*12+10;Mech:DZM511_SENS_FRAM_N;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� �� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:22*12+0;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:22*12+2;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:22*12+3;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:22*12+4;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ������ 1';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:22*12+6;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:22*12+8;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� �� - ������ 2';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:22*12+10;Mech:DZM511_SENS_FRAM_S;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:23*12+0;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:23*12+2;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:23*12+3;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:23*12+4;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ������ 1';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:23*12+6;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:23*12+8;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ - ������ 2';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:23*12+10;Mech:DZM511_SENS_SCR;AccessR:R_CONFIG;AccessW:W_CONFIG),



(Name:'����������� ������� 1 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:24*12+0;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:24*12+2;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:24*12+3;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:24*12+4;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:120;
    Index:24*12+6;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:24*12+8;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 1 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:120;
    Index:24*12+10;Mech:DZM511_SENS_WATER1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 2 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:25*12+0;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:25*12+2;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:25*12+3;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:25*12+4;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:25*12+6;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:25*12+8;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:25*12+10;Mech:DZM511_SENS_WATER2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 3 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:26*12+0;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:26*12+2;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:26*12+3;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:26*12+4;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:26*12+6;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:26*12+8;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:26*12+10;Mech:DZM511_SENS_WATER3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 4 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:27*12+0;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:27*12+2;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:27*12+3;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:27*12+4;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:27*12+6;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:27*12+8;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:27*12+10;Mech:DZM511_SENS_WATER4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 5 - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:28*12+0;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:28*12+2;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:28*12+3;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:28*12+4;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:28*12+6;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:28*12+8;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5 - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:28*12+10;Mech:DZM511_SENS_WATER5;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� AHU - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:29*12+0;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:29*12+2;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:29*12+3;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:29*12+4;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:29*12+6;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:29*12+8;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:29*12+10;Mech:DZM511_SENS_WATAHU;AccessR:R_CONFIG;AccessW:W_CONFIG)


{
(Name:'����������� ������� 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:20;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:21;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:22;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:23;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:24;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:25;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG)}
);

//================================================================================
//=====================�������
//================================================================================
const
    DZ_SumParsLevs=4;

var XNamesLevsC510:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ_SumInSens*8;Cfg:DZ_SumConfig;Kind:0)
     );


var NameInSensorsLevsC510:array [1..DZ_SumVisibleInSens*DZ_SumParsLevs] of TNameConst=(

(Name:'����������� ������� 1 - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:0;Mech:DZM_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 1 - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:2;Mech:DZM_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 1 - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:4;Mech:DZM_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 1 - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:6;Mech:DZM_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 2 - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:8;Mech:DZM_SENS_TEMP2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 2 - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:10;Mech:DZM_SENS_TEMP2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 2 - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:12;Mech:DZM_SENS_TEMP2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 2 - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:14;Mech:DZM_SENS_TEMP2;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 3 - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:16;Mech:DZM_SENS_TEMP3;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 3 - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:18;Mech:DZM_SENS_TEMP3;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 3 - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:20;Mech:DZM_SENS_TEMP3;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 3 - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:22;Mech:DZM_SENS_TEMP3;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 4 - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:24;Mech:DZM_SENS_TEMP4;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 4 - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:26;Mech:DZM_SENS_TEMP4;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 4 - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:28;Mech:DZM_SENS_TEMP4;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 4 - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:30;Mech:DZM_SENS_TEMP4;AccessR:RW_USER;AccessW:RW_USER),

(Name:'��������� ������� 1 - ������ ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:32;Mech:DZM_SENS_HUM1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������� 1 - ������ ����������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:34;Mech:DZM_SENS_HUM1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������� 1 - ������� ����������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:36;Mech:DZM_SENS_HUM1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������� 1 - ������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:38;Mech:DZM_SENS_HUM1;AccessR:RW_USER;AccessW:RW_USER),

(Name:'��������� ������� 2 - ������ ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:40;Mech:DZM_SENS_HUM2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������� 2 - ������ ����������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:42;Mech:DZM_SENS_HUM2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������� 2 - ������� ����������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:44;Mech:DZM_SENS_HUM2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������� 2 - ������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:46;Mech:DZM_SENS_HUM2;AccessR:RW_USER;AccessW:RW_USER),

(Name:'���������� ���� - ������ ��������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:100;
    Index:48;Mech:DZM_SENS_INLIGHT;AccessR:RW_USER;AccessW:RW_USER),
(Name:'���������� ���� - ������ ����������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:100;
    Index:50;Mech:DZM_SENS_INLIGHT;AccessR:RW_USER;AccessW:RW_USER),
(Name:'���������� ���� - ������� ����������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:100;
    Index:52;Mech:DZM_SENS_INLIGHT;AccessR:RW_USER;AccessW:RW_USER),
(Name:'���������� ���� - ������� ��������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:100;
    Index:54;Mech:DZM_SENS_INLIGHT;AccessR:RW_USER;AccessW:RW_USER),

(Name:'������������ ��2 - ������ ��������� �������';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:2000;
    Index:56;Mech:DZM_SENS_CO;AccessR:RW_USER;AccessW:RW_USER),
(Name:'������������ ��2 - ������ ����������� �������';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:2000;
    Index:58;Mech:DZM_SENS_CO;AccessR:RW_USER;AccessW:RW_USER),
(Name:'������������ ��2 - ������� ����������� �������';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:2000;
    Index:60;Mech:DZM_SENS_CO;AccessR:RW_USER;AccessW:RW_USER),
(Name:'������������ ��2 - ������� ��������� �������';Frm:SSSS;Ed:'ppm';TipSens:TipIzm;Min:0;Max:2000;
    Index:62;Mech:DZM_SENS_CO;AccessR:RW_USER;AccessW:RW_USER),

//+4

(Name:'����������� ����� - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:96;Mech:DZM_SENS_TOP;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ����� - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:98;Mech:DZM_SENS_TOP;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ����� - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:100;Mech:DZM_SENS_TOP;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ����� - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:102;Mech:DZM_SENS_TOP;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ����� - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:104;Mech:DZM_SENS_SOIL;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ����� - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:106;Mech:DZM_SENS_SOIL;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ����� - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:108;Mech:DZM_SENS_SOIL;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ����� - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:110;Mech:DZM_SENS_SOIL;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������ - ������ ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:-20;Max:50;
    Index:112;Mech:DZM_SENS_GLASS;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������ - ������ ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:-20;Max:50;
    Index:114;Mech:DZM_SENS_GLASS;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������ - ������� ����������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:-20;Max:50;
    Index:116;Mech:DZM_SENS_GLASS;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������ - ������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:-20;Max:50;
    Index:118;Mech:DZM_SENS_GLASS;AccessR:RW_USER;AccessW:RW_USER),

//+2

(Name:'��������� ������ ����� - ������ ��������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:136;Mech:DZM_SENS_FRAM_N;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ ����� - ������ ����������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:138;Mech:DZM_SENS_FRAM_N;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ ����� - ������� ����������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:140;Mech:DZM_SENS_FRAM_N;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ ����� - ������� ��������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:142;Mech:DZM_SENS_FRAM_N;AccessR:RW_USER;AccessW:RW_USER),

(Name:'��������� ������ �� - ������ ��������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:144;Mech:DZM_SENS_FRAM_S;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ �� - ������ ����������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:146;Mech:DZM_SENS_FRAM_S;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ �� - ������� ����������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:148;Mech:DZM_SENS_FRAM_S;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ �� - ������� ��������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:150;Mech:DZM_SENS_FRAM_S;AccessR:RW_USER;AccessW:RW_USER),

(Name:'��������� ������ - ������ ��������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:152;Mech:DZM_SENS_SCR;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ - ������ ����������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:154;Mech:DZM_SENS_SCR;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ - ������� ����������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:156;Mech:DZM_SENS_SCR;AccessR:RW_USER;AccessW:RW_USER),
(Name:'��������� ������ - ������� ��������� �������';Frm:SSSpS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:158;Mech:DZM_SENS_SCR;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 1 - ������ ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:160;Mech:DZM_SENS_WATER1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 1 - ������ ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:162;Mech:DZM_SENS_WATER1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 1 - ������� ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:164;Mech:DZM_SENS_WATER1;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 1 - ������� ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:166;Mech:DZM_SENS_WATER1;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 2 - ������ ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:168;Mech:DZM_SENS_WATER2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 2 - ������ ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:170;Mech:DZM_SENS_WATER2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 2 - ������� ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:172;Mech:DZM_SENS_WATER2;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 2 - ������� ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:174;Mech:DZM_SENS_WATER2;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 3 - ������ ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:176;Mech:DZM_SENS_WATER3;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 3 - ������ ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:178;Mech:DZM_SENS_WATER3;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 3 - ������� ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:180;Mech:DZM_SENS_WATER3;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 3 - ������� ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:182;Mech:DZM_SENS_WATER3;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 4 - ������ ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:184;Mech:DZM_SENS_WATER4;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 4 - ������ ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:186;Mech:DZM_SENS_WATER4;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 4 - ������� ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:188;Mech:DZM_SENS_WATER4;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 4 - ������� ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:190;Mech:DZM_SENS_WATER4;AccessR:RW_USER;AccessW:RW_USER),

(Name:'����������� ������� 5 - ������ ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:192;Mech:DZM_SENS_WATER5;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 5 - ������ ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:194;Mech:DZM_SENS_WATER5;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 5 - ������� ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:196;Mech:DZM_SENS_WATER5;AccessR:RW_USER;AccessW:RW_USER),
(Name:'����������� ������� 5 - ������� ��������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:198;Mech:DZM_SENS_WATER5;AccessR:RW_USER;AccessW:RW_USER)

);



//=================================================================================
//============== ���������� ������� �������� ======================================
//=================================================================================


var XNamesOutSensC510:array [1..1] of TXNames=(
    (Name:'��������';Frm:None;Ed:'';Index:0;Cfg:0;Kind:0)
     );


var NameOutSensorsC510:array [1..DZ_SumOutSens*DZ_SumParsSens] of TNameConst=(

(Name:'�������� ����������� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:0;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����������� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:2;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����������� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:3;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����������� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:4;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����������� - ������ 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:6;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����������� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:8;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����������� - ������ 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:10;Mech:DZM_SENS_OUT;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:12;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:14;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������ - ���������';Frm:SS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:50;
    Index:15;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:16;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������ - ������ 1';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1000;
    Index:18;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:20;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������ - ������ 2';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1000;
    Index:22;Mech:DZM_SENS_SUN;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'�������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:24;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:26;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����� - ���������';Frm:SS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:50;
    Index:27;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:28;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����� - ������ 1';Frm:SSpS0;Ed:'�/�';TipSens:TipIzm;Min:0;Max:50;
    Index:30;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:32;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����� - ������ 2';Frm:SSpS0;Ed:'�/�';TipSens:TipIzm;Min:1;Max:50;
    Index:34;Mech:DZM_SENS_WIND;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:36;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:38;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������';Frm:SS;Ed:'�';TipSens:TipIzm;Min:0;Max:50;
    Index:39;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:40;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 1';Frm:SSSS;Ed:'�';TipSens:TipIzm;Min:0;Max:360;
    Index:42;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:44;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� - ������ 2';Frm:SSSS;Ed:'�';TipSens:TipIzm;Min:1;Max:360;
    Index:46;Mech:DZM_SENS_WINDD;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:48;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:50;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ - ���������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:50;
    Index:51;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:52;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ - ������ 1';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:360;
    Index:54;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:56;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ - ������ 2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:1;Max:360;
    Index:58;Mech:DZM_SENS_RAIN;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'�������� ��������� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:60;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:62;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� - ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:50;
    Index:63;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:64;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� - ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:66;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:68;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� - ������ 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:1;Max:100;
    Index:70;Mech:DZM_SENS_OUTHUM;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:72;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:74;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:75;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:76;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:78;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:80;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:82;Mech:DZM_SENS_TSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:84;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:86;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� - ���������';Frm:SS;Ed:'�C';TipSens:TipIzm;Min:0;Max:50;
    Index:87;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:88;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� - ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:90;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:92;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� - ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:1;Max:150;
    Index:94;Mech:DZM_SENS_TRET;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'�������� ������ - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:96;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:98;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ - ���������';Frm:SS;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:50;
    Index:100;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:101;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ - ������ 1';Frm:SSpS0;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:15;
    Index:102;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:104;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ - ������ 2';Frm:SSpS0;Ed:'��/��2';TipSens:TipIzm;Min:1;Max:15;
    Index:106;Mech:DZM_SENS_PSUP;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'�������� ������� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:108;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:110;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� - ���������';Frm:SS;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:50;
    Index:111;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:112;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� - ������ 1';Frm:SSpS0;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:15;
    Index:114;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:116;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� - ������ 2';Frm:SSpS0;Ed:'��/��2';TipSens:TipIzm;Min:1;Max:15;
    Index:118;Mech:DZM_SENS_PRET;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ ����� - ���';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:561;Max:572;
    Index:120;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� - �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:30;
    Index:122;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� - ���������';Frm:SS;Ed:'�3/�';TipSens:TipIzm;Min:0;Max:50;
    Index:123;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� - ���������� 1';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:124;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� - ������ 1';Frm:SSSpS;Ed:'�3/�';TipSens:TipIzm;Min:0;Max:1000;
    Index:126;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� - ���������� 2';Frm:SSSS;Ed:'��';TipSens:TipIzm;Min:0;Max:5000;
    Index:128;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� - ������ 2';Frm:SSSpS;Ed:'�3/�';TipSens:TipIzm;Min:1;Max:1000;
    Index:130;Mech:DZM_SENS_VOL;AccessR:R_CONFIG;AccessW:W_CONFIG)
);

//==================================================================================

{
      //DZ_SumSensors=DZ_SumInSens+DZ_SumOutSens;
const DZ_SumAnOutputs=24;
      DZ_SumDigOutputs=22;
      DZ_SumOutputs=DZ_SumAnOutputs+DZ_SumDigOutputs;
const DZ_SumInputs=7;
      DZ_StartInputs=DZ_SumOutputs+1;
      DZ_StartInSens=DZ_StartInputs+DZ_SumInputs;
      DZ_StartOutSens=DZ_StartInSens+DZ_SumInSens;


var NameConfigC510:array [1..DZ_SumOutputs+DZ_SumInSens+DZ_SumOutSens+DZ_SumInputs] of TNameConst=(
(Name:'������������ ������ 1';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:0;Mech:DZM_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:1;Mech:DZM_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:2;Mech:DZM_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:3;Mech:DZM_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:4;Mech:DZM_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:5;Mech:DZM_VALVEAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� �����';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:6;Mech:DZM_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ��';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:7;Mech:DZM_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ ��������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:8;Mech:DZM_FRAM_UC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:9;Mech:DZM_SPEED_AHU;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� �������� �����������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:10;Mech:DZM_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �������� ����������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:11;Mech:DZM_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 1';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:12;Mech:DZM_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 2';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:13;Mech:DZM_SCREEN_TV2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 3';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:14;Mech:DZM_SCREEN_TV3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����������� ������� 4';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:15;Mech:DZM_SCREEN_TV4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:16;Mech:DZM_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:17;Mech:DZM_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:18;Mech:DZM_LIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:19;Mech:DZM_S_PUMP_AHU;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ 1';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:20;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 2';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:21;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 3';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:22;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 4';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:23;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),


(Name:'����� ������� 1';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:24;Mech:DZM_PUMP1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 2';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:25;Mech:DZM_PUMP2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 3';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:26;Mech:DZM_PUMP3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 4';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:27;Mech:DZM_PUMP4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 5';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:28;Mech:DZM_PUMP5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� AHU';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:29;Mech:DZM_PUMPAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'�����������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:30;Mech:DZM_VENT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:31;Mech:DZM_VAG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:32;Mech:DZM_COOL;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:33;Mech:DZM_SIO_PUMP;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:34;Mech:DZM_SIO_VALVES;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ���������� AHU';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:35;Mech:DZM_AHU_VALVES;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;
    Index:36;Mech:DZM_ALARM;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� 1';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:37;Mech:DZM_EXTREG1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 2';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:38;Mech:DZM_EXTREG2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 3';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:39;Mech:DZM_EXTREG3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� 4';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:40;Mech:DZM_EXTREG4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� 5';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:41;Mech:DZM_EXTREG5;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ 1';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:42;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 2';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:43;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 3';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:44;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ 4';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:1;
    Index:45;Mech:0;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

(Name:'������ ���������';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:46;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����������';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:47;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� 50%';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:48;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� 100%';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:49;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:50;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:51;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������������';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:0;Max:1;
    Index:52;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:53;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:54;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:55;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:56;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:5;Max:100;
    Index:57;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� 2';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:5;Max:100;
    Index:58;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���������� ����';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:1400;
    Index:59;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ��2';Frm:SSSS;Ed:'ppm/10';TipSens:TipIzm;Min:50;Max:3000;
    Index:60;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� 1';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:61;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� 2';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:62;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:63;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��������';Frm:SSpS0;Ed:'��';TipSens:TipIzm;Min:-10;Max:100;
    Index:64;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:65;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:30;
    Index:66;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:-30;Max:50;
    Index:67;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ����� AHU';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:68;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������ AHU';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:69;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������� �����';Frm:SSSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:70;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������� ��';Frm:SSSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:71;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������';Frm:SSSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
    Index:72;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ������� 1';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:73;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 2';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:74;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 3';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:75;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 4';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:76;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� 5';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:77;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� AHU';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:78;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:1;Max:50;
    Index:79;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������� ������';Frm:SSSS;Ed:'��/�2';TipSens:TipIzm;Min:0;Max:2000;
    Index:80;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� �����';Frm:SSpS0;Ed:'�/�';TipSens:TipIzm;Min:0;Max:40;
    Index:81;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� �����';Frm:SSSS;Ed:'�';TipSens:TipIzm;Min:0;Max:360;
    Index:82;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:10;
    Index:83;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:5;Max:100;
    Index:84;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ������� ����������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:85;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����������� ��������� ����������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:150;
    Index:86;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������� ����������';Frm:SSpS0;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:15;
    Index:87;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��������� ����������';Frm:SSpS0;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:15;
    Index:88;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������������';Frm:SSSS;Ed:'�3/�';TipSens:TipIzm;Min:0;Max:15;
    Index:89;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG)
);

}


//===============================================================================
//=============================== ��������� ��������� ����������� 510 ---------
//===============================================================================

const DZ_SumVisualRegs=16;
      DZ_SumParsMech=3;
      DZ_SumRegs=24;
      DZ_SizeParMech=8;


var XNamesMechC510:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ_SumRegs*DZ_SizeParMech;Cfg:DZ_SumConfig;Kind:0)
     );


var NameMechC510:array [1..DZ_SumVisualRegs*DZ_SumParsMech] of TNameConst=(

(Name:'������������ ������ 1 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:0;Mech:DZM_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:2;Mech:DZM_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:4;Mech:DZM_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:8;Mech:DZM_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:10;Mech:DZM_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:12;Mech:DZM_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 3 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:16;Mech:DZM_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:18;Mech:DZM_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:20;Mech:DZM_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 4 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:24;Mech:DZM_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:26;Mech:DZM_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:28;Mech:DZM_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 5 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:32;Mech:DZM_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:34;Mech:DZM_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:36;Mech:DZM_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� ����� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:48;Mech:DZM_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:50;Mech:DZM_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:52;Mech:DZM_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� �� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:56;Mech:DZM_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� �� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:58;Mech:DZM_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� �� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:60;Mech:DZM_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),

//(Name:'������ ������ ��������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
//    Index:8;Mech:DZM_FRAM_UC;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'�������� AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
//    Index:9;Mech:DZM_SPEED_AHU;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'����� ����������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:80;Mech:DZM_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:82;Mech:DZM_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:84;Mech:DZM_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ���������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:88;Mech:DZM_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ���������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:90;Mech:DZM_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ���������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:92;Mech:DZM_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������������ 1 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:96;Mech:DZM_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:98;Mech:DZM_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:100;Mech:DZM_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������������ 2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:104;Mech:DZM_SCREEN_TV2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:106;Mech:DZM_SCREEN_TV2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:108;Mech:DZM_SCREEN_TV2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������������ 3 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:112;Mech:DZM_SCREEN_TV3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:114;Mech:DZM_SCREEN_TV3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:116;Mech:DZM_SCREEN_TV3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������������ 4 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:120;Mech:DZM_SCREEN_TV4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:122;Mech:DZM_SCREEN_TV4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:124;Mech:DZM_SCREEN_TV4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ CO2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:128;Mech:DZM_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:130;Mech:DZM_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:132;Mech:DZM_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� �������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:136;Mech:DZM_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� �������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:138;Mech:DZM_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� �������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:140;Mech:DZM_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:144;Mech:DZM_LIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:146;Mech:DZM_LIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:148;Mech:DZM_LIGHT;AccessR:R_CONFIG;AccessW:W_CONFIG)

//(Name:'�������� ������ AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
//    Index:19;Mech:DZM_S_PUMP_AHU;AccessR:R_CONFIG;AccessW:W_CONFIG),

);

//===============================================================================
//=============================== ��������� ��������� ����������� 511 ---------
//===============================================================================

const
      DZ511_SumParsMech=3;
      DZ511_SumRegs=24;
      DZ511_SizeParMech=8;


var XNamesMechC511:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ511_SumRegs*DZ511_SizeParMech;Cfg:DZ511_SumConfig;Kind:0)
     );


var NameMechC511:array [1..(DZ511_SumRegs-4)*DZ511_SumParsMech] of TNameConst=(

(Name:'������������ ������ 1 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:0;Mech:DZM511_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:2;Mech:DZM511_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:4;Mech:DZM511_VALVE1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:1*DZ511_SizeParMech+0;Mech:DZM511_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:1*DZ511_SizeParMech+2;Mech:DZM511_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:1*DZ511_SizeParMech+4;Mech:DZM511_VALVE2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 3 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:2*DZ511_SizeParMech+0;Mech:DZM511_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:2*DZ511_SizeParMech+2;Mech:DZM511_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:2*DZ511_SizeParMech+4;Mech:DZM511_VALVE3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 4 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:3*DZ511_SizeParMech+0;Mech:DZM511_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:3*DZ511_SizeParMech+2;Mech:DZM511_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:3*DZ511_SizeParMech+4;Mech:DZM511_VALVE4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ 5 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:4*DZ511_SizeParMech+0;Mech:DZM511_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:4*DZ511_SizeParMech+2;Mech:DZM511_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:4*DZ511_SizeParMech+4;Mech:DZM511_VALVE5;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ ������ AHU - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:5*DZ511_SizeParMech+0;Mech:DZM511_VALVEAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ AHU - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:5*DZ511_SizeParMech+2;Mech:DZM511_VALVEAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ AHU - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:5*DZ511_SizeParMech+4;Mech:DZM511_VALVEAHU;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'������� ����� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:6*DZ511_SizeParMech+0;Mech:DZM511_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:6*DZ511_SizeParMech+2;Mech:DZM511_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:6*DZ511_SizeParMech+4;Mech:DZM511_FRAM_NORTH;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� �� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:7*DZ511_SizeParMech+0;Mech:DZM511_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� �� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:7*DZ511_SizeParMech+2;Mech:DZM511_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� �� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:7*DZ511_SizeParMech+4;Mech:DZM511_FRAM_SOUTH;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� ����� 2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:8*DZ511_SizeParMech+0;Mech:DZM511_FRAM_NORTH2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:8*DZ511_SizeParMech+2;Mech:DZM511_FRAM_NORTH2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:8*DZ511_SizeParMech+4;Mech:DZM511_FRAM_NORTH2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� ����� 3 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:9*DZ511_SizeParMech+0;Mech:DZM511_FRAM_NORTH3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:9*DZ511_SizeParMech+2;Mech:DZM511_FRAM_NORTH3;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 3 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:9*DZ511_SizeParMech+4;Mech:DZM511_FRAM_NORTH3;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� ����� 4 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:10*DZ511_SizeParMech+0;Mech:DZM511_FRAM_NORTH4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:10*DZ511_SizeParMech+2;Mech:DZM511_FRAM_NORTH4;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 4 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:10*DZ511_SizeParMech+4;Mech:DZM511_FRAM_NORTH4;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ ������ �������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:11*DZ511_SizeParMech+0;Mech:DZM511_FRAM_UC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ �������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:11*DZ511_SizeParMech+2;Mech:DZM511_FRAM_UC;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ �������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:11*DZ511_SizeParMech+4;Mech:DZM511_FRAM_UC;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'�������� AHU 1 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:12*DZ511_SizeParMech+0;Mech:DZM511_SPEED_AHU1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'�������� AHU 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:12*DZ511_SizeParMech+2;Mech:DZM511_SPEED_AHU1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'�������� AHU 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:12*DZ511_SizeParMech+4;Mech:DZM511_SPEED_AHU1;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

(Name:'�������� AHU 2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:13*DZ511_SizeParMech+0;Mech:DZM511_SPEED_AHU2;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'�������� AHU 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:13*DZ511_SizeParMech+2;Mech:DZM511_SPEED_AHU2;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'�������� AHU 2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:13*DZ511_SizeParMech+4;Mech:DZM511_SPEED_AHU2;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),


//(Name:'������ ������ ��������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
//    Index:8;Mech:DZM511_FRAM_UC;AccessR:R_CONFIG;AccessW:W_CONFIG),
//(Name:'�������� AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
//    Index:9;Mech:DZM511_SPEED_AHU;AccessR:R_CONFIG;AccessW:W_CONFIG),


(Name:'����� ����������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:14*DZ511_SizeParMech+0;Mech:DZM511_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:14*DZ511_SizeParMech+2;Mech:DZM511_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:14*DZ511_SizeParMech+4;Mech:DZM511_SCREEN_TG;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ���������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:15*DZ511_SizeParMech+0;Mech:DZM511_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ���������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:15*DZ511_SizeParMech+2;Mech:DZM511_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ���������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:15*DZ511_SizeParMech+4;Mech:DZM511_SCREEN_HG;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������������ 1 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:16*DZ511_SizeParMech+0;Mech:DZM511_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:16*DZ511_SizeParMech+2;Mech:DZM511_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������������ 1 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:16*DZ511_SizeParMech+4;Mech:DZM511_SCREEN_TV1;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ CO2 - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:17*DZ511_SizeParMech+0;Mech:DZM511_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:17*DZ511_SizeParMech+2;Mech:DZM511_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ CO2 - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:17*DZ511_SizeParMech+4;Mech:DZM511_CO2;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� �������� - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:18*DZ511_SizeParMech+0;Mech:DZM511_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� �������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:18*DZ511_SizeParMech+2;Mech:DZM511_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� �������� - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:18*DZ511_SizeParMech+4;Mech:DZM511_PRES_REG;AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������������ - ����� ����';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:4000;
    Index:19*DZ511_SizeParMech+0;Mech:DZM511_LIGHT;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������������ - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:19*DZ511_SizeParMech+2;Mech:DZM511_LIGHT;AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������������ - �-�����������';Frm:SSpSSS;Ed:'% �� 1';TipSens:TipIzm;Min:0;Max:10;
    Index:19*DZ511_SizeParMech+4;Mech:DZM511_LIGHT;AccessR:RW_INVISIBLE;AccessW:W_CONFIG)

//(Name:'�������� ������ AHU';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
//    Index:19;Mech:DZM_S_PUMP_AHU;AccessR:R_CONFIG;AccessW:W_CONFIG),

);

//===============================================================================
// ------- ��������� ���������� ����������� 510 ---------
//===============================================================================


const        DZ_SumParUpr=           22;
             DZ_iMaxTPipe=           5;
             DZ_iMinTPipe=           DZ_iMaxTPipe+8*2;
             DZ_iOptTPipe=           DZ_iMinTPipe+3*2;
             DZ_iPID=                DZ_iOptTPipe+2*2;
             DZ_iVScr=               DZ_iPID+4*2;
             DZ_iScr=                DZ_iVScr+2;
             DZ_EndParUpr=           DZ_iScr+5*2+40;
             DZ_SizeParUpr=           86;

var XNamesParsC510:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ_SizeParUpr;Cfg:DZ_SumConfig;Kind:0)
     );

var DZ_NameParUpr:array [1..DZ_SumParUpr] of TNameConst=(

         (Name:'������ 1 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:95;Def:0;Index:DZ_iMaxTPipe;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 2 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ_iMaxTPipe+2;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 3 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ_iMaxTPipe+4;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 4 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iMaxTPipe+6;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 5 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ_iMaxTPipe+8;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ �������� ������������ �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iMaxTPipe+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ �������� ����������� �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iMaxTPipe+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ����������� - ����������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iScr;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ���������� - ����������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iScr+2;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_GUEST),

//         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iMinTPipe;Mech:DZM_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe;Mech:DZM_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ_iMinTPipe+2;Mech:DZM_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe+2;Mech:DZM_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:3;Def:0;Index:DZ_iMinTPipe+4;Mech:DZM_PRES_REG;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'������ 5 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe+4;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ��������� - ���� ���������������� ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:2.45;Index:DZ_iPID+2;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.02;Max:20;Def:3.5;Index:DZ_iPID+4;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ���� ���������������� ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:2.45;Index:DZ_iPID+6;Mech:DZM_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:3.5;Index:DZ_iPID;Mech:DZM_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ - ������ ������������ ������� 1';Frm:SS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:DZ_iVScr;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ������������ - ����� ������������ ������� 1';Frm:SS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:90;Index:DZ_iVScr+1;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����������� ������� ��2 (0-��������, 1-������)';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:1;Def:HIDE_MIN_MAX;Index:DZ_iScr+4;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���������� �������� C��';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:8;Index:DZ_iScr+6;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���-�� �������� ��������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:10;Index:DZ_iScr+8;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST)
         );

//===============================================================================
// ------- ��������� ���������� ����������� 511 ---------
//===============================================================================


const        DZ511_SumParUpr=           22;
             DZ511_iMaxTPipe=           5;
             DZ511_iMinTPipe=           DZ511_iMaxTPipe+8*2;
             DZ511_iOptTPipe=           DZ511_iMinTPipe+3*2;
             DZ511_iPID=                DZ511_iOptTPipe+2*2;
             DZ511_iVScr=               DZ511_iPID+4*2;
             DZ511_iScr=                DZ511_iVScr+2;
             DZ511_EndParUpr=           DZ511_iScr+5*2+40;
             DZ511_SizeParUpr=           86;

var XNamesParsC511:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ511_SizeParUpr;Cfg:DZ511_SumConfig;Kind:0)
     );

var DZ511_NameParUpr:array [1..DZ511_SumParUpr] of TNameConst=(

         (Name:'������ 1 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:95;Def:0;Index:DZ511_iMaxTPipe;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 2 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ511_iMaxTPipe+2;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 3 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ511_iMaxTPipe+4;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 4 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ511_iMaxTPipe+6;Mech:DZM511_VALVE4;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 5 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ511_iMaxTPipe+8;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ UC - ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ511_iMaxTPipe+12;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ511_iMaxTPipe+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ����������� - ����������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ511_iScr;Mech:DZM511_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ���������� - ����������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ511_iScr+2;Mech:DZM511_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_GUEST),

//         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iMinTPipe;Mech:DZM_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ511_iOptTPipe;Mech:DZM511_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ511_iMinTPipe+2;Mech:DZM511_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ511_iOptTPipe+2;Mech:DZM511_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:3;Def:0;Index:DZ511_iMinTPipe+4;Mech:DZM511_PRES_REG;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'������ 5 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe+4;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ��������� - ���� ���������������� ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:2.45;Index:DZ511_iPID+2;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.02;Max:20;Def:3.5;Index:DZ511_iPID+4;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ���� ���������������� ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:2.45;Index:DZ511_iPID+6;Mech:DZM511_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:3.5;Index:DZ511_iPID;Mech:DZM511_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ - ������ ������������ ������� 1';Frm:SS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:DZ511_iVScr;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ������������ - ����� ������������ ������� 1';Frm:SS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:90;Index:DZ511_iVScr+1;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����������� ������� ��2 (0-��������, 1-������)';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:1;Def:HIDE_MIN_MAX;Index:DZ511_iScr+4;Mech:DZM511_CO2;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���������� �������� C��';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:8;Index:DZ511_iScr+6;Mech:DZM511_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���-�� �������� ��������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:10;Index:DZ511_iScr+8;Mech:DZM511_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST)
         );


//===============================================================================
//************************ 511 ���� ������������*****************************
//===============================================================================

const
      DZ511_iFanConnect=1;
      DZ511_iFanMotor=2;
      DZ511_iFanSpeed=3;
      DZ511_iFanPower=4;
      DZ511_iFanLoad=5;

      DZ511_SumFans=64;
      DZ511_SumFanPars=5;
      DZ511_SizeFan=9;
      DZ511_SumFullFans=DZ511_SumFans*DZ511_SizeFan+3;

var XNamesFansC511:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ511_SumFullFans;Cfg:0;Kind:0)
     );

var NameFans:array [1..DZ511_SumFanPars] of TNameConst=(
 (Name:'���������� - ��������� �����';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:256;Def:HIDE_MIN_MAX;
    Index:0;Mech:DZM511_SUC; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'���������� - ��������� ������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:256;Def:HIDE_MIN_MAX;
    Index:1;Mech:DZM511_SUC; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'���������� - ������� ��������';Frm:SSSS;Ed:'��/���';TipSens:TipControl;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:3;Mech:DZM511_SUC; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'���������� - ������� ��������';Frm:SSSS;Ed:'��';TipSens:TipControl;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:5;Mech:DZM511_SUC; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'���������� - ��������';Frm:SSSS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:7;Mech:DZM511_SUC; AccessR:RW_GUEST;AccessW:RW_USER)

        );







//===============================================================================
//--------- START STRATEGY 510------------------
//===============================================================================

const DZ_SumKStrategy=5;
      DZ_SupParStrategy=4;
      DZ_SumFullStrategy=8;
      DZ_SizeStrateg=7;

var XNamesStrategyC510:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ_SumFullStrategy*DZ_SizeStrateg;Cfg:DZ_SumConfig;Kind:0)
     );

var NameStrategy:array [1..DZ_SumKStrategy*DZ_SupParStrategy] of TNameConst=(
 (Name:'������ ������� 1 - ������� � �������';Frm:mSS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;GridColor:$0030df;Mech:DZM_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 1 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:1;GridColor:$0030df;Mech:DZM_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 1 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:2;GridColor:$0030df;Mech:DZM_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 1 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:4;GridColor:$0030df;Mech:DZM_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 2 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:7;GridColor:$0030df;Mech:DZM_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 2 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:8;GridColor:$0030df;Mech:DZM_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 2 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:9;GridColor:$0030df;Mech:DZM_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 2 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:11;GridColor:$0030df;Mech:DZM_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 3 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:14;GridColor:$0030df;Mech:DZM_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 3 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:15;GridColor:$0030df;Mech:DZM_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 3 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:16;GridColor:$0030df;Mech:DZM_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 3 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:18;GridColor:$0030df;Mech:DZM_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 4 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:21;GridColor:$0030df;Mech:DZM_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 4 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:22;GridColor:$0030df;Mech:DZM_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 4 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:23;GridColor:$0030df;Mech:DZM_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 4 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:25;GridColor:$0030df;Mech:DZM_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 5 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:26;GridColor:$0030df;Mech:DZM_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 5 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:27;GridColor:$0030df;Mech:DZM_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 5 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:28;GridColor:$0030df;Mech:DZM_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 5 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:30;GridColor:$0030df;Mech:DZM_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER)
        );

//===============================================================================
//--------- START STRATEGY 511------------------
//===============================================================================

const DZ511_SumKStrategy=5;
      DZ511_SupParStrategy=4;
      DZ511_SumFullStrategy=8;
      DZ511_SizeStrateg=7;

var XNamesStrategyC511:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ511_SumFullStrategy*DZ511_SizeStrateg;Cfg:DZ511_SumConfig;Kind:0)
     );

var NameStrategy511:array [1..DZ511_SumKStrategy*DZ511_SupParStrategy] of TNameConst=(
 (Name:'������ ������� 1 - ������� � �������';Frm:mSS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;GridColor:$0030df;Mech:DZM511_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 1 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:1;GridColor:$0030df;Mech:DZM511_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 1 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:2;GridColor:$0030df;Mech:DZM511_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 1 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:4;GridColor:$0030df;Mech:DZM511_PUMP1; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 2 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:7;GridColor:$0030df;Mech:DZM511_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 2 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:8;GridColor:$0030df;Mech:DZM511_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 2 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:9;GridColor:$0030df;Mech:DZM511_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 2 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:11;GridColor:$0030df;Mech:DZM511_PUMP2; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 3 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:14;GridColor:$0030df;Mech:DZM511_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 3 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:15;GridColor:$0030df;Mech:DZM511_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 3 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:16;GridColor:$0030df;Mech:DZM511_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 3 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:18;GridColor:$0030df;Mech:DZM511_PUMP3; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 4 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:21;GridColor:$0030df;Mech:DZM511_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 4 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:22;GridColor:$0030df;Mech:DZM511_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 4 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:23;GridColor:$0030df;Mech:DZM511_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 4 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:25;GridColor:$0030df;Mech:DZM511_PUMP4; AccessR:RW_GUEST;AccessW:RW_USER),

 (Name:'������ ������� 5 - ������� � �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:26;GridColor:$0030df;Mech:DZM511_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 5 - ������� � ���������� ���������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:27;GridColor:$0030df;Mech:DZM511_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 5 - �������� ������������ �������������';Frm:mSS;Ed:'';TipSens:TipControl;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:28;GridColor:$0030df;Mech:DZM511_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER),
 (Name:'������ ������� 5 - �������������';Frm:SS;Ed:'';TipSens:TipControl;Min:10;Max:100;Def:HIDE_MIN_MAX;
    Index:30;GridColor:$0030df;Mech:DZM511_PUMP5; AccessR:RW_GUEST;AccessW:RW_USER)
        );

//===============================================================================
// ------- ��������� ������� ����������� 510 ---------
//===============================================================================

const        DZ_SumParTune=         125;//109;
             DZ_iSunToClim=          0;
             DZ_iSunToMinFram=       DZ_iSunToClim+24;
             DZ_iTfram=              DZ_iSunToClim+15*2;
             DZ_iTask5Kon=           DZ_iTfram+5*2;
             DZ_iPAirToWater=        DZ_iTask5Kon+3*2;
             DZ_iCalcWater=          DZ_iPAirToWater+2*2;
             DZ_iParFram=            DZ_iCalcWater+25*2;
             DZ_iFram=               DZ_iParFram+2*2;
             DZ_iSunToFram=          DZ_iFram+12*2;
             DZ_iCO2=                DZ_iSunToFram+3*2;
             DZ_iScreen=             DZ_iCO2+2*2;
             DZ_iSiod=               DZ_iScreen+20*2;
             DZ_iVentil=             DZ_iSiod+11*2;
             DZ_iCalorifer=          DZ_iVentil+3*2;
             DZ_iConst=              DZ_iCalorifer+2*2;
             DZ_iSACAlg=             DZ_iConst+3*2;
             DZ_iDelPup=             DZ_iSACAlg+6*2;
             DZ_iScreenGlass=        DZ_iDelPup+2;
             DZ_iParAirToWater=      DZ_iScreenGlass+8;//iDelPup+2;
             DZ_iMinKontRH=          DZ_iParAirToWater+4;
             DZ_iRezTune=            DZ_iMinKontRH+4*2;    // � ��������� ����� �������� ��
             DZ_iScreenCloseSpeed=   DZ_iMinKontRH+5*2;     // NEW
             //DZ_EndTune=DZ_iRezTune+16*2;
             DZ_EndTune=DZ_iRezTune+17*2;

var DZ_NameTuneClimate:array [1..DZ_SumParTune] of TNameConst=(
         (Name:'������� - ��������� ������������ ������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:DZ_iParAirToWater+2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ �������� ������ �� ��������� ��������� ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:DZ_iSunToClim;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ ������ �� ��������� ��������� ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:500;Index:DZ_iSunToClim+2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iSunToClim+4;Mech:DZM_SHEATING;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ���������� - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iSunToClim+6;Mech:DZM_SVENTILATION;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'��������� ������ - ������ ��������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:30;Def:0;Index:DZ_iSunToClim+10;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������������ ��2 - ������ ����������� ��';Frm:SSSS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:500;Def:000;Index:DZ_iSunToClim+16;Mech:DZM_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������� 1 - ������ ��������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:10;Index:DZ_iSunToClim+22;Mech:DZM_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������� 5 - ������ ����������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iSunToClim+24;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������ - ������ ����������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ_iSunToMinFram+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ��������� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:50;Def:10;Index:DZ_iCalcWater+20;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:200;Max:800;Def:500;Index:DZ_iCalcWater+22;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ_iCalcWater+24;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         // NEW
         (Name:'� ��������� - ����� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ_iRezTune;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ���������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ_iSunToClim+14;Mech:DZM_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)�������� ������ ��� ';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:3;Index:DZ_iCalcWater+8;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:50;Def:20;Index:DZ_iCalcWater+10;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:10;Index:DZ_iCalcWater+12;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)�������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:4;Index:DZ_iCalcWater+26;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:20;Max:80;Def:50;Index:DZ_iCalcWater+28;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:123;Index:DZ_iCalcWater+30;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:60;Index:DZ_iSunToClim+18;Mech:DZM_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ��������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:6;Def:1.5;Index:DZ_iCalcWater+32;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ����� ������ ��';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:6;Max:25;Def:15;Index:DZ_iCalcWater+34;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ����� �������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ_iCalcWater+36;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ����� �������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ_iScreen+16;Mech:DZM_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ��������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iCalcWater+48;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - �������� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:3;Index:DZ_iCalcWater+44;Mech:DZM_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� - ���������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ_iSACAlg+2;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'� ������� - ������ ��������� ������ (0 - �� ���������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iCalcWater+14;Mech:DZM_SHEATING;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ������� ��������� ������ (0 - �� ���������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:DZ_iFram+4;Mech:DZM_SHEATING;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ����������� ��������';Frm:SpS;Ed:'';TipSens:TipCalc;Min:0;Max:3;Def:2;Index:DZ_iPAirToWater+5;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

//         (Name:'������ �������� - �������� ����������';Frm:SSpS0;Ed:'�C*���';TipSens:TipCalc;Min:1;Max:8;Def:4;Index:DZ_iDelPup;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ �������� - ��������� ��������� ��� ������ �������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:DZ_iCalcWater+16;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ �������� - ��������� ��������� ��� (����-�����) ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-2;Max:5;Def:2;Index:DZ_iCalcWater+18;Mech:DZM_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'������ 1,2 - (RH���-RH���) �������� ������ �� ������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ_iMinKontRH;Mech:DZM_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 1,2 - (RH���-RH���) ������ �� ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:DZ_iMinKontRH+2;Mech:DZM_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 1 - (RH���-RH���) ����������� ������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iMinKontRH+4;Mech:DZM_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 2 - (RH���-RH���) ����������� ������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iMinKontRH+6;Mech:DZM_VALVE2;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������ 5 - �������� � �������, ���� ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-15;Max:10;Def:5;Index:DZ_iTask5Kon;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��������, ���� ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-25;Max:10;Def:-5;Index:DZ_iCalcWater+6;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��� ����� �������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:130;Def:60;Index:DZ_iTask5Kon+4;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��������, ��� ����� � ����� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-25;Max:5;Def:-10;Index:DZ_iCalcWater+4;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - �������� ����� ��������� ������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ_iCalcWater+3;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������� - (RH���-RH���) �������� ������ �� ������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ_iTFram;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ������ �� ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:DZ_iTFram+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ����������� ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iTFram+8;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ��������� ����������� ���������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ_iTFram+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) �������� ������ �� �������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ_iTFram+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ������ �� �������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:DZ_iTFram+6;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ��������� �������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iTFram+9;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ����������� ����������� ���������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ_iSunToClim+20;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������� - ����� ���� ��������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-15;Max:10;Def:-5;Index:DZ_iFram+16;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ��� ����� ��������� ��������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:DZ_iFram+18;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Def:5;Index:DZ_iSunToFram;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ����� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:30;Def:25;Index:DZ_iSunToFram+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ����� ����������� �������� �';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ_iSunToFram+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'������� - ����������� ����� ��� ������� �����������';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:0.1;Max:5;Def:1;Index:DZ_iFram+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - ����� ��������� ����������� ������� ���';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:1;Max:25;Def:15;Index:DZ_iFram+8;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ����� ��������� ������������ ������� ���';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:5;Max:35;Def:20;Index:DZ_iFram+10;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ������������� �������� ��';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:60;Def:20;Index:DZ_iFram+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'������� - ��������� �����������, ���� ������������ ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:100;Index:DZ_iCalcWater+2;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������� - ����������� ����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:600;Def:2;Index:DZ_iFram+6;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ���������� ��� �� ������ ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:1;Max:40;Def:2;Index:DZ_iFram+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:2;Index:DZ_iParFram+1;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ����������� ��� �� ������ ������ ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:1;Max:5;Def:2;Index:DZ_iParFram;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:20;Max:100;Def:50;Index:DZ_iParFram+3;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ����������� ��� �� ������� ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:1;Max:5;Def:4;Index:DZ_iParFram+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:50;Max:200;Def:100;Index:DZ_iParFram+5;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ����������� ��� ����� �� ���������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:1;Max:10;Def:6;Index:DZ_iParFram+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//         (Name:'������� - ������������� �������� ��';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:60;Def:20;Index:DZ_iFram+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
//         (Name:'������� - �������� ��� ���������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:1;Def:1;
//            Index:DZ_iPAirToWater+3;Mech:0;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ���������� ���������� �� �������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:20;Def:10;
            Index:DZ_iPAirToWater+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'��2 - �-�����������';Frm:SSpSSS;Ed:'%/ppm';TipSens:TipCalc;Min:0;Max:3;Def:0.04;Index:DZ_iCO2;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'��2 - �-�����������';Frm:SSpSSS;Ed:'%/ppm';TipSens:TipCalc;Min:0;Max:10;Def:0.04;Index:DZ_iSACAlg;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - ����� ��������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:30;Def:1;Index:DZ_iFram+22;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - �������� ������������������';Frm:SS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:150;Def:100;Index:DZ_iFram+23;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - ������������ �����';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:100;Def:60;Index:DZ_iFram+20;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - ����������� �����';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:40;Def:30;Index:DZ_iFram+21;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'��������� �������� - ���� ����������������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;Min:0;Max:0.5;Def:0.04;Index:DZ_iCO2+2;Mech:DZM_PRES_REG;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'��2 - �������� �� �������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:5;
            Index:DZ_iSunToClim+12;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'����� ����������� - ����� ������������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:20;Def:6;
            Index:DZ_iScreen+4;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ������ ����������� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:5;
            Index:DZ_iScreen+2;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� ���������� - ����� ������������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-20;Max:12;Def:-10;
            Index:DZ_iScreen+8;Mech:DZM_SCREEN_HG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - ������ ������������� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1200;Def:750;
            Index:DZ_iScreen;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - (T���-T���) �������� ������ �� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:DZ_iConst;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - (T���-T���) ������ �� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ_iConst+2;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - (T���-T���) ��������� ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:500;Def:200;Index:DZ_iConst+4;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� ������������ - ����� ������������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-20;Max:12;Def:10;
            Index:DZ_iScreen+6;Mech:DZM_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������������ - ������ �����������, ����� �����������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:600;Def:200;
            Index:DZ_iScreen+14;Mech:DZM_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������������ - ������ ����������� ��� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1200;Def:600;
            Index:DZ_iScreen+12;Mech:DZM_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� ������������ - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:15;Def:1.5;
            Index:DZ_iScreen+10;Mech:DZM_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),

//        (Name:'����� ����������� - ��������� ������������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:35;
//            Index:DZ_iScreen+18;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� - �������������� ���� 1 ������ �';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:30;Max:100;Def:50;
            Index:DZ_iScreen+26;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 1 ������ ����';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:10;Def:4;
            Index:DZ_iScreen+28;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 1 ����� ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:2;
            Index:DZ_iScreen+30;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 2 ������ �';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:50;Max:100;Def:80;
            Index:DZ_iScreen+32;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 2 ������ ����';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:10;Def:2;
            Index:DZ_iScreen+34;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 2 ����� ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:1;
            Index:DZ_iScreen+36;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ��������� ���� ��� ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:2;
            Index:DZ_iScreen+38;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������ ������������/�������������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:360;Def:60;
            Index:DZ_iScreenGlass+6;Mech:DZM_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'����� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-40;Max:10;Def:-20;Index:DZ_iScreen+20;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
//         (Name:'����� - ����� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-5;Max:20;Def:5;Index:DZ_iScreen+22;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
//         (Name:'����� - ����� ����������� �������� �';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ_iScreen+24;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'����� - ������� �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:20;Def:5;Index:DZ_iCalcWater+38;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - ������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Def:-5;Index:DZ_iCalcWater+40;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - ������� ��������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ_iCalcWater+42;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
  // NEW
         (Name:'����� �����������, ���������� �������� ��������';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:1;Max:10;Def:1;Index:DZ_iScreenCloseSpeed;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'����� - (RH���-RH���) �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:10;Index:DZ_iSACAlg+6;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:60;Def:30;Index:DZ_iSACAlg+8;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) ��������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:70;Def:0;Index:DZ_iSACAlg+10;Mech:DZM_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'�������� - �������� 50%, ���� ������ ������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:900;Def:250;Index:DZ_iScreenGlass;Mech:DZM_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'�������� - �������� 100%, ���� ������ ������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:600;Def:150;Index:DZ_iScreenGlass+2;Mech:DZM_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'�������� - ���������/���������� ����������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:300;Def:30;Index:DZ_iScreenGlass+4;Mech:DZM_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'�������� - �������� ��������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:300;Def:5;Index:DZ_iParAirToWater;Mech:DZM_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'���� - ��������,���� ����������� ������ ������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:DZ_iSiod+8;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������,���� ����������� ������ ������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:DZ_iSiod;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������� ������ ������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ_iSiod+4;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������ ���������� ������ ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:180;Def:40;Index:DZ_iSiod+2;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������� ���������� � ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:120;Def:20;Index:DZ_iSiod+6;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��������,���� ��������� ������ ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:20;Index:DZ_iSiod+18;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������,���� ��������� ������ ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:10;Index:DZ_iSiod+10;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��������� ������ ������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:60;Def:40;Index:DZ_iSiod+14;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������ ��������� ���� ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:180;Def:40;Index:DZ_iSiod+12;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������� ��������� ���� ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:120;Def:20;Index:DZ_iSiod+16;Mech:DZM_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����������� - ��������, ���� ��������������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iVentil;Mech:DZM_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:100;Def:10;Index:DZ_iVentil+2;Mech:DZM_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - ����� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:100;Def:10;Index:DZ_iVentil+4;Mech:DZM_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - �����������, ���� ������� ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:DZ_iSACAlg+4;Mech:DZM_VENT;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'��������� ������� - ��������,���� ����������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ_iCalorifer;Mech:DZM_VAG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� ������� - ���������,���� ����������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ_iCalorifer+2;Mech:DZM_VAG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����������� - �������� (������� �������),���� (�����-����) ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ_iSunToClim+8;Mech:DZM_VAG;AccessR:RW_GUESTI;AccessW:RW_USER)

         );
//===============================================================================

//===============================================================================
// ------- ��������� ������� ����������� 511 ---------
//===============================================================================

const        DZ511_SumParTune=         124;//109;
             DZ511_iSunToClim=          0;
             DZ511_iSunToMinFram=       DZ511_iSunToClim+24;
             DZ511_iTfram=              DZ511_iSunToClim+15*2;
             DZ511_iTask5Kon=           DZ511_iTfram+5*2;
             DZ511_iPAirToWater=        DZ511_iTask5Kon+3*2;
             DZ511_iCalcWater=          DZ511_iPAirToWater+2*2;
             DZ511_iParFram=            DZ511_iCalcWater+25*2;
             DZ511_iFram=               DZ511_iParFram+2*2;
             DZ511_iSunToFram=          DZ511_iFram+12*2;
             DZ511_iCO2=                DZ511_iSunToFram+3*2;
             DZ511_iScreen=             DZ511_iCO2+2*2;
             DZ511_iSiod=               DZ511_iScreen+20*2;
             DZ511_iVentil=             DZ511_iSiod+11*2;
             DZ511_iCalorifer=          DZ511_iVentil+3*2;
             DZ511_iConst=              DZ511_iCalorifer+2*2;
             DZ511_iSACAlg=             DZ511_iConst+3*2;
             DZ511_iDelPup=             DZ511_iSACAlg+6*2;
             DZ511_iScreenGlass=        DZ511_iDelPup+2;
             DZ511_iParAirToWater=      DZ511_iScreenGlass+8;//iDelPup+2;
             DZ511_iRezTune=            DZ511_iParAirToWater+4;
             DZ511_EndTune=DZ511_iRezTune+20*2;

var DZ511_NameTuneClimate:array [1..DZ511_SumParTune] of TNameConst=(
         (Name:'������� - ��������� ������������ ������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:DZ511_iParAirToWater+2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ �������� ������ �� ��������� ��������� ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:DZ511_iSunToClim;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ ������ �� ��������� ��������� ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:500;Index:DZ511_iSunToClim+2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ511_iSunToClim+4;Mech:DZM511_SHEATING;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ���������� - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ511_iSunToClim+6;Mech:DZM511_SVENTILATION;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'��������� ������ - ������ ��������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:30;Def:0;Index:DZ511_iSunToClim+10;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������������ ��2 - ������ ����������� ��';Frm:SSSS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:500;Def:000;Index:DZ511_iSunToClim+16;Mech:DZM511_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������� 1 - ������ ��������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:10;Index:DZ511_iSunToClim+22;Mech:DZM511_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������� 5 - ������ ����������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ511_iSunToClim+24;Mech:DZM511_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������ - ������ ����������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ511_iSunToMinFram+4;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ��������� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:50;Def:10;Index:DZ511_iCalcWater+20;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:200;Max:800;Def:500;Index:DZ511_iCalcWater+22;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ511_iCalcWater+24;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ511_iSunToClim+14;Mech:DZM511_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)�������� ������ ��� ';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:3;Index:DZ511_iCalcWater+8;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:50;Def:20;Index:DZ511_iCalcWater+10;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:10;Index:DZ511_iCalcWater+12;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)�������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:4;Index:DZ511_iCalcWater+26;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:20;Max:80;Def:50;Index:DZ511_iCalcWater+28;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:123;Index:DZ511_iCalcWater+30;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:60;Index:DZ511_iSunToClim+18;Mech:DZM511_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ��������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:6;Def:1.5;Index:DZ511_iCalcWater+32;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ����� ������ ��';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:6;Max:25;Def:15;Index:DZ511_iCalcWater+34;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ����� �������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ511_iCalcWater+36;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ����� �������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ511_iScreen+16;Mech:DZM511_SVENTILATION;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ��������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ511_iCalcWater+48;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - �������� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:3;Index:DZ511_iCalcWater+44;Mech:DZM511_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� - ���������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ511_iSACAlg+2;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'� ������� - ������ ��������� ������ (0 - �� ���������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ511_iCalcWater+14;Mech:DZM511_SHEATING;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ������� ��������� ������ (0 - �� ���������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:DZ511_iFram+4;Mech:DZM511_SHEATING;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ����������� ��������';Frm:SpS;Ed:'';TipSens:TipCalc;Min:0;Max:3;Def:2;Index:DZ511_iPAirToWater+5;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

//         (Name:'������ �������� - �������� ����������';Frm:SSpS0;Ed:'�C*���';TipSens:TipCalc;Min:1;Max:8;Def:4;Index:DZ511_iDelPup;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ �������� - ��������� ��������� ��� ������ �������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:DZ511_iCalcWater+16;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ �������� - ��������� ��������� ��� (����-�����) ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-2;Max:5;Def:2;Index:DZ511_iCalcWater+18;Mech:DZM511_SHEATING;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'������ 5 - �������� � �������, ���� ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-15;Max:10;Def:5;Index:DZ511_iTask5Kon;Mech:DZM511_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��������, ���� ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-25;Max:10;Def:-5;Index:DZ511_iCalcWater+6;Mech:DZM511_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��� ����� �������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:130;Def:60;Index:DZ511_iTask5Kon+4;Mech:DZM511_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��������, ��� ����� � ����� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-25;Max:5;Def:-10;Index:DZ511_iCalcWater+4;Mech:DZM511_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - �������� ����� ��������� ������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ511_iCalcWater+3;Mech:DZM511_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������ UC - (RH���-RH���) �������� ������ �� ������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ511_iTFram;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) ������ �� ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:DZ511_iTFram+2;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) ����������� ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ511_iTFram+8;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) ��������� ����������� ���������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ511_iTFram+12;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) �������� ������ �� �������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ511_iTFram+4;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) ������ �� �������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:DZ511_iTFram+6;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) ��������� �������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ511_iTFram+9;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - (RH���-RH���) ����������� ����������� ���������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ511_iSunToClim+20;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������ UC - ����� ���� ��������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-15;Max:10;Def:-5;Index:DZ511_iFram+16;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - ��� ����� ��������� ��������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:DZ511_iFram+18;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������ UC - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:500;Def:50;Index:DZ511_iSunToFram+6;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ������ ������ ��';Frm:SSpS0;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:300;Index:DZ511_iSunToFram+8;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ����������� ����� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:25;Index:DZ511_iSunToFram+10;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'������ UC - ����� �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Def:5;Index:DZ511_iSunToFram;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ����� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:30;Def:25;Index:DZ511_iSunToFram+2;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ����� ����������� �������� �';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ511_iSunToFram+4;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'������ UC - ����� ���������';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:5;Max:35;Def:20;Index:DZ511_iFram+10;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - ������������� �������� ��';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:60;Def:20;Index:DZ511_iFram+14;Mech:DZM511_FRAM_NORTH;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'������ UC - ����������� ����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:600;Def:2;Index:DZ511_iFram+6;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ���������� ��� �� ������ ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:1;Max:40;Def:2;Index:DZ511_iFram+2;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:2;Index:DZ511_iParFram+1;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ����������� ��� �� ������ ������ ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:1;Max:5;Def:2;Index:DZ511_iParFram;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:20;Max:100;Def:50;Index:DZ511_iParFram+3;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ����������� ��� �� ������� ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:1;Max:5;Def:4;Index:DZ511_iParFram+2;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:50;Max:200;Def:100;Index:DZ511_iParFram+5;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ UC - ����������� ��� ����� �� ���������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:1;Max:10;Def:6;Index:DZ511_iParFram+4;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:20;Index:DZ511_iRezTune;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:20;Max:100;Def:50;Index:DZ511_iRezTune+1;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������ ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:40;Max:100;Def:100;Index:DZ511_iRezTune+2;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - �������� ������� ����';Frm:mSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:2;Index:DZ511_iRezTune+3;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - �������� ������� ����';Frm:mSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:2;Index:DZ511_iRezTune+4;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - �������� �������� ����';Frm:mSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:5;Index:DZ511_iRezTune+5;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - �������� ���������� ����';Frm:mSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:10;Index:DZ511_iRezTune+6;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ��������� ������� ���� �� �������';Frm:SS;Ed:'-������';TipSens:TipCalc;Min:1;Max:4;Def:1;Index:DZ511_iRezTune+7;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ��������� ������� ���� �� �������';Frm:SS;Ed:'-������';TipSens:TipCalc;Min:1;Max:4;Def:1;Index:DZ511_iRezTune+8;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ��������� �������� ���� �� �������';Frm:SS;Ed:'-������';TipSens:TipCalc;Min:1;Max:4;Def:1;Index:DZ511_iRezTune+9;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ��������� ���������� ���� �� �������';Frm:SS;Ed:'-������';TipSens:TipCalc;Min:1;Max:4;Def:1;Index:DZ511_iRezTune+10;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� - ������������ ��������� �� ��������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:10;Index:DZ511_iRezTune+11;Mech:DZM511_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         //         (Name:'������ UC - ������������� �������� ��';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:60;Def:20;Index:DZ511_iFram+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
//         (Name:'������ UC - �������� ��� ���������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:1;Def:1;
//            Index:DZ511_iPAirToWater+3;Mech:0;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ UC - ���������� ���������� �� �������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:20;Def:10;
            Index:DZ511_iPAirToWater+4;Mech:DZM511_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

//         (Name:'��2 - �-�����������';Frm:SSpSSS;Ed:'%/ppm';TipSens:TipCalc;Min:0;Max:3;Def:0.04;Index:DZ511_iCO2;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
//         (Name:'��2 - �-�����������';Frm:SSpSSS;Ed:'%/ppm';TipSens:TipCalc;Min:0;Max:10;Def:0.04;Index:DZ511_iSACAlg;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - ����� ��������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:30;Def:1;Index:DZ511_iFram+22;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - �������� ������������������';Frm:SS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:150;Def:100;Index:DZ511_iFram+23;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - ������������ �����';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:100;Def:60;Index:DZ511_iFram+20;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ ��2 - ����������� �����';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:40;Def:30;Index:DZ511_iFram+21;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
//         (Name:'��������� �������� - ���� ����������������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;Min:0;Max:0.5;Def:0.04;Index:DZ511_iCO2+2;Mech:DZM511_PRES_REG;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'��2 - �������� �� �������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:5;
            Index:DZ511_iSunToClim+12;Mech:DZM511_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'����� ����������� - (����-�����) ������������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:20;Def:6;
            Index:DZ511_iScreen+4;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ������ ����������� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:5;
            Index:DZ511_iScreen+2;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� ���������� - ����� ������������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-20;Max:12;Def:-10;
            Index:DZ511_iScreen+8;Mech:DZM511_SCREEN_HG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - ������ ������������� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1200;Def:750;
            Index:DZ511_iScreen+14;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - (T���-T���) �������� ������ �� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:DZ511_iConst;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - (T���-T���) ������ �� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ511_iConst+2;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������� - (T���-T���) ��������� ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:500;Def:200;Index:DZ511_iConst+4;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),

{         (Name:'����� ������������ - ����� ������������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-20;Max:12;Def:10;
            Index:DZ511_iScreen+6;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������������ - ������ �����������, ����� �����������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:600;Def:200;
            Index:DZ511_iScreen+14;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������������ - ������ ����������� ��� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1200;Def:600;
            Index:DZ511_iScreen+12;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� ������������ - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:15;Def:1.5;
            Index:DZ511_iScreen+10;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUESTI;AccessW:RW_USER),
 }
//        (Name:'����� ����������� - ��������� ������������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:35;
//            Index:DZ511_iScreen+18;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� - �������������� ���� 1 ������ �';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:30;Max:100;Def:50;
            Index:DZ511_iScreen+26;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 1 ������ ����';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:10;Def:4;
            Index:DZ511_iScreen+28;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 1 ����� ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:2;
            Index:DZ511_iScreen+30;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 2 ������ �';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:50;Max:100;Def:80;
            Index:DZ511_iScreen+32;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 2 ������ ����';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:10;Def:2;
            Index:DZ511_iScreen+34;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - �������������� ���� 2 ����� ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:1;
            Index:DZ511_iScreen+36;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ��������� ���� ��� ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:2;
            Index:DZ511_iScreen+38;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������ ������������/�������������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:360;Def:60;
            Index:DZ511_iScreenGlass+6;Mech:DZM511_SCREEN_TG;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'����� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-40;Max:10;Def:-20;Index:DZ511_iScreen+20;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
//         (Name:'����� - ����� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-5;Max:20;Def:5;Index:DZ511_iScreen+22;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
//         (Name:'����� - ����� ����������� �������� �';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ511_iScreen+24;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'����� - ������� �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:20;Def:5;Index:DZ511_iCalcWater+38;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - ������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Def:-5;Index:DZ511_iCalcWater+40;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - ������� ��������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ511_iCalcWater+42;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'����� - (RH���-RH���) �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:10;Index:DZ511_iSACAlg+6;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:60;Def:30;Index:DZ511_iSACAlg+8;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) ��������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:70;Def:0;Index:DZ511_iSACAlg+10;Mech:DZM511_SCREEN_TG;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'�������� - �������� 50%, ���� ������ ������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:900;Def:250;Index:DZ511_iScreenGlass;Mech:DZM511_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'�������� - �������� 100%, ���� ������ ������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:600;Def:150;Index:DZ511_iScreenGlass+2;Mech:DZM511_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'�������� - ���������/���������� ����������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:300;Def:30;Index:DZ511_iScreenGlass+4;Mech:DZM511_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'�������� - �������� ��������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:300;Def:5;Index:DZ511_iParAirToWater;Mech:DZM511_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'���� - ��������,���� ����������� ������ ������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:DZ511_iSiod+8;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������,���� ����������� ������ ������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:DZ511_iSiod;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������� ������ ������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:DZ511_iSiod+4;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������ ���������� ������ ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:180;Def:40;Index:DZ511_iSiod+2;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������� ���������� � ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:120;Def:20;Index:DZ511_iSiod+6;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��������,���� ��������� ������ ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:20;Index:DZ511_iSiod+18;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������,���� ��������� ������ ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:10;Index:DZ511_iSiod+10;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��������� ������ ������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:60;Def:40;Index:DZ511_iSiod+14;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������ ��������� ���� ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:180;Def:40;Index:DZ511_iSiod+12;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������� ��������� ���� ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:120;Def:20;Index:DZ511_iSiod+16;Mech:DZM511_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����������� - ��������, ���� ��������������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ511_iVentil;Mech:DZM511_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:100;Def:10;Index:DZ511_iVentil+2;Mech:DZM511_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - ����� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:100;Def:10;Index:DZ511_iVentil+4;Mech:DZM511_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - �����������, ���� ������� ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:DZ511_iSACAlg+4;Mech:DZM511_VENT;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'��������� ������� - ��������,���� ����������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ511_iCalorifer;Mech:DZM511_VAG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� ������� - ���������,���� ����������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ511_iCalorifer+2;Mech:DZM511_VAG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����������� - �������� (������� �������),���� (�����-����) ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:DZ511_iSunToClim+8;Mech:DZM511_VAG;AccessR:RW_GUESTI;AccessW:RW_USER)

         );
//===============================================================================


//type TClimatDiagnos=array [1..SumDiadnos] of TDiagnos;    //30
const
        clKontur100=clFuchsia;
        clKontur0=clBlue;
        clKonturMax=clFuchsia;
        clKonturMin=$C306A3;//clBlue;
        clNoEff=clAqua;
        DZ_SUM_DIAGNOS    =30;

DZ_Diagnos:array [1..DZ_SUM_DIAGNOS] of TDiagnos = (
   (Name:'��� ������� ����������� �������';ShowPozition:29;LevelAlarm:alFatal;
      PosInHot:39;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoTask'),
   (Name:'��� ��������� ����������� �������';ShowPozition:25;LevelAlarm:alFatal;
      PosInHot:21;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesAir'),
   (Name:'��� ��������� ����������� ���� � ������� 1';ShowPozition:21;LevelAlarm:alFatal;
      PosInHot:69;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater1';Mech:DZM_VALVE1),
   (Name:'��� ��������� ����������� ���� � ������� 2';ShowPozition:15;LevelAlarm:alFatal;
      PosInHot:77;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater2';Mech:DZM_VALVE2),
   (Name:'��� ��������� ����������� ���� � ������� 3';ShowPozition:11;LevelAlarm:alFatal;
      PosInHot:85;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater3';Mech:DZM_VALVE3),
   (Name:'��� ��������� ����������� ���� � ������� 4';ShowPozition:8;LevelAlarm:alFatal;
      PosInHot:93;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater4';Mech:DZM_VALVE4),
   (Name:'��� ��������� ����������� ���� � ������� 5';ShowPozition:5;LevelAlarm:alFatal;
      PosInHot:101;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater5';Mech:DZM_VALVE5),

   (Name:'������ ������� 1 � ������ ������';ShowPozition:19;LevelAlarm:alHand;
      PosInHot:137;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_VALVE1;),
   (Name:'����� ������� 1 � ������ ������';ShowPozition:16;LevelAlarm:alHand;
      PosInHot:139;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_PUMP1;),
   (Name:'������ ������� 2 � ������ ������';ShowPozition:13;LevelAlarm:alHand;
      PosInHot:141;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_VALVE2;),
   (Name:'����� ������� 2 � ������ ������';ShowPozition:10;LevelAlarm:alHand;
      PosInHot:143;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_PUMP2;),
   (Name:'������ ������� 3 � ������ ������';ShowPozition:7;LevelAlarm:alHand;
      PosInHot:145;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_VALVE3;),
   (Name:'����� ������� 3 � ������ ������';ShowPozition:4;LevelAlarm:alHand;
      PosInHot:147;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_PUMP3;),
   (Name:'������ ������� 4 � ������ ������';ShowPozition:2;LevelAlarm:alHand;
      PosInHot:149;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_VALVE4;),
   (Name:'����� ������� 4 � ������ ������';ShowPozition:-2;LevelAlarm:alHand;
      PosInHot:151;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_PUMP4;),
   (Name:'������ ������� 5 � ������ ������';ShowPozition:-5;LevelAlarm:alHand;
      PosInHot:153;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_VALVE5;),
   (Name:'����� ������� 5 � ������ ������';ShowPozition:-8;LevelAlarm:alHand;
      PosInHot:155;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:DZM_PUMP5;),

{8}(Name:'� ���� � 1-� ������� �� ������������';ShowPozition:-1;LevelAlarm:alAttention;
      PosInHot:68;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul1';Mech:DZM_VALVE1),
   (Name:'� ���� � 2-� ������� �� ������������';ShowPozition:-4;LevelAlarm:alAttention;
      PosInHot:76;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul2';Mech:DZM_VALVE2),
   (Name:'� ���� � 3-� ������� �� ������������';ShowPozition:-7;LevelAlarm:alAttention;
      PosInHot:84;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul3';Mech:DZM_VALVE3),
   (Name:'� ���� � 4-� ������� �� ������������';ShowPozition:-10;LevelAlarm:alAttention;
      PosInHot:92;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul4';Mech:DZM_VALVE4),
   (Name:'� ���� � 5-� ������� �� ������������';ShowPozition:-13;LevelAlarm:alAttention;
      PosInHot:100;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul5';Mech:DZM_VALVE5),

   (Name:'������ 1 ������� ��������� ������';ShowPozition:0;LevelAlarm:alBlueAttention;
      PosInHot:138;Oper:BLE;OperValue:3;Color:clKontur0;Mech:DZM_VALVE1),
   (Name:'������ 1 ������� ��������� ������';ShowPozition:-22;LevelAlarm:alBlueAttention;
      PosInHot:138;Oper:BGT;OperValue:97;Color:clKontur100;Mech:DZM_VALVE1),
   (Name:'������ 2 ������� ��������� ������';ShowPozition:0;LevelAlarm:alBlueAttention;
      PosInHot:142;Oper:BLE;OperValue:3;Color:clKontur0;Mech:DZM_VALVE2),
   (Name:'������ 2 ������� ��������� ������';ShowPozition:-26;LevelAlarm:alBlueAttention;
      PosInHot:142;Oper:BGT;OperValue:97;Color:clKontur100;Mech:DZM_VALVE2),
   (Name:'������ 3 ������� ��������� ������';ShowPozition:0;LevelAlarm:alBlueAttention;
      PosInHot:146;Oper:BLE;OperValue:3;Color:clKontur0;Mech:DZM_VALVE3),
   (Name:'������ 3 ������� ��������� ������';ShowPozition:-30;LevelAlarm:alBlueAttention;
      PosInHot:146;Oper:BGT;OperValue:97;Color:clKontur100;Mech:DZM_VALVE3),
   (Name:'������ 4 ������� ��������� ������';ShowPozition:-34;LevelAlarm:alBlueAttention;
      PosInHot:150;Oper:BGT;OperValue:97;Color:clKontur100;Mech:DZM_VALVE4),
   (Name:'������ 5 ������� ��������� ������';ShowPozition:-38;LevelAlarm:alBlueAttention;
      PosInHot:154;Oper:BGT;OperValue:97;Color:clKontur100;Mech:DZM_VALVE4)
);

// ------- ������� ���� - �������� � ������� ---------------------------
const
             DZ_cSumContur=       8;
             DZ_SumOutMeteo=      6;
             DZ_SumSensMeteo=    11; //  cSMeteoSens;
             DZ_SumCommon=       20;
             DZ_StCommon=        1;
             DZ_EndCommon=       DZ_StCommon+DZ_SumCommon-1;      //� �� - ����� ������ ��������
             DZ_SourseMeteo=     DZ_StCommon+15;
             DZ_posAbsMaxWater=  16;
             DZ_posZonePower=    131;
             DZ_posCalcPower=    132;
             DZ_posZoneMaxWater= 49;
             DZ_SSumSun=         12;
             DZ_S1TASens=        14;

             DZ_StTeplSens=      DZ_EndCommon+1;
             DZ_SumTeplSens=    15; //cSInTeplSens;
             DZ_SumTeplDSens=    2;
             DZ_EndTeplSens=     DZ_StTeplSens+DZ_SumTeplSens+DZ_SumTeplDSens-1;                   //� �� - ����� ������ ��������

             DZ_SumTeplCalc=     12;//14;//10+STVirtSens;
             DZ_StTeplCalc=      DZ_EndTeplSens+1;                   //� �� - ����� ������ ������� ����
             DZ_EndTeplCalc=     DZ_StTeplCalc+DZ_SumTeplCalc-1;                  //� �� - ����� ��������� ������� ����

             DZ_SumTeplWarm=     13+8*5;//11+10*5;//51;
             DZ_StTeplWarm=      DZ_EndTeplCalc+1;       //� �� - ����� ������ �������� ��������
             DZ_EndTeplWarm=     DZ_StTeplWarm+DZ_SumTeplWarm-1;       //� �� - ����� ��������� �������� ��������

             DZ_SumTeplVent=     10;
             DZ_StTeplVent=      DZ_EndTeplWarm+1;       //� �� - ����� ������ �������� ��������
             DZ_EndTeplVent=     DZ_StTeplVent+DZ_SumTeplVent-1;       //� �� - ����� ��������� �������� ��������

             DZ_SumTeplScreen=   7;
             DZ_StTeplScreen=    DZ_EndTeplVent+1;           //� �� - ����� ������ �������� ������
             DZ_EndTeplScreen=   DZ_StTeplScreen+DZ_SumTeplScreen-1;

             DZ_SumTeplOther=   17;
             DZ_StTeplOther=    DZ_EndTeplScreen+1;           //� �� - ����� ������ �������� ������
             DZ_EndTeplOther=   DZ_StTeplOther+DZ_SumTeplOther-1;


             DZ_SCalcPump=       5;
             DZ_SCalcRegul=      13;
             DZ_SCalcMecan=      DZ_SCalcPump+DZ_SCalcRegul;
             DZ_SASens=20;

             DZ_SumTeplMecan=    52; //56;
             DZ_StTeplMecan=     DZ_EndTeplOther+1;              //� �� - ����� ������ ��������� ����������
             DZ_EndTeplMecan=    DZ_StTeplMecan+DZ_SumTeplMecan-1;
             DZ_StTeplRez=       DZ_EndTeplMecan+1;
             DZ_SumTeplRez=      0;
             DZ_EndTeplRez=      DZ_StTeplRez+DZ_SumTeplRez-1;
             DZ_SumMesTepl=      DZ_EndTeplRez-DZ_SumCommon;
             DZ_SumMesHot=       DZ_EndTeplRez;//SumMesTepl+SumCommon;
//             DZ_SumMesHot=       182;

             ibNews=           0;
//			/*���� ����� �� ��*/
             DZ_iSensOut=        1;//7;
             DZ_iWind=           DZ_iSensOut+6;
             DZ_iDirWind=        DZ_iSensOut+9;
             DZ_iPCSend325=      0;//iSensOut;
             DZ_sizeSensOut=     DZ_SumSensMeteo*3;
             DZ_iNextTAir=       DZ_iSensOut+DZ_sizeSensOut;//iRez+12;
             DZ_iAbsMaxWater=    DZ_iNextTAir;
             DZ_iVosx=           DZ_iNextTAir+8;//iRez+sizeRez;
//             iVosx=           iPulRelay+8;//iRez+sizeRez;
             DZ_iSumSun=         DZ_iVosx+4;//iPCBlock+sizePCBlock325-2;//6;
             DZ_iRezer=          DZ_iSumSun+2;
             DZ_iPulRegul=       DZ_iSumSun+2;
             DZ_iFeedBack=       DZ_iPulRegul+5;
             DZ_iMidlSR=         DZ_iRezer+12;
             DZ_sizePCSend403=   DZ_iMidlSR;
             DZ_iMidlWind=       DZ_iMidlSR+2;
             DZ_iPozFluger=      DZ_iMidlSR+4;
             DZ_iTime=           DZ_iPozFluger+2;
             DZ_iHand=           DZ_iTime+5;
             DZ_SizeSendTime=    DZ_iHand+1;


              DZ_iTepl=           DZ_iHand+1;//iPozFluder+2;
              DZ_itConfig=        0;
              DZ_itSensorIn=      2;
              DZ_itTAir=          2;
              DZ_itRH=            14;
              DZ_itTSheet=        26;
              DZ_sizeSensorIn=    26*3;
              DZ_itTeplDSens=     DZ_itSensorIn+DZ_sizeSensorIn;
              DZ_itTeplRCS=       DZ_itTeplDSens+4;
              DZ_itTeplTemRSC=    DZ_itTeplRCS+1;
              DZ_itTeplWinRSC=    DZ_itTeplRCS+0;
              DZ_itClimTask=      DZ_itTeplRCS+2;
              DZ_itTaskT=         DZ_itClimTask;
              DZ_itDoT=           DZ_itTaskT+2;
              DZ_sizeClimTask=    50;//29;//22;
              DZ_itOtherCalc=     DZ_itClimTask+DZ_sizeClimTask;
              DZ_sizeOtherCalc=   30;
              DZ_itWaterCalc=     DZ_itOtherCalc+DZ_sizeOtherCalc;
              DZ_itRaisedCritery= DZ_itWaterCalc;
              DZ_sizeWaterCalc=   48;
              DZ_itKontur=        DZ_itWaterCalc+DZ_sizeWaterCalc;
              DZ_itKonturRCS=     DZ_itKontur+20;
              DZ_size1Kontur=     24;
              DZ_SizeContur=      DZ_size1Kontur;
              DZ_cSumKontur=      8;
              DZ_iZoneStatus=     DZ_itKontur+(DZ_cSumKontur)*DZ_size1Kontur;
              DZ_iZoneMaxWater=   DZ_iZoneStatus+36*2;

              DZ_iMechanic=       DZ_iZoneMaxWater+10*2;
              DZ_size1Mec=        2;
              DZ_nOutputs=        46;
              DZ_sizeHand=        (DZ_nOutputs)*DZ_size1Mec;
              DZ_sizeTepl=        DZ_iMechanic+DZ_sizeHand;
//              DZ_sizeTepl=        DZ_iMechanic+sizeTMech+10*2;

              iSensTair       =-1;
              iSensRH         =-2;
              iSensSheet      =-3;
              iSensSoil       =-4;
              iSensRez        =-5;
              iSensGlass      =-6;
              iSensCO2        =-7;
              iSensContr      =-8;
              iSensPosN       =-9;
              iSensPosS       =-10;
              iSensPipe1      =-11;
//              MechPower       =-30;
const
DZ_cDefineHot:array [1..DZ_SumMesHot] of TNameConst=( //TDZDefineHot=(
// ----------------- ����������� -----------------
//1
(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-40;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������� �o����';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:-1;Max:5000;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+3;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� �����';Frm:SSpS0;Ed:'�/���';TipSens:SensorRCS;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ_iWind;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSSS;Ed:'�';TipSens:SensorRCS;Min:0;Max:360;Def:HIDE_MIN_MAX;
    Index:DZ_iDirWind;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�����';Frm:SSSS;Ed:'';TipSens:SensorRCS;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+12;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//6
(Name:'B�������� ��������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+15;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ������';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+18;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ��������';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+21;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:16;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+24;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ��������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:14;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+27;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//11
(Name:'������ ����';Frm:SSSS;Ed:'�3/���';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+30;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �o������� ��������';Frm:SSSS;Ed:'��/��2';TipSens:TipSR;Min:-1;Max:8000;Def:HIDE_MIN_MAX;
    Index:DZ_iSumSun;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipSun;Min:-1;Max:5000;Def:HIDE_MIN_MAX;
    Index:DZ_iMidlSR;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� �������';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ_iMidlSR+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comNord;Max:comNord+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMidlSR+5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//16
(Name:'���������� ���� �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_iAbsMaxWater;Mech:DZM_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:2;
//    Index:DZ_iHand;AccessR:RW_NOEDIT;AccessW:RW_SUPERVISOR),
(Name:'����� ������� ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:DZ_iVosx;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������ ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:DZ_iVosx+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� � �����������';Frm:SShSSm;Ed:'���:���';TipSens:TipTime;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:DZ_iTime;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������';Frm:SS;Ed:'';TipSens:TipTime;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'���� � �����������';Frm:SSsSS;Ed:'';TipSens:TipTime;Min:35065;Max:200*365;Def:HIDE_MIN_MAX;
//    Index:DZ_iTime+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// ------- ���������� ��������� �������  -----------------------
//21
(Name:'������ ������� ';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir;Mech:DZM_SENS_TEMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itRH;Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ������������';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:0;Max:1400;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+18;Mech:DZM_SENS_INLIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+39;Mech:DZM_SENS_SOIL;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:SSSpS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+57;Mech:DZM_SENS_SCR;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//26
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-20;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+42;Mech:DZM_SENS_GLASS;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ��2';Frm:SSSpS;Ed:'ppm/10';TipSens:SensorRCS;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+21;Mech:DZM_SENS_CO;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+3;Mech:DZM_SENS_TEMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� �����';Frm:SSSpS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+51;Mech:DZM_SENS_FRAM_N;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ��';Frm:SSSpS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+54;Mech:DZM_SENS_FRAM_S;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//31
(Name:'���� ������ ������ 1';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+60;Mech:DZM_SENS_WATER1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//(Name:'������ 2 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
//    Index:DZ_itKontur+DZ_size1Kontur+12;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 2';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+63;Mech:DZM_SENS_WATER2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 3';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+66;Mech:DZM_SENS_WATER3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 4';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+69;Mech:DZM_SENS_WATER4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 5';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+72;Mech:DZM_SENS_WATER5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//36
(Name:'��������� ��������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_itTeplDSens+1;Mech:DZM_LIGHT ;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:ComboBit;Ed:'1';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_itTeplDSens+1;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),
// ------- ����������� ��������� ������� ---------------------------
(Name:'����������� ������� - ������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:-1;Max:35;Def:FATAL_MIN_MAX;
    Index:DZ_itTaskT;Mech:DZM_SENS_TEMP1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� - �������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:-1;Max:35;Def:FATAL_MIN_MAX;
    Index:DZ_itTaskT+2;Mech:DZM_SENS_TEMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� - ������ �� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+10;Mech:DZM_SENS_HUM1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
//41
(Name:'��������� ������� - �������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+12;Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������� - ���������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-1;Max:40;Def:FATAL_MIN_MAX;
    Index:DZ_itTaskT+4;Mech:DZM_SENS_TEMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������ �� ���������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipTimer;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+14;Mech:DZM_CO2;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������� ������������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+16;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ��������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:AbsRH;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0{iRez};Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//46
(Name:'������� �������� ���� �������';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0{iRez};Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{47}
(Name:'������� �������� ���� �����';Frm:SSpS0;Ed:'�/�3';TipSens:DDWPS;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),
(Name:'����� ����';Frm:SSpS0;Ed:'�C';TipSens:TR;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:0;Mech:DZM_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//49             DZ_iMaxWater
//(Name:'������� ������� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:3;Max:35;Def:HIDE_MIN_MAX;
//    Index:DZ_itTaskT+6;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'���� �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:135;Def:HIDE_MIN_MAX;
    Index:DZ_iZoneMaxWater;Mech:DZM_SENS_TEMP1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipSun;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+2;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (����-�����) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+6;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (����-�������) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+4;Mech:DZM_SENS_GLASS;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - �������� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+8;Mech:DZM_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ����� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+16;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ����� ������� ��������(�10)';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+24;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - ����� ������� ��������(�10)';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+12;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//57
(Name:'� ��������� - (�) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+18;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (�) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+10;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - (�) �������� �� ';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+26;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - (�) �������� �� ';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+22;Mech:DZM_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� - �������� ������������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-400;Max:400;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+20;Mech:DZM_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'���� - ������������ �� �������';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-400;Max:400;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+16;Mech:DZM_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
{63}
(Name:'������ 1 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+2;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+4;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+6;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� ������ (�����,RH,����)';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+10;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ���������������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+8;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 1 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+12;Mech:DZM_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+14;Mech:DZM_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),   }
(Name:'������ 1 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:10;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+12;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
      Index:DZ_itKontur+14;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{71}
(Name:'������ 2 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+2;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+4;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+6;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� ������ (�����,RH,����)';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+10;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+8;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 2 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+12;Mech:DZM_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+14;Mech:DZM_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),}
(Name:'������ 2 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+12;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur+14;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{79}
(Name:'������ 3 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+2;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+4;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+6;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2;Mech:DZM_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+10;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+8;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 3 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+12;Mech:DZM_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+14;Mech:DZM_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),}
(Name:'������ 3 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+12;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*2+14;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{87}
(Name:'������ 4 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+2;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+4;Mech:DZM_PUMP4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+6;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+10;Mech:DZM_PUMP4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ���������������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+8;Mech:DZM_PUMP4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'��������� �������� - �������� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+12;Mech:DZM_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+14;Mech:DZM_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),  }
(Name:'������ 4 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+12;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*3+14;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{95}
(Name:'������ 5 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+2;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+4;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+6;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+10;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ���������������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+8;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 5 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+12;Mech:DZM_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+14;Mech:DZM_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),      }
(Name:'������ 5 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+12;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*4+14;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{103}
(Name:'������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comFram;Max:comFram+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+18;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'������� - ���� ����������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*7+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���� ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� ����� � ���������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� ��������� �� ������';Frm:SSSS;Ed:'%';TipSens:TipSun;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+6;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���������� ����������� ���';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+10;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ����������� ����������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:5;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+8;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������� - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),   }
{111}
(Name:'������� - ������� ������������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:-1;Max:100;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:-1;Max:100;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*7+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{113}
(Name:'����� ����������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+24;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - �������������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*7+2;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - ������������� �����������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*7+4;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*7+10;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - ���������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*7+14;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+25;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+26;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{120}

(Name:'����������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+23;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� - ������ ������� ��� ���';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc+2;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� - ������ �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc+4;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'��������� �������� - �������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc+8;Mech:DZM_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+21;Mech:DZM_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'�������� ��� ���������� 1';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc;Mech:DZM_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 2';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask;Mech:DZM_EXTREG1+1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 3';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc;Mech:DZM_EXTREG1+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 4';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask;Mech:DZM_EXTREG1+3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 5';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc;Mech:DZM_EXTREG1+4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ��2 (������� ��� � �����)';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+14;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��������';Frm:SSpS0;Ed:'��';TipSens:TipCalc;Min:0;Max:20;Def:NO_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������7';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
//    Index:DZ_itOtherCalc;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),
(Name:'�������� ����������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),


// 133
(Name:'���� - ������� ������� ����������';Frm:SSSS;Ed:'���';TipSens:TipTimer;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+19;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� - ����� ������ � ������ �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itOtherCalc+6;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// 135
(Name:'������ - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+27;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ_itClimTask+29;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),

//============================= Contnrol and status ========================================
// 137
(Name:'������������ ������ 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+0;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+1;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+48;Mech:DZM_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+49;Mech:DZM_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//141
(Name:'������������ ������ 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+2;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+3;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+50;Mech:DZM_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+51;Mech:DZM_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+4;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+5;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+52;Mech:DZM_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+53;Mech:DZM_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//149
(Name:'������������ ������ 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+6;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+7;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+54;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+55;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//153
(Name:'������������ ������ 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+8;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 5 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+9;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+56;Mech:DZM_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+57;Mech:DZM_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//157       21
(Name:'������� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+13;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+15;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//161        25
(Name:'����� ����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+20;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+21;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+22;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+23;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+24;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+25;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+26;Mech:DZM_SCREEN_TV2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+27;Mech:DZM_SCREEN_TV2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+28;Mech:DZM_SCREEN_TV3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+29;Mech:DZM_SCREEN_TV3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+30;Mech:DZM_SCREEN_TV4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+31;Mech:DZM_SCREEN_TV4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//173        37
(Name:'������� ��2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+32;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+33;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+60;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+61;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//177       41
(Name:'��������� ������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+62;Mech:DZM_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ���������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:2;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+63;Mech:DZM_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//179
(Name:'��� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+66;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��� ����� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+67;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+68;Mech:DZM_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+69;Mech:DZM_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+34;Mech:DZM_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+35;Mech:DZM_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//185
(Name:'������������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+36;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+37;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
//    Index:DZ_iMechanic+50;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������ ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
//    Index:DZ_iMechanic+51;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//187
(Name:'������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+72;Mech:DZM_ALARM;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+73;Mech:DZM_ALARM;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)
//(Name:'��������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
//    Index:DZ_iMechanic+6;Mech:DZM_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'��������� 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
//   Index:DZ_iMechanic+7;Mech:DZM_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)

{�����: 190, �� ��� 58 ����������}
);


// ------- ������� ���� 511 - �������� � ������� ---------------------------
const
             DZ511_cSumContur=       8;
             DZ511_SumOutMeteo=      6;
             DZ511_SumSensMeteo=    11; //  cSMeteoSens;
             DZ511_SumCommon=       20;
             DZ511_StCommon=        1;
             DZ511_EndCommon=       DZ511_StCommon+DZ511_SumCommon-1;      //� �� - ����� ������ ��������
             DZ511_SourseMeteo=     DZ511_StCommon+15;
             DZ511_posAbsMaxWater=  16;
             DZ511_posZonePower=    131;
             DZ511_posCalcPower=    132;
             DZ511_posZoneMaxWater= 49;
             DZ511_SSumSun=         12;
             DZ511_S1TASens=        14;

             DZ511_StTeplSens=      DZ511_EndCommon+1;
             DZ511_SumTeplSens=    30; //cSInTeplSens;
             DZ511_SumTeplDSens=    2;
             DZ511_EndTeplSens=     DZ511_StTeplSens+DZ511_SumTeplSens+DZ511_SumTeplDSens-1;                   //� �� - ����� ������ ��������

             DZ511_SumTeplCalc=     12;//14;//10+STVirtSens;
             DZ511_StTeplCalc=      DZ511_EndTeplSens+1;                   //� �� - ����� ������ ������� ����
             DZ511_EndTeplCalc=     DZ511_StTeplCalc+DZ511_SumTeplCalc-1;                  //� �� - ����� ��������� ������� ����

             DZ511_SumTeplWarm=     13+8*5;//11+10*5;//51;
             DZ511_StTeplWarm=      DZ511_EndTeplCalc+1;       //� �� - ����� ������ �������� ��������
             DZ511_EndTeplWarm=     DZ511_StTeplWarm+DZ511_SumTeplWarm-1;       //� �� - ����� ��������� �������� ��������

             DZ511_SumTeplVent=     10;
             DZ511_StTeplVent=      DZ511_EndTeplWarm+1;       //� �� - ����� ������ �������� ��������
             DZ511_EndTeplVent=     DZ511_StTeplVent+DZ511_SumTeplVent-1;       //� �� - ����� ��������� �������� ��������

             DZ511_SumTeplScreen=   7;
             DZ511_StTeplScreen=    DZ511_EndTeplVent+1;           //� �� - ����� ������ �������� ������
             DZ511_EndTeplScreen=   DZ511_StTeplScreen+DZ511_SumTeplScreen-1;

             DZ511_SumTeplOther=   17;
             DZ511_StTeplOther=    DZ511_EndTeplScreen+1;           //� �� - ����� ������ �������� ������
             DZ511_EndTeplOther=   DZ511_StTeplOther+DZ511_SumTeplOther-1;


             DZ511_SumTeplMecan=    62;
             DZ511_StTeplMecan=     DZ511_EndTeplOther+1;              //� �� - ����� ������ ��������� ����������
             DZ511_EndTeplMecan=    DZ511_StTeplMecan+DZ511_SumTeplMecan-1;
             DZ511_StTeplRez=       DZ511_EndTeplMecan+1;
             DZ511_SumTeplRez=      0;
             DZ511_EndTeplRez=      DZ511_StTeplRez+DZ511_SumTeplRez-1;
             DZ511_SumMesTepl=      DZ511_EndTeplRez-DZ511_SumCommon;
             DZ511_SumMesHot=       DZ511_EndTeplRez;//SumMesTepl+SumCommon;
//             DZ511_SumMesHot=       182;

//			/*���� ����� �� ��*/
             DZ511_iSensOut=        1;//7;
             DZ511_iWind=           DZ511_iSensOut+6;
             DZ511_iDirWind=        DZ511_iSensOut+9;
             DZ511_iPCSend325=      0;//iSensOut;
             DZ511_sizeSensOut=     DZ511_SumSensMeteo*3;
             DZ511_iNextTAir=       DZ511_iSensOut+DZ511_sizeSensOut;//iRez+12;
             DZ511_iAbsMaxWater=    DZ511_iNextTAir;
             DZ511_iVosx=           DZ511_iNextTAir+8;//iRez+sizeRez;
//             iVosx=           iPulRelay+8;//iRez+sizeRez;
             DZ511_iSumSun=         DZ511_iVosx+4;//iPCBlock+sizePCBlock325-2;//6;
             DZ511_iRezer=          DZ511_iSumSun+2;
             DZ511_iPulRegul=       DZ511_iSumSun+2;
             DZ511_iFeedBack=       DZ511_iPulRegul+5;
             DZ511_iMidlSR=         DZ511_iRezer+12;
             DZ511_sizePCSend403=   DZ511_iMidlSR;
             DZ511_iMidlWind=       DZ511_iMidlSR+2;
             DZ511_iPozFluger=      DZ511_iMidlSR+4;
             DZ511_iTime=           DZ511_iPozFluger+2;
             DZ511_iHand=           DZ511_iTime+5;
             DZ511_SizeSendTime=    DZ511_iHand+1;


              DZ511_iTepl=           DZ511_iHand+1;//iPozFluder+2;
              DZ511_itConfig=        0;
              DZ511_itSensorIn=      2;
              DZ511_itTAir=          2;
              DZ511_itRH=            20;
              DZ511_itWater=         DZ511_itRH+17*3;
              DZ511_sizeSensorIn=    30*3;
              DZ511_itTeplDSens=     DZ511_itSensorIn+DZ511_sizeSensorIn;
              DZ511_itTeplRCS=       DZ511_itTeplDSens+4;
              DZ511_itTeplTemRSC=    DZ511_itTeplRCS+1;
              DZ511_itTeplWinRSC=    DZ511_itTeplRCS+0;
              DZ511_itClimTask=      DZ511_itTeplRCS+2;
              DZ511_itTaskT=         DZ511_itClimTask;
              DZ511_itDoT=           DZ511_itTaskT+2;
              DZ511_sizeClimTask=    50;//29;//22;
              DZ511_itOtherCalc=     DZ511_itClimTask+DZ511_sizeClimTask;
              DZ511_sizeOtherCalc=   30;
              DZ511_itWaterCalc=     DZ511_itOtherCalc+DZ511_sizeOtherCalc;
              DZ511_itRaisedCritery= DZ511_itWaterCalc;
              DZ511_sizeWaterCalc=   48;
              DZ511_itKontur=        DZ511_itWaterCalc+DZ511_sizeWaterCalc;
              DZ511_itKonturRCS=     DZ511_itKontur+20;
              DZ511_size1Kontur=     24;
              DZ511_SizeContur=      DZ511_size1Kontur;
              DZ511_cSumKontur=      8;
              DZ511_iZoneStatus=     DZ511_itKontur+(DZ511_cSumKontur)*DZ511_size1Kontur;
              DZ511_iZoneMaxWater=   DZ511_iZoneStatus+36*2;

              DZ511_iMechanic=       DZ511_iZoneMaxWater+10*2;
              DZ511_size1Mec=        2;
              DZ511_nOutputs=        46;
              DZ511_sizeHand=        (DZ511_nOutputs)*DZ511_size1Mec;
              DZ511_sizeTepl=        DZ511_iMechanic+DZ511_sizeHand;
//              DZ511_sizeTepl=        DZ511_iMechanic+sizeTMech+10*2;

 //              MechPower       =-30;
const
DZ511_cDefineHot:array [1..DZ511_SumMesHot] of TNameConst=( //TDZ511DefineHot=(
// ----------------- ����������� -----------------
//1
(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-40;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������� �o����';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:-1;Max:5000;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+3;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� �����';Frm:SSpS0;Ed:'�/���';TipSens:SensorRCS;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ511_iWind;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSSS;Ed:'�';TipSens:SensorRCS;Min:0;Max:360;Def:HIDE_MIN_MAX;
    Index:DZ511_iDirWind;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�����';Frm:SSSS;Ed:'';TipSens:SensorRCS;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+12;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//6
(Name:'B�������� ��������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+15;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ������';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+18;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ��������';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+21;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:16;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+24;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ��������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:14;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+27;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//11
(Name:'������ ����';Frm:SSSS;Ed:'�3/���';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iSensOut+30;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �o������� ��������';Frm:SSSS;Ed:'��/��2';TipSens:TipSR;Min:-1;Max:8000;Def:HIDE_MIN_MAX;
    Index:DZ511_iSumSun;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipSun;Min:-1;Max:5000;Def:HIDE_MIN_MAX;
    Index:DZ511_iMidlSR;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� �������';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ511_iMidlSR+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comNord;Max:comNord+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMidlSR+5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//16
(Name:'���������� ���� �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_iAbsMaxWater;Mech:DZM511_SHEATING;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:2;
//    Index:DZ511_iHand;AccessR:RW_NOEDIT;AccessW:RW_SUPERVISOR),
(Name:'����� ������� ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:DZ511_iVosx;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������ ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:DZ511_iVosx+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� � �����������';Frm:SShSSm;Ed:'���:���';TipSens:TipTime;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:DZ511_iTime;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������';Frm:SS;Ed:'';TipSens:TipTime;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'���� � �����������';Frm:SSsSS;Ed:'';TipSens:TipTime;Min:35065;Max:200*365;Def:HIDE_MIN_MAX;
//    Index:DZ511_iTime+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// ------- ���������� ��������� �������  -----------------------
//21
(Name:'������ ������� 1';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ511_itTAir;Mech:DZM511_SENS_TEMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� 2';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ511_itTAir+3;Mech:DZM511_SENS_TEMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� 3';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ511_itTAir+6;Mech:DZM511_SENS_TEMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� 4';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ511_itTAir+9;Mech:DZM511_SENS_TEMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� 5';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ511_itTAir+12;Mech:DZM511_SENS_TEMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� 6';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:FATAL_MIN_MAX;
    Index:DZ511_itTAir+15;Mech:DZM511_SENS_TEMP6;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������� ��������� ������� 1';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH;Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� ������� 2';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+3;Mech:DZM511_SENS_HUM2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� ������� 3';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+6;Mech:DZM511_SENS_HUM3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� ������� 4';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+9;Mech:DZM511_SENS_HUM4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//31
(Name:'���������� ������������';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:0;Max:1400;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+12;Mech:DZM511_SENS_INLIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ��2';Frm:SSSpS;Ed:'ppm/10';TipSens:SensorRCS;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+15;Mech:DZM511_SENS_CO;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'����������� ������ 1';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+18;Mech:DZM511_SENS_EVAP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������ 2';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+21;Mech:DZM511_SENS_EVAP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+24;Mech:DZM511_SENS_COOL;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ��������';Frm:SSpS0;Ed:'��';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+27;Mech:DZM511_SENS_OP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+30;Mech:DZM511_SENS_TOP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+33;Mech:DZM511_SENS_SOIL;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-20;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+36;Mech:DZM511_SENS_GLASS;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//40
(Name:'����������� �� ����� AHU';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+39;Mech:DZM511_SENS_INAHU;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �� ������ AHU';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+42;Mech:DZM511_SENS_OUTAHU;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),


(Name:'��������� ������� �����';Frm:SSSpS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+45;Mech:DZM511_SENS_FRAM_N;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ��';Frm:SSSpS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+48;Mech:DZM511_SENS_FRAM_S;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:SSSpS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itRH+51;Mech:DZM511_SENS_SCR;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'���� ������ ������ 1';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ511_itWater;Mech:DZM511_SENS_WATER1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 2';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ511_itWater+3;Mech:DZM511_SENS_WATER2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 3';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ511_itWater+6;Mech:DZM511_SENS_WATER3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 4';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ511_itWater+9;Mech:DZM511_SENS_WATER4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 5';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ511_itWater+12;Mech:DZM511_SENS_WATER5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ AHU';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ511_itWater+15;Mech:DZM511_SENS_WATAHU;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//51
(Name:'��������� ��������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_itTeplDSens+1;Mech:DZM511_LIGHT ;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:ComboBit;Ed:'1';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_itTeplDSens+1;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),
// ------- ����������� ��������� ������� ---------------------------
(Name:'����������� ������� - ������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:-1;Max:35;Def:FATAL_MIN_MAX;
    Index:DZ511_itTaskT;Mech:DZM511_SENS_TEMP1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� - �������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:-1;Max:35;Def:FATAL_MIN_MAX;
    Index:DZ511_itTaskT+2;Mech:DZM511_SENS_TEMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� - ������ �� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ511_itTaskT+10;Mech:DZM511_SENS_HUM1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
//56
(Name:'��������� ������� - �������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ511_itTaskT+12;Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������� - ���������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-1;Max:40;Def:FATAL_MIN_MAX;
    Index:DZ511_itTaskT+4;Mech:DZM511_SENS_TEMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������ �� ���������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipTimer;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ511_itTaskT+14;Mech:DZM511_CO2;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������� ������������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ511_itTaskT+16;Mech:DZM511_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ��������� ������';Frm:SSpS0;Ed:'�/�3';TipSens:AbsRH;Min:0;Max:200;Def:HIDE_MIN_MAX;
    Index:0{iRez};Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//61
(Name:'���������� ��������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:prognT;Min:0;Max:200;Def:HIDE_MIN_MAX;
    Index:0{iRez};Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{62}
(Name:'������������� ������������';Frm:SSSpS;Ed:'��/�';TipSens:DDWPS;Min:0;Max:1000;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����';Frm:SSpS0;Ed:'�C';TipSens:TR;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:0;Mech:DZM511_SENS_HUM1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//64             DZ511_iMaxWater
//(Name:'������� ������� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:3;Max:35;Def:HIDE_MIN_MAX;
//    Index:DZ511_itTaskT+6;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'���� �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:135;Def:HIDE_MIN_MAX;
    Index:DZ511_iZoneMaxWater;Mech:DZM511_SENS_TEMP1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipSun;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+2;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (����-�����) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+6;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (����-�������) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+4;Mech:DZM511_SENS_GLASS;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - �������� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+8;Mech:DZM511_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ����� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+16;Mech:DZM511_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ����� ������� ��������(�10)';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+24;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - ����� ������� ��������(�10)';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+12;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//72
(Name:'� ��������� - (�) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+18;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (�) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+10;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - (�) �������� �� ';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+26;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - (�) �������� �� ';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+22;Mech:DZM511_SENS_TEMP1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� - �������� ������������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-400;Max:400;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+20;Mech:DZM511_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'���� - ������������ �� �������';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-400;Max:400;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+16;Mech:DZM511_SENS_TEMP1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
{78}
(Name:'������ 1 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+2;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+4;Mech:DZM511_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+6;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� ������ (�����,RH,����)';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+10;Mech:DZM511_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ���������������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+8;Mech:DZM511_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 1 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+12;Mech:DZM511_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+14;Mech:DZM511_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),   }
(Name:'������ 1 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:10;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+12;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
      Index:DZ511_itKontur+14;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{86}
(Name:'������ 2 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+2;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+4;Mech:DZM511_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+6;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� ������ (�����,RH,����)';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+10;Mech:DZM511_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+8;Mech:DZM511_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 2 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+12;Mech:DZM511_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+14;Mech:DZM511_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),}
(Name:'������ 2 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+12;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur+14;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{94}
(Name:'������ 3 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+2;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+4;Mech:DZM511_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+6;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2;Mech:DZM511_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+10;Mech:DZM511_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+8;Mech:DZM511_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 3 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+12;Mech:DZM511_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+14;Mech:DZM511_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),}
(Name:'������ 3 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+12;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*2+14;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{102}
(Name:'������ 4 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+2;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+4;Mech:DZM511_PUMP4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+6;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+10;Mech:DZM511_PUMP4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ���������������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+8;Mech:DZM511_PUMP4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'��������� �������� - �������� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+12;Mech:DZM511_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+14;Mech:DZM511_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),  }
(Name:'������ 4 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+12;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*3+14;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{110}
(Name:'������ 5 - �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+2;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+4;Mech:DZM511_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+6;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+10;Mech:DZM511_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ���������������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+8;Mech:DZM511_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������ 5 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+12;Mech:DZM511_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+14;Mech:DZM511_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),      }
(Name:'������ 5 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+12;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:FATAL_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*4+14;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{118}
(Name:'������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comFram;Max:comFram+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+18;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'������� - ���� ����������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*7+2;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���� ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6+2;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� ����� � ���������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6+4;Mech:DZM511_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� ��������� �� ������';Frm:SSSS;Ed:'%';TipSens:TipSun;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6+6;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���������� ����������� ���';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6;Mech:DZM511_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6+10;Mech:DZM511_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ����������� ����������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:5;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6+8;Mech:DZM511_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������� - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*5+12;Mech:DZM511_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*5+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*5+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),   }
{126}
(Name:'������� - ������� ������������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:-1;Max:100;Def:FATAL_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*6+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:-1;Max:100;Def:FATAL_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*7+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{128}
(Name:'����� ����������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+24;Mech:DZM511_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - �������������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*7+2;Mech:DZM511_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - ������������� �����������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*7+4;Mech:DZM511_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*7+10;Mech:DZM511_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� - ���������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_itKontur+DZ511_size1Kontur*7+14;Mech:DZM511_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+25;Mech:DZM511_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+26;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{135}

(Name:'����������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+23;Mech:DZM511_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� - ������ ������� ��� ���';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc+2;Mech:DZM511_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� - ������ �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc+4;Mech:DZM511_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'��������� �������� - �������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc+8;Mech:DZM511_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+21;Mech:DZM511_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'�������� ��� ���������� 1';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc;Mech:DZM511_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 2';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask;Mech:DZM511_EXTREG1+1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 3';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc;Mech:DZM511_EXTREG1+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 4';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask;Mech:DZM511_EXTREG1+3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��� ���������� 5';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc;Mech:DZM511_EXTREG1+4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{145}
(Name:'������ ��2 (������� ��� � �����)';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ511_itRaisedCritery+14;Mech:DZM511_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ��������';Frm:SSpS0;Ed:'��';TipSens:TipCalc;Min:0;Max:20;Def:NO_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������7';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
//    Index:DZ511_itOtherCalc;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),
(Name:'�������� ����������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),


// 133
(Name:'���� - ������� ������� ����������';Frm:SSSS;Ed:'���';TipSens:TipTimer;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+19;Mech:DZM511_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� - ����� ������ � ������ �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ511_itOtherCalc+6;Mech:DZM511_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// 135
(Name:'������ - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+27;Mech:DZM511_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ511_itClimTask+29;Mech:0;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),

//============================= Contnrol and status ========================================
// 137
(Name:'������������ ������ 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+0;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+1;Mech:DZM511_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+48;Mech:DZM511_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+49;Mech:DZM511_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//141
(Name:'������������ ������ 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+2;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+3;Mech:DZM511_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+50;Mech:DZM511_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+51;Mech:DZM511_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+4;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+5;Mech:DZM511_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+52;Mech:DZM511_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+53;Mech:DZM511_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//149
(Name:'������������ ������ 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+6;Mech:DZM511_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+7;Mech:DZM511_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+54;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+55;Mech:DZM511_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//153
(Name:'������������ ������ 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+8;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 5 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+9;Mech:DZM511_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+56;Mech:DZM511_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+57;Mech:DZM511_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+12;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+13;Mech:DZM511_FRAM_NORTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+14;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+15;Mech:DZM511_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'����� ����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+28;Mech:DZM511_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+29;Mech:DZM511_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+30;Mech:DZM511_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+31;Mech:DZM511_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+32;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+33;Mech:DZM511_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������� ����� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+16;Mech:DZM511_FRAM_NORTH2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+17;Mech:DZM511_FRAM_NORTH2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+18;Mech:DZM511_FRAM_NORTH3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+19;Mech:DZM511_FRAM_NORTH3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+20;Mech:DZM511_FRAM_NORTH4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+21;Mech:DZM511_FRAM_NORTH4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������� ��2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+34;Mech:DZM511_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+35;Mech:DZM511_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+60;Mech:DZM511_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+61;Mech:DZM511_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//177       41
(Name:'��������� ������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+62;Mech:DZM511_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ���������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:2;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+63;Mech:DZM511_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//179
(Name:'��� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+66;Mech:DZM511_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��� ����� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+67;Mech:DZM511_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+68;Mech:DZM511_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+69;Mech:DZM511_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'��������� �������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+36;Mech:DZM511_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+37;Mech:DZM511_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//185
(Name:'������������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+38;Mech:DZM511_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+39;Mech:DZM511_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������������ ������ AHU �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+10;Mech:DZM511_VALVEAHU;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ AHU ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+11;Mech:DZM511_VALVEAHU;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� AHU �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+58;Mech:DZM511_PUMPAHU;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� AHU ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+5;Mech:DZM511_PUMPAHU;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),


//157       21
//161        25

(Name:'������ UC �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+22;Mech:DZM511_FRAM_UC;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ UC ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+23;Mech:DZM511_FRAM_UC;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),


(Name:'�������� AHU 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+24;Mech:DZM511_SPEED_AHU1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� AHU 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+25;Mech:DZM511_SPEED_AHU1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'�������� AHU 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+26;Mech:DZM511_SPEED_AHU2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� AHU 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+27;Mech:DZM511_SPEED_AHU2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+72;Mech:DZM511_ALARM;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ511_iMechanic+73;Mech:DZM511_ALARM;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)

{�����: 190, �� ��� 58 ����������}
);


const SumValYAlarmHot =14;

var XNamesAlarmC510:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ_sizeTepl;Cfg:DZ_SumConfig;Kind:0)
     );

var AlarmHotName:array [1..SumValYAlarmHot] of TNameConst=(

(Name:'�������^';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupMain;Max:comGroupMain+8;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+DZ_iTepl; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��������� ������';Frm:CpMpN;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+1+DZ_iTepl; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'���������';Frm:SdS;Ed:'����:����';TipSens:TipControl;Min:0;Max:0;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+2+DZ_iTepl; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),

(Name:'������ 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+18+DZ_iTepl; Mech:DZM_VALVE1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+DZ_size1Kontur*1+18+DZ_iTepl; Mech:DZM_VALVE2; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+DZ_size1Kontur*2+18+DZ_iTepl; Mech:DZM_VALVE3; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+DZ_size1Kontur*3+18+DZ_iTepl; Mech:DZM_VALVE4; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+DZ_size1Kontur*4+18+DZ_iTepl; Mech:DZM_VALVE5; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������� ������������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+DZ_size1Kontur*6+18+DZ_iTepl; Mech:DZM_FRAM_SOUTH; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������� �����������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_itKontur+DZ_size1Kontur*7+18+DZ_iTepl; Mech:DZM_FRAM_NORTH; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),


(Name:'����������� �����';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+4+DZ_iTepl; Mech:DZM_SCREEN_TG; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+5+DZ_iTepl; Mech:DZM_SIO_VALVES; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+6+DZ_iTepl; Mech:DZM_LIGHT; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ_iZoneStatus+7+DZ_iTepl; Mech:DZM_CO2; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER)
);


const SumValYAlarmHot511 =14;

var XNamesAlarmC511:array [1..1] of TXNames=(
    (Name:'����';Frm:None;Ed:'';Index:DZ511_sizeTepl;Cfg:DZ511_SumConfig;Kind:0)
     );

var AlarmHotName511:array [1..SumValYAlarmHot511] of TNameConst=(

(Name:'�������^';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupMain;Max:comGroupMain+8;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+DZ_iTepl; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��������� ������';Frm:CpMpN;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+1+DZ_iTepl; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'���������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+5;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+2+DZ_iTepl; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),

(Name:'������ 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+18+DZ511_iTepl; Mech:DZM511_VALVE1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+DZ511_size1Kontur*1+18+DZ511_iTepl; Mech:DZM511_VALVE2; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+DZ511_size1Kontur*2+18+DZ511_iTepl; Mech:DZM511_VALVE3; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+DZ511_size1Kontur*3+18+DZ511_iTepl; Mech:DZM511_VALVE4; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+DZ511_size1Kontur*4+18+DZ511_iTepl; Mech:DZM511_VALVE5; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'�������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+DZ511_size1Kontur*6+18+DZ511_iTepl; Mech:DZM511_FRAM_NORTH; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ AHU';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_itKontur+DZ511_size1Kontur*7+18+DZ511_iTepl; Mech:DZM511_FRAM_UC; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),


(Name:'����������� �����';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+4+DZ511_iTepl; Mech:DZM511_SCREEN_TG; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+5+DZ511_iTepl; Mech:DZM511_SIO_VALVES; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+6+DZ511_iTepl; Mech:DZM511_LIGHT; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comClim510Stat;Max:comClim510Stat+39;
        Def:HIDE_MIN_MAX;Index:DZ511_iZoneStatus+7+DZ511_iTepl; Mech:DZM511_CO2; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER)
);

implementation

end.
