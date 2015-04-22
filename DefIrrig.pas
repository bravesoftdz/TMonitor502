unit DefIrrig;

interface
uses FConstType, FController, Graphics;

const
// ����� ����������� ����������� SubTip
{#define tR100   1
#define tDV     2
#define tTV     8
#define tAV10   16
#define tSiod   32}

        Rasxod100=      $01;
        DubleValve=     $02;
        Pusto=          $04;
        TriValve=       $08;
//        ArxRas10=       $10;
        YesSiod =       $20;
        YesKamera=      $02;
//#define tSiod22 64 /* 6 ���=1(64), �� ����������� ����22 */
        YesSiod22=      $40;
        YesT325=        $80;
// ��������� �������� ������� ������ - GD.SostPol.OutReg
	OnNasos=	$01;
	OnWater=	$02;
	OnFirstKl=	$04;
// ��������� �������� �������� - GD.SostPol.InReg
	OnLevel1=	$01;
	OnLevel2=	$02;
	OnLevel3=	$04;
	OnLevel4=	$08;
//  ��������� ������ ��������- GD.SostPol.Chan[].RCS
        ActChan=	0;//$01;
        YesZD=		1;//$02;
        LowLevErr=	4;//$10;
        HiLevErr=	5;//$20;
        LevErr=         $30;
// ���� �������� ������ - GD.SostPol.TipError
        cErDoz=4; //���� �� 1 �� 4
//        cErVAC=	7;
        bErOutMat=64;
        cErRasxod=32;
        cErNasWater=8;
        cErWater=9;
// ��������� ������ - GD.SostPol.Cycle
        sSTOP=           0;
        sACT=            1;
        sPAUSE=          2;
        sWATER=          3;
// ��������� ����������� �� ���������
       Temp1=9;
       Hum1=13;
const    NameChan04:array [1..17] of string[6]=(
     'EC','pH','���','ECk','���','���','���','���',
     '����1','����2','����3','����4','����1','����2','����3','����4',
     '���� 1');
const    FrmChan04:array [1..17] of TSFormat=
    (SSpSS,SSpSS,SSpS0,SSpSS,SSSS,SSSpS,SSSpS,SSSpS,
     SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSSS);
const    EdChan04:array [1..17] of string[7]=(
     '���/��','','�C','���/��','��/�2','��','��','��',
     '�C','�C','�C','�C','%','%','%','%','����');
const    NameChan324:array [1..17] of string[6]=(
     'EC','pH','���','ECk','pH�','���','���','���',
     '����1','����2','����3','����4','����1','����2','����3','����4',
     '���� 1');
const    FrmChan324:array [1..17] of TSFormat=
    (SSpSS,SSpSS,SSpS0,SSpSS,SSpSS,SSSS,SSSpS,SSSpS,
     SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSpS0,SSSS);
const    EdChan324:array [1..17] of string[7]=(
     '���/��','','�C','���/��','','��/�2','��','��',
     '�C','�C','�C','�C','%','%','%','%','����');

{type
 TCtrPoliv=Class(TFPicCtr)
 public
     ScaleRasxod:TSFormat;
     NumDozEC:Byte;
//     mSostPol:array[0..100] of byte;
     property NumValve:Byte read IdentCtr[id1] write IdentCtr[id1];
     property NumChan:Byte read IdentCtr[id2] write IdentCtr[id2];
//     property NumTimer:Byte read Ident[1] write Ident[1];
     property SizeArx:Byte read IdentCtr[id3] write IdentCtr[id3];
end; }
SumIrrigDiag=6;
var
IrrigDiagnos:array [1..SumIrrigDiag] of TDiagnos=(
   (Name:'��� �������� ������';ShowPozition:30;LevelAlarm:alFatal;PosInHot:0;Frm:SS;Oper:BGT;OperValue:0;Color:clRed;Voice:''),
   (Name:'����� ����������� ������� �� ��';ShowPozition:29;LevelAlarm:alFatal;PosInHot:6;Frm:SS;Oper:lAND;OperValue:$80;Color:clRed;Voice:'WrongTime'),
   (Name:'������ ����������';ShowPozition:28;LevelAlarm:alHand;PosInHot:13;Frm:SS;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl'),
//   (Name:'���������';ShowPozition:-2;LevelAlarm:caRedFatalAlarm+1;PosInHot:22;Frm:SS;Oper:BGT;OperValue:0;Color:clGreen),
   (Name:'�� ��������� �����';ShowPozition:-2;LevelAlarm:alMessig;PosInHot:22;Frm:SS;Oper:BGT;OperValue:0;Color:clGreen),
//   (Name:'������';ShowPozition:-5;LevelAlarm:caRedFatalAlarm+1;PosInHot:20;Frm:SS;Oper:lAND;OperValue:1;Color:clBlue),
   (Name:'����� ������';ShowPozition:-5;LevelAlarm:alMessig;PosInHot:21;Frm:SS;Oper:lAND;OperValue:1;Color:clBlue),
   (Name:'������';ShowPozition:-1;LevelAlarm:alFatal;PosInHot:23;Frm:SS;Oper:BGT;OperValue:0;Color:clRed)
   );

implementation

end.
