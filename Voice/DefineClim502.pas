unit DefineClim502;

interface
uses FController, Graphics, ClimCalc,   // DefineClim65, Climat65,
   SysUtils, Chart, Series, GanttCh, GGraf, TeEngine,ComCtrls,
   FConstType, MessageU, Windows, HandClim;

type Int16=SmallInt; pInt16=^SmallInt;

//===============================================================================
// ------- ��������� ���������� ����������� 502 ---------
//===============================================================================
const        Conf502Sum=           9;//10;//22;
             Conf502Size=           86;

//===================================================================
// ============ ������ ==============================================
//===================================================================
const
     TT_NumTimer=20;
     TT_iTimerZone=0;
     TT_iTimeStart=TT_iTimerZone+1;
     TT_iStartType=TT_iTimeStart+2; // NEW
     TT_iTimeEnd=TT_iTimeStart+2;
     TT_iTaskTemper=TT_iTimeEnd+2;
     TT_iTaskTVent=TT_iTaskTemper+2;
     TT_iTaskCO2=TT_iTaskTVent+2;
     TT_iOpt1Temp=TT_iTaskCO2+2;
     TT_iMinPipe1=TT_iOpt1Temp+5;
     TT_iMinOpenWin=TT_iMinPipe1+2;
     TT_iWinYes=TT_iMinOpenWin+1;
     TT_iTimeSiod=TT_iWinYes+1;
     TT_iScreenYes=TT_iTimeSiod+2;
     TT_iVentYes=TT_iScreenYes+3;
     TT_iDosvet=TT_iVentYes+1;
     TT_iMinPipe3=TT_iDosvet+2;
     TT_iTaskHumin=TT_iMinPipe3+1;
     TT_sizeTimer=TT_iTaskHumin+1+20;
     TT_SumTimer=25;

var XNamesConf502:array [1..1] of TXNames=(
    (Name:'��������';Frm:None;Ed:'';Index:0;Cfg:0;Kind:0)
     );
//    (Name:'��� ���� �� �����';Frm:ComboBit;Ed:'1';TipSens:TipCalc{TipBit};Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
//        Index:15;Mech:cfNoFull;AccessR:RW_GUEST;AccessW:RW_NOEDIT),

var YNamesConf502:array [1..Conf502Sum] of TNameConst=(
         (Name:'������� �������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
            Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ��������������';Frm:ComboBit;Ed:'1';TipSens:TipIzm;Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
            Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'����� ������������';Frm:ComboBit;Ed:'2';TipSens:TipCalc;Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
            Index:2;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'�����������';Frm:ComboBit;Ed:'3';TipSens:TipIzm;Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
            Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���������';Frm:ComboBit;Ed:'4';TipSens:TipIzm;Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
            Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'UltraClima';Frm:ComboBit;Ed:'5';TipSens:TipIzm;Min:comNoYes;Max:comNoYes+1;Def:HIDE_MIN_MAX;
            Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���������� �������� C��';Frm:SS;Ed:'��';TipSens:TipIzm;Min:0;Max:8;
            Index:2;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���-�� �������� ��������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:10;
            Index:3;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'���������� �������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:HIDE_MIN_MAX;
            Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST)
         );


//===============================================================================
// ------- ��������� ������� ����������� 502 ---------
//==============================================================================

const
        MAX_SENS_SUM=60;
        YMaxReg502Count=30;
        YMaxCalibr502Count=MAX_SENS_SUM;
        
        clKontur100=clFuchsia;
        clKontur0=clBlue;
        clKonturMax=clFuchsia;
        clKonturMin=$C306A3;//clBlue;
        clNoEff=clAqua;
        DZ_SUM_DIAGNOS    =30;


// ------- ������� ���� - �������� � ������� ---------------------------
const
      TreeName:array [1..7] of string=('�����','������ �������','�������','�������','Ultra Clima','������','�����������');
      YMesHotSum=       185;
var
DZ_cDefineHot:array [1..YMesHotSum] of TNameConst=(
// ----------------- ����������� -----------------
//1
(Name:'��������� ��������';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:-1;Max:5000;Def:HIDE_MIN_MAX;
    {Link:linkHotInvisible+20;} Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdNewTree),
(Name:'������� ��������� ��������';Frm:SSSS;Ed:'��/�2';TipSens:TipSun;Min:-1;Max:5000;Def:HIDE_MIN_MAX;
    Link:-1;Index:24;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdEffect;),
(Name:'����������� �o������� ��������';Frm:SSSS;Ed:'��/��2';TipSens:TipSR;Min:-1;Max:8000;Def:HIDE_MIN_MAX;
    Link:-2;Index:22;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-40;Max:60;Def:HIDE_MIN_MAX;
    Index:2;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect),
(Name:'B�������� ��������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������';Frm:SS;Ed:'';TipSens:SensorRCS;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'�������� �����';Frm:SSpS0;Ed:'�/���';TipSens:SensorRCS;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:6;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect),
(Name:'����������� �����';Frm:SSSS;Ed:'�';TipSens:SensorRCS;Min:0;Max:360;Def:HIDE_MIN_MAX;
    Link:-1;Index:8;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �������� �����';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Link:-2;Index:26;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{(Name:'����������� ������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comNord;Max:comNord+1;Def:HIDE_MIN_MAX;
    Index:28;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),}
(Name:'����� � ���';Frm:SS;Ed:'�/���';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-1;Index:28;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� � ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-2;Index:28;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-7;Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opMinus;o2:-1),
(Name:'������� ��������������� �������_������';Frm:SSpS0;Ed:'�/�3';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-8;Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMinus;o2:-1),
(Name:'�������� �������';Frm:SSSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:800;Def:HIDE_MIN_MAX;
    Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'�������� ������';Frm:SSSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:800;Def:HIDE_MIN_MAX;
    Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������� �������� �������_������';Frm:SSSS;Ed:'��';TipSens:SensorRCS;Min:-1;Max:20;Def:HIDE_MIN_MAX;
    Link:-1;Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opMinus;o2:-1),

(Name:'����� ������� ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:32;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������ ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:34;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �����';Frm:SS;Ed:'%';TipSens:TipSun;Min:0;Max:101;Def:HIDE_MIN_MAX;
    Index:34;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����';Frm:SS;Ed:'%';TipSens:TipSun;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:34;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:12;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'����������� ���� ��������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:14;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'���� �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:135;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
{(Name:'���������� ���� �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:30;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR), }
(Name:'�������� ���� ������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:16;Def:HIDE_MIN_MAX;
    Index:16;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'�������� ���� ��������';Frm:SSpSS;Ed:'��';TipSens:SensorRCS;Min:0;Max:14;Def:HIDE_MIN_MAX;
    Index:18;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'�������� ������� �������� ����';Frm:SSpS0;Ed:'��';TipSens:TipCalc;Min:-1;Max:5;Def:HIDE_MIN_MAX;
    Link:-2;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������ ����';Frm:SSSS;Ed:'�3/���';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
//    Index:20;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// ------- ���������� ��������� �������  -----------------------
//====================================================================
(Name:'����������� ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:-1;Max:35;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR;Kind:kdProgTask+kdNewTree),
(Name:'��������� �������� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:-1;Max:5;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'����������� ������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:-1;Max:35;Def:NO_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������ ������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{SensorRCS};Min:-1;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdTask),
(Name:'������ ������� � �����';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������ ������� ����';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������ ������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������ ������� � �����';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-20;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),

(Name:'�������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR;Kind:kdProgTask),
(Name:'��������� �������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:15;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'��������� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:95;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdTask),
(Name:'������� �������� ���� �������';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Link:-1;Index:0{iRez};Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-9;op:opDDWP;o2:-1),
(Name:'������� �������� ���� �����';Frm:SSpS0;Ed:'�/�3';TipSens:DDWPS;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ��������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:AbsRH;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:00;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����';Frm:SSpS0;Ed:'�C';TipSens:TR;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� ������� �������_������';Frm:SSpS0;Ed:'�/�3';TipSens:TipCalc;Min:-40;Max:40;Def:HIDE_MIN_MAX;
    Index:00;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:11;op:opMinus;o2:-1),
(Name:'�������� ����������� ����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-1;Max:40;Def:FATAL_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��2 ������ ������������';Frm:SSSS;Ed:'ppm';TipSens:TipTimer;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Link:3;Index:0;Mech:0;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR;Kind:kdProgTask),
(Name:'��2 ���������';Frm:SSpS0;Ed:'ppm';TipSens:TipTimer;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Link:2;Index:0;Mech:0;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'��2 ������� ������������';Frm:SSSS;Ed:'ppm';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Link:1;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������������ ��2';Frm:SSSS;Ed:'ppm';TipSens:SensorRCS;Min:0;Max:3000;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdTask),
(Name:'���������� ������������';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:0;Max:1400;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),

// ------- ����������� ��������� ������� ---------------------------

(Name:'������ 1 � ����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Link:linkPape;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect+kdSubSys+kdNewTree),
(Name:'������ 1 ������� T ����';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-1;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 ��������';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-2;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Link:-3;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:80;Def:HIDE_MIN_MAX;
    Link:-4;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ 1 ����-����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-5;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'������ 1 ��������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-6;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 ������������ ������';Frm:SSpS0;Ed:'';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-7;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg+kdPump),
(Name:'������ 1 �����';Frm:SS;Ed:'';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-8;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdPump),

(Name:'������ 2 � ����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Link:linkPape;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect+kdSubSys),
(Name:'������ 2 ������� ����������� ����';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-1;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 ��������';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-2;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Link:-3;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:80;Def:HIDE_MIN_MAX;
    Link:-4;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ 2 ����-����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'������ 2 ��������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 ������������ ������';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg+kdPump),
(Name:'������ 2 �����';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdPump),

(Name:'������ 3 � ����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect+kdSubSys),
(Name:'������ 3 ������� ����������� ����';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 ��������';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:80;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ 3 ����-����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'������ 3 ��������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 ������������ ������';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg+kdPump),
(Name:'������ 3 �����';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdPump),

(Name:'������ 4 � ����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect+kdSubSys),
(Name:'������ 4 ������� ����������� ����';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 ��������';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:80;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ 4 ����-����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'������ 4 ��������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 ������������ ������';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg+kdPump),
(Name:'������ 4 �����';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdPump),

(Name:'������ 5 � ����';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor+kdEffect+kdSubSys),
(Name:'������ 5 ������� ����������� ����';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 ��������';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:80;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ 5 ����-����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'������ 5 ��������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 ������������ ������';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg+kdPump),
(Name:'������ 5 �����';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdPump),

(Name:'����������� �������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:120;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdEffect+kdSubSys+kdNewTree),
(Name:'����������� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� ��������';Frm:SSpS0;Ed:'%';TipSens:TipProg;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������������ �������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:120;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdEffect+kdSubSys),
(Name:'������������ ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������� ��������';Frm:SSpS0;Ed:'%';TipSens:TipProg;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������� �� ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������� �� �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� �����������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'������� �� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

(Name:'Ultra Clima ������� �����������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdNewTree;o1:-6;op:opPlus;o2:-1),
(Name:'Ultra Clima ������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'Ultra Clima �������';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

(Name:'������� ������ 1 ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'������� ������ 1 �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������� ������ 1 ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������� ������ 1 �����������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'������� ������ 1 ������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ������ 1';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),
(Name:'������� ������ 2 ��������';Frm:SSpSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'������� ������ 2 �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������� ������ 2 ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������� ������ 2 �����������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'������� ������ 2 ������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ������ 2';Frm:SSpS0;Ed:'';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),
(Name:'������� ������ 3 ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'������� ������ 3 �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������� ������ 3 ��������';Frm:SSpSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������� ������ 3 �����������';Frm:SSpSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'������� ������ 3 ������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ������ 3';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),
(Name:'������� ������ 4 ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'������� ������ 4 �������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-2;op:opPlus;o2:-1),
(Name:'������� ������ 4 ��������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'������� ������ 4 �����������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'������� ������ 4 ������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ������ 4';Frm:SSpS0;Ed:'';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

(Name:'��������� ����� � ����� �������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdEffect+kdSubSys),
(Name:'��������� ����� � ����� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:-1;Max:130;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ����� � ����� ������� ��������';Frm:SSpS0;Ed:'%';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ����� � ����� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ����� � ����� ������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'��������� ����� � ����� ������� ���������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'��������� ����� � ����� ������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ����� � ����� �������';Frm:SSpS0;Ed:'';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

(Name:'��������� ����������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdUltraClimFan+kdEffect+kdSubSys),
(Name:'��������� ���������� �������';Frm:SSpS0;Ed:'%';TipSens:TipDo;Min:-1;Max:130;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ���������� ��������';Frm:SSpS0;Ed:'%';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ���������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ ��������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-1;Max:150;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdEffect+kdSubSys),
(Name:'������ �������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:0;Max:4;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'������ �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipDo;Min:-1;Max:130;Def:HIDE_MIN_MAX;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-6;op:opPlus;o2:-1),
(Name:'������ �������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'������ �������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-4;op:opMINUS;o2:-5),
(Name:'������ �������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ �������� ������������ ������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg+kdPump),
(Name:'������ �������� �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdPump),

(Name:'����� ����������� �������';Frm:SSpSS;Ed:'%';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
      Link:linkGorScreen;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdNewTree),
(Name:'����� ����������� ��������';Frm:SSpSS;Ed:'%';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-1;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� �������';Frm:SSpSS;Ed:'%';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-2;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� �������';Frm:SSpSS;Ed:'%';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Link:-3;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'����� ����������� ������ 1 ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-4;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'����� ����������� ������ 1 �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-5;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-5),
(Name:'����� ����������� ������ 1 ���������';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-6;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� ������ 1';Frm:SS;Ed:'';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Link:-7;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),
(Name:'����� ����������� ������ 2 ��������';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdSensor),
(Name:'����� ����������� ������ 2 �����������';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-9),
(Name:'����� ����������� ������ 2 ���������';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����������� ������ 2';Frm:SS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

(Name:'����������� ������ ������� ��� ���';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask+kdNewTree),
(Name:'����������� ������ �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'�����������';Frm:SS;Ed:'%';TipSens:TipTimer;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

(Name:'��������� ��������  �������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ��������  ������� ��������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:-3;Max:3;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdConstTask),
(Name:'��������� �������� �����������';Frm:SSpSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:110;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;o1:-1;op:opMINUS;o2:-2),
(Name:'��������� �������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:110;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ��������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:110;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR;Kind:kdReg),

//(Name:'������ ��2 (������� ��� � �����)';Frm:SSSS;Ed:'ppm';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
//    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

(Name:'���� - ������� ������� ����������';Frm:SSSS;Ed:'���';TipSens:TipTimer;Min:0;Max:30;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//============================= Contnrol and status ========================================
(Name:'������ ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)
);
var XHot502Names:array [1..2] of TXNames=(
    (Name:'��������';Frm:None;Ed:'';Index:0;Cfg:0;Kind:0;Min:0;Max:0),
    (Name:'�������';Frm:None;Ed:'';Index:0;Cfg:0;Kind:0;Min:0;Max:0));

implementation

end.
