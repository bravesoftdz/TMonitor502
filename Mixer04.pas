unit Mixer04;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls,DateUtils,
  StdCtrls,Chart,Series,TeEngine, GanttCh,ComCtrls,
  FConstType, FController,PicCtr,DefIrrig,ClimCalc, Gauges,MSiod, FBox,
  FPanel, GIFDef, GIFComponent, FPicLabel;
const
    t325=128;  { 7 ���=1(128), �� ���������� 325(��� �� ������ ����� � �������) }
    t326=32;   { ���=1(32), �� ���������� 326( ����� ������� ������) }
    t326Pr=8;  //#define t326Pr  8  /* 3 ����=1(8), �� ����� � ����������� 1-100 */
    NumChan=8;
    NumChanU=2;
    NumChanArx=4;
    NumChanPul=2;
    cNumMat=3;
    cNumMat324=2;
    nmSR=6;
    Temp1=9;
    Hum1=13;
    cNumTimer=30;
    bTOborot=4;
    blChanel=2;

type
   TFMixer04 = class(TFPicCtr)
    Label8: TLabel;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge1: TGauge;
    C: TLabel;
    Label9: TLabel;
    Panel6: TPanel;
    Panel3: TPanel;
    BotLev: TShape;
    WorkLev: TShape;
    TopLev: TShape;
    PaPro: TPanel;
    Bevel5: TBevel;
    Label27: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    LMes: TLabel;
    ImagePoliv: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label26: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label24: TLabel;
    LCtr: TLabel;
    Label3: TLabel;
    GIFSShow1: TGIFSShow;
    GIFSShow2: TGIFSShow;
    FBox1: TFBox;
    FBox2: TFBox;
    FBox3: TFBox;
    FBox4: TFBox;
    FBox5: TFBox;
    FBox6: TFBox;
    FBox7: TFBox;
    FBox8: TFBox;
    FBox9: TFBox;
    FBox10: TFBox;
    FBox11: TFBox;
    FBox12: TFBox;
    FBox13: TFBox;
    FBox14: TFBox;
    FBox15: TFBox;
    FBox16: TFBox;
    FBox17: TFBox;
    FBox18: TFBox;
    FBox19: TFBox;
    FBox20: TFBox;
    FBox21: TFBox;
    FBox22: TFBox;
    FBox23: TFBox;
    FBox24: TFBox;
    FBox25: TFBox;
    FBox26: TFBox;
    FBox27: TFBox;
    FBox28: TFBox;
    FPanel1: TFPanel;
    Label5: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Shape1: TShape;
    Gauge4: TGauge;
    Label30: TLabel;
    Bevel1: TBevel;
    Shape2: TShape;
    Gauge6: TGauge;
    Label7: TLabel;
    Bevel2: TBevel;
    Shape3: TShape;
    FBox29: TFBox;
    FPicLabel1: TFPicLabel;
    FPicLabel13: TFPicLabel;
    FPicLabel6: TFPicLabel;
    FPicLabel2: TFPicLabel;
    FPicLabel3: TFPicLabel;
    FPicLabel4: TFPicLabel;
    FPicLabel5: TFPicLabel;
    FPicLabel7: TFPicLabel;
    FPicLabel8: TFPicLabel;
    FPicLabel9: TFPicLabel;
    FPicLabel10: TFPicLabel;
    FPicLabel11: TFPicLabel;
    FPicLabel12: TFPicLabel;
    procedure SBECaClick(Sender: TObject);
  private
    { Private declarations }
     ScaleRasxod:TSFormat;
     NumDozEC:Byte;
     BlArxMC:TBlock;
     BlockHoum:Byte;
     function GetTipOborot:Boolean;
     property NumChan:Byte read IdentCtr[ident2] write IdentCtr[ident2];
     property SizeArx:Byte read IdentCtr[ident3] write IdentCtr[ident3];
     property NumValve:Byte read IdentCtr[idModific] write IdentCtr[idModific];
     function CustLoadXY(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String; pData:Pointer{;NumV:word;FrmRas:TSFormat}):Double;
//     property Oborot:Boolean read ((SubTip and bTOborot)>0)];
  public
    { Public declarations }
    procedure InitCtr(vIdentCtr:TIdentCtr);override;
    function CtrFromFile(NameFile:string):Boolean;override;
    procedure SetPicCtr; override;
  end;
  
type TSostPolD4=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
        var Txt:String):Double;override;
     procedure SetTree(var Tree:TTreeView); override;
end;

type THotPol325=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
        var Txt:String):Double;override;
//     procedure RandBlock; override;
//     function BitLoadXY(ValY:Integer;
//       var vRes:Integer; var vPrefStr:String; var PointDiagnos:TPtDiagnos):Boolean;override;
     procedure PostPortRead; override;
     procedure SetTree(var Tree:TTreeView); override;
     function SendTime:Boolean;
end;

type TControlD4=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type TControl325=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(vInBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type TTimerD4=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
     function SetAny(Col,Row,x,y:integer;var Any:TAny):Integer;override;
end;

type TTimerD7=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
     function SetAny(Col,Row,x,y:integer;var Any:TAny):Integer;override;
end;

type TTimer326=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
     function GetTimer325(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;
     function GetTimer326(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;
     function SetAny(Col,Row,x,y:integer;var Any:TAny):Integer;override;
     function GetChart325(x,y:WORD;var Any:TAny):Integer;
     function GetChart326(x,y:WORD;var Any:TAny):Integer;
end;

{type TTimerD9=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
//     function SetAny(x,y:WORD;var Any:TAny):double;override;
end;
}
type TChanelD4=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type TArxivD4=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type TIrrArxPC=Class(TBlock)
private
DateTest:TDateTime;
//BlArxMC:TBlock;
function CalcDayArxPC(var ArxDate:TDateTime):Boolean;
function CalcAllArxPC(StartDate:TDateTime):Boolean;

public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type THoum=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

//var vBlArxMC:TBlock;

implementation

uses SetGrid,GGraf, {SetSer,} Port;

{$R *.DFM}
const cNameIdentD4=173;
{var cNameIdentD4:TNameIdent=(
     '���������� ��������',
     '���������� ��������',
     '������ ������',
     '�����������',
     '��� �����������');
}
function TFMixer04.GetTipOborot:Boolean;
begin result:=(SubTip and bTOborot)>0;
end;

function TFMixer04.CtrFromFile(NameFile:string):Boolean;
begin
     result:=inherited CtrFromFile(NameFile);
     Block[BlockHoum].LoadFileByDate(Now,dEnd);
     LCtr.Caption:=CtrName;
//     LoadViewFromFile(GetViewNameFile);
end;

procedure TFMixer04.SBECaClick(Sender: TObject);
begin
end;
//-- ��������� ������ D-04 ------------------
type rTChan4=record
     RCS:Byte;
     IZ:InInt;
     IZcor:InInt;
     ZD:InInt;
     CopyReg:Byte;
     TimeReg:Byte;
     end;
type rTSostPolD5=record
     News:Byte;
{		 Time:InInt;
		 Data:InInt;
		 Year:Byte;}
     Hand:Byte;
     Cycle:Byte;
     OutReg:InInt;
     InReg:Byte;
// 0-�����,1..4-������ ��������,
// 5- ������ �������, 6-������ ������ ����
     TipError:Byte; // ����� ���� Error
     NumPoliv:Byte;
     SelValve:Byte;
     tTimeValve:InInt;
     RCSDoz:Byte;
     RCSRas:Byte;
     TecRasxod:InInt;
     tVolValve:InInt;
     OutRegExt:Byte;
     TecSol:InInt;
     Propor:Byte;
     Rezept:Byte;
     MirrorVal:Byte;
     Chan:Array [1..8]of rTChan4;
//	TimeValve:array [1..NumValve] of Byte;
     end;

procedure TSostPolD4.Init;
begin
//     Num:=blHotBlock;
     CountX:=1;
     CountY:=60;//43+(ParentCtr as TFMixer04).NumValve+(ParentCtr as TFMixer04).NumChan;
     SizeCol:=SizeOf(rTSostPolD5);
     if (ParentCtr as TFMixer04).NumChan>8 then
       SizeCol:=SizeCol+SizeOf(rTChan4)*((ParentCtr as TFMixer04).NumChan-8);
     FullSize:=SizeCol;
     SendByte:=2;
//     EEPSize:=0;
     Pref:='���������';
     NameBlock:='��������� ������';
end;

function TSostPolD4.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var ADat:^rTSostPolD5;
    NumV,StartVal,bValve:Byte;
    NKran:integer;
    Prop:word;
begin
 ADat:=Adr;
 NumV:=(ParentCtr as TFMixer04).NumValve;
 StartVal:=(ParentCtr as TFMixer04).CtrTip mod 10;
 Result:=ValX;
 imNum:=0;
 case ValY of
 0:    if ValX=0 then  Txt:='���������'
          else Txt:='';//'��������';
 1 :  begin
      Result:=Convers('������ ����������',
        Addr(ADat^.Hand),SS,InBlock,ValX,ValY,Txt,'');
      end;
 2..17: begin
      ValY:=ValY-1;
      if ValY<=NumChanPul then
        Result:=Convers('�������� '+NameChan324[ValY],
        Addr(ADat^.Chan[ValY].IZcor),
        FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY])
      else Result:=Convers('�������� '+NameChan324[ValY],
        Addr(ADat^.Chan[ValY].IZ),
        FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY]);
      if (Result<=0) or (Result>200) then imNum:=imNoRealPC;
      end;
 18..20:  begin
//        imNum:=0;imProg;
        ValY:=ValY-17;
        Result:=Convers('������ '+NameChan324[ValY],
         Addr(ADat^.Chan[ValY].ZD),
         FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY]);
         if Result<=0 then imNum:=imAlarmLow;
        end;
  21:   case (ParentCtr as TFMixer04).NumDozEC of
        2: Result:=Convers('��������� �:�',
            Addr(ADat^.Propor),SdS,InBlock,ValX,ValY,Txt,'');
        3: Result:=Convers('�������� �:�:C',
            Addr(ADat^.Propor),SdSdS,InBlock,ValX,ValY,Txt,'');
        4: Result:=Convers('�������� �:�:C:D',
            Addr(ADat^.Propor),SdSdSdS,InBlock,ValX,ValY,Txt,'');
        end;
  22:   begin
//        imNum:=0;//imRasch;
        NumV:=ADat^.Chan[1].CopyReg;
        Result:=Convers('����� ��',
         Addr(NumV),SS,InBlock,ValX,ValY,Txt,'/8 ���');
        end;
 23..24:    begin
//        imNum:=0;//imRasch;
        NumV:=ValY-22;
        ValY:=ValY-23;
        if (ParentCtr as TFMixer04).NumDozEC>2 then
           begin
           NKran:=-1;
           bValve:=ADat^.Propor;
           repeat
           NKran:=NKran+1;
           Prop:=bValve and 3;
           bValve:=bValve shr 2;
           if Prop>0 then NumV:=NumV-1;
           until ((Prop>0)and(NumV=0)) or ((NKran-ValY)>1);
           end
        else
           begin
           NKran:=ValY;
           if(ADat^.Propor=0) then Prop:=1
             else if NKran>0 then Prop:=ADat^.Propor mod 6
                             else Prop:=ADat^.Propor div 6;
           end;
        Prop:=Prop*ADat^.Chan[1].CopyReg;
        Result:=Convers('���� '+char(ord('A')+NKran),
            Addr(Prop),SS,InBlock,ValX,ValY,Txt,'/8 ���');
        end;
 25:    begin
//        imNum:=0;//imRasch;
        NumV:=ADat^.Chan[2].CopyReg;
        Result:=Convers('���� pH',
         Addr(NumV),SS,InBlock,ValX,ValY,Txt,'/8 ���');
        end;
 26:  Result:=Convers('������� ������',
        Addr(ADat^.TecRasxod),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3/���');
 27:  Result:=Convers('������ ��������',
        Addr(ADat^.tVolValve),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
 28:  Result:=Convers('�������� �������',
        Addr(ADat^.tTimeValve),SSmSSs,InBlock,ValX,ValY,Txt,'');
 29:  Result:=Convers('����� ������',
        Addr(ADat^.NumPoliv),SS,InBlock,ValX,ValY,Txt,'');
 30:  begin
      StartVal:=ADat^.SelValve+1;
      Result:=Convers('������� ������',
        Addr(StartVal),SS,InBlock,ValX,ValY,Txt,'');
      StartVal:=ADat^.MirrorVal;
      if StartVal>0 then Txt:=Txt+'+'+IntToStr(StartVal);
      if (Result<1) or (Result>30) then begin
         Result:=0;
         Txt:='~';
         end;
      end;
 31..36:  begin
        ValY:=ValY-30;
        Result:=Convers('��������� '+NameChan324[ValY],
         Addr(ADat^.Chan[ValY].IZ),
         FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY]);
        if Result<=0 then imNum:=imNoRealPC;
        end;
 37:  begin
      Result:=Convers('������� ����� ',
          Addr(ADat^.Chan[nmSR].IZcor),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      imNum:=imSun;
      end;
else  begin
       if ValY>=1000 then ValY:=ValY mod 1000
         else ValY:=ValY-37;
         case ValY of
            0: begin
               if ValX=0 then  Txt:='���������'
               else Txt:='��������';
               end;
            1: Result:=ConversBit('����� ������', //����� 38
               Addr(ADat^.OutReg[1]),
               0,OnOff,InBlock,ValX,Txt);
            2: Result:=ConversBit('������ ����',
               Addr(ADat^.OutReg[1]),
               StartVal,OnOff,InBlock,ValX,Txt);
            3:  Result:=ConversBit('����� ����',
               Addr(ADat^.OutReg[1]),
               1,OnOff,InBlock,ValX,Txt);
            4..7:  Result:=ConversBit('������� '+IntToStr(ValY-3),//����� 42
               Addr(ADat^.InReg),
               ValY-4,YesNo,InBlock,ValX,Txt);
            8..10:  Result:=ConversBit('������� '+NameChan324[ValY-7],
               Addr(ADat^.Chan[ValY-7].RCS),
               YesZD,OnOff,InBlock,ValX,Txt);
            11..15:  Result:=ConversBit(NameChan324[ValY-10]+' ������ �������',
               Addr(ADat^.Chan[ValY-10].RCS),
               LowLevErr,YesNo,InBlock,ValX,Txt);
            16..20:  Result:=ConversBit(NameChan324[ValY-15]+' ������ �������',
               Addr(ADat^.Chan[ValY-15].RCS),
               HiLevErr,YesNo,InBlock,ValX,Txt);
            21:  Result:=ConversBit('������ ������',
               Addr(ADat^.RCSRas),
               0,OnOff,InBlock,ValX,Txt);
            22:  Result:=Convers('��������� ������',
               Addr(ADat^.Cycle),SS,InBlock,ValX,ValY,Txt,'');
            23:  Result:=Convers('��� ������',
               Addr(ADat^.TipError),SS,InBlock,ValX,ValY,Txt,'');
            else begin
               ValY:=ValY-23;
               if ValY <= NumV then begin
               bValve:=ValY+StartVal;
                if bValve>=16 then
                  Result:=ConversBit('������ '+IntToStr(ValY),
                  Addr(ADat^.OutRegExt),
                  bValve-16,OnOff,InBlock,ValX,Txt)
                else Result:=ConversBit('������ '+IntToStr(ValY),
                  Addr(ADat^.OutReg[1-(bValve div 8)]),
                  bValve mod 8,OnOff,InBlock,ValX,Txt);
               end;
               end;
            end;
       end;
 end;
end;

procedure TSostPolD4.SetTree(var Tree:TTreeView);
var st:string;
    Node1,NodeHead:TTreeNode;
    Param:Txy;
    nSens:word;
begin
   with Tree do begin
      Items.BeginUpdate;
      Param.Block:=Self;
      if Items.Count=0 then
        NodeHead:=Items.AddChildObject(nil,ParentCtr.CtrName,Param.Ptr)
      else NodeHead:=Items.AddChildObject(Items.Item[0],ParentCtr.CtrName,Param.Ptr);
// ���������� ���������
      Param.X:=1;
      Param.Y:=1;
      Node1:=Items.AddChildObject(NodeHead,'������ ����������',Param.Ptr);
      Node1.ImageIndex:=imNorm;
      Param.Block:=Self;
      Node1:=Items.AddChildObject(NodeHead,'���������',Param.Ptr);
      Param.X:=1;
      for nSens:=2 to 17 do begin
             Param.Y:=nSens;
             LoadXY(cOutBlock,0,nSens,st);
             (Items.AddChildObject(Node1,st,Param.Ptr)).ImageIndex:=imIzmer;//imNum;
             end;
      Param.Block:=Self;
      Node1:=Items.AddChildObject(NodeHead,'�������',Param.Ptr);
      Param.X:=1;
      for nSens:=18 to 21 do begin
        Param.Y:=nSens;
        LoadXY(cOutBlock,0,nSens,st);
        (Items.AddChildObject(Node1,st,Param.Ptr)).ImageIndex:=imTimer;//imNum;
        end;
      Param.Block:=Self;
      Node1:=Items.AddChildObject(NodeHead,'���������',Param.Ptr);
      Param.X:=1;
      for nSens:=22 to CountY do begin
             Param.Y:=nSens;
             LoadXY(cOutBlock,0,nSens,st);
             (Items.AddChildObject(Node1,st,Param.Ptr)).ImageIndex:=imIzmer;//imNum;
             end;
      Items.EndUpdate;
//      NodeHead.Expand(False);
      end;
end;

//---------- END ��������� ������ D-04 ------------------

//-- ��������� ������ D325 ------------------
const   iTime=6;
        SizeSendTime=14;
        SizeSendSun=6;
type rTChan325=record
     IZ:InInt;
     RCS:Byte;
//     IZcor:InInt;
//     ZD:InInt;
//     CopyReg:Byte;
//     TimeReg:Byte;
     end;
type rHotPol=record
     News:Byte;    //0
		 PolSun:InInt;
     PolSunRCS:Byte;
		 PolSumSun:InInt;
		 Time:InInt;      //6
		 Data:InInt;
		 Year:Byte;
     Rez:InInt;
     Hand:Byte;       //13
     Rezept:Byte;
     NumPoliv:Byte;   //15
     RCSDoz:Byte;
     RCSRas:Byte;
     OutRegExt:Byte;
     InReg:Byte;      //19
     OutReg:InInt;
     Cycle:Byte;      //22
// 0-�����,1..4-������ ��������,
// 5- ������ �������, 6-������ ������ ����
     TipError:Byte;   // ����� ���� Error
     SelValve:Byte;   //24
     tTimeValve:InInt;
     TecRasxod:InInt;
     tVolValve:InInt;
     Propor:Byte;    //Zona:Byte;   
     MirrorVal:Byte;
		 FilPul:Array [1..NumChanPul]of InInt;
     Chan:Array [1..17]of rTChan325;
     CopyRegEC:Byte;
     CopyRegPH:Byte;
     Task:Array [1..8]of InInt;
     CycleSiod:Byte;
     BoilerMix:Byte;
     Prop:array [1..4] of Byte;
     tFilterPeriod:InInt;
//     tFilterClean:InInt;
//     tFilterVolume:InInt;
//     Task:Array [1..5]of InInt;  � ����������� 8 ������
//	TimeValve:array [1..NumValve] of Byte;
     end;
const SumIrrigDiag325=4;
var
IrrigDiagnos325:array [1..SumIrrigDiag325] of TDiagnos=(
   (Name:'������ ����������';ShowPozition:28;LevelAlarm:alHand;
      PosInHot:1;Frm:SS;Oper:BGT;OperValue:0;Color:clRed;Voice:'HandControl'),
   (Name:'�� ��������� �����';ShowPozition:-2;LevelAlarm:alMessig;
      PosInHot:59;Frm:SS;Oper:BGT;OperValue:0;Color:clGreen),
   (Name:'����� ������';ShowPozition:-5;LevelAlarm:alMessig;
      PosInHot:38;Frm:SS;Oper:BGT;OperValue:0;Color:clBlue),
   (Name:'������';ShowPozition:-1;LevelAlarm:alFatal;
      PosInHot:60;Frm:SS;Oper:BGT;OperValue:0;Color:clRed)
   );
procedure THotPol325.Init;
begin
     CountX:=1;
     CountY:=65;
     SizeCol:=SizeOf(rHotPol);
     FullSize:=SizeCol;
     SendByte:=SizeSendTime;
     Pref:='���������';
     NameBlock:='��������� ������';
     FixRow:=1;
     Diagnosis:=Addr(IrrigDiagnos325[1]);
     CountDiagnosis:=SumIrrigDiag325;
end;

function THotPol325.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var pHotPol:^rHotPol;
    StartVal,bValve:Byte;
    NumV,NKran:integer;
    Prop:word;
    pt:Pointer;
begin
 pHotPol:=Adr;
 NumV:=(ParentCtr as TFMixer04).NumValve;
 StartVal:=(ParentCtr as TFMixer04).CtrTip mod 10;
 Result:=ValX;
 imNum:=0;
 case ValY of
 0:    if ValX=0 then  Txt:='���������'
          else Txt:='';//'��������';
 1 :  begin
      Result:=Convers('������ ����������',
        Addr(pHotPol^.Hand),SS,InBlock,ValX,ValY,Txt,'');
      end;
 2..17: begin
      ValY:=ValY-1;
      if ValY<=NumChanPul then  pt:=Addr(pHotPol^.FilPul[ValY])
        else  pt:=Addr(pHotPol^.Chan[ValY].IZ);
      Result:=Convers('�������� '+NameChan324[ValY],
        pt,FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY]);
      if (Result<=0) or (Result>500) then imNum:=imNoRealPC;
      end;
 18..20:  begin
//        imNum:=0;imProg;
        ValY:=ValY-17;
        Result:=Convers('������ '+NameChan324[ValY],
         Addr(pHotPol^.Task[ValY]),
         FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY]);
         if Result<=0 then imNum:=imAlarmLow;
        end;
  21: if (ParentCtr.SubTip and t326Pr)>0 then
          begin
          Result:=Convers('��������� _�:_�:_C:_D',
            Addr(pHotPol^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
          Txt:=Copy(Txt,1,Length(Txt)-(4-(ParentCtr as TFMixer04).NumDozEC)*3);
          end
      else
       case (ParentCtr as TFMixer04).NumDozEC of
        2: Result:=Convers('��������� �:�',
            Addr(pHotPol^.Propor),SdS,InBlock,ValX,ValY,Txt,'');
        3: Result:=Convers('�������� �:�:C',
            Addr(pHotPol^.Propor),SdSdS,InBlock,ValX,ValY,Txt,'');
        4: Result:=Convers('�������� �:�:C:D',
            Addr(pHotPol^.Propor),SdSdSdS,InBlock,ValX,ValY,Txt,'');
        end;
  22:   begin
//        imNum:=0;//imRasch;
        NumV:=100*pHotPol^.CopyRegEC div 36;
        Result:=Convers('����� ��',
         Addr(NumV),SS,InBlock,ValX,ValY,Txt,'%');
        end;
 23..24:    begin
//        imNum:=0;//imRasch;
        NumV:=ValY-22;
        ValY:=ValY-23;
        if (ParentCtr as TFMixer04).NumDozEC>2 then
           begin
           NKran:=-1;
           repeat
           NKran:=NKran+1;
           Prop:=pHotPol^.Prop[NKran+1];//bValve and 3;
           if Prop>0 then NumV:=NumV-1;
           until ((Prop>0)and(NumV=0)) or ((NKran-ValY)>1);
           end
        else
           begin
           NKran:=ValY;
           if NKran>0 then Prop:=pHotPol^.Prop[2]
                             else Prop:=pHotPol^.Prop[1];
           end;
        bValve:=0;
        for NumV:=1 to 4 do if pHotPol^.Prop[NumV]>bValve then bValve:=pHotPol^.Prop[NumV];
        if bValve>0 then Prop:=100*Prop*pHotPol^.CopyRegEC div (36*bValve)
          else Prop:=0;
        Result:=Convers('���� '+char(ord('A')+NKran),
            Addr(Prop),SS,InBlock,ValX,ValY,Txt,'%');
        end;
 25:    begin
//        imNum:=0;//imRasch;
        NumV:=100*pHotPol^.CopyRegPH div 36;
        Result:=Convers('���� pH',
         Addr(NumV),SS,InBlock,ValX,ValY,Txt,'%');
        end;
 26:  Result:=Convers('������� ������',
        Addr(pHotPol^.TecRasxod),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3/���');
 27:  Result:=Convers('������ ��������',
        Addr(pHotPol^.tVolValve),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
 28:  Result:=Convers('�������� �������',
        Addr(pHotPol^.tTimeValve),SSmSSs,InBlock,ValX,ValY,Txt,'')/cMin;
 29:  Result:=Convers('����� ���������',
        Addr(pHotPol^.NumPoliv),SS,InBlock,ValX,ValY,Txt,'');
 30:  begin
      StartVal:=pHotPol^.SelValve+1;
      Result:=Convers('������� ������',
        Addr(StartVal),SS,InBlock,ValX,ValY,Txt,'');
      StartVal:=pHotPol^.MirrorVal;
      if StartVal>0 then Txt:=Txt+'+'+IntToStr(StartVal);
      if (Result<1) or (Result>30) then begin
         Result:=0;
         Txt:='~';
         end;
      end;
 31..35:  begin
        ValY:=ValY-30;
        Result:=Convers('��������� '+NameChan324[ValY],
         Addr(pHotPol^.Chan[ValY].IZ),
         FrmChan324[ValY],InBlock,ValX,ValY,Txt,EdChan324[ValY]);
        if Result<=0 then imNum:=imNoRealPC;
        end;
 36:  begin
        Result:=Convers('����� ',
          Addr(pHotPol^.Propor),SS,InBlock,ValX,ValY,Txt,'');
      end;
 37:  begin
      Result:=Convers('������� ����� ',
          Addr(pHotPol^.PolSumSun),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      imNum:=imSun;
      end;
 38: Result:=ConversBit('����� ������', //����� 38
               Addr(pHotPol^.OutReg[1]),
               0,OnOff,InBlock,ValX,Txt);
 39: Result:=ConversBit('������ ����',
               Addr(pHotPol^.OutReg[1]),
              StartVal,OnOff,InBlock,ValX,Txt);
 40:  Result:=ConversBit('����� ����',
               Addr(pHotPol^.OutReg[1]),
               1,OnOff,InBlock,ValX,Txt);
 41..44:  Result:=ConversBit('������� '+IntToStr(ValY-40),//����� 42
               Addr(pHotPol^.InReg),
               ValY-41,YesNo,InBlock,ValX,Txt);
 45..47:  Result:=ConversBit('������� '+NameChan324[ValY-44],
               Addr(pHotPol^.Chan[ValY-44].RCS),
               YesZD,OnOff,InBlock,ValX,Txt);
 48..52:  Result:=ConversBit(NameChan324[ValY-47]+' ������ �������',
               Addr(pHotPol^.Chan[ValY-47].RCS),
               LowLevErr,YesNo,InBlock,ValX,Txt);
 53..57:  Result:=ConversBit(NameChan324[ValY-52]+' ������ �������',
               Addr(pHotPol^.Chan[ValY-52].RCS),
               HiLevErr,YesNo,InBlock,ValX,Txt);
 58:  Result:=ConversBit('������ ������',
               Addr(pHotPol^.RCSRas),
               0,OnOff,InBlock,ValX,Txt);
 59:  Result:=Convers('��������� ������',
               Addr(pHotPol^.Cycle),SS,InBlock,ValX,ValY,Txt,'');
 60:  Result:=Convers('��� ������',
               Addr(pHotPol^.TipError),SS,InBlock,ValX,ValY,Txt,'');
 61:  Result:=Convers('��������� ����',
               Addr(pHotPol^.CycleSiod),SS,InBlock,ValX,ValY,Txt,'');
 62:  Result:=Convers('������-���� ������',
               Addr(pHotPol^.BoilerMix),SS,InBlock,ValX,ValY,Txt,'%');
 63:  Result:=Convers('������ - ����� �� ��������',
               Addr(pHotPol^.tFilterPeriod),SShSSm_12,InBlock,ValX,ValY,Txt,'���:���')/cMin;
{ 64:  Result:=Convers('������ - ����� �� ��������',
               Addr(pHotPol^.tFilterVolume),SSSpS,InBlock,ValX,ValY,Txt,'�3');
 65:  Result:=Convers('������ - ��������',
               Addr(pHotPol^.tFilterClean),SSmSSs,InBlock,ValX,ValY,Txt,'���:���')/cMin;
}
 64:  Result:=Convers('����� � �����������',
               Addr(pHotPol^.Time),SShSSm,InBlock,ValX,ValY,Txt,'���:���')/cMin;
 65:  Result:=Convers('���� � �����������',
               Addr(pHotPol^.Data),SSsSS,InBlock,ValX,ValY,Txt,'');
    end;
end;

{function THotPol325.BitLoadXY(ValY:Integer;
       var vRes:Integer; var vPrefStr:String; var PointDiagnos:TPtDiagnos):Boolean;
var pHot:PByteArray;
//    Val:Double;
//    vStr:string;
//    YPoz:integer;
begin
if (ValY<1) or (ValY > SumIrrigDiag) then begin Result:=False; Exit; end;
PointDiagnos:=Addr(IrrigDiagnos[ValY]);
Result:=True;
vRes:=0;
vPrefStr:='';
pHot:=Adr;
case ValY of
  1:begin
    if Not Ready  then vRes:=PointDiagnos^.ShowPozition;
    end;
//  if Not Ready  then begin Result:=False; Exit; end;
  2:begin
    if Ready and ((pHot^[6+4] and $80)>0) then vRes:=PointDiagnos^.ShowPozition;
    end;
  3:begin
    if Ready and (pHot^[PointDiagnos^.IndByte]>0) then vRes:=PointDiagnos^.ShowPozition;
    end;
  else
    begin
//    ValY:=ValY-3;
//  if Ready and (vDiagnos.ShowPozition<>0) then YPoz:=vDiagnos.ShowPozition+nZona*2 else YPoz:=0;
    if GetOper(PointDiagnos^.Oper,pHot^[PointDiagnos^.IndByte],PointDiagnos^.OperValue)
       then vRes:=PointDiagnos^.ShowPozition
    else vRes:=0;
    end;
  end;
end; }

procedure THotPol325.PostPortRead;
var pHot:^rHotPol;
begin
 if Not Ready  then Exit;
{ pHot:=Adr;
//  ����� ��� 0x01=��������;  ��� 0x20-��� ���������
 if ((pHot^.PolSunRCS and 1) = 0) and ((pHot^.PolSun[0]+pHot^.PolSun[1]) > 10) then
// ���� ������ ����������� � �������� � �� 0, �� ��� � ����� ������
      begin
      mMeteo[comSun].IZ[0]:=pHot^.PolSun[0];
      mMeteo[comSun].IZ[1]:=pHot^.PolSun[1];
//      mMeteo[comSun].RCS:=pHot^.PolSunRCS;
      mMeteo[comSun].TimeRes:=BlDate;
      mMeteo[comSumSun].IZ[0]:=pHot^.PolSumSun[0];
      mMeteo[comSumSun].IZ[1]:=pHot^.PolSumSun[1];
      mMeteo[comSumSun].TimeRes:=BlDate;
      end
 else
      if FMain.mnTransferSun.Checked
         and (ParentCtr.DataPath = '')
         and (Now > mMeteo[comSun].TimeRes)
         and (Now < (mMeteo[comSun].TimeRes+3*cMin)) then
          begin
          if (ParentCtr.DataPath <> '') then Exit;
          pHot^.PolSun[0]:=mMeteo[comSun].IZ[0];
          pHot^.PolSun[1]:=mMeteo[comSun].IZ[1];
          pHot^.Chan[nmSR].IZ[0]:=pHot^.PolSun[0];
          pHot^.Chan[nmSR].IZ[1]:=pHot^.PolSun[1];
          pHot^.PolSumSun[0]:=mMeteo[comSumSun].IZ[0];
          pHot^.PolSumSun[1]:=mMeteo[comSumSun].IZ[1];

          pHot^.PolSunRCS:=$81;
          pHot^.News:=0;
          SendByte:=SizeSendSun;
          FPort.BlockSend(Self,IN_UNIT,0,nil);
          SendByte:=SizeSendTime;
          end; }
 inherited; // �������� ���� � ����
end;

function THotPol325.SendTime:Boolean;
var pHotPol:pByteArray;
    Minut:word;
begin
if FormFalseTime then Exit;
FormFalseTime:=True;
 if FMain.mnAutoSynxTime.Checked or (MessageDlg('��������! ����� ����������� "'+ParentCtr.CtrName
     +'" ���������� �� ��. ����������������?'
       ,mtWarning,[mbYes, mbNo],0)= mrYes) then
 begin
 pHotPol:=Adr;
 pHotPol^[0]:=$80;  //�������, ��� �������� ����
 Minut:=MinuteOfTheDay(Now);
 pHotPol^[iTime]:=Minut div 256;
 pHotPol^[iTime+1]:=Minut mod 256;
 pHotPol^[iTime+2]:=MonthOfTheYear(Now);
 pHotPol^[iTime+3]:=DayOfTheMonth(Now);
 pHotPol^[iTime+4]:=YearOf(Now)-2000;
 SendByte:=SizeSendTime;
 Result:=SendToPort(nil);
 end;
FormFalseTime:=False;
end;

procedure THotPol325.SetTree(var Tree:TTreeView);
var st:string;
    Node1,NodeHead:TTreeNode;
    Param:Txy;
    nSens:word;
begin
   with Tree do begin
      Items.BeginUpdate;
      Param.Block:=Self;
      if Items.Count=0 then
        NodeHead:=Items.AddChildObject(nil,ParentCtr.CtrName,Param.Ptr)
      else NodeHead:=Items.AddChildObject(Items.Item[0],ParentCtr.CtrName,Param.Ptr);
// ���������� ���������
      Param.X:=1;
      Param.Y:=1;
      Node1:=Items.AddChildObject(NodeHead,'������ ����������',Param.Ptr);
      Node1.ImageIndex:=imNorm;
      Param.Block:=Self;
      Node1:=Items.AddChildObject(NodeHead,'���������',Param.Ptr);
      Param.X:=1;
      for nSens:=2 to 17 do begin
             Param.Y:=nSens;
             LoadXY(cOutBlock,0,nSens,st);
             (Items.AddChildObject(Node1,st,Param.Ptr)).ImageIndex:=imIzmer;//imNum;
             end;
      Param.Block:=Self;
      Node1:=Items.AddChildObject(NodeHead,'�������',Param.Ptr);
      Param.X:=1;
      for nSens:=18 to 21 do begin
        Param.Y:=nSens;
        LoadXY(cOutBlock,0,nSens,st);
        (Items.AddChildObject(Node1,st,Param.Ptr)).ImageIndex:=imTimer;//imNum;
        end;
      Param.Block:=Self;
      Node1:=Items.AddChildObject(NodeHead,'���������',Param.Ptr);
      Param.X:=1;
      for nSens:=22 to CountY do begin
             Param.Y:=nSens;
             LoadXY(cOutBlock,0,nSens,st);
             (Items.AddChildObject(Node1,st,Param.Ptr)).ImageIndex:=imIzmer;//imNum;
             end;
      Items.EndUpdate;
      NodeHead.Expand(False);
      end;
end;
// end HotPol

procedure TFMixer04.SetPicCtr;
var// ADat:^rTSostPolD4;
    TErr:Byte;
    txt2,txt:string;
    n,nMes:integer;
    nLine2:word;
    sLine2:string;
    pHot:PByteArray;
//    Color:TColor;
begin
  if Not Block[0].Ready then Exit;
  if (DataPath='') and ((SubTip and T325)>0) then
        begin
        pHot:=Block[0].Adr;
        n:=MinuteOfTheDay(Now);
        nMes:=pHot^[iTime]*256+pHot^[iTime+1];
        if (n>15)
          and (n<(24*60-15))
          and (((nMes+15)<n) or((nMes-15)> n))
          then (Block[0] as THotPol325).SendTime;
        end;
  BotLev.Visible:= Block[0].LoadXY(cOutBlock,1,41,txt)=0;
  TopLev.Visible:= Block[0].LoadXY(cOutBlock,1,42,txt)=0;
  WorkLev.Visible:= Block[0].LoadXY(cOutBlock,1,43,txt)=0;
//  ADat:=Block[0].Adr;
  TErr:=round(Block[0].LoadXY(cOutBlock,1,60,txt));//ADat^.TipError;
  sLine2:='';
  nLine2:=0;
  for nMes:=38 to 38+20 do begin
    if(Block[0].LoadXY(cOutBlock,1,nMes,txt)>0) then begin
                   Block[0].LoadXY(cOutBlock,0,nMes,txt2);
                   if (nLine2>0) then sLine2:=sLine2+#13#10;
                   sLine2:=sLine2+txt2+' '+txt;
                   nLine2:=nLine2+1;
                   end;
    end;
  LMes.Caption:=sLine2;
  if round(Block[0].LoadXY(cOutBlock,1,1{Hand},txt))>0 then begin
      SetVoice('HandControl',0);
      PSost.Caption:='������ ����������';
      PSost.Color:=clRed;
      end
    else
    case round(Block[0].LoadXY(cOutBlock,1,59,txt)) of //ADat^.Cycle of
      0: begin
         PSost.Caption:='������ ���';
         PSost.Color:=clBlue;
         end;
      1: begin
         SetVoice('�����������',alFatal);
         case TErr of
         1..4: PSost.Caption:='������ '+NameChan324[TErr];
         cErRasxod: PSost.Caption:='������ �������';
//         cErVAC:    PSost.Caption:='��� ������� 24�';
         bErOutMat: PSost.Caption:='��� ��������';
         cErNasWater: PSost.Caption:='���� ����� ����';
         else PSost.Caption:='������';
         end;
         PSost.Color:=clRed;
         end;
      2: begin
         PSost.Caption:='���� � ���';//ActionMes;
         PSost.Color:=clRed;
         end;
      3: begin
         PSost.Caption:='������� �������';//ActionMes;
         PSost.Color:=$003FFF00;
         end;
      4: begin
         PSost.Caption:='�����';//ActionMes;
         PSost.Color:=$000FF0F;
         end;
      end;
end;

//---------- ��������� D325 ------------------
{type rTControl325=record
     rNumVal:Byte;
     rNumChan:Byte;
     rSizeArx:Byte;
     rSubIdent:Byte;
     rIdent:Byte;
//     Time:InInt;
//     Data:InInt;
//     Year:Byte;
//*-- ������ ����������� ������, ������ 20 ����*/
//     NFCtr:Byte;
     DelayBot1:Byte; //5
     SleepVal:Byte;
     FullBak:Byte;
     Turbo:Byte;
     ReadyMix:Byte;
     TimeAlarmRas:Byte;   // 10
     ResetAlarmRas:Byte;  // 11
     MinRasxod:InInt;     // 12
     MaxRasxod:InInt;     // 14
     CompAB:Byte;         // 16
     SBak:Array [1..3]of InInt; //17
     SleepValSiod:Byte;   //23
     ForvNasSiod:Byte;
     NSensEC:Byte;
     NSensPH:Byte;
		 Acid_P:Byte;
     ECStSR:InInt;        //28
     ECEndSR:InInt;
     ECKorSR:Byte;        //32
     RasStSR:InInt;       //33
     RasEndSR:InInt;
     RasKorSR:Byte;       //37
     TimeClFil:Byte;      //39
     TimePerFil:InInt;
     VolPerFil:InInt;
     BoilerP:InInt;
     BoilerI:InInt;
     BoilerRez:Byte;
     BoilerPause:Byte;
     BoilerTimeVal:InInt;
		 ConstEC:Byte;
		 MaxRegulEC:Byte;
		 ConstPH:Byte;
		 MaxRegulPH:Byte;
     CtrLevMat:Byte;
		 Rez:array[1..7] of Byte; }       //40
{    SleepValSiod:Byte;     //char    SleepValSiod;
     ForvNasSiod:Byte;      //char    ForvNasSiod;
     NSensEC:Byte;          //char	NSensEC;
     NSensPH:Byte;          //char	NSensPH;
		 Acid_P:Byte;           //char	Acid_P
     Rez:Array [1..30] of Byte;//   char    Rez[30];
     end;  }
const
     iMinRasx=6;
     iMaxRasx=7;
     iFilRasx=25;
var
NameParUpr25:array [1..33] of TNameConst=(
(Name:'����� ������ ��� ������������ ������� ��������';Frm:SS;Ed:'���';TipSens:TipControl;Min:3;Max:15;Def:6;Index:5),
(Name:'������� ������ ������ (0-���, 1-��)';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:1;Def:1;Index:7),
(Name:'�������� �������� (0-���, 1-��)';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:1;Def:1;Index:55),
(Name:'����� ����� ��� ������������ �������� ������';Frm:SS;Ed:'���';TipSens:TipControl;Min:0;Max:20;Def:4;Index:6),
(Name:'������������ ������������������ ��������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:1;Def:1;Index:8),

//(Name:'���������� ��������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:0;Def:0;Index:9),
(Name:'���������� ���������� ������ ��������';Frm:SSSpS;Ed:'�3/���';TipSens:TipControl;Min:0;Max:10;Def:6;Index:12),
(Name:'����������� ���������� ������ ��������';Frm:SSSpS;Ed:'�3/���';TipSens:TipControl;Min:0;Max:60;Def:30;Index:14),
(Name:'��� ������� ��� ������� ���������� ����� �����';Frm:SS;Ed:'���';TipSens:TipControl;Min:0;Max:120;Def:40;Index:10),
(Name:'����������� ����� ����� ������ ������� �����';Frm:SS;Ed:'���';TipSens:TipControl;Min:0;Max:30;Def:3;Index:11),

(Name:'��������� �� �� �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:2;Def:0;Index:25),
(Name:'��������� �� �� �������';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:2;Def:0;Index:26),
(Name:'��������� ���������� ��';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:6;Def:1;Index:51),
(Name:'�������� �������� ��';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:100;Index:52),
(Name:'��������� ���������� ��';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:15;Def:4;Index:53),
(Name:'�������� �������� ��';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:50;Index:54),

(Name:'������� ������� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:200;Def:50;Index:33),
(Name:'������� ������� - ������ ������ ��';Frm:SSSS;Ed:'��/��2';TipSens:TipCalc;Min:300;Max:2000;Def:500;Index:35),
(Name:'������� ������� - ������ ����������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:10;Index:37),
(Name:'������� �� - ������ �������� ������ ���';Frm:SSSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:200;Def:50;Index:28),
(Name:'������� �� - ������ ������ ��';Frm:SSSS;Ed:'��/��2';TipSens:TipCalc;Min:300;Max:2000;Def:500;Index:30),
(Name:'������� �� - ������ ��������� ��';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:50;Def:10;Index:32),

(Name:'�������� ����� ���� ������ ������� ��';Frm:SS;Ed:'���';TipSens:TipControl;Min:0;Max:15;Def:3;Index:24),
(Name:'����� ����� ��� ������������ �������� ����';Frm:SS;Ed:'���';TipSens:TipControl;Min:0;Max:15;Def:3;Index:23),

(Name:'�����,����� ������� ������� ������';Frm:SShSSm;Ed:'���:���';TipSens:TipControl;Min:0;Max:100*60;Def:10*60;Index:39),
(Name:'����� ����,����� �������� ������� ������';Frm:SSSpS;Ed:'�3';TipSens:TipControl;Min:0;Max:300;Def:50;Index:41),
(Name:'����� �������� �������';Frm:SS;Ed:'���';TipSens:TipControl;Min:0;Max:30;Def:5;Index:38),

(Name:'������-������� ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0.3;Max:5;Def:1;Index:43),
(Name:'������-������ ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0.05;Max:2;Def:0.1;Index:45),
//(Name:'������-������ ����';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:3;Def:0;Index:47),
(Name:'������-��� ������ �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:20;Max:800;Def:60;Index:49),
(Name:'������-����� ��� ����� �����������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:2;Max:60;Def:5;Index:48),

(Name:'������� ������ � ����� � � �';Frm:SS;Ed:'';TipSens:TipControl;Min:0;Max:3;Def:0;Index:16),
(Name:'������� ���� A';Frm:SSSpS;Ed:'��2';TipSens:TipControl;Min:30;Max:150;Def:45;Index:17),
(Name:'������� ���� B';Frm:SSSpS;Ed:'��2';TipSens:TipControl;Min:30;Max:150;Def:45;Index:19)
);
procedure TControl325.Init;
begin
     CountX:=1;
     CountY:=33;
     SizeCol:=63;//SizeOf(rTControl325);
     FullSize:=SizeCol;
     SendByte:=FullSize;
     Pref:='���������';
     NameBlock:='��������� �����������';
     FixRow:=1;
//     StartRow:=0;
end;

function TControl325.LoadXYvirt(vInBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var ADat:PByteArray;
//    Minut:word;
begin
     ADat:=Adr;
     Result:=ValX;
     if ValY=0 then
       begin
       if ValX=0 then Txt:='���������� '+ParentCtr.CtrName
         else Txt:='��������';
       Exit;
       end;
     Result:=Convers(NameParUpr25[ValY].Name+Format(' (�� %g �� %g, �������: %g ',[NameParUpr25[ValY].Min,NameParUpr25[ValY].Max,NameParUpr25[ValY].Def])+NameParUpr25[ValY].Ed+')',
            Addr(ADat^[NameParUpr25[ValY].Index+SizeCol*(ValX-1)]),NameParUpr25[ValY].Frm,vInBlock,ValX,ValY,Txt,NameParUpr25[ValY].Ed);
           if (ValX>0) and ((Result< NameParUpr25[ValY].Min) or (Result>NameParUpr25[ValY].Max )) then Txt:='!��� ��������� '+Txt;
end;
//--------- END ��������� D325 ------------------
//---------- ��������� D-04 ------------------
type rTControlD4=record
     rNumVal:Byte;
     rNumChan:Byte;
     rSizeArx:Byte;
     rSubIdent:Byte;
     rIdent:Byte;
     Time:InInt;
     Data:InInt;
     Year:Byte;
//*-- ������ ����������� ������, ������ 20 ����*/
     NFCtr:Byte;
     DelayBot1:Byte;
     SleepVal:Byte;
     FullBak:Byte;
     Turbo:Byte;
     ReadyMix:Byte;
     TimeAlarmRas:Byte;   // ����� ���� TimeErTemp:Byte;
     ResetAlarmRas:Byte;  // ����� ���� ResetFatal:Byte;
     MinRasxod:InInt;     // ����� �� ����
     MaxRasxod:InInt;     // ����� �� ����
     CompAB:Byte;
     SBak:Array [1..3]of InInt;
{    SleepValSiod:Byte;     //char    SleepValSiod;
     ForvNasSiod:Byte;      //char    ForvNasSiod;
     NSensEC:Byte;          //char	NSensEC;
     NSensPH:Byte;          //char	NSensPH;
		 Acid_P:Byte;           //char	Acid_P
     Rez:Array [1..30] of Byte;//   char    Rez[30];
}     end;

procedure TControlD4.Init;//override;
begin
     CountX:=1;
     CountY:=20;
     SizeCol:=SizeOf(rTControlD4);
     FullSize:=SizeCol;
     SendByte:=FullSize;
//     EEPSize:=FullSize;
     Pref:='���������';
     NameBlock:='��������� �����������';
     FixRow:=5;
     StartRow:=0;
end;

function TControlD4.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var ADat:^rTControlD4;
    Minut:word;
begin
     ADat:=Adr;
     Result:=ValX;
     if InBlock=cInBlock then begin
         Minut:=MinuteOfTheDay(Now);
         ADat^.Time[0]:=Minut div 256;
         ADat^.Time[1]:=Minut mod 256;
         ADat^.Data[0]:=MonthOfTheYear(Now);
         ADat^.Data[1]:=DayOfTheMonth(Now);
         end;
     case ValY of
     0:  Result:=Convers('���������� ��������',
          Addr(ADat^.rNumVal),SS,InBlock,ValX,ValY,Txt,'');
     1:  Result:=Convers('���������� ��������',
          Addr(ADat^.rNumChan),SS,InBlock,ValX,ValY,Txt,'');
     2:  Result:=Convers('������ ������',
          Addr(ADat^.rSizeArx),SS,InBlock,ValX,ValY,Txt,'����');
     3:  Result:=Convers('�����������',
          Addr(ADat^.rSubIdent),SS,InBlock,ValX,ValY,Txt,'');
     4:  Result:=Convers('��� ����������',
          Addr(ADat^.rIdent),SS,InBlock,ValX,ValY,Txt,'');
     5:  Result:=Convers('����� ����������',
          Addr(ADat^.NFCtr),SS,InBlock,ValX,ValY,Txt,'');
     6:  Result:=Convers('����� �����������',
          Addr(ADat^.Time),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
     7:  Result:=Convers('���� �����������',
          Addr(ADat^.Data),SSsSS,InBlock,ValX,ValY,Txt,'');
     8:  Result:=Convers('����������� ������',
          Addr(ADat^.MinRasxod),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
     9:  Result:=Convers('������������ ������',
          Addr(ADat^.MaxRasxod),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
    10:  Result:=Convers('������ ������� �����',
          Addr(ADat^.TimeAlarmRas),SS,InBlock,ValX,ValY,Txt,'���');
    11:  Result:=Convers('������ �� ������ �������',
          Addr(ADat^.ResetAlarmRas),SS,InBlock,ValX,ValY,Txt,'���');
    12:  Result:=Convers('������ ����',
          Addr(ADat^.DelayBot1),SS,InBlock,ValX,ValY,Txt,'���');
    13:  Result:=Convers('��� ���������� ����',
          Addr(ADat^.FullBak),SS,InBlock,ValX,ValY,Txt,'');
    14:  Result:=Convers('����� ����� ���������',
          Addr(ADat^.SleepVal),SS,InBlock,ValX,ValY,Txt,'���');
    15:  Result:=Convers('�������� ��������',
          Addr(ADat^.Turbo),SS,InBlock,ValX,ValY,Txt,'');
    16:  Result:=Convers('���������� ��������',
          Addr(ADat^.ReadyMix),SS,InBlock,ValX,ValY,Txt,'');
    17:  Result:=Convers('������� � � �',
          Addr(ADat^.CompAB),SS,InBlock,ValX,ValY,Txt,'');
    18..19:  Result:=Convers('������� ���� '+char(ord('A')+ValY-18),
          Addr(ADat^.SBak[ValY-17]),SSSpS,InBlock,ValX,ValY,Txt,'��2');
       else Result:=cEndCol;
    end;
end;
//--------- END ��������� D-04 ------------------
//--------- ������� �� ����� D-04 ------------------
type rTTimerD4=record
     Time:Byte;
     Vol:InInt;
     end;
type rT1TimerD4=record
     DataStart:InInt;
     DataEnd:InInt;
     TimeStart:InInt;
     Cycle:Byte;
     PastCycle:Byte;
     Period:InInt;
     Propor:Byte;
//     Rezept:Byte;
//     Tepl:Byte;
     TaskT:InInt;
     KorSR:InInt;
//     RezSR:Byte;
     ZD:array [1..2] of InInt;
     Valve:array [1..1] of rTTimerD4;
     end;
     
procedure TTimerD4.Init;//override;
var NumV:Byte;
begin
     NumV:=(ParentCtr as TFMixer04).NumValve;
     CountX:=cNumTimer;//(ParentCtr as TFMixer04).NumTimer;
     CountY:=11+NumV*3;
     SizeCol:=SizeOf(rT1TimerD4)+SizeOf(rTTimerD4)*(NumV-1);
     if (4095 div SizeCol) < CountX then CountX:=4095 div SizeCol;
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
//     EEPSize:=SizeCol*5;
     Pref:='����������';
     NameBlock:='��������� ������';
     FixRow:=1;
end;

function TTimerD4.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;//override;
var  ADat:PByteArray;
     pTimer:^rT1TimerD4;
     NumV,SelVal,Int:integer;
     NumRast,RDrip:double;
     VolRast:InInt;
     st:string;
begin
  NumV:=(ParentCtr as TFMixer04).NumValve;
  ADat:=Adr;
  Result:=ValX;
  ADat:=Addr(ADat^[SizeCol*(ValX-1)]);
  pTimer:=pointer(ADat);
  case ValY of
   0: begin if ValX=0 then Txt:='����� ���������'
         else  Txt:='����� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('����� ������',
        Addr(pTimer^.TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   2: begin
      Result:=Convers('������ ��������',
        Addr(pTimer^.Cycle),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   3: begin
      Result:=Convers('��������� ��������',
        Addr(pTimer^.PastCycle),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   4: begin
      Result:=Convers('������ �������',
        Addr(pTimer^.Period),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   5: begin
      if (ParentCtr.SubTip and YesT325)>0  then
        begin
        if (pTimer^.KorSR[0]*256+pTimer^.KorSR[1])>3 then st:='��/��2'
         else st:='';
        Result:=Convers('��������� �� ������',
          Addr(pTimer^.KorSR),SSSS,InBlock,ValX,ValY,Txt,st);
        end
      else
        Result:=Convers('��������,���� �����',
          Addr(pTimer^.KorSR),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      end;
   6: begin
      Result:=Convers('���� ������',
        Addr(pTimer^.DataStart),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   7: begin
      Result:=Convers('���� ���������',
        Addr(pTimer^.DataEnd),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   8: Result:=Convers('������� �� ��������',
        Addr(pTimer^.ZD[1]),SSpSS,InBlock,ValX,ValY,Txt,'���/��');
   9: case (ParentCtr as TFMixer04).NumDozEC of
        2: Result:=Convers('��������� �:�',
            Addr(pTimer^.Propor),SdS,InBlock,ValX,ValY,Txt,'');
        3: Result:=Convers('��������� �:�:C',
            Addr(pTimer^.Propor),SdSdS,InBlock,ValX,ValY,Txt,'');
        4: Result:=Convers('��������� �:�:C:D',
            Addr(pTimer^.Propor),SdSdSdS,InBlock,ValX,ValY,Txt,'');
      end;
   10: Result:=Convers('������� �� ��������',
        Addr(pTimer^.ZD[2]),SSpSS,InBlock,ValX,ValY,Txt,'');
   11: Result:=Convers('������� ������ ����',
        Addr(pTimer^.TaskT),SSpS0,InBlock,ValX,ValY,Txt,'�C');
   else begin
        ValY:=ValY-12;
        SelVal:=ValY mod 3;
        ValY:=(ValY div 3)+1;
        if ValY> NumV then begin Result:=cEndCol;Exit;end;
        case SelVal of
        0:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ������',
           Addr(pTimer^.Valve[ValY].Time),SS,InBlock,ValX,ValY,Txt,'���');
        1:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ��������',
           Addr(pTimer^.Valve[ValY].Vol),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
        2: begin
          Int:=pTimer^.Valve[ValY].Vol[1]
            +256*pTimer^.Valve[ValY].Vol[0];
          with ParentCtr as TFMixer04 do
             begin
             NumRast:=Block[BlockHoum].LoadXY(cOutBlock,ValY,1,st);
             RDrip:=Block[BlockHoum].LoadXY(cOutBlock,ValY,2,st);
             if ScaleRasxod=SSpSS then NumRast:=NumRast*10;
             end;
          if NumRast>0 then Int:=Round((100000/NumRast)*Int) else Int:=0;
          VolRast[1]:=Int mod 256;
          VolRast[0]:=Int div 256;
          if RDrip>0 and (pTimer^.Valve[ValY].Time) then
            if (60.0*Int/(RDrip*1000.0))>pTimer^.Valve[ValY].Time then
               ActionMes:='�������� ������ �� ������� �� �������� �����!';
          Result:=Convers('������ N'+IntToStr(ValY)+' �� ��������',
           Addr(VolRast),SSSS,InBlock,ValX,ValY,Txt,'��');
          if(ValX>0) and (InBlock=cInBlock) and (NumRast>0) then
             begin
             Int:=VolRast[1]+256*VolRast[0];
             Int:=Round(NumRast*Int/100000);
             pTimer^.Valve[ValY].Vol[1]:=Int mod 256;
             pTimer^.Valve[ValY].Vol[0]:=Int div 256;
             end;
           end;
        end;
    end;// end case set Valve
   end;
end;
//--------- ���������� �������� ������ ��� D-04
function TTimerD4.SetAny(Col,Row,x,y:integer;var Any:TAny):Integer;
var ChartBl:TChart;
    NumV,iX,iY,yG:integer;
    dbStart,dbEnd,dbDlit:Double;
    st:string;
    ADat:PByteArray;
    pTimer:^rT1TimerD4;

begin
 ActionMes:='';
 NumV:=(ParentCtr as TFMixer04).NumValve;
 ChartBl:=Any.Ptr;
 with ChartBl do begin
  (Series[0]as TGanttSeries).Clear;
  Series[1].Clear;
  yG:=0;
  for iX:=1 to CountX do begin
   ADat:=Adr;
   ADat:=Addr(ADat^[SizeCol*(iX-1)]);
   pTimer:=pointer(ADat);
   dbStart:=((pTimer^.TimeStart[0]*256+pTimer^.TimeStart[1])
            +pTimer^.PastCycle
            *(pTimer^.Period[0]*256+pTimer^.Period[1]))*cMin;
   if dbStart>0 then begin
     dbDlit:=0;
     for iY:=1 to NumV do
         begin
         LoadXY(cOutBlock,iX,10+(iY*3),st);
         dbDlit:=dbDlit+pTimer^.Valve[iY].Time;
         end;
     for iY:=pTimer^.PastCycle+1 to pTimer^.Cycle do begin
       dbEnd:=dbStart+dbDlit*cMin;
       with (Series[0]as TGanttSeries) do
         NextTask[AddGanttColor(dbStart,dbEnd,yG,'���� '+IntToStr(iX),RGB(iY*32+(iY div 8),iX*64+(iX div 4),200))]:=0;
       dbStart:=dbStart+(pTimer^.Period[0]*256+pTimer^.Period[1])*cMin;
       if(dbStart<=dbEnd) then dbStart:=dbEnd;
       end;
     yG:=yG+10;
     end;
  end;
  dbEnd:=0;
  with (Series[0]as TGanttSeries) do begin
   repeat begin  //��������� ���� �� ���������� ���
    yG:=-1;
    dbStart:=Now+10;
    for iX:=0 to count-1 do begin //����� ����� ������ ������������� �����
      if NextTask[iX]<0 then continue;
      if StartValues[iX]<dbStart then begin dbStart:=StartValues[iX];yG:=iX;end;
      end;
    if yG>=0 then begin  //���� ����� �������������
     dbDlit:=dbStart-dbEnd; //����� �� ����� ������ ���������
     if(dbDlit<0) then begin //���� ��������� �� ��������
        StartValues[yG]:=StartValues[yG]-dbDlit;
        EndValues[yG]:=EndValues[yG]-dbDlit;
        end;
     dbEnd:=EndValues[yG]; //�������� ����� ����������� ��������
     NextTask[yG]:=-1;  // �������� ��� ��������
     end;
    end until yG<0;
   end;
 end;
 if ActionMes='' then Result:=1 else Result:=101;
end;
//--------- END ������� �� ����� D-04 ------------------
//--------- ������� �� ����� D-07 ------------------
type rTDoubleVal=record
     Time:Byte;
     Vol:InInt;
     MirrorVal:Byte;
     end;
type rT1TimerD7=record
     DataStart:InInt;
     DataEnd:InInt;
     TimeStart:InInt;
     Cycle:Byte;
     PastCycle:Byte;
     Period:InInt;
     Propor:Byte;
//     Rezept:Byte;
//     Tepl:Byte;
     TaskT:InInt;
     KorSR:InInt;
//     RezSR:Byte;
     TaskEC:InInt;
     TaskPH:InInt;
//     ZD:array [1..2] of InInt;
     Valve:array [1..1] of rTDoubleVal;
     end;
procedure TTimerD7.Init;//override;
var NumV:Byte;
begin
     NumV:=(ParentCtr as TFMixer04).NumValve;
     CountX:=cNumTimer;   //(ParentCtr as TFMixer04).NumTimer;
     CountY:=11+NumV*4;
     SizeCol:=SizeOf(rT1TimerD7)+SizeOf(rTDoubleVal)*(NumV-1);
     if (4095 div SizeCol) < CountX then CountX:=4095 div SizeCol;
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
//     EEPSize:=SizeCol*5;
     Pref:='�������';
     NameBlock:='������� �� �����';
     FixRow:=1;
end;

function TTimerD7.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;
var  ADat:PByteArray;
     pTimer:^rT1TimerD7;
     NumV,SelVal,Int:integer;
     NumRast,Driper:double;
     VolRast:InInt;
     st:string;
begin
  NumV:=(ParentCtr as TFMixer04).NumValve;
  ADat:=Adr;
  Result:=ValX;
  ADat:=Addr(ADat^[SizeCol*(ValX-1)]);
  pTimer:=pointer(ADat);
  case ValY of
   0: begin if ValX=0 then Txt:='����� ���������'
         else  Txt:='����� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('����� ������',
        Addr(pTimer^.TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   2: begin
      Result:=Convers('������ ��������',
        Addr(pTimer^.Cycle),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   3: begin
      Result:=Convers('��������� ��������',
        Addr(pTimer^.PastCycle),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   4: begin
      Result:=Convers('������ �������',
        Addr(pTimer^.Period),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   5: begin
      Result:=Convers('���� ������',
        Addr(pTimer^.DataStart),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   6: begin
      Result:=Convers('���� ���������',
        Addr(pTimer^.DataEnd),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   7: Result:=Convers('������� �� ��������',
        Addr(pTimer^.TaskEC),SSpSS,InBlock,ValX,ValY,Txt,'���/��');
   8: case (ParentCtr as TFMixer04).NumDozEC of
        2: Result:=Convers('��������� �:�',
            Addr(pTimer^.Propor),SdS,InBlock,ValX,ValY,Txt,'');
        3: Result:=Convers('��������� �:�:C',
            Addr(pTimer^.Propor),SdSdS,InBlock,ValX,ValY,Txt,'');
        4: Result:=Convers('��������� �:�:C:D',
            Addr(pTimer^.Propor),SdSdSdS,InBlock,ValX,ValY,Txt,'');
      end;
   9: Result:=Convers('������� �� ��������',
        Addr(pTimer^.TaskPH),SSpS0,InBlock,ValX,ValY,Txt,'');
   10: Result:=Convers('������� ������ ����',
        Addr(pTimer^.TaskT),SSpS0,InBlock,ValX,ValY,Txt,'�C');
   11:begin
      if (ParentCtr.SubTip and YesT325)>0  then
        begin
        if (pTimer^.KorSR[0]*256+pTimer^.KorSR[1])>3 then st:='��/��2'
         else st:='';
        Result:=Convers('��������� �� ������',
          Addr(pTimer^.KorSR),SSSS,InBlock,ValX,ValY,Txt,st);
        end
      else
        Result:=Convers('��������,���� �����',
          Addr(pTimer^.KorSR),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      end;
  else begin
        SelVal:=(ValY-12) mod 4;
        ValY:=(ValY-12) div 4+1;
        if ValY> NumV then begin Result:=cEndCol;Exit;end;
        case SelVal of
        0:
          Result:=Convers('������ N'+IntToStr(ValY)+' ������ � �� ',
           Addr(pTimer^.Valve[ValY].MirrorVal),SS,InBlock,ValX,ValY,Txt,'');
        1:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ������',
           Addr(pTimer^.Valve[ValY].Time),SS,InBlock,ValX,ValY,Txt,'���');
        2:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ��������',
           Addr(pTimer^.Valve[ValY].Vol),SSSpS,InBlock,ValX,ValY,Txt,'�3');
        3: begin
           with ParentCtr as TFMixer04 do
              begin
              NumRast:=Block[BlockHoum].LoadXY(cOutBlock,ValY,1,st);
              Driper:=Block[BlockHoum].LoadXY(cOutBlock,ValY,2,st);
              Int:=pTimer^.Valve[ValY].MirrorVal;
              if Int>0 then NumRast:=NumRast+Block[BlockHoum].LoadXY(cOutBlock,Int,1,st);
              if ScaleRasxod=SSpSS then NumRast:=NumRast*10;
              end;
           Int:=pTimer^.Valve[ValY].Vol[1]+256*pTimer^.Valve[ValY].Vol[0];   //����� � �3
           if NumRast>0 then Int:=Round((100000/NumRast)*Int) else Int:=0;
           VolRast[1]:=Int mod 256;                                          //������ �� ��������
           VolRast[0]:=Int div 256;
           Result:=Convers('������ N'+IntToStr(ValY)+' �� ��������',
                  Addr(VolRast),SSSS,InBlock,ValX,ValY,Txt,'��');
           if(ValX>0) and (Driper>0.2) then
              if (1.19*Int*0.06/(Driper)>pTimer^.Valve[ValY].Time) then
                  begin
                  Txt:='!���� �����'+Txt;
                  ActionMes:='����'+IntToStr(ValX)+' ����'+IntToStr(ValY)+' ���� �����';
//                  MesColor:=clRed;
                  end;
           if(ValX>0) and (InBlock=cInBlock) and (NumRast>0) then
              begin
              Int:=VolRast[1]+256*VolRast[0];     //����� � �� �� ��������
              Int:=Round(NumRast*Int/100000);     //����� � �3 �� ������
              pTimer^.Valve[ValY].Vol[1]:=Int mod 256;
              pTimer^.Valve[ValY].Vol[0]:=Int div 256;
              end;
           end;
        end;
    end;// end case set Valve
   end;
end;
//--------- END ������� �� ����� D-07 ------------------
//--------- ���������� �������� ������ ��� D-07
function TTimerD7.SetAny(Col,Row,x,y:integer;var Any:TAny):Integer;
var ChartBl:TChart;
    NumV,iX,iY,yG:integer;
    dbStart,dbEnd,dbDlit:Double;
//    Txt:string;
    ADat:PByteArray;
    pTimer:^rT1TimerD7;

begin
Result:=1;
// ActionMes:='';
NumV:=(ParentCtr as TFMixer04).NumValve;
ChartBl:=Any.Ptr;
with ChartBl do
  begin
  (Series[0]as TGanttSeries).Clear;
  Series[1].Clear;
  yG:=0;
  for iX:=1 to CountX do
   begin
   ADat:=Adr;
   ADat:=Addr(ADat^[SizeCol*(iX-1)]);
   pTimer:=pointer(ADat);
   dbStart:=((pTimer^.TimeStart[0]*256+pTimer^.TimeStart[1])
            +pTimer^.PastCycle
            *(pTimer^.Period[0]*256+pTimer^.Period[1]))*cMin;
   if dbStart>0 then
     begin
     dbDlit:=0;
     for iY:=1 to NumV do
         begin
         dbDlit:=dbDlit+pTimer^.Valve[iY].Time;
         end;
     for iY:=pTimer^.PastCycle+1 to pTimer^.Cycle do
          begin
          dbEnd:=dbStart+dbDlit*cMin;
          with (Series[0]as TGanttSeries) do
            NextTask[AddGanttColor(dbStart,dbEnd,yG,'���� '+IntToStr(iX),RGB(iY*32+(iY div 8),iX*64+(iX div 4),200))]:=0;
          dbStart:=dbStart+(pTimer^.Period[0]*256+pTimer^.Period[1])*cMin;
          if(dbStart<=dbEnd) then dbStart:=dbEnd;
          end;
     yG:=yG+10;
     end;
  end;

// dbStart:=0;
 dbEnd:=0;
 with (Series[0]as TGanttSeries) do
  begin
  repeat
    begin  //��������� ���� �� ���������� ���
    yG:=-1;
    dbStart:=Now+10;
    for iX:=0 to count-1 do
          begin //����� ����� ������ ������������� �����
          if NextTask[iX]<0 then continue;
          if StartValues[iX]<dbStart then begin dbStart:=StartValues[iX];yG:=iX;end;
          end;
    if yG>=0 then
          begin  //���� ����� �������������
          dbDlit:=dbStart-dbEnd; //����� �� ����� ������ ���������
          if(dbDlit<0) then
              begin //���� ��������� �� ��������
              StartValues[yG]:=StartValues[yG]-dbDlit;
              EndValues[yG]:=EndValues[yG]-dbDlit;
              end;
          dbEnd:=EndValues[yG]; //�������� ����� ����������� ��������
          NextTask[yG]:=-1;  // �������� ��� ��������
          end;
    end until yG<0;
  end;
// Visible:=True;
 end;
end;

//--------- ������� �� ����� D326 ------------------
//typedef struct  eeTimer326
 {
        uint    DataStart;
        uint    DataEnd;
        uint    TimeStart;
        uint    TimeEnd;
        uint    MaxPeriod;	//Period;
        char    RezB;
        uint    StartSR_KorSR325;	//KorSR325;
        uint    MinPeriod;
        uint    EndSR;
        uchar   AddTimeEnd_Cycle;	//Cycle;
        uchar   LowEC_PastC;		//PastCycle;
        uchar   Propor;
        int     TaskEC;
        int     TaskPH;
        int     TaskT;
        eValveZD  Valve[NumValve];
        }
type rT1Timer326=record
     DataStart:InInt;
     DataEnd:InInt;
     TimeStart:InInt;
     TimeEnd:InInt;
     MaxPeriod:InInt;
     Zona:Byte; //RezB:Byte;
     StartSR_KorSR325:InInt;
     MinPeriod:InInt;
     EndSR:InInt;
     AddTimeEnd_Cycle:Byte;
     LowEC_PastC:Byte;
//     Propor:Byte;
     TProp:array [1..4] of Byte;
     TTaskEC:Byte;
     TTaskPH:Byte;
     TTaskT:Byte;
//     TaskEC:InInt;
//     TaskPH:InInt;
//     TaskT:InInt;
     Valve:array [1..1] of rTDoubleVal;
     end;
procedure TTimer326.Init;//override;
var NumV:Byte;
begin
     NumV:=(ParentCtr as TFMixer04).NumValve;
     CountX:=cNumTimer;   //(ParentCtr as TFMixer04).NumTimer;
     CountY:=14+NumV*4;
     if (ParentCtr as TFMixer04).GetTipOborot  then CountY:=CountY+1;
     SizeCol:=SizeOf(rT1Timer326)+SizeOf(rTDoubleVal)*(NumV-1);
     if (4095 div SizeCol) < CountX then CountX:=4095 div SizeCol;
     FullSize:=SizeCol*CountX+1;
     SendByte:=FullSize;
     Pref:='�������';
     NameBlock:='������� �� �����';
     FixRow:=1;
end;

function TTimer326.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;
var  ADat:PByteArray;
begin
  ADat:=Adr;
  CountY:=(ParentCtr as TFMixer04).NumValve*4;
  if (ParentCtr as TFMixer04).GetTipOborot then CountY:=CountY+1;
  if ADat[0]=0 then    //��������� ���� 0
    begin
    CountY:=CountY+11; //+(ParentCtr as TFMixer04).NumValve*4;
    Result:=GetTimer325(InBlock,ValX,ValY,Txt);
    end
  else
    begin              //��������� ���� 1
    CountY:=CountY+14;  //+(ParentCtr as TFMixer04).NumValve*4;
    Result:=GetTimer326(InBlock,ValX,ValY,Txt);
    end;
end;

function TTimer326.GetTimer326(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;
var  ADat:PByteArray;
     pTimer:^rT1Timer326;
     NumV,SelVal,Int:integer;
     NumRast,Driper:double;
     VolRast:InInt;
     st:string;
begin
  NumV:=(ParentCtr as TFMixer04).NumValve;
  ADat:=Adr;
  ADat:=Addr(ADat^[1]);
  Result:=ValX;
  ADat:=Addr(ADat^[SizeCol*(ValX-1)]);
  pTimer:=pointer(ADat);
  if (ParentCtr as TFMixer04).GetTipOborot and (ValY >2) then
      begin
      if ValY>3 then ValY:=ValY-1
      else begin
        Result:=Convers('����� (0-������� �� ������ ����)',
          Addr(pTimer^.Zona),SS,InBlock,ValX,ValY,Txt,'');
        Exit;
        end;
      end;
  case ValY of
   0: begin if ValX=0 then Txt:='����� ���������'
         else  Txt:='����� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('����� ������ ������',
        Addr(pTimer^.TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   2: begin
      Result:=Convers('����� ��������� ������',
        Addr(pTimer^.TimeEnd),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   3: Result:=Convers('������� �� ��������',
        Addr(pTimer^.TTaskEC),SpS,InBlock,ValX,ValY,Txt,'���/��');
   4: begin
       Result:=Convers('��������� _�:_�:_C:_D',
            Addr(pTimer^.TProp[1]),mSdS,InBlock,ValX,ValY,Txt,'');
       Txt:=Copy(Txt,1,Length(Txt)-(4-(ParentCtr as TFMixer04).NumDozEC)*3);
      end;
{   4: case (ParentCtr as TFMixer04).NumDozEC of
        2: Result:=Convers('��������� �:�',
            Addr(pTimer^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
        3: Result:=Convers('��������� �:�:C',
            Addr(pTimer^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
        4: Result:=Convers('��������� �:�:C:D',
            Addr(pTimer^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
      end;  }
   5: Result:=Convers('������� �� ��������',
        Addr(pTimer^.TTaskPH),SpS,InBlock,ValX,ValY,Txt,'');
   6: Result:=Convers('������� ������ ����',
        Addr(pTimer^.TTaskT),SS,InBlock,ValX,ValY,Txt,'�C');
   7: begin
      Result:=Convers('������������ ������ ������ �����',
        Addr(pTimer^.MaxPeriod),SSSS,InBlock,ValX,ValY,Txt,'���');
      end;
   8: begin
      Result:=Convers('������������ ����� ����� ��������',
        Addr(pTimer^.MinPeriod),SSSS,InBlock,ValX,ValY,Txt,'���');
      end;
   9: begin
      Result:=Convers('����������� ������ ��� ������� �������� ���������',
        Addr(pTimer^.StartSR_KorSR325),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      end;
   10: begin
      Result:=Convers('����������� ������ ��� ������� ��������� �����������',
        Addr(pTimer^.EndSR),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      end;
   11: begin
      Result:=Convers('��������� ������� �� ��� ������������ ������',
        Addr(pTimer^.LowEC_PastC),pSS,InBlock,ValX,ValY,Txt,'���');
      end;
   12: begin
       Result:=Convers('�������� ��������� ������ ��� ������������ ������',
        Addr(pTimer^.AddTimeEnd_Cycle),SS,InBlock,ValX,ValY,Txt,'���');
       end;
   13: begin
       Result:=Convers('���� ������ �������� ���������',
        Addr(pTimer^.DataStart),SSsSS,InBlock,ValX,ValY,Txt,'');
       end;
   14: begin
       Result:=Convers('���� ��������� �������� ���������',
        Addr(pTimer^.DataEnd),SSsSS,InBlock,ValX,ValY,Txt,'');
       end;
  else begin
        SelVal:=(ValY-15) mod 4;
        ValY:=(ValY-15) div 4+1;
        if ValY> NumV then begin Result:=cEndCol;Exit;end;
        case SelVal of
        0:
          Result:=Convers('������ N'+IntToStr(ValY)+' ������ � �� ',
           Addr(pTimer^.Valve[ValY].MirrorVal),SS,InBlock,ValX,ValY,Txt,'');
        1:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ������',
           Addr(pTimer^.Valve[ValY].Time),SS,InBlock,ValX,ValY,Txt,'���');
        2:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ��������',
           Addr(pTimer^.Valve[ValY].Vol),SSSpS,InBlock,ValX,ValY,Txt,'�3');
        3: begin
           with ParentCtr as TFMixer04 do
              begin
              NumRast:=Block[BlockHoum].LoadXY(cOutBlock,ValY,1,st);
              Driper:=Block[BlockHoum].LoadXY(cOutBlock,ValY,2,st);
              Int:=pTimer^.Valve[ValY].MirrorVal;
              if Int>0 then NumRast:=NumRast+Block[BlockHoum].LoadXY(cOutBlock,Int,1,st);
              if ScaleRasxod=SSpSS then NumRast:=NumRast*10;
              end;
           Int:=pTimer^.Valve[ValY].Vol[1]+256*pTimer^.Valve[ValY].Vol[0];   //����� � �3
           if NumRast>0 then Int:=Round((100000/NumRast)*Int) else Int:=0;
           VolRast[1]:=Int mod 256;                                          //������ �� ��������
           VolRast[0]:=Int div 256;
           Result:=Convers('������ N'+IntToStr(ValY)+' �� ��������',
                  Addr(VolRast),SSSS,InBlock,ValX,ValY,Txt,'��');
           if(ValX>0) and (Driper>0.2) then
              if (1.19*Int*0.06/(Driper)>pTimer^.Valve[ValY].Time) then
                  begin
                  Txt:='!���� �����'+Txt;
                  ActionMes:='����'+IntToStr(ValX)+' ����'+IntToStr(ValY)+' ���� �����';
//                  MesColor:=clRed;
                  end;
           if(ValX>0) and (InBlock=cInBlock) and (NumRast>0) then
              begin
              Int:=VolRast[1]+256*VolRast[0];     //����� � �� �� ��������
              Int:=Round(NumRast*Int/100000);     //����� � �3 �� ������
              pTimer^.Valve[ValY].Vol[1]:=Int mod 256;
              pTimer^.Valve[ValY].Vol[0]:=Int div 256;
              end;
           end;
        end;
    end;// end case set Valve
   end;
end;

function TTimer326.GetTimer325(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;
var  ADat:PByteArray;
     pTimer:^rT1Timer326;
     NumV,SelVal,Int:integer;
     NumRast,Driper:double;
     VolRast:InInt;
     st:string;
begin
  NumV:=(ParentCtr as TFMixer04).NumValve;
  ADat:=Adr;
  ADat:=Addr(ADat^[1]);
  Result:=ValX;
  ADat:=Addr(ADat^[SizeCol*(ValX-1)]);
  pTimer:=pointer(ADat);
  if (ParentCtr as TFMixer04).GetTipOborot and (ValY >2) then
      begin
      if ValY>3 then ValY:=ValY-1
      else begin
        Result:=Convers('����� (0-������� �� ������ ����)',
          Addr(pTimer^.Zona),SS,InBlock,ValX,ValY,Txt,'');
        Exit;
        end;
      end;
  case ValY of
   0: begin if ValX=0 then Txt:='����� ���������'
         else  Txt:='����� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('����� ������',
        Addr(pTimer^.TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   2: begin
      Result:=Convers('������ ��������',
        Addr(pTimer^.AddTimeEnd_Cycle),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   3: begin
      Result:=Convers('��������� ��������',
        Addr(pTimer^.LowEC_PastC),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   4: begin
      Result:=Convers('������ �������',
        Addr(pTimer^.MaxPeriod),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   5: begin
      Result:=Convers('���� ������',
        Addr(pTimer^.DataStart),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   6: begin
      Result:=Convers('���� ���������',
        Addr(pTimer^.DataEnd),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   7: Result:=Convers('������� �� ��������',
        Addr(pTimer^.TTaskEC),SpS,InBlock,ValX,ValY,Txt,'���/��');
   8: begin
//       Int:=(ParentCtr as TFMixer04).NumDozEC;
//       if ValX>0 then ValX:=Int;
       Result:=Convers('��������� _�:_�:_C:_D',
            Addr(pTimer^.TProp[1]),mSdS,InBlock,ValX,ValY,Txt,'');
       Txt:=Copy(Txt,1,Length(Txt)-(4-(ParentCtr as TFMixer04).NumDozEC)*3);
      end;
{   8: case (ParentCtr as TFMixer04).NumDozEC of
        2: Result:=Convers('��������� �:�',
            Addr(pTimer^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
        3: Result:=Convers('��������� �:�:C',
            Addr(pTimer^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
        4: Result:=Convers('��������� �:�:C:D',
            Addr(pTimer^.Prop[1]),mSdS,InBlock,ValX,ValY,Txt,'');
      end; }
   9:  Result:=Convers('������� �� ��������',
        Addr(pTimer^.TTaskPH),SpS,InBlock,ValX,ValY,Txt,'');
   10: Result:=Convers('������� ������ ����',
        Addr(pTimer^.TTaskT),SS,InBlock,ValX,ValY,Txt,'�C');
   11: begin
        if (ParentCtr.SubTip and YesT325)>0  then
          begin
          if (pTimer^.StartSR_KorSR325[0]*256+pTimer^.StartSR_KorSR325[1])>3 then st:='��/��2'
            else st:='';
          Result:=Convers('��������� �� ������',
            Addr(pTimer^.StartSR_KorSR325),SSSS,InBlock,ValX,ValY,Txt,st);
          end
          else
             Result:=Convers('��������,���� �����',
                Addr(pTimer^.StartSR_KorSR325),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
       end;
  else begin
        SelVal:=(ValY-12) mod 4;
        ValY:=(ValY-12) div 4+1;
        if ValY> NumV then begin Result:=cEndCol;Exit;end;
        case SelVal of
        0:
          Result:=Convers('������ N'+IntToStr(ValY)+' ������ � �� ',
           Addr(pTimer^.Valve[ValY].MirrorVal),SS,InBlock,ValX,ValY,Txt,'');
        1:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ������',
           Addr(pTimer^.Valve[ValY].Time),SS,InBlock,ValX,ValY,Txt,'���');
        2:
          Result:=Convers('������ N'+IntToStr(ValY)+' ����� ��������',
           Addr(pTimer^.Valve[ValY].Vol),(ParentCtr as TFMixer04).ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
        3: begin
           with ParentCtr as TFMixer04 do
              begin
              NumRast:=Block[BlockHoum].LoadXY(cOutBlock,ValY,1,st);
              Driper:=Block[BlockHoum].LoadXY(cOutBlock,ValY,2,st);
              Int:=pTimer^.Valve[ValY].MirrorVal;
              if Int>0 then NumRast:=NumRast+Block[BlockHoum].LoadXY(cOutBlock,Int,1,st);
              if ScaleRasxod=SSpSS then NumRast:=NumRast*10;
              end;
           Int:=pTimer^.Valve[ValY].Vol[1]+256*pTimer^.Valve[ValY].Vol[0];   //����� � �3
           if NumRast>0 then Int:=Round((100000/NumRast)*Int) else Int:=0;
           VolRast[1]:=Int mod 256;                                          //������ �� ��������
           VolRast[0]:=Int div 256;
           Result:=Convers('������ N'+IntToStr(ValY)+' �� ��������',
                  Addr(VolRast),SSSS,InBlock,ValX,ValY,Txt,'��');
           if(ValX>0) and (Driper>0.2) then
              if (1.19*Int*0.06/(Driper)>pTimer^.Valve[ValY].Time) then
                  begin
                  Txt:='!���� �����'+Txt;
                  ActionMes:='����'+IntToStr(ValX)+' ����'+IntToStr(ValY)+' ���� �����';
//                  MesColor:=clRed;
                  end;
           if(ValX>0) and (InBlock=cInBlock) and (NumRast>0) then
              begin
              Int:=VolRast[1]+256*VolRast[0];     //����� � �� �� ��������
              Int:=Round(NumRast*Int/100000);     //����� � �3 �� ������
              pTimer^.Valve[ValY].Vol[1]:=Int mod 256;
              pTimer^.Valve[ValY].Vol[0]:=Int div 256;
              end;
           end;
        end;
    end;// end case set Valve
   end;
end;
//--------- END ������� �� ����� D326 ------------------
//--------- ���������� �������� ������ ��� D326
function TTimer326.SetAny(Col,Row,x,y:integer;var Any:TAny):Integer;
var  ADat:PByteArray;
begin
  ADat:=Adr;
  if ADat[0]=0 then
    begin
//    CountY:=11+(ParentCtr as TFMixer04).NumValve*4;
    Result:=GetChart325(x,y,Any);
    end
  else
    begin
//    CountY:=14+(ParentCtr as TFMixer04).NumValve*4;
    Result:=GetChart326(x,y,Any);
    end;
end;
//--------- ���������� �������� ������ ��� D326
function TTimer326.GetChart326(x,y:WORD;var Any:TAny):Integer;
type eSostTimer=record
        LastStart:Integer;
        LastSR:Integer;
        LongTimeEnd:Integer;
        PastCycle:Byte;
        end;
var ChartBl:TChart;
    NumV,CtrTime,LngX:integer;
    ByteY:Byte;
    SostTimer:array [0..50] of eSostTimer;

function NewColor(const p1,p2:integer):TColor;
begin
Result:=RGB(p1*32+(p1 div 8),p2*64+(p2 div 4),200)
end;

function TestTimer:Integer;
var
  ByteX,ByteY:Byte;
  StartSR,EndSR,tSR,MinPer,CalcPer,tPer,AbsMaxPer
   ,tCor,TimeStart,TimeEnd:Integer;
//  dbDan:double;
  pTimer,pTimerFind:^rT1Timer326;
  ADat:PByteArray;
begin
Result:=0;
ByteY:=255;
AbsMaxPer:=0;
for ByteX:=0 to CountX-1 do
    begin
    ADat:=Adr;
    ADat:=Addr(ADat^[1]);
    ADat:=Addr(ADat^[SizeCol*ByteX]);
    pTimer:=pointer(ADat);
    TimeStart:=(pTimer^.TimeStart[0]*256+pTimer^.TimeStart[1]);
		if(TimeStart=0) then continue;
    TimeEnd:=(pTimer^.TimeEnd[0]*256+pTimer^.TimeEnd[1]);
    if((TimeStart > CtrTime) or ((TimeEnd+SostTimer[ByteX].LongTimeEnd) <= CtrTime)) then continue;
//        if((CtrData  < GD.Timer[ByteX].DataStart)||
//           (CtrData  > GD.Timer[ByteX].DataEnd)) continue;
		CalcPer:=pTimer^.MaxPeriod[0]*256+pTimer^.MaxPeriod[1];
		if CalcPer=0 then continue;
    tPer:=CtrTime-SostTimer[ByteX].LastStart;
		MinPer:=pTimer^.MinPeriod[0]*256+pTimer^.MinPeriod[1];
		if(tPer<MinPer) then continue;                           //������� ���� ������ ��������
		tSR:=0;//GD.Arx[0].SolRad-GD.HotPol.SostTimer[ByteX].LastSR;
		StartSR:=pTimer^.StartSR_KorSR325[0]*256+pTimer^.StartSR_KorSR325[1];
		EndSR:=pTimer^.EndSR[0]*256+pTimer^.EndSR[1];
		if EndSR>StartSR then LngX:=(tSR-StartSR)*50 div (EndSR-StartSR);
		if (tSR>=EndSR) then LngX:=50;
		if ((EndSR<=StartSR)or(tSR<StartSR)) then LngX:=0;
		CalcPer:=CalcPer-LngX*(CalcPer-MinPer) div 50;
		if(tPer<CalcPer) then continue;                          //������� ���� ������ ������ �����������
		if(tPer {CalcPer} >AbsMaxPer) then                       //����� ����, ��� ������ �� �������
       begin pTimerFind:=pTimer; AbsMaxPer:=tPer; ByteY:=ByteX;tCor:=LngX;end;
    end;
// ���� ��������� �� ������� �� �����
if(ByteY=255) then Exit;
// ����� ���������� ��������� ���������
for ByteX:=1 to NumV do Result:=Result+pTimerFind^.Valve[ByteX].Time;
if Result=0 then Exit;
SostTimer[ByteY].LastStart:=CtrTime;
SostTimer[ByteY].LastSR:=0;//GD.Arx[0].SolRad;
SostTimer[ByteY].PastCycle:=SostTimer[ByteY].PastCycle+1;
SostTimer[ByteY].LongTimeEnd:=SostTimer[ByteY].LongTimeEnd+tCor*pTimerFind^.AddTimeEnd_Cycle div 50;
if(SostTimer[ByteY].LongTimeEnd>120) then SostTimer[ByteY].LongTimeEnd:=120;
if(pTimerFind^.AddTimeEnd_Cycle=0) then SostTimer[ByteY].LongTimeEnd:=0;
//dbDan:=(pTimerFind^.TaskEC[0]*256+pTimerFind^.TaskEC[1])-pTimerFind^.LowEC_PastC*tCor div 50;
with ChartBl do
  begin
  with (Series[0]as TGanttSeries) do
       NextTask[AddGanttColor(cMin*CtrTime,cMin*(CtrTime+Result),(ByteY+1),
       '���� '+IntToStr(ByteY+1),NewColor(SostTimer[ByteY].PastCycle,ByteY+1))]:=-1;
{  with (Series[1]as TFastLineSeries) do
           begin
           AddXY(cMin*CtrTime,dbDan,'',clTeeColor);
           AddXY(cMin*(CtrTime+Result),dbDan,'',clTeeColor);
           end;   }
  end;
CtrTime:=CtrTime+Result-1;
end;

begin
Result:=1;
// ActionMes:='';
NumV:=(ParentCtr as TFMixer04).NumValve;
ChartBl:=Any.Ptr;
//uTimer:=Adr;
for ByteY:=0 to CountX-1 do
  begin
  SostTimer[ByteY].LastStart:=0;
  SostTimer[ByteY].LastSR:=0;
  SostTimer[ByteY].PastCycle:=0;
  SostTimer[ByteY].LongTimeEnd:=0;
  end;
with ChartBl do
  begin
  (Series[0]as TGanttSeries).Clear;
  Series[1].Clear;
  CtrTime:=0;
  while CtrTime < 24*60 do
    begin
    TestTimer;
    CtrTime:=CtrTime+1;
    end;
  end;
end;

//--------- ���������� �������� ������ ��� D-325
function TTimer326.GetChart325(x,y:WORD;var Any:TAny):Integer;
var ChartBl:TChart;
    NumV,iX,iY,yG:integer;
    dbStart,dbEnd,dbDlit:Double;
//    Txt:string;
    ADat:PByteArray;
    pTimer:^rT1Timer326;

begin
Result:=1;
// ActionMes:='';
NumV:=(ParentCtr as TFMixer04).NumValve;
ChartBl:=Any.Ptr;
with ChartBl do
  begin
  (Series[0]as TGanttSeries).Clear;
  Series[1].Clear;
  yG:=0;
  for iX:=1 to CountX do
   begin
   ADat:=Adr;
   ADat:=Addr(ADat^[1]);
   ADat:=Addr(ADat^[SizeCol*(iX-1)]);
   pTimer:=pointer(ADat);
   dbStart:=((pTimer^.TimeStart[0]*256+pTimer^.TimeStart[1])
            +pTimer^.LowEC_PastC
            *(pTimer^.MaxPeriod[0]*256+pTimer^.MaxPeriod[1]))*cMin;
   if dbStart>0 then
     begin
     dbDlit:=0;
     for iY:=1 to NumV do
         begin
         dbDlit:=dbDlit+pTimer^.Valve[iY].Time;
         end;
     for iY:=pTimer^.LowEC_PastC+1 to pTimer^.AddTimeEnd_Cycle do
          begin
          dbEnd:=dbStart+dbDlit*cMin;
          with (Series[0]as TGanttSeries) do
            NextTask[AddGanttColor(dbStart,dbEnd,yG,'���� '+IntToStr(iX),RGB(iY*32+(iY div 8),iX*64+(iX div 4),200))]:=0;
          dbStart:=dbStart+(pTimer^.MaxPeriod[0]*256+pTimer^.MaxPeriod[1])*cMin;
          if(dbStart<=dbEnd) then dbStart:=dbEnd;
          end;
     yG:=yG+10;
     end;
  end;

// dbStart:=0;
 dbEnd:=0;
 with (Series[0]as TGanttSeries) do
  begin
  repeat
    begin  //��������� ���� �� ���������� ���
    yG:=-1;
    dbStart:=Now+10;
    for iX:=0 to count-1 do
          begin //����� ����� ������ ������������� �����
          if NextTask[iX]<0 then continue;
          if StartValues[iX]<dbStart then begin dbStart:=StartValues[iX];yG:=iX;end;
          end;
    if yG>=0 then
          begin  //���� ����� �������������
          dbDlit:=dbStart-dbEnd; //����� �� ����� ������ ���������
          if(dbDlit<0) then
              begin //���� ��������� �� ��������
              StartValues[yG]:=StartValues[yG]-dbDlit;
              EndValues[yG]:=EndValues[yG]-dbDlit;
              end;
          dbEnd:=EndValues[yG]; //�������� ����� ����������� ��������
          NextTask[yG]:=-1;  // �������� ��� ��������
          end;
    end until yG<0;
  end;
// Visible:=True;
 end;
end;

//----------������ ������� D-04 ------------------
type rT1ChanelD4=record
     Fk1:InInt;
     Fk2:InInt;
     Kk1:InInt;
     Kk2:InInt;
     GL:InInt;
     TimeAlarm:Byte;
     ResetAlarm:Byte;
     TimeCtrl:Byte;
     RezConstCtrl:Byte;
     RezMaxReg:Byte;
     end;
type rTChanelD4=array[1..8] of rT1ChanelD4;

procedure TChanelD4.Init;//override;
begin
     CountX:=(ParentCtr as TFMixer04).NumChan;//8;
     CountY:=7;
     SizeCol:=SizeOf(rT1ChanelD4);
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
//     EEPSize:=FullSize;
     Pref:='����������';
     NameBlock:='���������� ��������';
end;

function TChanelD4.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var ADat:^rTChanelD4;
    ScCal:string[4];
begin
    ADat:=Adr;
     Result:=ValX;
     if ValX>8 then ScCal:='��' else ScCal:='��';
     case ValY of
     0: if ValX=0 then Txt:='���������'
                  else Txt:=NameChan324[ValX];
     5: if ValX>16 then begin Result:=0; Txt:='';end else
        Result:=Convers('���������� ����������',
          Addr(ADat^[ValX].GL),FrmChan324[ValX],InBlock,ValX,ValY,Txt,EdChan324[ValX]);
     6: if ValX>=nmSR then begin Result:=0; Txt:='';end else
          Result:=Convers('����� �� ������ �������',
          Addr(ADat^[ValX].TimeAlarm),SS,InBlock,ValX,ValY,Txt,'���');
     7: if ValX>=nmSR then begin Result:=0; Txt:='';end else
        Result:=Convers('����� �� ������� ����� ������',
          Addr(ADat^[ValX].ResetAlarm),SS,InBlock,ValX,ValY,Txt,'���');
{     8: if ValX>NumChanU then begin Result:=0; Txt:='';end else
        Result:=Convers('��������� ����������',
          Addr(ADat^[ValX].ConstCtrl),SS,InBlock,ValX,ValY,Txt,'');
     9: if ValX>NumChanU then begin Result:=0; Txt:='';end else
        Result:=Convers('������������ ����� �����',
          Addr(ADat^[ValX].MaxReg),SS,InBlock,ValX,ValY,Txt,'/8 ���');
}     2: if ValX>16 then begin Result:=0; Txt:='';end else
           Result:=Convers('�������/���������� ������� 1',
             Addr(ADat^[ValX].Fk1),SSSS,InBlock,ValX,ValY,Txt,ScCal);
     1: Result:=Convers('������ 1',
          Addr(ADat^[ValX].Kk1),FrmChan324[ValX],InBlock,ValX,ValY,Txt,EdChan324[ValX]);
     4: if ValX>16 then begin Result:=0; Txt:='';end else
        Result:=Convers('�������/���������� ������� 2',
          Addr(ADat^[ValX].Fk2),SSSS,InBlock,ValX,ValY,Txt,ScCal);
     3: if ValX>16 then begin Result:=0; Txt:='';end else
          Result:=Convers('������ 2',
          Addr(ADat^[ValX].Kk2),FrmChan324[ValX],InBlock,ValX,ValY,Txt,EdChan324[ValX]);
//     10: Result:=Convers('��������',
//          Addr(ADat^[ValX].OS),SSpSS,InBlock,ValX,ValY,Txt,UnitDoz4(ValX));
     else Result:=cEndCol;
     end;
end;
//----------END ������ ������� D-04 ------------------
//--------- ����� D-04 ------------------

type rTValveArxD4=record
     Time:InInt;
     Vol:InInt;
     Midl:array[1..4] of InInt;
     end;

type rT1ArxD4=record
     Data:InInt;
     PolTime:InInt;
     PolVol:InInt;
     SolRad:InInt;
     ResetTime:InInt;
     ResetVol:InInt;
     TimeMat:array [1..cNumMat] of InInt;
     RasMat:array [1..cNumMat] of InInt;
     Valve:array[1..1] of rTValveArxD4;
     end;


function TFMixer04.CustLoadXY(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String; pData:Pointer{;NumV:word;FrmRas:TSFormat}):Double;
var    ADat:PByteArray;
       pArx:^rT1ArxD4;
       NKl,Cas:Word;
       FrmRas:TSFormat;
begin
//NumValve,
//    (ParentCtr as TFMixer04).ScaleRasxod)  Result:=ValX;
  ADat:=pData;//Addr(ADat^[SizeCol*(ValX-1)]);
  pArx:=pointer(ADat);
  if (ValY>0) and (ValX>0) then
  //if (ValX>0) and (InBlock>0) then
  begin
        if (pArx^.Data[0]<=0) or (pArx^.Data[0]>12)or
         (pArx^.Data[1]<=0) or (pArx^.Data[1]>31)then begin
            txt:='~';
            Result:=0; Exit;
            end;
        end;
    with BlArxMC do
    case ValY of
    0: Result:=Convers('����',
          Addr(pArx^.Data),SSsSS,InBlock,ValX,ValY,Txt,'');
    1: Result:=Convers('����� �� ����',
          Addr(pArx^.PolTime),SShSSm_12,InBlock,ValX,ValY,Txt,'���:���');
    2: Result:=Convers('������ �� ����',
          Addr(pArx^.PolVol),ScaleRasxod,InBlock,ValX,ValY,Txt,'�3');
    3: Result:=Convers('����� �� ����',
          Addr(pArx^.SolRad),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
    else begin // ����� �������
      Cas:=ValY-4;
      NKl:=(Cas div 6)+1; //����� �������
      if NKl<=NumValve then
       begin  // ����� �������
       Cas:=Cas mod 6;     //�������� � �������
       case Cas of
        0: Result:=Convers('������ N'+IntToStr(NKl)+' �����',
          Addr(pArx^.Valve[NKl].Time),SShSSm_12,InBlock,ValX,ValY,Txt,'���:���');
        1: begin
             if ScaleRasxod=SSpSS then FrmRas:=SSpSSS;
             if ScaleRasxod=SSSpS then FrmRas:=SSpSS;
             Result:=Convers('������ N'+IntToStr(NKl)+' ������',
              Addr(pArx^.Valve[NKl].Vol),FrmRas,InBlock,ValX,ValY,Txt,'�3');
           end;
        2..5: Result:=Convers('������ N'+IntToStr(NKl)+' ������� '+NameChan324[Cas-1],
          Addr(pArx^.Valve[NKl].Midl[Cas-1]),SSpSS,InBlock,ValX,ValY,Txt,EdChan324[Cas-1]);
        end;
       end    // ��� �������
       else
       begin  // ����� ��������
       Cas:=Cas-NumValve*6;

       case Cas of
           0: Result:=Convers('������� � �������',
                Addr(pArx^.TimeMat[1]),SSSS,InBlock,ValX,ValY,Txt,'���');
           1: Result:=Convers('������� � �������',
                Addr(pArx^.TimeMat[2]),SSSS,InBlock,ValX,ValY,Txt,'���');
           2: Result:=Convers('������� �� �������',
                Addr(pArx^.TimeMat[3]),SSSS,InBlock,ValX,ValY,Txt,'���');
           end;
       end; // ��� ��������
     end;    // ��� �������
    end;    // ��� ���� case
    if (ValX>0) and (ValY>0) and(Result=0) then Txt:='~~';
end;

function TIrrArxPC.CalcDayArxPC(var ArxDate:TDateTime):Boolean;
var
// pPCArx:^rT1ArxD4;
 pB:pByteArray;
 vDate,TimeIrr,vTimeIrr:TDateTime;
 i,tDay:integer;
// vVal:Double;
 st:string;
// MinDay:word;
begin
//pPCArx:=Adr;
Result:=False;
//with ParentCtr do
  begin
  if not (ParentCtr as TFMixer04).BlArxMC.LoadFileCycle(ArxDate) then
    begin
    ArxDate:=Now;
    Exit;
    end;
//  ClearData;
//  BlDate:=0;
  TimeIrr:=0;
  repeat
    for i:=1 to (ParentCtr as TFMixer04).BlArxMC.CountX do
      begin
      vDate:=(ParentCtr as TFMixer04).BlArxMC.LoadXY(cOutBlock,i,0,st);
      if vDate=0 then continue;
      tDay:=DayOfTheYear(vDate);
      if tDay=DayOfTheYear(ArxDate) then
          begin
          vTimeIrr:=(ParentCtr as TFMixer04).BlArxMC.LoadXY(cOutBlock,i,1,st);
          if vTimeIrr > TimeIrr then
            begin
            pB:=(ParentCtr as TFMixer04).BlArxMC.Adr;
            pB:=Addr(pB^[SizeCol*(i-1)]);
            CopyByteArray(pB,Adr,SizeCol);
            BlDate:=ArxDate+1-cMin;
            Ready:=True;
            Result:=True;
            TimeIrr:=vTimeIrr;
            end;
          end;
      end;
  until Not (ParentCtr as TFMixer04).BlArxMC.LoadFileCycle(ArxDate);
  end;
end;

function TIrrArxPC.CalcAllArxPC(StartDate:TDateTime):Boolean;
var  Save_Cursor:TCursor;
begin
 if(Frac(Now) < cMin*60) or (ParentCtr.DataPath <> '') then Exit;
 Save_Cursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;    { Show hourglass cursor }
 try
 if LoadFileByDate(Now,dEnd) then StartDate:=BlDate+1
      else  StartDate:=EncodeDate(YearOf(Now),1,1);  // Now-ClimLongArx; //
 while DayOfTheYear(StartDate) < DayOfTheYear(Now) do  // DayOf()
      begin
      if CalcDayArxPC(StartDate) then SaveToFile;
      StartDate:=StartDate+1;
      end;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
  DateTest:=Now;
end;

procedure TArxivD4.Init;//override;
var NumV:Byte;
begin
     NumV:=(ParentCtr as TFMixer04).NumValve;
     CountX:=(ParentCtr as TFMixer04).SizeArx;
     CountY:=6+NumV*6;
     SizeCol:=SizeOf(rT1ArxD4)+SizeOf(rTValveArxD4)*(NumV-1);
     if (4095 div SizeCol) < CountX then CountX:=4095 div SizeCol;
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
//     FixRow:=2;
     Pref:='����������';
     NameBlock:='����� ������ � ��';
     Sort:=srNoGridGraf;
end;

function TArxivD4.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var    ADat:PByteArray;
begin
  ADat:=Adr;
//  ADat:=Addr(ADat^[SizeCol*(ValX-1)]);
  Result:=(ParentCtr as TFMixer04).CustLoadXY(InBlock,ValX,ValY,Txt,
    Addr(ADat^[SizeCol*(ValX-1)]));
  AccessW:=RW_NOEDIT;
end;

procedure TIrrArxPC.Init;
var NumV:Byte;
begin
//     BlArxMC:=vBlArxMC;
     CountX:=1;
     CountY:=(ParentCtr as TFMixer04).BlArxMC.CountY;
     SizeCol:=(ParentCtr as TFMixer04).BlArxMC.SizeCol;
     FullSize:=SizeCol;
     SendByte:=0;
     Pref:='�������';
     NameBlock:='����� ������ ��';
end;

function TIrrArxPC.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
begin
  if (ValY=0) and (ValX=0) and (Int(DateTest) <> Int(Now)) then CalcAllArxPC(Now);
  Result:=(ParentCtr as TFMixer04).CustLoadXY(InBlock,ValX,ValY,Txt,Adr);
  AccessW:=RW_NOEDIT;
end;


type r1Houm=record
     NumRast:InInt;
     RasxKap:InInt;
     NameRast:string[20];
     end;
type rHoum=array [1..1] of r1Houm;
procedure THoum.Init;//override;
var NumV:Byte;
begin
     NumV:=(ParentCtr as TFMixer04).NumValve;
     CountX:=NumV;
     CountY:=3;
//     FNumBlock:=ParentCtr.BlHoum;
     SizeCol:=SizeOf(r1Houm);
     FullSize:=SizeCol*NumV;
     SendByte:=0;
     Pref:='� ��������';
     NameBlock:='�������������� ��������';
end;

function THoum.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var    ADat:^rHoum;
begin
     ADat:=Adr;
     Result:=ValX;
     case ValY of
     0: if ValX=0 then Txt:='����� �������'
                  else Txt:='������ '+IntToStr(ValX);
     1: Result:=Convers('�������� �� ������',
          Addr(ADat^[ValX].NumRast),SSSS,InBlock,ValX,ValY,Txt,'��');
     2: Result:=Convers('����������',
          Addr(ADat^[ValX].RasxKap),SSpSS,InBlock,ValX,ValY,Txt,'�/���');
     3: if ValX=0 then Txt:='��������' else
          if InBlock=cInBlock then ADat^[ValX].NameRast:=Txt
            else Txt:=ADat^[ValX].NameRast;
     end;
end;

procedure TFMixer04.InitCtr(vIdentCtr:TIdentCtr);
begin
     inherited;
//     SubTip:= SubTip or cRasxod100;     // ��� ���������� � ����������� tR100
     NameIdent:=cNameIdentD4;
     ScaleRasxod:=SSSpS;
     if (SubTip and cRasxod100)=0 then
       begin
          ScaleRasxod:=SSpSS;
          NameParUpr25[iMinRasx].Frm:=ScaleRasxod;
          NameParUpr25[iMaxRasx].Frm:=ScaleRasxod;
          NameParUpr25[iFilRasx].Frm:=ScaleRasxod;
       end;
     NumDozEC:=CtrTip mod 10 -3;
//     CtrName:='����� '+IntToStr(CtrTip)+'-'+IntToStr(IdentCtr[idSubTip])+'-'+IntToStr(IdentCtr[idModific]);
     Period:=30;
     TimeView:=5;
     BlArxMC:=nil;
     if (SubTip and T325)>0 then
        begin
//        NameIdent:=cNameIdentD4;
        THotPol325.Create(Self);
        TControl325.Create(Self);
        end
     else
        begin
        TSostPolD4.Create(Self);
        TControlD4.Create(Self);
        end;
     TChanelD4.Create(Self);
     if (SubTip and cYesMirror)>0 then
          begin
          if ((SubTip and t326)>0) and ((SubTip and T325)>0) then
            TTimer326.Create(Self)
          else TTimerD7.Create(Self);
          end
     else TTimerD4.Create(Self);
     if ((SubTip and YesSiod22)>0) then begin
       TTimerSiod22.Create(Self);
       BlArxMC:=TArxivD4.Create(Self);
       TArxivSiod.Create(Self);
       end else
      if ((SubTip and YesSiod)>0) then
         begin
         TTimerSiod.Create(Self);
         BlArxMC:=TArxivD4.Create(Self);
         TArxivSiod.Create(Self);
         end
         else TArxivD4.Create(Self);
     if BlArxMC<>nil then
         begin
         TIrrArxPC.Create(Self);//.CalcAllArxPC(Now);
         end;
     BlockHoum:=CountBlock;
     THoum.Create(Self);
     LoadImageSkin(ImagePoliv,'Mixer325.jpg');
end;

end.
