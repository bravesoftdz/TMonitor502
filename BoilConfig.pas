unit BoilConfig;

interface
uses FConstType, MessageU;
//*********************************************************************
//*******************     ������������     ****************************
//*********************************************************************
const
  eSumBoilers =6;
  eSumGroups=  10;
  eSumCollector=6;
  eSumCO2Units =6;
  eSumTankSens =20;
  eSumPanels =150;
  eSumElGroups= 20;
  eSumHPUnits =10;
  eSumBuses =10;
  faAlarm=3;

      eMAX_SUM_PID=60;
    eMAX_SUM_PUMP=270;
    eMAX_SUM_SENS=140;
    eMAX_SUM_CALC=1100;
    eMAX_SUM_INPUT=140;
    eMAX_SUM_CONST=100;


  iConfMixValve           =15;
  iConfBurn               =iConfMixValve+eSumGroups;
  iConfMixBoiler          =iConfBurn+eSumBoilers;
  iConfRegBoiler          =iConfMixBoiler+eSumBoilers;
  iConfShockBoil          =iConfRegBoiler+eSumBoilers;
  iConfCondBoil           =iConfShockBoil+eSumBoilers;
  iConfMixHP              =iConfCondBoil+eSumBoilers;
  iConfValveHP            =iConfMixHP+eSumHPUnits;


  iConfGrPump             =iConfMixValve+eMAX_SUM_PID;
  iConfBoilOn             =iConfGrPump+eSumGroups;
  iConfBoilOnline         =iConfBoilOn+eSumBoilers;
  iConfBoilPump           =iConfBoilOnline+eSumBoilers;
  iConfBoilShPump         =iConfBoilPump+eSumBoilers;
  iConfBoilCondPump       =iConfBoilShPump+eSumBoilers;
  iConfBoilRezPump        =iConfBoilCondPump+eSumBoilers;

  iConfCO2                =iConfBoilRezPump+eSumBoilers;

  iConfPanelOn            =iConfCO2+eSumCO2Units;
  iConfElGroupOn          =iConfPanelOn+eSumPanels;
  iConfElGroupLight       =iConfElGroupOn+eSumElGroups;
  iConfHPStart            =iConfElGroupLight+eSumElGroups;
  iConfRlLightOK          =iConfHPStart+eSumHPUnits;

  iConfControlOK          =iConfRlLightOK+eSumHPUnits;
  iConfFatalAlarm         =iConfControlOK+1;
  iConfCommonAlarm        =iConfFatalAlarm+1;

  iConfBoilLev            =iConfGrPump+eMAX_SUM_PUMP;
  iConfBoilAlr            =iConfBoilLev+eSumBoilers;
  iConfCO2Alr             =iConfBoilAlr+eSumBoilers;
  iConfCO2Req             =iConfCO2Alr+eSumCO2Units;
  iConfElGroupAlr         =iConfCO2Req+eSumCO2Units;
  iConfHPInfo             =iConfElGroupAlr+eSumElGroups;
  iConfHPOn               =iConfHPInfo+eSumHPUnits;
  iConfHPRequest          =iConfHPOn+eSumHPUnits;
  iConfTankAlarm          =iConfHPRequest+eSumHPUnits;
  iConfReset              =iConfTankAlarm+1;
  iConfFire               =iConfReset+1;
  iConfNitro              =iConfFire+1;
  iConfPumps              =iConfNitro+1;

  iConfCollect            =iConfBoilLev+eMAX_SUM_INPUT;
  iConfBus                =iConfCollect+eSumBoilers;

  cSumValYConfig        =427;

  cSizeColConf     =550;
  MAX_SUM_RELAY    =0;//60000;//128;
  MAX_SUM_INPUT    =0;//60000;//8;
  pozCfMixValGr1    =7;
//  iSumBoils =0;
//  iSumGroups =1;

var BoilNameConfig:array [1..cSumValYConfig] of TNameConst=(
//1
(Name:'���-�� ������';Frm:SSSS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:4; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'���-�� ����������';Frm:SSSS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:5; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'���-�� ���';Frm:SSSS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:11; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'���-�� �����';Frm:SSSS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:9; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'���-�� ������������';Frm:SSSS;Ed:'';TipSens:TipControl;Min:0;Max:20;Def:HIDE_MIN_MAX;
  Index:10; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'���-�� ��������� ��2';Frm:SSSS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:8; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
//7
(Name:'������������ ������ ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ������ 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixValve+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//17
{(Name:'��������� ��������� ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��������� ������ 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPumpReg+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),}
//17
(Name:'������� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBurn; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBurn+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBurn+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBurn+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBurn+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBurn+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//23
(Name:'������ ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixBoiler; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixBoiler+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixBoiler+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixBoiler+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixBoiler+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixBoiler+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//29
(Name:'��������� ������ ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRegBoiler; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRegBoiler+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRegBoiler+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRegBoiler+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRegBoiler+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRegBoiler+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//35
(Name:'������ ���� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfShockBoil; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfShockBoil+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfShockBoil+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfShockBoil+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfShockBoil+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfShockBoil+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//41
(Name:'������ ���������� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCondBoil; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCondBoil+1; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCondBoil+2; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCondBoil+3; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCondBoil+4; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCondBoil+5; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
//47
(Name:'������������ ������ ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfMixHP+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//57
(Name:'������ ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+1; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+2; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+3; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+4; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+5; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+6; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+7; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+8; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfValveHP+9; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

//35
(Name:'������ ����';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:0; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
//36
(Name:'����� ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfGrPump+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//46
(Name:'������ ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOn; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOn+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOn+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOn+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOn+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOn+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//52
(Name:'���������� ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOnline; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOnline+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOnline+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOnline+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOnline+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilOnline+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//58
(Name:'����� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilPump; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilPump+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilPump+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilPump+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilPump+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilPump+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//64
(Name:'����� ������ ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilShPump; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilShPump+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilShPump+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilShPump+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilShPump+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilShPump+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//70
//64
(Name:'����� ���������� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilCondPump; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilCondPump+1; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilCondPump+2; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilCondPump+3; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilCondPump+4; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilCondPump+5; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

(Name:'����� ��� ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilRezPump; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ��� ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilRezPump+1; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ��� ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilRezPump+2; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ��� ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilRezPump+3; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ��� ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilRezPump+4; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ��� ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfBoilRezPump+5; Mech:0; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

(Name:'���������� ��2 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCO2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCO2+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCO2+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCO2+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCO2+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCO2+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//76
(Name:'�������� ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 11';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+10; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 12';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+11; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 13';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+12; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 14';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+13; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 15';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+14; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 16';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+15; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 17';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+16; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 18';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+17; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 19';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+18; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 20';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+19; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 21';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+20; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 22';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+21; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 23';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+22; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 24';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+23; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 25';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+24; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 26';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+25; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 27';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+26; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 28';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+27; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 29';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+28; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 30';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+29; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 31';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+30; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 32';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+31; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 33';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+32; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 34';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+33; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 35';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+34; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 36';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+35; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 37';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+36; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 38';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+37; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 39';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+38; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 40';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+39; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 41';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+40; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 42';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+41; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 43';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+42; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 44';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+43; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 45';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+44; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 46';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+45; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 47';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+46; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 48';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+47; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 49';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+48; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 50';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+49; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 51';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+50; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 52';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+51; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 53';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+52; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 54';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+53; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 55';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+54; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 56';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+55; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 57';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+56; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 58';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+57; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 59';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+58; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 60';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+59; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 61';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+60; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 62';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+61; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 63';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+62; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 64';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+63; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 65';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+64; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 66';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+65; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 67';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+66; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 68';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+67; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 69';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+68; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 70';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+69; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 71';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+70; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 72';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+71; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 73';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+72; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 74';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+73; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 75';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+74; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 76';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+75; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 77';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+76; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 78';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+77; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 79';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+78; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 80';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+79; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 81';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+80; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 82';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+81; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 83';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+82; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 84';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+83; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 85';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+84; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 86';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+85; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 87';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+86; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 88';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+87; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 89';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+88; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 90';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+89; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 91';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+90; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 92';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+91; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 93';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+92; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 94';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+93; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 95';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+94; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 96';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+95; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 97';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+96; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 98';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+97; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 99';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+98; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 100';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+99; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 101';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+100; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 102';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+101; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 103';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+102; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 104';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+103; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 105';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+104; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 106';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+105; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 107';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+106; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 108';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+107; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 109';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+108; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 110';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+109; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 111';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+110; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 112';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+111; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 113';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+112; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 114';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+113; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 115';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+114; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 116';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+115; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 117';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+116; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 118';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+117; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 119';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+118; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 120';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+119; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 121';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+120; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 122';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+121; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 123';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+122; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 124';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+123; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 125';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+124; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 126';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+125; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 127';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+126; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 128';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+127; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 129';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+128; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 130';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+129; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 131';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+130; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 132';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+131; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 133';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+132; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 134';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+133; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 135';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+134; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 136';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+135; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 137';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+136; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 138';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+137; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 139';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+138; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 140';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+139; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 141';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+140; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 142';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+141; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 143';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+142; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 144';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+143; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 145';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+144; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 146';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+145; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 147';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+146; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 148';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+147; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 149';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+148; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 150';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfPanelOn+149; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//176

(Name:'�������� ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 11';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+10; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 12';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+11; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 13';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+12; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 14';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+13; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 15';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+14; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 16';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+15; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 17';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+16; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 18';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+17; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 19';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+18; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������ 20';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupOn+19; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//196
(Name:'������� ������������ ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 11';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+10; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 12';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+11; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 13';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+12; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 14';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+13; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 15';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+14; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 16';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+15; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 17';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+16; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 18';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+17; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 19';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+18; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ������������ ������ 20';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfElGroupLight+19; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//216
(Name:'������ ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfHPStart+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//226
(Name:'���������� �������� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� �������� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfRlLightOK+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//236

(Name:'������ ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilLev; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilLev+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilLev+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilLev+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilLev+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilLev+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//242
(Name:'������ ����� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilAlr; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilAlr+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilAlr+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilAlr+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilAlr+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfBoilAlr+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//248
(Name:'������ ��2 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Alr; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Alr+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Alr+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Alr+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Alr+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Alr+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//254
(Name:'������ ��2 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Req; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Req+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Req+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Req+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Req+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfCO2Req+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//260
(Name:'������ ������ 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfELGroupAlr+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfELGroupAlr+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 11';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+10; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 12';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+11; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 13';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+12; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 14';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+13; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 15';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+14; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 16';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+15; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 17';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+16; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 18';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+17; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 19';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+18; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 20';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfElGroupAlr+19; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//280
(Name:'������ ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPRequest+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//290
(Name:'������ ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPOn+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
//300
(Name:'�������� ��� 1';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 2';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 3';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 4';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 5';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 6';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 7';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 8';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 9';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ��� 10';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfHPInfo+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

//310
(Name:'��������� ������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfFatalAlarm; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfCommonAlarm; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���� ����������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iConfControlOK; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ������ ���� (������)';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfTankAlarm; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �����������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfReset; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfFire; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ����-������������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfNitro; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������';Frm:CpMpN;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:iConfPumps; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��������� ����������';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfCollect; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��� ��2';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfCollect+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��2 1';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfCollect+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��2 2';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfCollect+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��2 3';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfCollect+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��2 4';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfCollect+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���� �����������';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 1';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+1; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 2';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+2; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 3';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+3; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 4';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+4; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 5';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+5; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 6';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+6; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 7';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+7; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 8';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������������� 9';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iConfBus+9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG)


//276
    );
//*********************************************************************
//******************** END ������������ ***********************
//*********************************************************************


implementation





end.
