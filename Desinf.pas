unit Desinf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FConstType, FController, PicCtr, SetGrid, MessageU, MSiod, Grids_ts, TSGrid,
  ExtCtrls, GGraf, FBox, FPicPanel, FPanel, Gauges, StdCtrls, FPicLabel;

type THot=Class(TBlock)
private
     function SendTime:Boolean;
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
        var Txt:String):Double;override;
     procedure PostPortRead; override;
end;

type TControl=Class(TBlock)
public
     procedure Init;override;
{     function LoadXYvirt(vInBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;  }
end;

type TTimer=Class(TBlock)
public
     procedure Init;override;
{     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;}
end;

type TCalSens=Class(TBlock)
public
     procedure Init;override;
//     function GetExistSens(nZone,nSens:integer):Boolean;
     function LoadXYvirt(vInBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type TConfig=Class(TBlock)
public
     procedure Init;override;
//     function LoadXYvirt(vInBlock:Byte;ValX,ValY:Integer;
//       var Txt:String):Double;override;
end;

type TArxivDez=Class(TBlock)
public
     procedure Init;override;
//     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
//       var Txt:String):Double;override;
end;

type
  TFDesinf = class(TFPicCtr)
    xGridWater: TtsGrid;
    FPDesinf: TFPanel;
    FBox2: TFBox;
    FBox1: TFBox;
    FBox3: TFBox;
    FBox11: TFBox;
    FBox13: TFBox;
    FPicLabel11: TFPicLabel;
    FBox18: TFBox;
    Gauge3: TGauge;
    FBox23: TFBox;
    FPicLabel8: TFPicLabel;
    FBox20: TFBox;
    FBox27: TFBox;
    FPicLabel13: TFPicLabel;
    FPicLabel1: TFPicLabel;
    FBox4: TFBox;
    FBox5: TFBox;
    FBox6: TFBox;
    FBox7: TFBox;
    FBox8: TFBox;
    L8: TLabel;
    LAcid: TLabel;
    FPicLabel12: TFPicLabel;
    FPicLabel4: TFPicLabel;
    FPicLabel5: TFPicLabel;
    FPicLabel6: TFPicLabel;
    FBox9: TFBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FBox12: TFBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Gauge4: TGauge;
    FBox14: TFBox;
    Splitter1: TSplitter;
    Gauge1: TGauge;
    Label10: TLabel;
    FBox15: TFBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Gauge2: TGauge;
    Gauge5: TGauge;
    Gauge6: TGauge;
    Gauge7: TGauge;
    procedure FPDesinfMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
//     function SendTime:Boolean;
//     function GetExistSens(nZone,nSens:integer):Boolean;
  public
    procedure InitCtr(vIdentCtr:TIdentCtr);override;
    procedure SetPicCtr; override;
  end;

var
  FDesinf: TFDesinf;

implementation

{$R *.dfm}
uses Mixer403, audit, DateUtils, Boiler;

procedure TFDesinf.InitCtr(vIdentCtr:TIdentCtr);
begin
     inherited;
     Design:='Desinf';
     THot.Create(Self);      //0
     ConfigBlock:=TConfig.Create(Self);         //6
     TCalSens.Create(Self);                      //2
     TTimer.Create(Self);                       //3
     TControl.Create(Self);  //1
     TArxivDez.Create(Self);           //7
     AuditBlock:=TAudit.Create(Self);
end;

const
  MAX_SUM_RELAY	  =99;//56;
  MAX_SUM_LEVEL	  =6; //5
  MAX_SUM_TAP		  =5;
  MAX_SUM_INPUT   =6;
//  MAX_SUM_SIOD_VALVE	=20;
//    SUM_CHAN_ARX = 5;
  SUM_ACH_CHAN = 3;
//begin-----------���� ������������ ������������-------------------------
//======== ������������ =================================================
//====== �������� � ������������ ������� ================================
//====== Pascal more +1  ================================================
const
  SUM_NAME_CONFIG	 =19; //
  cSizeColConf     =120;

var NameConfig:array [1..SUM_NAME_CONFIG] of TNameConst=(
(Name:'��� �����������';Frm:SS;Ed:'';TipSens:TipControl;Min:30;Max:94;Def:HIDE_MIN_MAX;
  Index:4; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'����������� �����������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:0; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),

(Name:'������ ����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:3;
    Index:9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:5;
    Index:10; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� �������������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:23;
    Index:11; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:40;
    Index:29; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� � �������� �� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:42;
    Index:27; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������ �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:9;
    Index:15; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:7;
    Index:16; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:10;
    Index:17; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:2;
    Index:18; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� �������� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:1;
    Index:8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������ �����';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:13;
    Index:19; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 50%';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:14;
    Index:20; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 75%';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:15;
    Index:21; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ 100%';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:16;
    Index:22; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ���� � �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:1;//
    Index:12; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ���� � �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:2;
    Index:13; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:4;
    Index:14; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG)
    );
//=======================================================================================

const SUM_NAME_CONFIG_LEV=36;

var NameConfigLev:array [1..SUM_NAME_CONFIG_LEV] of TNameConst=(

(Name:'��� �����������';Frm:SS;Ed:'';TipSens:TipControl;Min:30;Max:94;Def:HIDE_MIN_MAX;
  Index:4; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),
(Name:'����������� �����������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:HIDE_MIN_MAX;
  Index:0; Mech:0; AccessR:RW_GUEST;AccessW:RW_NOEDIT),

(Name:'������ ����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:3;
    Index:9; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:5;
    Index:10; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� �������������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:23;
    Index:11; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:40;
    Index:29; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� � �������� �� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:42;
    Index:27; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� ������ �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:9;
    Index:15; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:7;
    Index:16; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:10;
    Index:17; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:2;
    Index:18; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� �������� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:1;
    Index:8; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ������ �����';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:13;
    Index:19; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��� 1,2';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:14;
    Index:20; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��� 3';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:15;
    Index:21; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ��� 4';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:16;
    Index:22; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'��� 1 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:30; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 1 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:38; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 2 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:31; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 2 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:39; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 3 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:32; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 3 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:40; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 4 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:33; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��� 4 �� ������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:41; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'����� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:46; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:47; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �������� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:48; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������� �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:49; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���� �����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:95; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���� ���� � �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:1;//
    Index:12; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���� ���� � �������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:2;
    Index:13; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_INPUT;Def:0;
    Index:14; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������ ���� �����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:50; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'� ������ ���� �����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:51; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:52; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'� ������ ���� ����������';Frm:SS;Ed:'-����';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:53; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG)


    );

procedure TConfig.Init;//override;
begin
     if ParentCtr.Model > 2 then
        begin
        CountY:=SUM_NAME_CONFIG_LEV;
        ConstNames:=Addr(NameConfigLev[1]);
        end
     else
        begin
        CountY:=SUM_NAME_CONFIG;
        ConstNames:=Addr(NameConfig[1]);
        end;
     CountX:=1;
     SizeCol:=cSizeColConf;
     FullSize:=SizeCol;
     SendByte:=FullSize;
     Pref:=ProgMess[193]; //'������������';
     NameBlock:=ProgMess[194]; //'������������ ������������';
     FixRow:=1;
     end;

//================= Hot Block =================================
const   iSun=1;
        iSunRCS=3;
        iSumSun=4;
        iTime=1;
        SizeSendTime=6;
        iHand=6;
        iCycle=7;
        iInputReg=89;

        cSizeColHot=149; //������ Hot �����  
        cCountYHot=40;//41
        posInpTemp= 5;
        posOutTemp= 6;
        posOutFlow= 8;
        posCalcPower=10;

var NameHot:array [1..cCountYHot] of TNameConst=(
//1
(Name:'������� ���� �����������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:imsCondDes;Max:imsCondDes+10;
   Def:HIDE_MIN_MAX;Index:7;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:67;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ����� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:99;
    Def:NO_MIN_MAX;Index:59;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ������ ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:99;
    Def:NO_MIN_MAX;Index:61;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:63;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
//6
(Name:'����������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:65;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������ �������';Frm:SSpSS;Ed:'�3/�';TipSens:TipCalc;Min:-0.1;Max:6;
   Def:HIDE_MIN_MAX;Index:20;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ���������� ��������';Frm:SSpSS;Ed:'�3/�';TipSens:TipCalc;Min:-0.1;Max:8;
   Def:HIDE_MIN_MAX;Index:12;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� ��������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:-0.1;Max:800;
   Def:HIDE_MIN_MAX;Index:14;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� �����������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:-0.1;Max:100;
   Def:HIDE_MIN_MAX;Index:61;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
//11
(Name:'���� ������ ��� �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:99;
   Def:HIDE_MIN_MAX;Index:18;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ���� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:93;
    Def:HIDE_MIN_MAX;Index:95;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ��1';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:69;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ��2';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:71;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ����� �����������';Frm:SSSS;Ed:'�3';TipSens:Tipcontrol;Min:-0.1;Max:9999;
   Def:HIDE_MIN_MAX;Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),

// =======��������� ����������� � �������
//16
(Name:'��������� ����� �������� �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:30; Mech:11; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������� ����������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:31; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������� �����������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:32; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����� �� �����';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:34; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� �������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:33; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ����������� �� �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:35; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),
//22
(Name:'��������� ������ ������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:46; Mech:8; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������� ������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:47; Mech:9; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������ ����������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:48; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ������� �������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:49; Mech:12; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� ������ �����';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:50; Mech:13; AccessR:RW_GUEST;AccessW:RW_HARD),
//27
(Name:'������ 50 %';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:51; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ 75 %';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:52; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ 100 %';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:53; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �� �����������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0;Max:6;
    Def:HIDE_MIN_MAX;Index:93;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������';Frm:ComboBit;Ed:'0';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:8;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
//32
(Name:'������� 1';Frm:ComboBit;Ed:'0';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputReg;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� 2';Frm:ComboBit;Ed:'1';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputReg;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� 3';Frm:ComboBit;Ed:'2';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputReg;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� 4';Frm:ComboBit;Ed:'3';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputReg;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� �� �������';Frm:ComboBit;Ed:'0';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:9;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:73;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:2;
   Def:HIDE_MIN_MAX;Index:6;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'�����';Frm:SShSSm;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:NO_MIN_MAX;Index:1;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'����';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:NO_MIN_MAX;Index:3;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER)
);

const   cCountYHotLev=52;
        iInputRegLev=128;

var NameHotLev:array [1..cCountYHotLev] of TNameConst=(
//1
(Name:'������� ���� �����������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:imsCondDes;Max:imsCondDes+10;
   Def:HIDE_MIN_MAX;Index:7;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:94;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ����� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:99;
    Def:NO_MIN_MAX;Index:86;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ������ ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:99;
    Def:NO_MIN_MAX;Index:88;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:90;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
//6
(Name:'����������� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:92;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������ �������';Frm:SSpSS;Ed:'�3/�';TipSens:TipCalc;Min:-0.1;Max:6;
   Def:HIDE_MIN_MAX;Index:20;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ���������� ��������';Frm:SSpSS;Ed:'�3/�';TipSens:TipCalc;Min:-0.1;Max:8;
   Def:HIDE_MIN_MAX;Index:12;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'���������� ���� 1';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:102;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ���� 2';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:104;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ���� 3';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:106;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ���� 4';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:130;
    Def:NO_MIN_MAX;Index:108;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'�������� ��1';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:96;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �� �����������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:-0.1;Max:6;
    Def:HIDE_MIN_MAX;Index:132;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ������� �������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:49; Mech:12; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ����� �������� �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:100;Def:HIDE_MIN_MAX;
  Index:30; Mech:11; AccessR:RW_GUEST;AccessW:RW_HARD),
//17
(Name:'��������� ������� ����������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:100;Def:HIDE_MIN_MAX;
  Index:31; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������� �����������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:100;Def:HIDE_MIN_MAX;
  Index:32; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����� �� �����';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:100;Def:HIDE_MIN_MAX;
  Index:34; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� �������� �������������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:100;Def:HIDE_MIN_MAX;
  Index:33; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ����������� �� �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:-0.1;Max:100;Def:HIDE_MIN_MAX;
  Index:35; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),
//22
(Name:'��������� ������ ������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:46; Mech:8; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������� ������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:47; Mech:9; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������ ����������';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:48; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'���� ������ �����';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:50; Mech:13; AccessR:RW_GUEST;AccessW:RW_HARD),
//26
(Name:'��������� ��� 1,2';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:51; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ��� 3';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:52; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ��� 4';Frm:ComboBit;Ed:'0';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;Def:HIDE_MIN_MAX;
  Index:53; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ��2';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:98;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������';Frm:SS;Ed:'';TipSens:TipCalc;Min:-0.1;Max:2;
   Def:HIDE_MIN_MAX;Index:6;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� ������������';Frm:ComboBit;Ed:'0';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:8;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
//32
(Name:'����������� ���� �����������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:93;
    Def:HIDE_MIN_MAX;Index:134;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� ������ ��� �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:-0.1;Max:99;
   Def:HIDE_MIN_MAX;Index:18;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� ��������';Frm:SSSS;Ed:'�';TipSens:TipCalc;Min:-0.1;Max:800;
   Def:HIDE_MIN_MAX;Index:14;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� �����������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:-0.1;Max:100;
   Def:HIDE_MIN_MAX;Index:61;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
//36
(Name:'������� 1';Frm:ComboBit;Ed:'0';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputRegLev;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� 2';Frm:ComboBit;Ed:'1';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputRegLev;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� 3';Frm:ComboBit;Ed:'2';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputRegLev;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� 4';Frm:ComboBit;Ed:'3';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:iInputRegLev;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� �� �������';Frm:ComboBit;Ed:'0';TipSens:Tipcontrol;Min:comNoYes;Max:comNoYes+1;
   Def:HIDE_MIN_MAX;Index:9;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:112;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ����� �����������';Frm:SSSS;Ed:'�3';TipSens:Tipcontrol;Min:-0.1;Max:9999;
   Def:HIDE_MIN_MAX;Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� ����� �������(2-� ������)';Frm:SSpSS;Ed:'�3';TipSens:Tipcontrol;Min:-0.1;Max:32000;
   Def:HIDE_MIN_MAX;Index:146;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������-���������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:13;
    Def:NO_MIN_MAX;Index:110;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� ��-���������';Frm:SSSS;Ed:'���/��2';TipSens:TipCalc;Min:0;Max:300;
    Def:HIDE_MIN_MAX;Index:16;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� ������ �������';Frm:SSSS;Ed:'���';TipSens:Tipcontrol;Min:-0.1;Max:32000;
   Def:HIDE_MIN_MAX;Index:138;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� ���� ����� ������';Frm:SSpSS;Ed:'�3';TipSens:Tipcontrol;Min:-0.1;Max:320;
   Def:HIDE_MIN_MAX;Index:140;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� �������';Frm:SSSS;Ed:'���';TipSens:Tipcontrol;Min:-0.1;Max:3000;
   Def:HIDE_MIN_MAX;Index:142;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ��';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:100;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������';Frm:SS;Ed:'';TipSens:Tipcontrol;Min:0;Max:0;
   Def:HIDE_MIN_MAX;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'����� �����������';Frm:SShSSm;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:NO_MIN_MAX;Index:1;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���� �����������';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:NO_MIN_MAX;Index:3;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER)
);

procedure THot.Init;
begin
     CountX:=1;
     if ParentCtr.Model > 2 then
        begin
        CountY:=cCountYHotLev;
        ConstNames:=Addr(NameHotLev[1]);
        end
     else
        begin
        CountY:=cCountYHot;
        ConstNames:=Addr(NameHot[1]);
        end;
     SizeCol:=cSizeColHot;
     FullSize:=SizeCol;
     SendByte:=SizeSendTime;
     Pref:=ProgMess[196]; //'���������';
     NameBlock:=ProgMess[250]; //'��������� ������';
     FixRow:=1;
end;

function THot.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
        var Txt:String):Double; //override;
begin
    if (ConstNames[ValY].Ed = '���') and (ValX>0) then
        begin
        Result:=(LoadXY(cOutBlock,ValX,posOutTemp,Txt)-LoadXY(cOutBlock,ValX,posInpTemp,Txt))
          *LoadXY(cOutBlock,ValX,posOutFlow,Txt)/0.86;
        if Result < 0 then Result:=0;
        Txt:=Format('%5.2f ���',[Result]);
        end else Result:=inherited LoadXYvirt(InBlock,ValX,ValY,Txt);
end;

procedure THot.PostPortRead;
begin
 if Not Ready  then Exit;
 SendTime;
end;

function THot.SendTime:Boolean;
var pHot:pByteArray;
    Minut,CtrMin:word;   //,CopySend
begin
  if (ParentCtr.DataPath  <> '') or Not Ready then Exit;
  pHot:=Adr;
  Minut:=MinuteOfTheDay(Now);
  CtrMin:=pHot^[iTime]*256+pHot^[iTime+1];
  if (Minut < 30) or (Minut > (24*60-30))
     or (((CtrMin+10) > Minut) and((CtrMin-10) < Minut)) then Exit;
  if FormFalseTime then Exit;
  FormFalseTime:=True;
  if FMain.mnAutoSynxTime.Checked or (MessageDlg(Format(ProgMess[iAtten]+ProgMess[321]+ProgMess[322] //'��������! ����� ����������� "%s" ���������� �� ��. ����������������?'
  ,[ParentCtr.CtrName]),mtWarning,[mbYes, mbNo],0)= mrYes) then
    begin
    pHot^[0]:=$80;  //�������, ��� �������� ����
    Minut:=MinuteOfTheDay(Now);
    pHot^[iTime]:=Minut div 256;
    pHot^[iTime+1]:=Minut mod 256;
    pHot^[iTime+2]:=MonthOfTheYear(Now);
    pHot^[iTime+3]:=DayOfTheMonth(Now);
    pHot^[iTime+4]:=YearOf(Now)-2000;
// SendByte:=SizeSendTime;
    Result:=SendToPort(nil);
    end;
  FormFalseTime:=False;
end;

procedure TFDesinf.SetPicCtr;
var    pHot:PByteArray;
begin
  BlockToGrid(Block[0],xGridWater);
  pHot:=Block[0].Adr;
  if Not Block[0].Ready then Exit;
//  SendTime;
  if pHot^[iHand] > 0 then begin
      SetVoice('HandControl',0);
      PSost.Caption:=ProgMess[213];  //'������ ����������';
      PSost.Color:=clRed;
      end
    else
    case pHot^[iCycle] of
      1: begin PSost.Caption:=ProgMess[imsCondDes+1]; PSost.Color:=clGreen; end; //'������ �� �������'
      2: begin PSost.Caption:=ProgMess[imsCondDes+2]; PSost.Color:=clGreen; end;  //'��� �������'
      3: begin PSost.Caption:='������'; PSost.Color:=clBlue; end;
      4: begin PSost.Caption:='�����������'; PSost.Color:=clBlue; end;
      5: begin PSost.Caption:='��� �������'; PSost.Color:=clRed; end;
      6: begin PSost.Caption:='��������';PSost.Color:=clRed;end;
      7: begin PSost.Caption:='���������� ������'; PSost.Color:=clRed;end;
      8: begin PSost.Caption:='������ �������'; PSost.Color:=clRed; end;
      9: begin PSost.Caption:='��� �������'; PSost.Color:=clRed; end;
     10: begin PSost.Caption:=ProgMess[imsCondDes+10]; PSost.Color:=clRed; end;
      else begin PSost.Caption:=ProgMess[imsCondDes]; PSost.Color:=clRed; end;
      end;
end;

const
//     iScaleWaterCtr=5;
//     iMaxDouble=6;
//     iMicroInj=27;

     cSizeColControl=130;//
     cCountYControl=38;//58
var
NameParUpr403:array [1..cCountYControl] of TNameConst=(
(Name:'����������� ����������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:70;Max:93;Def:85;
  Index:60; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������������ ����������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:80;Max:93;Def:90;
  Index:62; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ���� ����������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:0;Max:7;Def:2;
  Index:64; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ������ �������';Frm:SSpSS;Ed:'�3/���';TipSens:TipCalc;Min:1;Max:7;Def:3;
  Index:66; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������������ ������ �������';Frm:SSpSS;Ed:'�3/���';TipSens:TipCalc;Min:2;Max:7;Def:6;
  Index:68; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������ �����������-��� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:10;Max:800;Def:37;
  Index:4; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �����������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:1;Max:50;Def:3.0;
  Index:20; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �����������-������ ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0.1;Max:5;Def:0.4;
  Index:36; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:50;Max:100;Def:70;
  Index:90; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:25;Def:20;
  Index:88; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������ ����������-��� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:4;Max:800;Def:37;
  Index:2; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������-������� ����';Frm:SSpSS;Ed:'%/�3';TipSens:TipCalc;Min:0.1;Max:99;Def:20;
  Index:18; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������-������ ����';Frm:SSpSS;Ed:'%/�3';TipSens:TipCalc;Min:0.1;Max:50;Def:3;
  Index:34; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ������� ����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:5;
  Index:92; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������������ ���� ������������';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:97;Def:93;
  Index:70; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:5;Max:80;Def:60;
  Index:24; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������������-������ ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:20;Def:0;
  Index:40; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'�������� �������������-��� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:4;Max:800;Def:60;
  Index:6; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� �������������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:1;Max:30;Def:5;
  Index:22; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� �������������-������ ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0.1;Max:20;Def:0.4;
  Index:38; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
//(Name:'��������� ���� ������ �� �������-����� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:800;Def:1;
//  Index:8; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ���� ������ �� �������-���� ����';Frm:SSpSS;Ed:'%/�3';TipSens:TipCalc;Min:0.1;Max:50;Def:15;
  Index:26; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ���� ������ �� �������-������ ����';Frm:SSpSS;Ed:'%/�3';TipSens:TipCalc;Min:0.1;Max:20;Def:5.0;
  Index:42; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������� �����������';Frm:SS;Ed:'�';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:53; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �� �����������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0;Max:6;Def:4;
  Index:58; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �������� �������-��� ������ �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:4;Max:30;Def:8;
  Index:0; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �������� �������-������� ����';Frm:SSpSS;Ed:'%/pH';TipSens:TipCalc;Min:0.3;Max:80;Def:12;
  Index:16; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �������� �������-������ ����';Frm:SSpSS;Ed:'%/pH';TipSens:TipCalc;Min:0.1;Max:5;Def:0.1;
  Index:32; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ����� �������� �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:20;Max:100;Def:50;
  Index:86; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ��';Frm:SSpS0;Ed:'';TipSens:TipControl;Min:0;Max:2;Def:0.5;
  Index:94; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ������� ��';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:120;
  Index:96; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ ��';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:600;Def:300;
  Index:98; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'����� �������� ������� � �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:15;
  Index:76; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ������� �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:240;
  Index:78; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:40;
  Index:80; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ���������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:20;
  Index:72; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ ���������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:60;
  Index:74; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ������� �� �C';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:900;Def:180;
  Index:82; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ ���������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:240;
  Index:84; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD)
);

const cSizeColControlLev=160;
      cCountYControlLev=60;
var
NameParUprLev:array [1..cCountYControlLev] of TNameConst=(
(Name:'����������� ����������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:70;Max:93;Def:85;
  Index:60; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������������ ����������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:80;Max:93;Def:90;
  Index:62; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������� �����������';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:0;Max:7;Def:2;
  Index:64; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����������� ������ �������';Frm:SSpSS;Ed:'�3/���';TipSens:TipCalc;Min:1;Max:7;Def:3;
  Index:66; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������������ ������ �������';Frm:SSpSS;Ed:'�3/���';TipSens:TipCalc;Min:2;Max:7;Def:6;
  Index:68; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������ �����������-��� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:10;Max:800;Def:37;
  Index:4; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �����������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:1;Max:50;Def:3.0;
  Index:20; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �����������-������ ����';Frm:SSpSS;Ed:'%/�C/5���';TipSens:TipCalc;Min:0.1;Max:5;Def:0.4;
  Index:36; Mech:5; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:50;Max:100;Def:70;
  Index:90; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� ������� �����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:25;Def:20;
  Index:88; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������ ����������-��� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:4;Max:800;Def:37;
  Index:2; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������-������� ����';Frm:SSpSS;Ed:'%/�3';TipSens:TipCalc;Min:0.1;Max:99;Def:20;
  Index:18; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ����������-������ ����';Frm:SSpSS;Ed:'%/�3/5���';TipSens:TipCalc;Min:0.1;Max:50;Def:3;
  Index:34; Mech:4; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ������� ����������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:40;Def:5;
  Index:92; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������������ ���� ������������';Frm:SSpSS;Ed:'�C';TipSens:TipCalc;Min:0;Max:97;Def:93;
  Index:70; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:5;Max:80;Def:60;
  Index:24; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ������������-������ ����';Frm:SSpSS;Ed:'%/�C/5���';TipSens:TipCalc;Min:0;Max:20;Def:0;
  Index:40; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'�������� �������������-��� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:4;Max:800;Def:60;
  Index:6; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� �������������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:1;Max:30;Def:5;
  Index:22; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� �������������-������ ����';Frm:SSpSS;Ed:'%/�C/5���';TipSens:TipCalc;Min:0.1;Max:20;Def:0.4;
  Index:38; Mech:6; AccessR:RW_GUEST;AccessW:RW_HARD),
//(Name:'��������� ���� ������ �� �������-����� ����';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:800;Def:1;
//  Index:8; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ���� ������ �� �������-���� ����';Frm:SSpSS;Ed:'%/�3';TipSens:TipCalc;Min:0.1;Max:50;Def:15;
  Index:26; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��������� ���� ������ �� �������-������ ����';Frm:SSpSS;Ed:'%/�3/5���';TipSens:TipCalc;Min:0.1;Max:20;Def:5.0;
  Index:42; Mech:7; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'������� �����������';Frm:SS;Ed:'�';TipSens:TipControl;Min:0;Max:100;Def:HIDE_MIN_MAX;
  Index:53; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �� �����������';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:0;Max:6;Def:4;
  Index:58; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �������� �������-��� ������ �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:4;Max:30;Def:8;
  Index:0; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �������� �������-������� ����';Frm:SSpSS;Ed:'%/pH';TipSens:TipCalc;Min:0.3;Max:80;Def:12;
  Index:16; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �������� �������-������ ����';Frm:SSpSS;Ed:'%/pH/5���';TipSens:TipCalc;Min:0.1;Max:5;Def:0.1;
  Index:32; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'�������� ����� �������� �������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:20;Max:100;Def:50;
  Index:86; Mech:3; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ��';Frm:SSpS0;Ed:'';TipSens:TipControl;Min:0;Max:2;Def:0.5;
  Index:94; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ������� ��';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:120;
  Index:96; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ ��';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:600;Def:300;
  Index:98; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'����� �������� ������� � �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:15;
  Index:76; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ������� �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:240;
  Index:78; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:40;
  Index:80; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ���������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:20;
  Index:72; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ ���������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:60;
  Index:74; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� ������� �� �C';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:900;Def:180;
  Index:82; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���������� ����� ������ ���������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:300;Def:240;
  Index:84; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �� �������� �������';Frm:SShSSm;Ed:'�:�';TipSens:TipControl;Min:0;Max:0;Def:0;
  Index:100; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �� �������� �������';Frm:SSpSS;Ed:'�3';TipSens:TipControl;Min:0;Max:0;Def:0;
  Index:102; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'����� �������� �������';Frm:SSSS;Ed:'���';TipSens:TipControl;Min:0;Max:0;Def:0;
  Index:104; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'��� ������������,���� ������������� < ��� ��������+';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:0;Max:30;Def:NO_MIN_MAX;
  Index:110; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'���� �����,���� ������������� < ���� ��������-';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:0;Max:30;Def:NO_MIN_MAX;
  Index:112; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),

(Name:'���������� ��-����';Frm:SSSS;Ed:'��';TipSens:TipControl;Min:0;Max:8;Def:NO_MIN_MAX;
  Index:114; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),


(Name:'������� ������� ���� 1';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:138; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �������� ���� 1';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:139; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �������� ���� 1';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:140; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ������� ���� 1';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:141; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� ������� ���� 2';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:142; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �������� ���� 2';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:143; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �������� ���� 2';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:144; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ������� ���� 2';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:145; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� ������� ���� 3';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:146; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �������� ���� 3';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:147; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �������� ���� 3';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:148; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ������� ���� 3';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:149; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� ������� ���� 4';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:150; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������� �������� ���� 4';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:151; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ �������� ���� 4';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:152; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD),
(Name:'������ ������� ���� 4';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:NO_MIN_MAX;
  Index:153; Mech:0; AccessR:RW_GUEST;AccessW:RW_HARD)
);

procedure TControl.Init;
begin
     CountX:=1;
     if ParentCtr.Model > 2 then
        begin
        CountY:=cCountYControlLev;
        ConstNames:=Addr(NameParUprLev[1]);
        SizeCol:=cSizeColControlLev;
        end
     else
        begin
        CountY:=cCountYControl;
        ConstNames:=Addr(NameParUpr403[1]);
        SizeCol:=cSizeColControl;
        end;
     FullSize:=SizeCol;
     SendByte:=FullSize;
     Pref:=ProgMess[198]; //'���������';
     NameBlock:=ProgMess[199]; //'��������� ����������';
     FixRow:=1;

//     Translator:=cCountYControl;
end;

//----------EAIAEU AAO?EEIA C-403 ------------------
type eCalAnalSens=record
        Val: array [1..2] of InInt;   //0
        U: array [1..2] of InInt;     //4
        Rezr:Byte;                    //8
        NInput:Byte;                  //9
        end;
type rCalSens=record
        CalPort:InInt;
        CalPort2:InInt;
        CalSens:array [1..2] of eCalAnalSens;
        end;
const
        MAX_ANALOG_SENS=64;//32
        cCountYSens=9;

var SensName:array [1..cCountYSens] of TNameConst=(
//1
(Name:'���� ����� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:99;
    Def:NO_MIN_MAX;Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� ������ ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:99;
    Def:NO_MIN_MAX;Index:14;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:24;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:34;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:44;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'�������� ��1';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:54;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'�������� ��2';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:64;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:74;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'����������� �����';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
    Def:NO_MIN_MAX;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST)
);

const cCountYSensLev=15;

var SensNameLev:array [1..cCountYSensLev] of TNameConst=(
//1
(Name:'���� ����� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:99;
    Def:NO_MIN_MAX;Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� ������ ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:99;
    Def:NO_MIN_MAX;Index:14;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� �������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:24;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� ��������� �������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:34;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� �������������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:44;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'��������� ��1';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:54;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'��������� ��2';Frm:SSpSS;Ed:'';TipSens:TipCalc;Min:1;Max:13;
    Def:NO_MIN_MAX;Index:64;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'��������� ��';Frm:SSpS0;Ed:'���';TipSens:TipCalc;Min:0;Max:14;
    Def:NO_MIN_MAX;Index:74;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���������� ���� 1';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:NO_MIN_MAX;Index:84;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���������� ���� 2';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:NO_MIN_MAX;Index:94;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���������� ���� 3';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:NO_MIN_MAX;Index:104;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���������� ���� 4';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:NO_MIN_MAX;Index:114;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'�� ������';Frm:SSpS0;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:124;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'���� ��������';Frm:SSpS0;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:NO_MIN_MAX;Index:134;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST),
(Name:'����������� �����';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
    Def:NO_MIN_MAX;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_GUEST)
);

XNamesCalibr:array [1..6] of TXNames=(
    (Name:'����� ����� (> 65 ��������)';Frm:SS;Ed:' ';Index:9;Cfg:0;Kind:0),
    (Name:'������1';Frm:None;Ed:'';Index:0;Cfg:0;Kind:0),
    (Name:'����������1';Frm:SSSS;Ed:'mV';Index:4;Cfg:0;Kind:0),
    (Name:'������2';Frm:None;Ed:' ';Index:2;Cfg:0;Kind:0),
    (Name:'����������2';Frm:SSSS;Ed:'mV';Index:6;Cfg:0;Kind:0),
    (Name:'��� (���� ��������)';Frm:S_S_S_S;Ed:' ';Index:0;Cfg:0;Kind:0)
     );

procedure TCalSens.Init;//override;
begin
     CountX:=6;
     if ParentCtr.Model > 2 then
        begin
        CountY:=cCountYSensLev;
        ConstNames:=Addr(SensNameLev[1]);
        end
     else
        begin
        CountY:=cCountYSens;
        ConstNames:=Addr(SensName[1]);
        end;
     SizeCol:=4+10*(CountY);
     FullSize:=SizeCol;
     SendByte:=FullSize;
     Pref:=ProgMess[203];  //'����������';
     NameBlock:=ProgMess[204];  //'���������� ��������';
     CountConstNames:=CountY-1;
     XNames:=Addr(XNamesCalibr[1]);
     XNamesCount:=CountX;
//     XNames[1].Index:=SizeCol;
end;

function TCalSens.LoadXYvirt(vInBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var pCal:^rCalSens;
    PortNum:word;    //nSens,,NumRecord,
    pSensNum:PByteArray;
begin
 pCal:=Adr;
 if ValY=0 then
      begin
      if ValX=0 then Txt:=ParentCtr.CtrName
                else Txt:=XNames[ValX].Name;
      Exit;
      end;
  if ValY=CountY then
       begin
       if (ValX>1) then begin Result:=0; Txt:='';Exit; end;
       Result:=Convers(ConstNames[ValY].Name,
       Addr(pCal^.CalPort),SSSS,vInBlock,ValX,ValY,Txt,ConstNames[ValY].Ed);
       Exit;
       end;
  PortNum:=pCal^.CalSens[ValY].NInput;
  if vInBlock <> cInBlock then begin Txt:=''; Result:=0; end;
  case ValX of
      0: Txt:=ConstNames[ValY].Name;
      1:  Result:=Convers('',
       Addr(pCal^.CalSens[ValY].NInput),SS,vInBlock,ValX,ValY,Txt,'');
      2: if PortNum < MAX_ANALOG_SENS then Result:=Convers('',
       Addr(pCal^.CalSens[ValY].Val[1]),ConstNames[ValY].Frm,vInBlock,ValX,ValY,Txt,ConstNames[ValY].Ed);
      3: if PortNum < MAX_ANALOG_SENS then Result:=Convers('',
       Addr(pCal^.CalSens[ValY].U[1]),SSSS,vInBlock,ValX,ValY,Txt,ProgMess[271]);    //'mV'
      4: if PortNum < MAX_ANALOG_SENS then Result:=Convers('',
       Addr(pCal^.CalSens[ValY].Val[2]),ConstNames[ValY].Frm,vInBlock,ValX,ValY,Txt,ConstNames[ValY].Ed);
      5: if PortNum < MAX_ANALOG_SENS then Result:=Convers('',
       Addr(pCal^.CalSens[ValY].U[2]),SSSS,vInBlock,ValX,ValY,Txt,ProgMess[271]);    //'mV'
      6: if PortNum >= MAX_ANALOG_SENS then Result:=Convers('',
       Addr(pCal^.CalSens[ValY].Val[1]),S_S_S_S,vInBlock,ValX,ValY,Txt,'');
      end;   //end case
end;

//--------- END CALIBR  ------------------


//--------- ������� �� ����� D403 ------------------
// typedef struct  eeTimer403
//type eTask = record
 {

        uint    DataStart;  //0
        uint    DataEnd;	//2
        uint    TimeStart;  //4
        uint    TimeEnd;    //6
        uchar   KeepEC;		//8
        uint    KeepPH;     //9
        uchar   KeepT;		//11
        char    KeepRetEC;  //13
        char    IrrigTime;  //14
        char    PauseTime;	//15
        int     VolPlant;   //16
        uint    Period;     //18
        char    Mixture;	//20
		char	MicroDoz;   //21
		char	ExtStart;	//22
        }
{const
  iDataStart=   0;          //uint    DataStart;  0
  iDataEnd=     2;        //uint    DataEnd;    2
  iTimeStart=   4;        //uint    TimeStart;  4
  iTimeEnd=     6;        //uint    TimeEnd;    6
  iNumZone=     25;
  iVolPlant=    28;
  iMaxPeriod=   8;
  iMicroDoz=    31;
  iIrridTimeOtliv=iVolPlant-2;
//  iStartRH=     iIrridTimeOtliv;
//  iEndRH=       iStartRH+1;
//  iPeriodFromRH=iMicroDoz+1;
  cSizeColTimer403=33;
  posTimerZone=1;
//  posMicroDoz=20;
//  posMixture=6;
//  posProp=8;  }
        //---------- ������� ������ � �����������  -------
const
  cCountYTimer404   =4;
  cSizeColTimer404  =23;
  MAX_SUM_TIMER	    =10;
  var NameTimer404:array [1..cCountYTimer404] of TNameConst=(

    (Name:'��������� ����������� �';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'��������� ����������� ��';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:6;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'���� ������ �������� ���������';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'���� ��������� �������� ���������';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:2;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER)
);

var XNamesTimer:array [1..1] of TXNames=(
    (Name:'�������';Frm:None;Ed:'';Index:cSizeColTimer404;Cfg:0;Kind:0)
     );
procedure TTimer.Init;
begin
     Pref:=ProgMess[201]; //'�������';
     NameBlock:=ProgMess[202]; //'������� �� �����';
     CountX:=MAX_SUM_TIMER;
     CountY:=cCountYTimer404;
     SizeCol:=cSizeColTimer404;
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
     FixRow:=1;
     ConstNames:=Addr(NameTimer404[1]);
     XNames:=Addr(XNamesTimer[1]);
     XNamesCount:=1;
     XNames[1].Index:=SizeCol;
end;


//--------- ����� 403 ------------------
        { struct eArx
        int      Data;      //0
        uint     DezTime;   //2
        uint     DezVol;    //4
        char	 ScaleWater;//6
		    char     NumValve;  //7
        }
        const   cCountNameAchive  =4;
        cSizeColAchive    =30;
        iScaleWaterArxDez    =6;

var NameAchiveDez:array [1..cCountNameAchive] of TNameConst=(
    (Name:'����';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
      Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'����� ����������� �� �����';Frm:SShSSm_12;Ed:'�:�';TipSens:TipCalc;Min:0;Max:0;
      Index:2;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'����� ������������������ �������� �� �����';Frm:SSpSS;Ed:'�3';TipSens:TipCalibr;Min:0;Max:0;
      Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'����� ������� �� �����';Frm:SSpSS;Ed:'�3';TipSens:TipCalibr;Min:0;Max:0;
      Index:8;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER)
);

procedure TArxivDez.Init;
begin
     CountX:=10;
     CountY:=cCountNameAchive;
     SizeCol:=cSizeColAchive;
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
     Pref:='�����';  //ProgMess[205];  //'����������';
     NameBlock:='����� �����������'; //ProgMess[206];  //'����� ������ � ��';
     ConstNames:=Addr(NameAchiveDez[1]);
     CountConstNames:=cCountNameAchive;
     Sort:=srNoGridGraf;
     Translator:=CountConstNames;
end;

procedure TFDesinf.FPDesinfMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  xGridWater.BeginDrag(False,10);
end;

end.
