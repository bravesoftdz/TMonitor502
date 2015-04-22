unit DefineClim403;

interface
uses FController, Graphics, ClimCalc,   // DefineClim65, Climat65,
   SysUtils, Chart, Series, GanttCh, GGraf, TeEngine,ComCtrls,
   FConstType, MessageU, Windows, HandClim;

// ------- ������� ����������� 403 ---------
const
     cNameIdent403=178;
     DZ_MAX_SUM_ZONE=4;

     // ������ ���������� � ��������� cDefineMech
DZM_VALVE1      = 1;
DZM_PUMP1       = 2;
DZM_VALVE2      = 3;
DZM_PUMP2       = 4;
DZM_VALVE3      = 5;
DZM_PUMP3       = 6;
DZM_VALVE4      = 7;
DZM_PUMP4       = 8;
DZM_VALVE5      = 9;
DZM_PUMP5       = 10;
DZM_FRAM_NORTH  = 11;
DZM_FRAM_SOUTH  = 12;
DZM_SCREEN_TG   = 13;
DZM_SCREEN_HG   = 14;
DZM_SCREEN_TV1  = 15;
DZM_SCREEN_TV2  = 16;
DZM_SCREEN_TV3  = 17;
DZM_SCREEN_TV4  = 18;
DZM_CO2         = 19;
DZM_VENT        = 21;
DZM_VAG         = 22;
DZM_SIO_PUMP    = 23;
DZM_SIO_VALVES  = 24;
DZM_PRES_REG    = 26;
DZM_LIGHT       = 27;
DZM_ALARM       = 29;
DZM_POISE       = 30;
DZM_EXTREG1     = 31;

     DZ_NumTimer=20;
     DZ_iTimerZone=0;
     DZ_iTimeStart=DZ_iTimerZone+1;
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
     DZ_iObrabot=DZ_iDosvet+2;
     DZ_iTaskHumin=DZ_iObrabot+1;
     DZ_sizeTimer=DZ_iTaskHumin+1;
     DZ_SumTimer=25;


var  DZ_NameTimer:array [1..DZ_SumTimer] of TNameConst=(
 (Name:'����� ����';Frm:SS;Ed:'-����';TipSens:TipCalc;Min:0;Max:4;Def:HIDE_MIN_MAX;
    Index:0;GridColor:$ff0f00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ������ �������� ��������� (���� 0 - ����� �� �������)';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:1;GridColor:$ffef00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ��������� �������� ��������� (���� 0-����� �� �������)';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;Def:0;
    Index:3;GridColor:$ffdf00;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ����������� ������� (���� 0-����� �� �������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskTemper;GridColor:clRed;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskTVent;GridColor:clRed;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ��������� ������� (���� 0-�� �� ���������)';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ_iTaskHumin;GridColor:clBlue;AccessR:RW_GUEST;AccessW:RW_GUEST),
//6
 (Name:'������� ������� �������� ���� ';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:0;Def:0;
    Index:DZ_iTaskHumin;GridColor:clBlue;AccessR:RW_GUEST;AccessW:RW_GUEST),
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
    Index:DZ_iOpt1Temp+3;GridColor:$af0fef;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'������� ������� 3 (���� 0, �� ����� ����� �����������)';Frm:SS;Ed:'';TipSens:TipCombo;Min:0;Max:90;Def:HIDE_MIN_MAX;
    Index:DZ_iObrabot;GridColor:clYellow;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST ),
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
 (Name:'����� ������ ��������� (����,���)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:DZ_iScreenYes+2;GridColor:$afdfaf;Mech:DZM_POISE;AccessR:RW_GUEST;AccessW:RW_GUEST),
//21
 (Name:'����� ������������ (����,���,����)';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comOnOff;Max:comOnOff+2;Def:0;
    Index:DZ_iVentYes;GridColor:$afefaf;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_GUEST),
 (Name:'����� ��������� ������������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:DZ_iDosvet+1;GridColor:clYellow;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST ),
 (Name:'������� ��������� ������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iDosvet;GridColor:clYellow;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_GUEST )
  );

// ------- ��������� ��������� ����������� 403 ---------

const

          DZ_SumParMec=       46;
          DZ_io_LuftMixVal=0;
          DZ_io_TimeMixVal=DZ_io_LuftMixVal+1;
          DZ_io_TimeFram=DZ_io_TimeMixVal+30;
          DZ_io_TimeScreen=DZ_io_TimeFram+12;
          DZ_io_TimeCO=DZ_io_TimeScreen+36;
          DZ_io_TimePressReg=DZ_io_TimeCO+6;
          DZ_sizeParMec=DZ_io_TimePressReg+12;

var DZ_NameParMec:array [1..DZ_SumParMec] of TNameConst=(
         (Name:'������ 1 - ������������ ������ ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeMixVal;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 1 - ������������ ������ �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimeMixVal+2;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 1 - ������������ ������ ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeMixVal+4;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 1 - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:10;Max:100;Def:50;Index:DZ_io_TimeMixVal+5;Mech:DZM_VALVE1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 2 - ������������ ������ ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeMixVal+6;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 2 - ������������ ������ �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimeMixVal+8;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 2 - ������������ ������ ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeMixVal+10;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 2 - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:10;Max:100;Def:0;Index:DZ_io_TimeMixVal+11;Mech:DZM_VALVE2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 3 - ������������ ������ ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeMixVal+12;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 3 - ������������ ������ �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimeMixVal+14;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 3 - ������������ ������ ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeMixVal+16;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 3 - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:10;Max:100;Def:0;Index:DZ_io_TimeMixVal+17;Mech:DZM_VALVE3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 4 - ������������ ������ ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeMixVal+18;Mech:DZM_VALVE4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 4 - ������������ ������ �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimeMixVal+20;Mech:DZM_VALVE4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 4 - ������������ ������ ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeMixVal+22;Mech:DZM_VALVE4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 4 - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:10;Max:100;Def:0;Index:DZ_io_TimeMixVal+23;Mech:DZM_VALVE4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 5 - ������������ ������ ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeMixVal+24;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 5 - ������������ ������ �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimeMixVal+26;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 5 - ������������ ������ ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeMixVal+28;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ 5 - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:10;Max:100;Def:0;Index:DZ_io_TimeMixVal+29;Mech:DZM_VALVE5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������������ ������� - ���� ��� ����� �����������';Frm:SS;Ed:'%';TipSens:TipCalc;
            Min:0;Max:3;Def:1;Index:DZ_io_LuftMixVal;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������� ����� - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeFram;Mech:DZM_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� ����� - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeFram+4;Mech:DZM_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� ����� - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:1;Max:100;Def:0;Index:DZ_io_TimeFram+5;Mech:DZM_FRAM_NORTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� �� - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeFram+6;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� �� - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeFram+10;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������� �� - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:1;Max:100;Def:0;Index:DZ_io_TimeFram+11;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ����������� - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeScreen;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ����������� - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeScreen+4;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ����������� - �������� �������������';Frm:SS;Ed:'�.�.';TipSens:TipCalc;
            Min:10;Max:100;Def:0;Index:DZ_io_TimeScreen+5;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ����������- ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeScreen+6;Mech:DZM_SCREEN_HG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ���������� - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeScreen+10;Mech:DZM_SCREEN_HG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 1 - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeScreen+12;Mech:DZM_SCREEN_TV1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 1 - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeScreen+16;Mech:DZM_SCREEN_TV1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 2 - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeScreen+18;Mech:DZM_SCREEN_TV2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 2 - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeScreen+22;Mech:DZM_SCREEN_TV2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 3 - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeScreen+24;Mech:DZM_SCREEN_TV3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 3 - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeScreen+28;Mech:DZM_SCREEN_TV3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 4 - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeScreen+30;Mech:DZM_SCREEN_TV4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ ������� 4 - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeScreen+34;Mech:DZM_SCREEN_TV4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'��������� ��2 - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimeCO;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'��������� ��2 - �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimeCO+2;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'��������� ��2 - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimeCO+4;Mech:DZM_CO2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'��������� �������� - ������ ��������/��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;
            Min:15;Max:800;Def:0;Index:DZ_io_TimePressReg;Mech:DZM_PRES_REG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'��������� �������� - �-�����������';Frm:SSpSSS;Ed:'%/��';TipSens:TipCalc;
            Min:0.1;Max:3;Def:1;Index:DZ_io_TimePressReg+2;Mech:DZM_PRES_REG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'��������� �������� - ����� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;
            Min:1;Max:100;Def:30;Index:DZ_io_TimePressReg+4;Mech:DZM_PRES_REG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR)

         );


// ------- ��������� ���������� ����������� 403 ---------
const        DZ_SumParUpr=           19;
             DZ_iMaxTPipe=           0;
             DZ_iMinTPipe=           DZ_iMaxTPipe+7*2;
             DZ_iOptTPipe=           DZ_iMinTPipe+3*2;
             DZ_iPID=                DZ_iOptTPipe+3*2;
             DZ_iVScr=               DZ_iPID+3*2;
             DZ_iScr=                DZ_iVScr+2;
             DZ_EndParUpr=           DZ_iScr+2*2+4;


var DZ_NameParUpr:array [1..DZ_SumParUpr] of TNameConst=(

         (Name:'������ 1 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:95;Def:0;Index:DZ_iMaxTPipe;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 2 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ_iMaxTPipe+2;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 3 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ_iMaxTPipe+4;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 4 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iMaxTPipe+6;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 5 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:0;Index:DZ_iMaxTPipe+8;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ �������� ������������ �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iMaxTPipe+10;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ �������� ����������� �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iMaxTPipe+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ����������� - ����������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iScr;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ���������� - ����������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:DZ_iScr+2;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_GUEST),

//         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iMinTPipe;Mech:DZM_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe;Mech:DZM_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ_iMinTPipe+2;Mech:DZM_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe+2;Mech:DZM_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:3;Def:0;Index:DZ_iMinTPipe+4;Mech:DZM_PRES_REG;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'������ 5 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:DZ_iOptTPipe+4;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ��������� - ���� ���������������� ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:2.45;Index:DZ_iPID;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.02;Max:20;Def:3.5;Index:DZ_iPID+2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ���� ���������������� ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:2.45;Index:DZ_iPID+4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:20;Def:3.5;Index:DZ_iPID-2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ������������ - ������ ������������ ������� 1';Frm:SS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:DZ_iVScr;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ������������ - ����� ������������ ������� 1';Frm:SS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:90;Index:DZ_iVScr+1;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_GUEST)
         );

// ------- ��������� ������� ����������� 403 ---------

const        DZ_SumParTune=         116;//109;
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
             DZ_iRezTune=            DZ_iParAirToWater+4;
             DZ_EndTune=DZ_iRezTune+20*2;

var DZ_NameTuneClimate:array [1..DZ_SumParTune] of TNameConst=(
         (Name:'������� - ��������� ������������ ������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:DZ_iParAirToWater+2;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'������ �������� ������ �� ��������� ��������� ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:DZ_iSunToClim;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ ������ �� ��������� ��������� ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:500;Index:DZ_iSunToClim+2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iSunToClim+4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ���������� - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iSunToClim+6;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'��������� ������ - ������ ��������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:30;Def:0;Index:DZ_iSunToClim+10;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������������ ��2 - ������ ����������� ��';Frm:SSSS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:500;Def:000;Index:DZ_iSunToClim+16;Mech:DZM_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������� 1 - ������ ��������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:10;Index:DZ_iSunToClim+22;Mech:DZM_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������� 5 - ������ ����������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iSunToClim+24;Mech:DZM_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� ������ - ������ ����������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:DZ_iSunToMinFram+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ��������� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:50;Def:10;Index:DZ_iCalcWater+20;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:200;Max:800;Def:500;Index:DZ_iCalcWater+22;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ_iCalcWater+24;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:45;Index:DZ_iSunToClim+14;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)�������� ������ ��� ';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:3;Index:DZ_iCalcWater+8;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:50;Def:20;Index:DZ_iCalcWater+10;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�������)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:10;Index:DZ_iCalcWater+12;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)�������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:4;Index:DZ_iCalcWater+26;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:20;Max:80;Def:50;Index:DZ_iCalcWater+28;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:123;Index:DZ_iCalcWater+30;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:60;Index:DZ_iSunToClim+18;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ��������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:6;Def:1.5;Index:DZ_iCalcWater+32;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ����� ������ ��';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:6;Max:25;Def:15;Index:DZ_iCalcWater+34;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - ����� �������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ_iCalcWater+36;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ���������� - ����� �������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:10;Index:DZ_iScreen+16;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ��������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:DZ_iCalcWater+48;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ��������� - �������� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:3;Index:DZ_iCalcWater+44;Mech:DZM_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� - ���������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:DZ_iSACAlg+2;Mech:0;AccessR:RW_SUPERVISOR;AccessW:RW_USER),

         (Name:'� ������� - ������ ��������� ������ (0 - �� ���������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:DZ_iCalcWater+14;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ������� ��������� ������ (0 - �� ���������)';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:DZ_iFram+4;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ����������� ��������';Frm:SpS;Ed:'';TipSens:TipCalc;Min:0;Max:3;Def:2;Index:DZ_iPAirToWater+5;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

//         (Name:'������ �������� - �������� ����������';Frm:SSpS0;Ed:'�C*���';TipSens:TipCalc;Min:1;Max:8;Def:4;Index:DZ_iDelPup;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ �������� - ��������� ��������� ��� ������ �������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:DZ_iCalcWater+16;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ �������� - ��������� ��������� ��� (����-�����) ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-2;Max:5;Def:2;Index:DZ_iCalcWater+18;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

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
              DZ_itRH=            5;
              DZ_itTSheet=        8;
              DZ_sizeSensorIn=    DZ_SumTeplSens*3;
              DZ_itTeplDSens=     DZ_itSensorIn+DZ_sizeSensorIn;
              DZ_itTeplRCS=       DZ_itTeplDSens+4;
              DZ_itTeplTemRSC=    DZ_itTeplRCS+1;
              DZ_itTeplWinRSC=    DZ_itTeplRCS+0;
              DZ_itClimTask=      DZ_itTeplRCS+2;
              DZ_itTaskT=         DZ_itClimTask;
              DZ_itDoT=           DZ_itTaskT+2;
              DZ_sizeClimTask=    37;//29;//22;
              DZ_itOtherCalc=     DZ_itClimTask+DZ_sizeClimTask;
              DZ_sizeOtherCalc=   10;
              DZ_itWaterCalc=     DZ_itOtherCalc+DZ_sizeOtherCalc;
              DZ_itRaisedCritery= DZ_itWaterCalc;
              DZ_sizeWaterCalc=   28 ;
              DZ_itKontur=        DZ_itWaterCalc+DZ_sizeWaterCalc;
              DZ_itKonturRCS=     DZ_itKontur+20;
              DZ_size1Kontur=     18;
              DZ_SizeContur=      DZ_size1Kontur;
              DZ_iZoneMaxWater=   DZ_itKontur+(DZ_cSumContur)*DZ_size1Kontur;
              DZ_iMechanic=       DZ_itKontur+(DZ_cSumContur)*DZ_size1Kontur+10*2;
              DZ_size1Mec=        2;
              DZ_nOutputs=        27;
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
    Index:DZ_iSensOut+18;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ��������';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+21;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:16;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+24;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ��������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:14;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+27;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//11
(Name:'������ ����';Frm:SSSS;Ed:'�3/���';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iSensOut+30;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
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
    Index:DZ_iAbsMaxWater;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
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
    Index:DZ_itTAir;Mech:iSensTair;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itRH;Mech:iSensRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+6;Mech:iSensSheet;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+9;Mech:iSensSoil;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:SSSS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+12;Mech:iSensRez;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//26
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-20;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+15;Mech:iSensGlass;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ��2';Frm:SSSpS;Ed:'ppm/10';TipSens:SensorRCS;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+18;Mech:iSensCO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+21;Mech:iSensContr;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� �����';Frm:SSSS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+24;Mech:iSensPosN;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ��';Frm:SSSS;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itTAir+27;Mech:iSensPosS;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//31
(Name:'���� ������ ������ 1';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+30;Mech:iSensPipe1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//(Name:'������ 2 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
//    Index:DZ_itKontur+DZ_size1Kontur+12;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 2';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+33;Mech:iSensPipe1-1;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 3';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+36;Mech:iSensPipe1-2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 4';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+39;Mech:iSensPipe1-3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 5';Frm:SSSpS;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:FATAL_MIN_MAX;
    Index:DZ_itTAir+42;Mech:iSensPipe1-4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//36
(Name:'��������� ��������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_itTeplDSens+1;Mech:DZM_LIGHT ;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:ComboBit;Ed:'1';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_itTeplDSens+1;AccessR:RW_INVISIBLE;AccessW:RW_SUPERVISOR),
// ------- ����������� ��������� ������� ---------------------------
(Name:'����������� ������� - ������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:-1;Max:35;Def:FATAL_MIN_MAX;
    Index:DZ_itTaskT;Mech:-1;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� - �������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:-1;Max:35;Def:FATAL_MIN_MAX;
    Index:DZ_itTaskT+2;Mech:-1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� - ������ �� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+10;Mech:iSensRH;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
//41
(Name:'��������� ������� - �������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+12;Mech:iSensRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������� - ���������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-1;Max:40;Def:FATAL_MIN_MAX;
    Index:DZ_itTaskT+4;Mech:iSensRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������ �� ���������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipTimer;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+14;Mech:DZM_CO2;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������� ������������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:DZ_itTaskT+16;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ��������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:AbsRH;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0{iRez};Mech:iSensRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//46
(Name:'������� �������� ���� �������';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0{iRez};Mech:iSensRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{47}
(Name:'������� �������� ���� �����';Frm:SSpS0;Ed:'�/�3';TipSens:DDWPS;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0;Mech:iSensSheet;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����';Frm:SSpS0;Ed:'�C';TipSens:TR;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:0;Mech:iSensRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//49             DZ_iMaxWater
//(Name:'������� ������� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:3;Max:35;Def:HIDE_MIN_MAX;
//    Index:DZ_itTaskT+6;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'���� �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:135;Def:HIDE_MIN_MAX;
    Index:DZ_iZoneMaxWater;Mech:iSensTair;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipSun;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+2;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (����-�����) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+6;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (����-�������) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+4;Mech:iSensSheet;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - �������� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+8;Mech:DZM_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ����� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+16;Mech:DZM_SCREEN_TG;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - ����� ������� ��������(�10)';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+24;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - ����� ������� ��������(�10)';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+12;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//57
(Name:'� ��������� - (�) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+18;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ��������� - (�) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+10;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - (�) �������� �� ';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+26;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'� ���������� - (�) �������� �� ';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-1000;Max:1000;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+22;Mech:iSensTair;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'���� - �������� ������������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-400;Max:400;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+20;Mech:iSensTair;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'���� - ������������ �� �������';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:-400;Max:400;Def:HIDE_MIN_MAX;
    Index:DZ_itRaisedCritery+16;Mech:iSensTair;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
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
    Index:DZ_itKontur+DZ_size1Kontur*6+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���� ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+2;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� ����� � ���������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+4;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� ��������� �� ������';Frm:SSSS;Ed:'%';TipSens:TipSun;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+6;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���������� ����������� ���';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+10;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'������� - ����������� ����������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:5;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+8;Mech:DZM_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
{(Name:'������� - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:200;Def:HIDE_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),   }
{111}
(Name:'������� - ������� ������������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:-1;Max:100;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*5+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:-1;Max:100;Def:FATAL_MIN_MAX;
    Index:DZ_itKontur+DZ_size1Kontur*6+14;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
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
    Index:DZ_itClimTask+29;Mech:DZM_POISE;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

//============================= Contnrol and status ========================================
// 137
(Name:'������������ ������ 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+0;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+1;Mech:DZM_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+32;Mech:DZM_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+33;Mech:DZM_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//141
(Name:'������������ ������ 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+2;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+3;Mech:DZM_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+34;Mech:DZM_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+35;Mech:DZM_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+4;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+5;Mech:DZM_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+36;Mech:DZM_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+37;Mech:DZM_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//149
(Name:'������������ ������ 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+6;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+7;Mech:DZM_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+38;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+39;Mech:DZM_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//153
(Name:'������������ ������ 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+8;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 5 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+9;Mech:DZM_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+40;Mech:DZM_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+41;Mech:DZM_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//157       21
(Name:'������� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+10;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+11;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+12;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+13;Mech:DZM_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//161        25
(Name:'����� ����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+14;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+15;Mech:DZM_SCREEN_TG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+16;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ���������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+17;Mech:DZM_SCREEN_HG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+18;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+19;Mech:DZM_SCREEN_TV1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+20;Mech:DZM_SCREEN_TV2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+21;Mech:DZM_SCREEN_TV2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+22;Mech:DZM_SCREEN_TV3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+23;Mech:DZM_SCREEN_TV3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+24;Mech:DZM_SCREEN_TV4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������������ ������� 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+25;Mech:DZM_SCREEN_TV4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//173        37
(Name:'������� ��2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+26;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+27;Mech:DZM_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+42;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+43;Mech:DZM_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//177       41
(Name:'��������� ������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+44;Mech:DZM_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ���������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:2;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+45;Mech:DZM_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//179
(Name:'��� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+46;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��� ����� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+47;Mech:DZM_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+48;Mech:DZM_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+49;Mech:DZM_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+48+16;Mech:DZM_POISE;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ���������';Frm:ComboBit;Ed:'0';TipSens:TipIzm;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+49+16;Mech:DZM_POISE;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//185
(Name:'������������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+50;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+51;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
//    Index:DZ_iMechanic+50;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������ ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
//    Index:DZ_iMechanic+51;Mech:DZM_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//187
(Name:'������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+52;Mech:DZM_ALARM;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:DZ_iMechanic+53;Mech:DZM_ALARM;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)
//(Name:'��������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
//    Index:DZ_iMechanic+6;Mech:DZM_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'��������� 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
//   Index:DZ_iMechanic+7;Mech:DZM_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)

{�����: 190, �� ��� 58 ����������}
);

implementation

end.
