unit DefineClim65;

interface
uses FConstType, FController, Graphics, ClimCalc, MessageU;  //DefineBoil,

//const
{        treeTA=          0;
        treeCA=          1;
        treeTR=          2;
//* ������ ��� � �������� ��������� */
        bNoWork=         1;  //0x01
        bMinMaxV=        32; //0x20
        bMinMaxU=        64; //0x40
        bHiAlarm=        4;  //0x04
        bLowAlarm=       8;  //0x08
        bHiCtrl=         16; //0x10
        bLowCtrl=        128;//0x80
//        lNorma=0;
        lHiA=0;
        lHiC=1;
        lLowC=2;
        lLowA=3;  }

type eNameStr=string[40];

//*����������� ������ ���������*/
type TUnit=(u,uB,uT,uPr,uYesNo,uOnOff,uBt,uDj,uPa,uMM,uMSec,uPPM,uGr,uKgsm);

type  eNameMes=record
        Name:string[60];
        ShowAlarm:Byte;
        LevelAlarm:Byte;
        NByte:integer;
        Mask:Byte;
        NPar:Word;
        Voice:string[20];
        end;
type  eNameASens=record
        Name:string[40];
        Frm:TSFormat;
        Ed:string[10];
        TipSens:TTipSens;
        Min,Max:word;
        end;

type eIzASens=record
        IZ:InInt;
        RCS:Byte;
        end;
type mIzASens=array [1..1] of eIzASens;
type eIzDSens=record
        RCS:Byte;
        end;
type mIzDSens=array [1..1] of eIzDSens;

const
        SProgn=         10;
        cSumContur=       7;
        cSMech=          10;
        NumTimer=10;
        NumArx=5;
        NumArxV5=3;
        cSInTeplSens=	15; // ���������� �������� � �������
        cSMeteoSens=	11; // ���������� �������� ������������

// ------- ������� ���� - ����������� ��������� ---------------------------
const
             STVirtSens=      4;
             SumCommon=       20;
             SumSensOut=      cSMeteoSens;
             StCommon=        1;
             EndCommon=       StCommon+SumCommon-1;      //� �� - ����� ������ ��������
             SourseMeteo=     StCommon+15;
             posAbsMaxWater=  16;
             posZoneMaxWater= 49;
             SSumSun=         12;
             S1TASens=        14;

             StTeplSens=      EndCommon+1;
             SumTeplASens=    cSInTeplSens;
             SumTeplDSens=    2;
             EndTeplSens=     StTeplSens+SumTeplASens+SumTeplDSens-1;                   //� �� - ����� ������ ��������

             SumTeplCalc=     12;//14;//10+STVirtSens;
             StTeplCalc=      EndTeplSens+1;                   //� �� - ����� ������ ������� ����
             EndTeplCalc=     StTeplCalc+SumTeplCalc-1;                  //� �� - ����� ��������� ������� ����

             SumTeplWarm=     13+10*5;//11+10*5;//51;
             StTeplWarm=      EndTeplCalc+1;       //� �� - ����� ������ �������� ��������
             EndTeplWarm=     StTeplWarm+SumTeplWarm-1;       //� �� - ����� ��������� �������� ��������

             SumTeplVent=     13;
             StTeplVent=      EndTeplWarm+1;       //� �� - ����� ������ �������� ��������
             EndTeplVent=     StTeplVent+SumTeplVent-1;       //� �� - ����� ��������� �������� ��������

             SumTeplScreen=   7;
             StTeplScreen=    EndTeplVent+1;           //� �� - ����� ������ �������� ������
             EndTeplScreen=   StTeplScreen+SumTeplScreen-1;

               SCalcPump=       5;
               SCalcRegul=      13;
               SCalcMecan=      SCalcPump+SCalcRegul;
               SASens=20;

             SumTeplMecan=    42; //56;
             StTeplMecan=     EndTeplScreen+1;              //� �� - ����� ������ ��������� ����������
             EndTeplMecan=    StTeplMecan+SumTeplMecan-1;
             StTeplRez=       EndTeplMecan+1;
             SumTeplRez=      0;
             EndTeplRez=      StTeplRez+SumTeplRez-1;
             SumMesTepl=      EndTeplRez-SumCommon;
             SumMesHot=       EndTeplRez;//SumMesTepl+SumCommon;

             ibNews=           0;
//			/*���� ����� �� ��*/
             iSensOut=        1;//7;
             iPCSend325=      0;//iSensOut;
             sizeSensOut=     cSMeteoSens*3;
             iNextTAir=       iSensOut+sizeSensOut;//iRez+12;
             iAbsMaxWater=    iNextTAir;
             iVosx=           iNextTAir+8;//iRez+sizeRez;
//             iVosx=           iPulRelay+8;//iRez+sizeRez;
             iSumSun=         iVosx+4;//iPCBlock+sizePCBlock325-2;//6;
             iRezer=          iSumSun+2;
             iPulRegul=       iSumSun+2;
             iMidlSR=         iRezer+12;
             sizePCSend325=   iMidlSR;
             iMidlWind=       iMidlSR+2;
             iPozFluger=      iMidlSR+4;
             iTime=           iPozFluger+2;
             iHand=           iTime+5;
             cSendTime=       iHand+1;

//typedef struct eeTepl
	{

				uchar 		Cfg[2];

				eSensing	InTeplSens[cSInTeplSens];
				char		DiskrSens[4];

				int			RCS;
/*
	0�01 - 1 - ��� ������� �����������
	0�02 - 1 - ��� ��������� �����������
	0�04 - 1 - ����������� ��������������� �� ������
	0�08 - 1 - �����������
*/
				eClimTask	AllTask;
				eOtherCalc	OtherCalc;

				eWaterCalc	WaterCalc;
				eKontur		Kontur[cSKontur+1];
				eMechanic	Mechanic[cSMechanic+1];
		 eTepl;					}

             iTepl=           iHand+1;//iPozFluder+2;
              itConfig=        0;
              itSensorIn=      2;
              itTAir=          2;
              itRH=            5;
              itTSheet=        8;
              sizeSensorIn=    cSInTeplSens*3;
              itTeplDSens=     itSensorIn+sizeSensorIn;
              itTeplRCS=       itTeplDSens+4;
                itTeplTemRSC=  itTeplRCS+1;
                itTeplWinRSC=  itTeplRCS+0;
              itClimTask=      itTeplRCS+2;
              itTaskT=         itClimTask;
              itDoT=           itTaskT+2;
              sizeClimTask=    24;//22;
              itOtherCalc=     itClimTask+sizeClimTask;
              sizeOtherCalc=   8;
              itWaterCalc=     itOtherCalc+sizeOtherCalc;
              itRaisedCritery=  itWaterCalc;
              sizeWaterCalc=   28 ;
              itKontur=        itWaterCalc+sizeWaterCalc;
                itKonturRCS=   itKontur+20;
              size1Kontur=     22;
              SizeContur=      size1Kontur;
              iZoneMaxWater=   itKontur+(cSumContur)*size1Kontur;
              itMechanic=      itKontur+(cSumContur)*size1Kontur;
              size1Mec=        2;
              sizeTepl=        itMechanic+(cSMech+1)*size1Mec;

              // ( MESI
              // �������� �� ��������� ���� ������ � ����������
              iMech=           iTepl + sizeTepl*2;
              // ������ ���������� ����� (20 ���������� * 2 �����)
              sizeTMech=       40;
              // ���������� �������� ����������
              START_MECH_NUM= 133;
//              ZONE_SM= 180;
//              MECH_KOL = 28;

{ 1 ���� - RCS
2 ���� - ���������

��� �����������:
0 ��� RCS - ����� ������:       ���� (0) / ����(1)
1 ��� RCS - ������� ���������:  ���� (0) / ��� (1)
MESI }

// ����� ���� RCS �������� CO2, � ������� ������ ��� ��������� (������, ��������)
//CO2_TYPE_BIT_NUM: Byte = 7;
// ������ ���������� � ��������� cDefineMech
T_VALVE1      = 1;
T_PUMP1       = 2;
T_VALVE2      = 3;
T_PUMP2       = 4;
T_VALVE3      = 5;
T_PUMP3       = 6;
T_VALVE4      = 7;
T_PUMP4       = 8;
T_VALVE5      = 9;
T_PUMP5       = 10;
T_FRAM_NORTH  = 11;
T_FRAM_SOUTH  = 12;
T_SCREEN      = 13;
T_CO2         = 14;
T_VENT        = 15;
T_VAG         = 16;
T_SIO_PUMP    = 17;
T_SIO_VALVES  = 18;
T_PRES_REG    = 19;
T_LIGHT      = 20;
T_EXTREG1     =21;

SValTp=130;
//cSumZona=  3;


type TDefineHot=array [1..SumMesHot] of TNameConst;

const
cDefineHotV0:TDefineHot=( //array [1..EndHot] of eNameConst=(
// ----------------- ����������� -----------------
{1}(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:SensorRCS;Min:-40;Max:60;Index:iSensOut),
(Name:'������������� �o����';Frm:SSSS;Ed:'��/�2';TipSens:SensorRCS;Min:0;Max:2000;Index:iSensOut+3),
(Name:'�������� �����';Frm:SSpS0;Ed:'�/���';TipSens:SensorRCS;Min:0;Max:40;Index:iSensOut+6),
(Name:'����������� �����';Frm:SSSS;Ed:'�';TipSens:SensorRCS{TipText};Min:0;Max:360;Index:iSensOut+9),
(Name:'�����';Frm:SSSS;Ed:'';TipSens:TipNoCalibr;Min:-10;Max:10;Index:iSensOut+12),
(Name:'B�������� ��������';Frm:SSpS0;Ed:'%';TipSens:SensorRCS;Min:0;Max:100;Index:iSensOut+15),
(Name:'����������� ���� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Index:iSensOut+18),
(Name:'����������� ���� ��������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:100;Index:iSensOut+21),
(Name:'�������� ���� ������';Frm:SSSpS;Ed:'��/��2';TipSens:TipSensor;Min:0;Max:16;Index:iSensOut+24),
{10}(Name:'�������� ���� ��������';Frm:SSSpS;Ed:'��/��2';TipSens:TipSensor;Min:0;Max:14;Index:iSensOut+27),
(Name:'������ ����';Frm:SSSS;Ed:'�3/���';TipSens:TipSensor;Min:0;Max:600;Index:iSensOut+30),

(Name:'����������� �o������� ��������';Frm:SSSS;Ed:'��/��2';TipSens:TipSR;Min:0;Max:8000;Index:iSumSun),
(Name:'��������� �������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipSun;Min:0;Max:2000;Index:iMidlSR),
(Name:'����� �������';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:0;Max:40;Index:iMidlSR+2),
(Name:'����������� ������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comNord;Max:comNord+1;Index:iMidlSR+4),
(Name:'������ ����������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:2;Index:iHand),
(Name:'����� ������� ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:cMin;Max:24*60*cMin;Index:iVosx),
(Name:'����� ������ ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:cMin;Max:24*60*cMin;Index:iVosx+2),
(Name:'����� � �����������';Frm:SShSSm;Ed:'���:���';TipSens:TipTime;Min:cMin;Max:24*60*cMin;Index:iTime),
{20}(Name:'���� � �����������';Frm:SSsSS;Ed:'';TipSens:TipTime;Min:35065;Max:200*365;Index:iTime+2),

// ------- ���������� ��������� �������  -----------------------
{21}(Name:'������ ������� ';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{TipSensor};Min:3;Max:70;Index:itTAir),
(Name:'������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipSensor;Min:3;Max:100;Index:itRH),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:10;Max:60;Index:itTAir+6),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:10;Max:60;Index:itTAir+9),
{25}(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:0;Max:70;Index:itTAir+12),
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:-25;Max:70;Index:itTAir+15),
(Name:'������������ ��2';Frm:SSSS;Ed:'ppm';TipSens:TipSensor;Min:100;Max:3000;Index:itTAir+18),
(Name:'������ ������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask;Min:3;Max:70;Index:itTAir+21),
//(Name:'������ ������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:3;Max:70;Index:itTAir+21),
(Name:'������������';Frm:SSpS0;Ed:'��/���';TipSens:TipSensor;Min:0;Max:70;Index:itTAir+24),
(Name:'������� �����';Frm:SSSS;Ed:'��';TipSens:TipSensor;Min:0;Max:100;Index:itTAir+27),
{31}(Name:'���� ������ ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:10;Max:150;Index:itTAir+30),
(Name:'���� ������ ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:10;Max:150;Index:itTAir+33),
(Name:'���� ������ ������ 3';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:10;Max:150;Index:itTAir+36),
(Name:'���� ������ ������ 4';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:10;Max:150;Index:itTAir+39),
(Name:'���� ������ ������ 5';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:10;Max:150;Index:itTAir+42),
{36}(Name:'��������� ��������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itTeplDSens+1),
{37}(Name:'��������� ������';Frm:ComboBit;Ed:'1';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itTeplDSens+1),

// ------- ����������� ��������� ������� ---------------------------
{38}(Name:'����������� ������� - ������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:3;Max:35;Index:itTaskT),
(Name:'����������� ������� - �������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:3;Max:35;Index:itTaskT+2),
{40}
(Name:'��������� ������� - ������ �� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:95;Index:itTaskT+10),
(Name:'��������� ������� - �������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:95;Index:itTaskT+12),
(Name:'����������� ���������� - ���������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:5;Max:40;Index:itTaskT+4),

{43}(Name:'��2 - ������ �� ���������';Frm:SSSS;Ed:'ppm';TipSens:TipTimer;Min:0;Max:1500;Index:itTaskT+14),
(Name:'��2 - ������� ������������';Frm:SSSS;Ed:'ppm';TipSens:TipSun;Min:0;Max:1500;Index:itTaskT+16),

(Name:'���������� ��������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:AbsRH;Min:0;Max:20;Index:0{iRez}),
(Name:'������� �������� ���� �������';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:20;Index:0{iRez}),
{47}(Name:'������� �������� ���� �����';Frm:SSpS0;Ed:'�/�3';TipSens:DDWPS;Min:0;Max:20;Index:0{iRez}),
(Name:'����� ����';Frm:SSpS0;Ed:'�C';TipSens:TR;Min:0;Max:40;Index:0{iRez}),
{49}
(Name:'������������ �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:iZoneMaxWater;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
//(Name:'������ �����������-(����-����)';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:-5;Max:5;Index:iContur+12),//iDifferTemp),
//(Name:'������� ������� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:3;Max:35;Index:itTaskT+6),
//(Name:'������� ������� ���������';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:95;Index:itTaskT+8),
//(Name:'������� �����������';Frm:SSpS0;Ed:'�C';TipSens:PrognT;Min:0;Max:50;Index:iNextTAir),
{52}
{				int		DifTAirTDo;//������� ��������������� � ��������
				int		UpSR;//��������� ����������� ������� �������	2
				int		LowGlass;//�������� ������	4
				int		LowOutWinWind;//�������� ����� � ������� �����������	6
				int		UpLight;//�������� ��������� ��������	8
				int		ICorrection;//��������� ����������� ������� �� �������� ������� � ���������	10
				int		LowRain;//�������� ������	12

				int		DCorrection;//��������� ����������� ������� �� 2 ��������	14    SSSpS
				int		UpScreen;//�������� �����	16
				int		PCorrection;//��������� ����������� ������� �� 1 ��������	18     SSSpSSSSpS

				int		Critery;//����-�������� ������������� ��	20                   SSSpS
				int		dNextTCalc;//������� ����������� (��� �����������)	22

				int		dSumCalc;//���������� ������� �������	24                       SSSpS

				int		LastCrit;//������� �� ���������� ��������	26                   SSSpS
}
(Name:'� ������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipSun;Min:0;Max:60;Index:itRaisedCritery+2),
(Name:'� ������� - (����-�����) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:30;Index:itRaisedCritery+6),
(Name:'� ������� - (����-�������) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:30;Index:itRaisedCritery+4),
//(Name:'� �������- (����-�������)�������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Index:itRaisedCritery+10),
//(Name:'� �������- (����-�����) �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipAdd;Min:-80;Max:80;Index:itRaisedCritery+18),
(Name:'� ������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Index:itRaisedCritery+12),
(Name:'� ������� - �������� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Index:itRaisedCritery+8),
(Name:'� ������� - ����� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Index:itRaisedCritery+16),
(Name:'� ������� - ����� ������� ��������(�10)';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:-300;Max:300;Index:itRaisedCritery+24),
//57
(Name:'� ������� - ��������������� � ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-5;Max:5;Index:itRaisedCritery),
//(Name:'� ������� - ������� ���������������';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Index:itRaisedCritery+22),
(Name:'� ������� - (�) �������� �� (�10)';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:100;Index:itRaisedCritery+18),
(Name:'� ������� - (�) �������� �� (�10)';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:100;Index:itRaisedCritery+10),
(Name:'� ������� - (�) �������� �� (�10)';Frm:SSSpS;Ed:'�C';TipSens:TipAdd;Min:-100;Max:100;Index:itRaisedCritery+14),
(Name:'� ������� - ����������������(�10)';Frm:SSSpS;Ed:'�C';TipSens:TipAdd;Min:-400;Max:400;Index:itRaisedCritery+26),
(Name:'���� - �������� ������������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-400;Max:400;Index:itRaisedCritery+20),
{63}
(Name:'������ 1 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Index:itKontur+2),
(Name:'������ 1 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Index:itKontur+4),
(Name:'������ 1 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Index:itKontur+6),
(Name:'������ 1 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Index:itKontur),
(Name:'������ 1 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Index:itKontur+10),
// Wpr=Wdt*dTnext+Wrh*dRH/10+Wopt*dTopt/10
(Name:'������ 1 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Index:itKontur+12),
// Weco=Wpr*Keco(k)/Keco(1)
(Name:'������ 1 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Index:itKontur+8),
(Name:'������ 1 - ��������� � �������������';Frm:SS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Index:itKontur+21),
(Name:'������ 1 - �������� ����� ����'{'����� � ����������� �������'};Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Index:itKontur+16),
(Name:'������ 1 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Index:itKontur+18),
{73}
(Name:'������ 2 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Index:itKontur+size1Kontur+2),
(Name:'������ 2 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Index:itKontur+size1Kontur+4),
(Name:'������ 2 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Index:itKontur+size1Kontur+6),
(Name:'������ 2 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Index:itKontur+size1Kontur),
(Name:'������ 2 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Index:itKontur+size1Kontur+10),
(Name:'������ 2 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Index:itKontur+size1Kontur+12),
(Name:'������ 2 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Index:itKontur+size1Kontur+8),
(Name:'������ 2 - ��������� � �������������';Frm:SS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Index:itKontur+size1Kontur+21),
(Name:'������ 2 - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Index:itKontur+size1Kontur+16),
(Name:'������ 2 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Index:itKontur+size1Kontur+18),
{83}
(Name:'������ 3 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Index:itKontur+size1Kontur*2+2),
(Name:'������ 3 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Index:itKontur+size1Kontur*2+4),
(Name:'������ 3 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Index:itKontur+size1Kontur*2+6),
(Name:'������ 3 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Index:itKontur+size1Kontur*2),
(Name:'������ 3 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*2+10),
(Name:'������ 3 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*2+12),
(Name:'������ 3 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Index:itKontur+size1Kontur*2+8),
(Name:'������ 3 - ��������� � �������������';Frm:SS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*2+21),
(Name:'������ 3 - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Index:itKontur+size1Kontur*2+16),
(Name:'������ 3 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Index:itKontur+size1Kontur*2+18),
{93}
(Name:'������ 4_�������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Index:itKontur+size1Kontur*3+2),
(Name:'������ 4_������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Index:itKontur+size1Kontur*3+4),
(Name:'������ 4_������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Index:itKontur+size1Kontur*3+6),
(Name:'������ 4_������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Index:itKontur+size1Kontur*3),
(Name:'������ 4 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*3+10),
(Name:'������ 4 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*3+12),
(Name:'������ 4 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Index:itKontur+size1Kontur*3+8),
(Name:'������ 4 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*3+14),
(Name:'������ 4 - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Index:itKontur+size1Kontur*3+16),
(Name:'������ 4 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Index:itKontur+size1Kontur*3+18),
{103}
(Name:'������ 5_�������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Index:itKontur+size1Kontur*4+2),
(Name:'������ 5_������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Index:itKontur+size1Kontur*4+4),
(Name:'������ 5_������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Index:itKontur+size1Kontur*4+6),
(Name:'������ 5_������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Index:itKontur+size1Kontur*4),
(Name:'������ 5 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*4+10),
(Name:'������ 5 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*4+12),
(Name:'������ 5 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Index:itKontur+size1Kontur*4+8),
(Name:'������ 5 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*4+14),
(Name:'������ 5 - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Index:itKontur+size1Kontur*4+16),
(Name:'������ 5 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Index:itKontur+size1Kontur*4+18),
{113}
(Name:'�������-����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comFram;Max:comFram+2;Index:itClimTask+18),
(Name:'������� ���� ����������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Index:itKontur+size1Kontur*6+2),
(Name:'������� ���� ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Index:itKontur+size1Kontur*5+2),
(Name:'������� ������� ����� � ���������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Index:itKontur+size1Kontur*5+4),
(Name:'������� ������� ��������� �� ������';Frm:SSSS;Ed:'%';TipSens:TipSun;Min:0;Max:100;Index:itKontur+size1Kontur*5+6),
(Name:'������� - ���������� ����������� ���';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:100;Index:itKontur+size1Kontur*5),
(Name:'������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*5+10),
(Name:'������� - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Index:itKontur+size1Kontur*5+12),
(Name:'������� - ����������� ��������';Frm:SSpSSS;Ed:'%';TipSens:TipCalc;Min:-5;Max:5;Index:itKontur+size1Kontur*5+8),
(Name:'������� - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Index:itKontur+size1Kontur*5+14),
(Name:'������� - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:200;Index:itKontur+size1Kontur*5+16),
{124}(Name:'������� - ������� ������������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Index:itKontur+size1Kontur*5+18),
(Name:'������� - ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Index:itKontur+size1Kontur*6+18),
{126}
(Name:'�����-����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Index:itClimTask+22),
(Name:'�����-���������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Index:itOtherCalc),
{128}(Name:'�����������-����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Index:itClimTask+21),
(Name:'�����������-������ ������� ��� ���';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:10;Index:itOtherCalc+2),
(Name:'�����������-������ �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:10;Index:itOtherCalc+4),
(Name:'���� - ������� ������� ����������';Frm:SSSS;Ed:'���';TipSens:TipTimer;Min:0;Max:30;Index:itClimTask+19),
(Name:'���� - ����� ������ � ������ �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;Index:itOtherCalc+6),
{133}
// ( MESI
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������������ ������ 1';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������������ ������ 2';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+2),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������������ ������ 3';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+4),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������������ ������ 4';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+6),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������������ ������ 5';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+8),
{143}
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'����� ������� 1';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itKonturRCS),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'����� ������� 2';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itKonturRCS+size1Kontur),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'����� ������� 3';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itKonturRCS+size1Kontur*2),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'����� ������� 4';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itKonturRCS+size1Kontur*3),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'����� ������� 5';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itKonturRCS+size1Kontur*4),
{153}
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������� �����';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+10),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������� ��';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+12),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'�����������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itMechanic+18),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'��������� �������';Frm:ComboBit;Ed:'1';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Index:itMechanic+18),
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'�����';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+16),
{163}
(Name:'������';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������� ��2';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Index:itMechanic+14),
{165}
(Name:'������ 1';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 2';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 3';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 4';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 5';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 6';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 7';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 8';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 9';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 10';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic)
//175
{(Name:'������ 11';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 12';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 13';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 14';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 15';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 16';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic)
(Name:'������ 17';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 18';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 19';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 20';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
//186
(Name:'������ 21';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 22';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
//188
(Name:'������ 35';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic),
(Name:'������ 36';Frm:None;Ed:'';TipSens:TipBit;Min:0;Max:0;Index:itMechanic)
}
{�����: 190. ����� 58 ����������}
// MESI )
);

{typedef struct eeHot
				uchar 		News;
			/*���� ����� �� ��*/
				eSensing 	MeteoSens[cSMeteoSens];//11
//typedef struct eeSensing {
//				int		Value;
//				uchar	RCS;
				int			NextTAirSens[2];
				int			NextRHAirSens[2];
				int			Vosx;
				int			Zax;
/***************************************/
				int			SumSun;
				int			Rez[6];
				int			MidlSR;
				int			MidlWind;
				int			PozFluger;
				uint 		Time;
				uint 		Data;
				uchar 		Year;
				uchar 		Demo;
/***************************************/				
				eTepl 		Tepl[cSTepl];
/***************************************/
				eMechanic	HandCtrl[cSTepl][cSHandCtrls];			
				 eHot;   }
const
         iWind65 = iSensOut+6;
         iDirWind65 = iSensOut+9;
// ���� ���������
const
cDefineHotV1:TDefineHot=(
// ----------------- ����������� -----------------
//1
(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:-40;Max:60;Def:HIDE_MIN_MAX;
    Index:iSensOut;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������� �o����';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;Def:HIDE_MIN_MAX;
    Index:iSensOut+3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� �����';Frm:SSpS0;Ed:'�/���';TipSens:TipSensor;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:iSensOut+6;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSSS;Ed:'�';TipSens:TipSensor;Min:0;Max:360;Def:HIDE_MIN_MAX;
    Index:iSensOut+9;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�����';Frm:SSSS;Ed:'';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:iSensOut+12;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//6
(Name:'B�������� ��������';Frm:SSpS0;Ed:'%';TipSens:TipSensor;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:iSensOut+15;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:iSensOut+18;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���� ��������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:iSensOut+21;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ������';Frm:SSpSS;Ed:'��';TipSens:TipSensor;Min:0;Max:16;Def:HIDE_MIN_MAX;
    Index:iSensOut+24;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'�������� ���� ��������';Frm:SSpSS;Ed:'��';TipSens:TipSensor;Min:0;Max:14;Def:HIDE_MIN_MAX;
    Index:iSensOut+27;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//11
(Name:'������ ����';Frm:SSSS;Ed:'�3/���';TipSens:TipSensor;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:iSensOut+30;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �o������� ��������';Frm:SSSS;Ed:'��/��2';TipSens:TipSR;Min:0;Max:8000;Def:HIDE_MIN_MAX;
    Index:iSumSun;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� �������';Frm:SSSS;Ed:'��/�2';TipSens:TipSun;Min:0;Max:2000;Def:HIDE_MIN_MAX;
    Index:iMidlSR;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� �������';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:0;Max:60;Def:HIDE_MIN_MAX;
    Index:iMidlSR+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comNord;Max:comNord+1;Def:HIDE_MIN_MAX;
    Index:iMidlSR+4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//16
(Name:'���������� ���� �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:iAbsMaxWater;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//(Name:'������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:2;
//    Index:iHand;AccessR:RW_NOEDIT;AccessW:RW_SUPERVISOR),
(Name:'����� ������� ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:cMin;Max:0;Def:HIDE_MIN_MAX;
    Index:iVosx;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������ ������';Frm:SShSSm;Ed:'';TipSens:TipSun;Min:cMin;Max:0;Def:HIDE_MIN_MAX;
    Index:iVosx+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� � �����������';Frm:SShSSm;Ed:'���:���';TipSens:TipTime;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:iTime;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� � �����������';Frm:SSsSS;Ed:'';TipSens:TipTime;Min:0;Max:0;Def:HIDE_MIN_MAX;
    Index:iTime+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// ------- ���������� ��������� �������  -----------------------
//21
(Name:'������ ������� ';Frm:SSpS0;Ed:'�C';TipSens:TipGoTask{TipSensor};Min:3;Max:70;Def:HIDE_MIN_MAX;
Index:itTAir;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��������� �������';Frm:SSpS0;Ed:'%';TipSens:TipSensor;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itRH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:0;Max:60;Def:HIDE_MIN_MAX;
Index:itTAir+6;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:0;Max:60;Def:HIDE_MIN_MAX;
Index:itTAir+9;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itTAir+12;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//26
(Name:'����������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor;Min:-20;Max:80;Def:HIDE_MIN_MAX;
Index:itTAir+15;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ��2';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSensor;Min:0;Max:5000;Def:HIDE_MIN_MAX;
Index:itTAir+18;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipSensor{TipGoTask};Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itTAir+21;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� �����';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itTAir+24;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ��';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itTAir+27;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//31
(Name:'���� ������ ������ 1';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:10;Max:150;
    Index:itTAir+30;Mech:0{T_VALVE1};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 2';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itTAir+33;Mech:0{T_VALVE2};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 3';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itTAir+36;Mech:0{T_VALVE3};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 4';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itTAir+39;Mech:0{T_VALVE4};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� ������ ������ 5';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itTAir+42;Mech:0{T_VALVE5};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//36
(Name:'��������� ��������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:itTeplDSens+1;Mech:T_LIGHT ;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������';Frm:ComboBit;Ed:'1';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:itTeplDSens+1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
// ------- ����������� ��������� ������� ---------------------------
(Name:'����������� ������� - ������';Frm:SSpS0;Ed:'�C';TipSens:TipTimer;Min:3;Max:35;Def:HIDE_MIN_MAX;
Index:itTaskT;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'����������� ������� - �������';Frm:SSpS0;Ed:'�C';TipSens:TipSun;Min:3;Max:35;Def:HIDE_MIN_MAX;
Index:itTaskT+2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� - ������ �� �������';Frm:SSpS0;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itTaskT+10;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
//41
(Name:'��������� ������� - �������';Frm:SSpS0;Ed:'%';TipSens:TipSun;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:itTaskT+12;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������� - ���������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:5;Max:40;Def:HIDE_MIN_MAX;
    Index:itTaskT+4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������ �� ���������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipTimer;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:itTaskT+14;Mech:T_CO2;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'��2 - ������� ������������';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;Def:HIDE_MIN_MAX;
    Index:itTaskT+16;Mech:T_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���������� ��������� �������';Frm:SSpS0;Ed:'�/�3';TipSens:AbsRH;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:0{iRez};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//46
(Name:'������� �������� ���� �������';Frm:SSpS0;Ed:'�/�3';TipSens:DDWP;Min:0;Max:40;Def:HIDE_MIN_MAX;
    Index:0{iRez};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{47}
(Name:'������� �������� ���� �����';Frm:SSpS0;Ed:'�/�3';TipSens:DDWPS;Min:0;Max:40;Def:HIDE_MIN_MAX;
Index:0{iRez};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ����';Frm:SSpS0;Ed:'�C';TipSens:TR;Min:0;Max:70;Def:HIDE_MIN_MAX;
Index:0{iRez};AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{49}
(Name:'������������ �������������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
    Index:iZoneMaxWater;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
//(Name:'������� ������� �����������';Frm:SSpS0;Ed:'�C';TipSens:prognT;Min:3;Max:35;Def:HIDE_MIN_MAX;
//Index:itTaskT+6;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'� ������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipSun;Min:0;Max:40;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - (����-�����) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:30;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+6;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - (����-�������) �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:30;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+4;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - ������ �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+12;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - �������� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:itRaisedCritery+8;Mech:T_LIGHT;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - ����� �������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipAdd;Min:0;Max:20;Def:HIDE_MIN_MAX;
    Index:itRaisedCritery+16;Mech:T_SCREEN;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - ����� ������� ��������(�10)';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+24;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
//57
(Name:'� ������� - ��������������� � ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-10;Max:30;Def:HIDE_MIN_MAX;
Index:itRaisedCritery;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'� ������� - (�) �������� �� (�10)';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+18;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - (�) �������� �� (�10)';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+10;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - (�) �������� �� (�10)';Frm:SSSpS;Ed:'�C';TipSens:TipAdd;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+14;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'� ������� - ����������������(�10)';Frm:SSSpS;Ed:'�C';TipSens:TipAdd;Min:-40;Max:40;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+26;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'���� - �������� ������������� ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-40;Max:40;Def:HIDE_MIN_MAX;
Index:itRaisedCritery+20;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
{63}
(Name:'������ 1 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itKontur+2;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+4;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+6;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
Index:itKontur;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
Index:itKontur+10;Mech:T_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+8;Mech:T_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
Index:itKontur+12;Mech:T_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
Index:itKontur+14;Mech:T_VALVE1;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ���������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:10;Max:150;Def:HIDE_MIN_MAX;
Index:itKontur+16;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 1 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
      Index:itKontur+18;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{73}
(Name:'������ 2 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur+2;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur+4;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur+6;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 ������� ����� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipTimer;Min:0;Max:70;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur+10;Mech:T_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur+8;Mech:T_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur+12;Mech:T_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-200;Max:200;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur+14;Mech:T_VALVE2;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ���������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur+16;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 2 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur+18;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{83}
(Name:'������ 3 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+2;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+4;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+6;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+10;Mech:T_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+8;Mech:T_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+12;Mech:T_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*2+14;Mech:T_VALVE3;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ���������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Index:itKontur+size1Kontur*2+16;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 3 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur*2+18;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{93}
(Name:'������ 4 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+2;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+4;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+6;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+10;Mech:T_PUMP4;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+8;Mech:T_PUMP4;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� - �������� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:-3;Max:7;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+16;Mech:T_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� - ������� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:-3;Max:7;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+18;Mech:T_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ���������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*3+16;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 4 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur*3+18;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{103}
(Name:'������ 5 �������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:130;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+2;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+4;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 ������� ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+6;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 ������� ����� � ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:70;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� ������ (�����,RH,����)';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+10;Mech:T_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ���������������� �������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:-100;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+8;Mech:T_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+12;Mech:T_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+14;Mech:T_VALVE5;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ���������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:150;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*4+16;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ 5 - ������� ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipDo;Min:0;Max:130;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur*4+18;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{113}
(Name:'������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comFram;Max:comFram+2;Def:HIDE_MIN_MAX;
Index:itClimTask+18;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_SUPERVISOR),
(Name:'������� ���� ����������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*6+2;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ���� ������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+2;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ������� ����� � ���������';Frm:SSSS;Ed:'%';TipSens:TipTimer;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+4;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ������� ��������� �� ������';Frm:SSSS;Ed:'%';TipSens:TipSun;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+6;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ���������� ����������� ���';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� ������';Frm:SSSpS;Ed:'';TipSens:TipCalc;Min:-300;Max:300;Index:itKontur+size1Kontur*5+10;Mech:T_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - ����������� ����������';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:5;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+8;Mech:T_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� � ��������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+12;Mech:T_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - ��������� � �������������';Frm:SSSpS;Ed:'';TipSens:TipAdd;Min:-300;Max:300;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+14;Mech:T_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
(Name:'������� - �������� ����� ����';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:-100;Max:200;Def:HIDE_MIN_MAX;
    Index:itKontur+size1Kontur*5+16;Mech:T_FRAM_SOUTH;AccessR:RW_USER;AccessW:RW_SUPERVISOR),
{124}
(Name:'������� - ������� ������������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*5+18;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� - ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipDo;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:itKontur+size1Kontur*6+18;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{126}
(Name:'����� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comScreen;Max:comScreen+2;Def:HIDE_MIN_MAX;
    Index:itClimTask+22;Mech:T_SCREEN;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� - ���������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:itOtherCalc;Mech:T_SCREEN;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
{128}
(Name:'����������� - ����� ������ �� ���������';Frm:ComboSS;Ed:'';TipSens:TipTimer;Min:comOnOff;Max:comOnOff+2;Def:HIDE_MIN_MAX;
    Index:itClimTask+21;Mech:T_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� - ������ ������� ��� ���';Frm:SSpS0;Ed:'�C';TipSens:TipProg;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:itOtherCalc+2;Mech:T_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� - ������ �������';Frm:SSpS0;Ed:'�C';TipSens:TipIzm;Min:0;Max:10;Def:HIDE_MIN_MAX;
    Index:itOtherCalc+4;Mech:T_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� - ������� ������� ����������';Frm:SSSS;Ed:'���';TipSens:TipTimer;Min:0;Max:120;Def:HIDE_MIN_MAX;
    Index:itClimTask+19;Mech:T_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'���� - ����� ������ � ������ �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:32000;Def:HIDE_MIN_MAX;
    Index:itOtherCalc+6;Mech:T_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),

//133 1 ========================== Control and Status ==========================
(Name:'������������ ������ 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:iMech+0;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:iMech+1;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+18;Mech:T_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 1 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+19;Mech:T_PUMP1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:iMech+2;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//138  6
(Name:'������������ ������ 2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:iMech+3;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+20;Mech:T_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 2 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+21;Mech:T_PUMP2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:iMech+4;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 3 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+5;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//143  11
(Name:'����� ������� 3 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+22;Mech:T_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 3 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+23;Mech:T_PUMP3;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+6;Mech:T_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 4 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+7;Mech:T_VALVE4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 4 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+24;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//148  16
(Name:'����� ������� 4 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+25;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+8;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������������ ������ 5 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+9;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+26;Mech:T_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� ������� 5 ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+27;Mech:T_PUMP5;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//153   21
(Name:'������� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+10;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ����� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+11;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+12;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� �� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+13;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+14;Mech:T_SCREEN;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//158   26
(Name:'����� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+15;Mech:T_SCREEN;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��2 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+16;Mech:T_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������� ��2 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+17;Mech:T_CO2;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+28;Mech:T_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'����������� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+29;Mech:T_VENT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//163   31
(Name:'��������� ������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+30;Mech:T_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� ������� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
Index:iMech+31;Mech:T_VAG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//165   33
(Name:'��� ����� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+32;Mech:T_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��� ����� ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:iMech+33;Mech:T_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+34;Mech:T_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'C�� ������  ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:iMech+35;Mech:T_SIO_VALVES;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+6;Mech:T_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� �������� ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
Index:iMech+7;Mech:T_PRES_REG;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//171   39
(Name:'������ �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
Index:iMech+36;Mech:T_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'������ ���������';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
    Index:iMech+37;Mech:T_LIGHT;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
//188}
(Name:'��������� 1 �����';Frm:ComboBit;Ed:'0';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:HIDE_MIN_MAX;
    Index:iMech+6;Mech:T_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR),
(Name:'��������� 1 ���������';Frm:SS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;Def:HIDE_MIN_MAX;
    Index:iMech+7;Mech:T_EXTREG1;AccessR:RW_GUEST;AccessW:RW_SUPERVISOR)

{�����: 190, �� ��� 58 ����������}
);

// ------- ��������� � �������������� ��������� -----------------
const   SumTeplDiadnos=   30;//46;             // ����� ���������
        SumDiadnos=       {SumComDiadnos+}SumTeplDiadnos;            // ����� ���������
//        iMes=           1;              // �������� ������ RCS ������������ Hot.Cfg
//        iMesContur=     iContur*2+18;      �������� RCS �������� ������������ Hot.RSC
   //     nMesMin1=       28;             // ����� ��������� �  �������� 1 �������
   //     nMesMax1=       nMesMin1+1;     // ����� ��������� �  ��������� 1 �������
   //     nMesMin2=       nMesMin1+2;     // ����� ��������� �  �������� 2 �������
   //     nMesMax2=       nMesMin1+3;     // ����� ��������� �  ��������� 2 �������
        clKontur100=clFuchsia;
        clKontur0=clBlue;
        clKonturMax=clFuchsia;
        clKonturMin=$C306A3;//clBlue;
        clNoEff=clAqua;
type TClimatDiagnos=array [1..SumDiadnos] of TDiagnos;    //30
const
comClimatDiagnosV1:array [1..SumDiadnos] of TDiagnos = (
   (Name:'��� ������� ����������� �������';ShowPozition:29;LevelAlarm:alFatal;
      PosInHot:39;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoTask'),
   (Name:'��� ��������� ����������� �������';ShowPozition:25;LevelAlarm:alFatal;
      PosInHot:21;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesAir'),
   (Name:'��� ��������� ����������� ���� � ������� 1';ShowPozition:21;LevelAlarm:alFatal;
      PosInHot:71;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater1';Mech:T_VALVE1),
   (Name:'��� ��������� ����������� ���� � ������� 2';ShowPozition:15;LevelAlarm:alFatal;
      PosInHot:81;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater2';Mech:T_VALVE2),
   (Name:'��� ��������� ����������� ���� � ������� 3';ShowPozition:11;LevelAlarm:alFatal;
      PosInHot:91;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater3';Mech:T_VALVE3),
   (Name:'��� ��������� ����������� ���� � ������� 4';ShowPozition:8;LevelAlarm:alFatal;
      PosInHot:101;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater4';Mech:T_VALVE4),
   (Name:'��� ��������� ����������� ���� � ������� 5';ShowPozition:5;LevelAlarm:alFatal;
      PosInHot:111;Oper:BLE;OperValue:0;Color:clRed;Voice:'NoMesWater5';Mech:T_VALVE5),

   (Name:'������ ������� 1 � ������ ������';ShowPozition:19;LevelAlarm:alHand;
      PosInHot:133;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_VALVE1;),
   (Name:'����� ������� 1 � ������ ������';ShowPozition:16;LevelAlarm:alHand;
      PosInHot:135;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_PUMP1;),
   (Name:'������ ������� 2 � ������ ������';ShowPozition:13;LevelAlarm:alHand;
      PosInHot:137;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_VALVE2;),
   (Name:'����� ������� 2 � ������ ������';ShowPozition:10;LevelAlarm:alHand;
      PosInHot:139;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_PUMP2;),
   (Name:'������ ������� 3 � ������ ������';ShowPozition:7;LevelAlarm:alHand;
      PosInHot:141;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_VALVE3;),
   (Name:'����� ������� 3 � ������ ������';ShowPozition:4;LevelAlarm:alHand;
      PosInHot:143;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_PUMP3;),
   (Name:'������ ������� 4 � ������ ������';ShowPozition:2;LevelAlarm:alHand;
      PosInHot:145;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_VALVE4;),
   (Name:'����� ������� 4 � ������ ������';ShowPozition:-2;LevelAlarm:alHand;
      PosInHot:147;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_PUMP4;),
   (Name:'������ ������� 5 � ������ ������';ShowPozition:-5;LevelAlarm:alHand;
      PosInHot:149;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_VALVE5;),
   (Name:'����� ������� 5 � ������ ������';ShowPozition:-8;LevelAlarm:alHand;
      PosInHot:151;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl';Mech:T_PUMP5;),

{8}(Name:'� ���� � 1-� ������� �� ������������';ShowPozition:-1;LevelAlarm:alAttention;
      PosInHot:68;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul1';Mech:T_VALVE1),
   (Name:'� ���� � 2-� ������� �� ������������';ShowPozition:-4;LevelAlarm:alAttention;
      PosInHot:78;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul2';Mech:T_VALVE2),
   (Name:'� ���� � 3-� ������� �� ������������';ShowPozition:-7;LevelAlarm:alAttention;
      PosInHot:88;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul3';Mech:T_VALVE3),
   (Name:'� ���� � 4-� ������� �� ������������';ShowPozition:-10;LevelAlarm:alAttention;
      PosInHot:98;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul4';Mech:T_VALVE4),
   (Name:'� ���� � 5-� ������� �� ������������';ShowPozition:-13;LevelAlarm:alAttention;
      PosInHot:108;Oper:BGT;OperValue:90;Color:clRed;Voice:'NoRegul5';Mech:T_VALVE5),

   (Name:'������ 1 ������� ��������� ������';ShowPozition:0;LevelAlarm:alBlueAttention;
      PosInHot:134;Oper:BLE;OperValue:3;Color:clKontur0;Mech:T_VALVE1),
   (Name:'������ 1 ������� ��������� ������';ShowPozition:-22;LevelAlarm:alBlueAttention;
      PosInHot:134;Oper:BGT;OperValue:97;Color:clKontur100;Mech:T_VALVE1),
   (Name:'������ 2 ������� ��������� ������';ShowPozition:0;LevelAlarm:alBlueAttention;
      PosInHot:138;Oper:BLE;OperValue:3;Color:clKontur0;Mech:T_VALVE2),
   (Name:'������ 2 ������� ��������� ������';ShowPozition:-26;LevelAlarm:alBlueAttention;
      PosInHot:138;Oper:BGT;OperValue:97;Color:clKontur100;Mech:T_VALVE2),
   (Name:'������ 3 ������� ��������� ������';ShowPozition:0;LevelAlarm:alBlueAttention;
      PosInHot:142;Oper:BLE;OperValue:3;Color:clKontur0;Mech:T_VALVE3),
   (Name:'������ 3 ������� ��������� ������';ShowPozition:-30;LevelAlarm:alBlueAttention;
      PosInHot:142;Oper:BGT;OperValue:97;Color:clKontur100;Mech:T_VALVE3),
   (Name:'������ 4 ������� ��������� ������';ShowPozition:-34;LevelAlarm:alBlueAttention;
      PosInHot:146;Oper:BGT;OperValue:97;Color:clKontur100;Mech:T_VALVE4),
   (Name:'������ 5 ������� ��������� ������';ShowPozition:-38;LevelAlarm:alBlueAttention;
      PosInHot:150;Oper:BGT;OperValue:97;Color:clKontur100;Mech:T_VALVE4)
    );

//begin-----------���� ������������ ������������-----------------

const SumConfigOutputs=26;
      SizeConfigOutputs=25;
      MAX_NUM_RELAY=48;
var NameConfigOutputs:array [1..SumConfigOutputs] of TNameConst=(
(Name:'������������ ������ 1';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:0;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 1';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:9;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 2';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:1;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 2';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:10;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 3';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:2;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 3';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:11;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 4';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:3;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 4';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:12;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ 5';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:4;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������� 5';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:13;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//6
//11
(Name:'������� �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:5;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ��';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:6;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:7;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ��2';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:8;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�����������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:14;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//16
(Name:'��������� �������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:15;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� �����';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:16;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'C�� �������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:17;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:3;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:18;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:24;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
//21
(Name:'���������1';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:19;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������2';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:20;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������3';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:21;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������4';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:22;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������5';Frm:SS;Ed:'';TipSens:TipIzm;Min:0;Max:MAX_NUM_RELAY;
    Index:23;Mech:0;AccessR:R_CONFIG;AccessW:W_CONFIG)
);
// ------- ��������� ���������� ����������� 65 ---------

const        SumParUpr=         139;
             iSunToClim=          0;
             iSunToMinFram=       iSunToClim+24;
             iTfram=              iSunToClim+15*2;
             iMaxTPipe=           iTfram+5*2;
             iMinTPipe=           iMaxTPipe+5*2;
             iOptTPipe=           iMinTPipe+3*2;
             iTask5Kon=           iOptTPipe+3*2;
             iPAirToWater=        iTask5Kon+3*2;
             iCalcWater=          iPAirToWater+2*2;
             iParValve=           iCalcWater+28*2;
             iFram=               iParValve+3*2;
             iSunToFram=          iFram+14*2;
             iCO2=                iSunToFram+3*2;
             iScreen=             iCO2+2*2;
             iSiod=               iScreen+20*2;
             iVentil=             iSiod+10*2;
             iCalorifer=          iVentil+3*2;
             iConst=              iCalorifer+2*2;
             iRHToT=              iConst+3*2;
             iDelPup=             iRHToT+6*2;
             iScreenGlass=        iDelPup+2;
             iPar3_4Kontur=       iScreenGlass+8;//iDelPup+2;
             iRez=                iPar3_4Kontur+4;
             LongArrayConst=iRez+2*2;
var NameParUpr:array [1..SumParUpr] of TNameConst=(
         (Name:'������ 1 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:95;Def:60;Index:iMaxTPipe;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 2 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:90;Index:iMaxTPipe+2;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 3 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:60;Index:iMaxTPipe+4;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 4 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:40;Index:iMaxTPipe+6;Mech:T_VALVE4;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������ 5 - ������������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;Def:110;Index:iMaxTPipe+8;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ ������� ������������ �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:100;Index:iFram;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),
         (Name:'������� - ������������ ������� ����������� �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:100;Index:iFram+2;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_GUEST),

         (Name:'����������� ������ - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:iSunToClim;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:300;Index:iSunToClim+2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ������ ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:iSunToClim+4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ���������� ��������� �������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:30;Def:5;Index:iRHToT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ���������� ��������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:30;Max:50;Def:30;Index:iRHToT+2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ���������� ��������� ����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:2;Def:0;Index:iRHToT+4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ���������� ��������� �������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:30;Def:5;Index:iRHToT+6;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ���������� ��������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:30;Max:50;Def:30;Index:iRHToT+8;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� ������ - ���������� ��������� ��������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:2;Def:0;Index:iRHToT+10;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� ������ - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:100;Def:0;Index:iSunToClim+6;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� ������ - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:300;Index:iSunToClim+8;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� ������ - ������ ����������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:30;Def:0;Index:iSunToClim+10;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������������ ��2 - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:iSunToClim+12;Mech:T_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������������ ��2 - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:300;Index:iSunToClim+14;Mech:T_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������������ ��2 - ������ ����������� ��';Frm:SSSS;Ed:'ppm';TipSens:TipCalc;Min:0;Max:500;Def:000;Index:iSunToClim+16;Mech:T_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'� ������� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:iCalcWater+26;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:200;Max:800;Def:300;Index:iCalcWater+28;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:15;Index:iCalcWater+30;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - (����-�������)�������� ������ ��� ';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:3;Index:iCalcWater+14;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - (����-�������)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:50;Def:30;Index:iCalcWater+16;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - (����-�������)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:25;Def:15;Index:iCalcWater+18;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - (����-�����)�������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:4;Index:iCalcWater+32;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - (����-�����)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:20;Max:80;Def:50;Index:iCalcWater+34;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - (����-�����)�������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:35;Def:30;Index:iCalcWater+36;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:6;Def:1.5;Index:iCalcWater+38;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - ����� ������ ��';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:6;Max:25;Def:15;Index:iCalcWater+40;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - ����� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:15;Def:5;Index:iCalcWater+42;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - ������� �������� ������ ���';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:0;Index:iCalcWater+44;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'� ������� - ������� ������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:20;Max:100;Def:100;Index:iCalcWater+46;Mech:T_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'� ������� - ������� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:iCalcWater+48;Mech:T_FRAM_SOUTH;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'� ������� - ������ �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:iCalcWater+54;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - �������� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:1;Max:15;Def:3;Index:iCalcWater+50;Mech:T_LIGHT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'� ������� - �������� ������ ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:iCalcWater+52;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),

//         (Name:'� ������� - (����-����)�������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:1;Def:0;Index:iCalcWater+2),
//         (Name:'� ������� - (����-����)������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:4;Max:15;Def:8;Index:iCalcWater+4),
//         (Name:'� ������� - (����-����)����������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:3;Max:15;Def:8;Index:iCalcWater+6),
//         (Name:'� ������� - ��������(����-����)�������� ������ ���';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0.1;Max:0.4;Def:0;Index:iCalcWater+8),
//         (Name:'� ������� - ��������(����-����)������ ��';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0.4;Max:1;Def:0.5;Index:iCalcWater+10),
         (Name:'� ������� - ���� ���������������� ��������';Frm:SSpSSS;Ed:'';TipSens:TipCalc;Min:0;Max:3;Def:1;Index:iCalcWater+10;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ������� - ���� ������������ ��������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0;Max:3;Def:0.5;Index:iCalcWater+12;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'� ������� - ���� ������������ ��������';Frm:SSpSSS;Ed:'';TipSens:TipCalc;Min:0.02;Max:0.25;Def:0.1;Index:iCalcWater;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
//         (Name:'� ������� - ���������� ������������ ��������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:1;Def:0;Index:iCalcWater+4),
         (Name:'� ������� - ������ �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:0.5;Def:0.1;Index:iCalcWater+8;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),//iTfram+6),
         (Name:'� ������� - ��������� �� 1�C ��� ����� 35�C ���� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:1;Max:8;Def:3.5;Index:iTask5Kon+6;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'� ������� - ��������� �� 1�C ��� ����� 75�C ���� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:1;Max:8;Def:3.5;
            Index:iPar3_4Kontur+4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'����� ���������� ������� ������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:16;Max:30;Def:21;Index:iConst+4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),

         (Name:'�������� ������� - �-���� ������� � ����';Frm:SSpSSS;Ed:'%/�C';TipSens:TipCalc;Min:0.3;Max:5;Def:1;Index:iParValve;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'�������� ������� - �������� ��������������';Frm:SSSpS;Ed:'�C*���';TipSens:TipCalc;Min:15;Max:50;Def:30;Index:iParValve+4;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'�������� ������� - ������ ��������������';Frm:SSSpS;Ed:'�C*���';TipSens:TipCalc;Min:0;Max:200;Def:100;Index:iParValve+2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'�������� ������� - �������� ������� ��������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:10;Def:5;Index:iCalcWater+2;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'�������� ������� - �������� ������� ��������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:1;Def:1;Index:iCalcWater+3;AccessR:RW_SUPERVISOR;AccessW:RW_SUPERVISOR),
         (Name:'������ �������� - �������� ����������';Frm:SSpS0;Ed:'�C*���';TipSens:TipCalc;Min:1;Max:8;Def:4;Index:iDelPup;AccessR:RW_GUESTI;AccessW:RW_USER),
          // ( MESI
         (Name:'�������� ������ 3 - �-�����������';Frm:SSpSSS;Ed:'%/�C';TipSens:TipCalc;Min:0.3;Max:5;Def:1;Index:iPar3_4Kontur;Mech:T_VALVE3;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'�������� ������ 4 - �-�����������';Frm:SSpSSS;Ed:'%/�C';TipSens:TipCalc;Min:0.3;Max:5;Def:1;
            Index:iPar3_4Kontur+2;Mech:T_VALVE4;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'��������� �������� - �-�����������';Frm:SSpSSS;Ed:'%/�C';TipSens:TipCalc;Min:0.3;Max:5;Def:1;Index:iPar3_4Kontur+2;Mech:T_PRES_REG;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������ �������� - ��������� ��������� ��� ������ �������';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:iCalcWater+22;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ �������� - ��������� ��������� ��� (����-�����) ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-2;Max:5;Def:2;Index:iCalcWater+24;AccessR:RW_GUESTI;AccessW:RW_USER),
          // MESI )

         (Name:'������ 1 - ������� � �����- ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:200;Def:0;Index:iSunToClim+18;Mech:T_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 1 - ������� � ��������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:300;Index:iSunToClim+20;Mech:T_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 1 - ������� � ��������� - ������ ��������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:30;Def:0;Index:iSunToClim+22;Mech:T_VALVE1;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:50;Def:0;Index:iMinTPipe;Mech:T_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 3 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:iOptTPipe;Mech:T_VALVE3;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:iMinTPipe+2;Mech:T_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 4 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:iOptTPipe+2;Mech:T_VALVE4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:80;Def:0;Index:iMinTPipe+4;Mech:T_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:90;Def:0;Index:iOptTPipe+4;Mech:T_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��������, ���� ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-15;Max:10;Def:-5;Index:iTask5Kon+4;Mech:T_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��� ��� ���� ������ � ������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-5;Max:10;Def:4;Index:iTask5Kon;Mech:T_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������ 5 - ��� ���� ������ �������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:40;Max:130;Def:90;Index:iTask5Kon+2;Mech:T_VALVE5;AccessR:RW_GUESTI;AccessW:RW_USER),

//         (Name:'��������� - ������ �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0.2;Max:2;Def:0.5;Index:iTfram+6),
//         (Name:'����������� - ���������� ���� ��������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0.5;Max:4;Def:1;Index:iTfram+8),
//         (Name:'����������� - ������� ��������� �������� ������ ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:iTfram),
//         (Name:'����������� - ������� ��������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:40;Def:30;Index:iTfram+2),
//         (Name:'����������� - ������� ��������� �������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:3;Index:iTfram+4),

         (Name:'������� - ������� � �����- ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:300;Def:0;Index:iSunToMinFram;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ������� � ��������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:100;Max:800;Def:300;Index:iSunToMinFram+2;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ������� � ��������� - ������ ����������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:0;Index:iSunToMinFram+4;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) �������� ������ �� ������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:iTFram;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ������ �� ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:iTFram+2;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ����������� ������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:20;Index:iTFram+8;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) �������� ������ �� �������� ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:iTFram+4;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ������ �� �������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:60;Def:30;Index:iTFram+6;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - (RH���-RH���) ��������� �������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:30;Index:iTFram+9;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ����� ���� ��������� �������� �������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:5;Max:25;Def:15;Index:iFram+18;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ����� ���� ��������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:10;Def:-5;Index:iFram+20;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ��� ����� ��������� ��������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:40;Index:iFram+22;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'������� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:300;Def:20;Index:iSunToFram;Mech:T_ANY_FRAM),
//         (Name:'������� - ������ ������ ��';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:200;Max:800;Def:500;Index:iSunToFram+2;Mech:T_ANY_FRAM),
//         (Name:'������� - ������ ����������� ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:30;Index:iSunToFram+4;Mech:T_ANY_FRAM),
         (Name:'������� - (����-�����) �������� ������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:0;Index:iSunToFram;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - (����-�����) ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:10;Max:30;Def:25;Index:iSunToFram+2;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - (����-�����) ��������� �������� �';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:10;Index:iSunToFram+4;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:1;Max:6;Def:3;Index:iFram+16;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ����� ��������� ����������� ������� ���';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:1;Max:25;Def:10;Index:iFram+12;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ����� ��������� ������������ ������� ���';Frm:SSpS0;Ed:'�/�';TipSens:TipCalc;Min:5;Max:35;Def:15;Index:iFram+14;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ������ ������ ����������� ������� ���';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:10;Max:90;Def:30;Index:iFram+24;Mech:T_FRAM_SOUTH;AccessR:RW_GUESTI;AccessW:RW_USER),
//         (Name:'������� - ����� (����-�����������)������� �� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:2;Max:15;Def:5;Index:iFram+26;Mech:T_ANY_FRAM),
//         (Name:'������� - ���� ���������������� ��������';Frm:SSpSSS;Ed:'%/�C';TipSens:TipCalc;Min:0.25;Max:50;Def:15;Index:iFram+26;Mech:T_ANY_FRAM),
//         (Name:'������� - ���� ������������ ��������';Frm:SSpSSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:0.3;Def:0.1;Index:iFram+4;Mech:T_FRAM_SOUTH),
         (Name:'������� - ��������� �����������, ���� ������������ ������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:100;Index:iCalcWater+4;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'������� - ����� ������� ����� ������������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:15;Def:4;Index:iFram+26;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - ������������� �������';Frm:SSpSSS;Ed:'';TipSens:TipCalc;Min:0.5;Max:0.99;Def:0.8;Index:iFram+4;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
          // ( MESI
         (Name:'������� - ��������� ������������� ��� ����������������';Frm:SSpSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:4;Def:2;Index:iCalcWater+20;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
          // MESI )
         (Name:'������� - ����������� ����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:600;Def:12;Index:iFram+10;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - ������������ ����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:2;Max:600;Def:15;Index:iFram+8;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'������� - ���������, ���� ������� ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:10;Max:40;Def:10;Index:iFram+6;Mech:T_FRAM_SOUTH;AccessR:RW_USERI;AccessW:RW_USER),

         (Name:'��2 - ���� ����������������';Frm:SSpSSS;Ed:'%/ppm';TipSens:TipCalc;Min:0;Max:0.5;Def:0.04;Index:iCO2;Mech:T_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��2 - ���� ������������ ��������';Frm:SSpSSS;Ed:'%/ppm';TipSens:TipCalc;Min:0;Max:0.5;Def:0.04;Index:iCO2+2;Mech:T_CO2;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����� ���������� - ������ ��������� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:900;Def:400;Index:iScreen;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ������ ��������� ���';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:300;Def:150;Index:iScreen+2;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ����� ���� ��������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:25;Def:4;Index:iScreen+4;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ����� ����� ��������� ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-10;Max:25;Def:8;Index:iScreen+6;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ����� �������� ������ ���';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:1;Max:6;Def:1.5;Index:iScreen+8;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ����� ������ ��';Frm:SSpS0;Ed:'�/���';TipSens:TipCalc;Min:6;Max:25;Def:10;Index:iScreen+10;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ����������� - ����� ����������� � ���� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:15;Def:5;Index:iScreen+12;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - (����-����) �������� ������������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:2;Def:0.5;Index:iScreen+14;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - (����-����) ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:2;Max:5;Def:4;Index:iScreen+16;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - (����-����) ������������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:25;Index:iScreen+18;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) �������� ������������ ���';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:iScreen+20;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:20;Max:40;Def:30;Index:iScreen+22;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - (RH���-RH���) ������������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:25;Index:iScreen+24;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - � ������ �������� ������������ ���';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-5;Max:10;Def:5;Index:iScreenGlass;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - � ������ ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-20;Max:0;Def:-5;Index:iScreenGlass+2;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� - � ������ ������������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:30;Index:iScreenGlass+4;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ��������� ������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:4;Index:iScreen+26;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������-���������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:4;Index:iScreen+28;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������-����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:8;Index:iScreen+30;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ��������� ������ ��';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:4;Index:iScreen+32;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������-���������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:4;Index:iScreen+34;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ���������-����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:8;Index:iScreen+36;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ��������� ���� ��� ������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:iScreen+38;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����� ������ ��������/�������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:360;Def:60;Index:iScreenGlass+6;Mech:T_SCREEN;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'���� - ��������,���� ����������� ������ ������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:iSiod+8;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������,���� ����������� ������ ������� ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:10;Def:2;Index:iSiod;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������� ������ ������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:20;Def:5;Index:iSiod+4;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������ ���������� ������ ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:180;Def:40;Index:iSiod+2;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������� ���������� � ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:120;Def:20;Index:iSiod+6;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��������,���� ��������� ������ ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:20;Index:iSiod+18;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ����������,���� ��������� ������ ������� ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:10;Index:iSiod+10;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��������� ������ ������� ������ ��';Frm:SSpS0;Ed:'%';TipSens:TipCalc;Min:0;Max:60;Def:40;Index:iSiod+14;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������ ��������� ���� ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:180;Def:40;Index:iSiod+12;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'���� - ��� ������� ��������� ���� ����������� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:120;Def:20;Index:iSiod+16;Mech:T_SIO_PUMP;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����������� - ��������, ���� ��������������� ������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:2;Index:iVentil;Mech:T_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - ����� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:100;Def:10;Index:iVentil+2;Mech:T_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'����������� - ����� �����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:1;Max:100;Def:10;Index:iVentil+4;Mech:T_VENT;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'��������� ������� - ��������,���� ����������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:iCalorifer;Mech:T_VAG;AccessR:RW_GUESTI;AccessW:RW_USER),
         (Name:'��������� ������� - ���������,���� ����������� ������ ��';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:5;Def:0;Index:iCalorifer+2;Mech:T_VAG;AccessR:RW_GUESTI;AccessW:RW_USER),

         (Name:'����������� ���������� �������� ��������';Frm:SSpSSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:1;Def:0.2;Index:iConst;AccessR:RW_USERI;AccessW:RW_USER),
         (Name:'����������� ���������� �����';Frm:SSpSSS;Ed:'';TipSens:TipCalc;Min:0.1;Max:1;Def:0.2;Index:iConst+2;AccessR:RW_USERI;AccessW:RW_USER)
         );


// ------- ������� ����������� 65 ---------

// ------- ��������� ��������� ����������� 65 ---------

const

          SumParMec=       18;
          io_TimeMixVal=0;
{1-5 - ������������ �������, 6 - ��� �������, 7 - ��� �������, 8 - ��2,
9 - �����, �������� 10 - ����������� � ������}
          l_SGroup=io_TimeMixVal+18;
          sio_SVal=l_SGroup+1;
          iv_MinTime=sio_SVal+1;
//          iNumSiod=iv_MinTime-1;
          ico_model=iv_MinTime+2;
          l_TimePause=ico_model+1;
          sio_ValPause=l_TimePause+1;
          iLiftValve=sio_ValPause+1;
          io_TeplPlace=iLiftValve+1;
          sizeParMec=io_TeplPlace+2;

var NameParMec:array [1..SumParMec] of TNameConst=(
         (Name:'������������ ������ ������ 1 - ������ ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:io_TimeMixVal;Mech:T_VALVE1;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������������ ������ ������ 2 - ������ ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:io_TimeMixVal+2;Mech:T_VALVE2;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������������ ������ ������ 3 - ������ ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:io_TimeMixVal+4;Mech:T_VALVE3;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������������ ������ ������ 4 - ������ ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:io_TimeMixVal+6;Mech:T_PUMP4;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������������ ������ ������ 5 - ������ ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:io_TimeMixVal+8;Mech:T_VALVE5;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'�������_����� - ����� ������� ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:10;Max:900;Def:60;Index:io_TimeMixVal+10;Mech:T_FRAM_NORTH;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'�������_�� - ����� ������� ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:10;Max:900;Def:60;Index:io_TimeMixVal+12;Mech:T_FRAM_SOUTH;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'����� - ����� ������� ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:1200;Def:60;Index:io_TimeMixVal+14;Mech:T_SCREEN;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'��2 - ����� ���� ����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:600;Def:60;Index:io_TimeMixVal+16;Mech:T_CO2;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'��2 - �����������(0-���������,1-������)';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:1;Def:1;Index:ico_model;Mech:T_CO2;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'��������� �������� - ������ ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:io_TimeMixVal+6;Mech:T_PRES_REG;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������������ ������� - ����� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:90;Def:60;Index:iv_MinTime;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'������������ ������� - ���� ��� ����� �����������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:3;Def:1;Index:iLiftValve;AccessR:RW_GUEST;AccessW:RW_USER),
//         (Name:'���� - ����� ������ ������� ��';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:10;Def:6;Index:imSiod;Mech:T_SIO_PUMP),
         (Name:'���� - ����� ����� ����������� ��������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:20;Def:4;Index:sio_ValPause;Mech:T_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'���� - ���������� ��������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:8;Def:2;Index:sio_SVal;Mech:T_SIO_PUMP;AccessR:RW_GUEST;AccessW:RW_USER),
         (Name:'�������� - ���������� �����';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:8;Def:4;Index:l_SGroup;Mech:T_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'�������� - ����� ����� ��� �����';Frm:SS;Ed:'���';TipSens:TipCalc;Min:1;Max:30;Def:3;Index:l_TimePause;Mech:T_LIGHT;AccessR:RW_SUPERVISOR;AccessW:RW_USER),
         (Name:'��������� ������� ������������ ������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:0;Max:360;Def:0;Index:io_TeplPlace;AccessR:RW_GUEST;AccessW:RW_USER)
          );

implementation

end.
