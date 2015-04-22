unit MSiod;

interface
uses  FConstType,FController,SysUtils, PicCtr,DefIrrig;  //
const
{#ifdef  Siod
#define NumTepl         4            /*���������� ������*/
#define SizeArxSiod     3            /*���������� ���� ������������� ����*/
#define NumPort         1            /*���������� ������ ������������*/
#define nPort0          16           /*������ ������ � �����������*/
#define NumChan         16+NumPort   /*���������� ����������� ��������*/
#define NumChanTH       8            /*���������� �������� ����������� � ���������*/
#define Temp1           8            /*������ �������� ����������� � �����������*/
#define Hum1            12           /*������ �������� ��������� � �����������*/
#define NumChanSiod     8            /*���������� ������� ����*/
#define NumTimerSiod    20           /*���������� ������� ����*/
}
    NumTepl=4;
    NumChanTH=8;
    NumTimerSiod=10;// � ���� 2004�. 10 ������ 20;
    SizeArxSiod=3;

NameChan403:array [1..17] of string[6]=(
     'EC1','pH1','EC2','pH2','���','Sun','Lev�','Lev�',
     'Tem 1','Tem 2','Tem 3','Tem 4','RH 1','RH 2','RH 3','RH 4',
     'Port');
EdChan403:array [1..17] of string[7]=(
     'mSm/sm','','mSm/sm','','�C','Vt/m2','sm','sm',
     '�C','�C','�C','�C','%','%','%','%','');
     cCountYChanel=7;
     cSizeColChanel=15;


type TTimerSiod=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;
type TTimerSiod22=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;
type TTimerSiod403=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;
type TTimerKamera=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

type TArxivSiod=Class(TBlock)
public
     procedure Init;override;
     function LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;override;
end;

implementation

uses Mixer403,MessageU, GGraf;
//--------- ������� �� ����� Siod ------------------
{typedef struct  eeTimerSiod
        uint    DataStart;
        uint    DataEnd;
        uint    TimeStart;
        char    SelTepl;
        uint    MinPeriod;
        uint    MaxPeriod;
        uint    MinHum;
        uint    MaxTemp;
        uint    LevSR;
        char    TimeVal[2];
        }

type rT1TimerSiod=record
     DataStart:InInt;
     DataEnd:InInt;
     TimeStart:InInt;
     SelTepl:Byte;
     MinPeriod:InInt;
     MaxPeriod:InInt;
     MinHum:InInt;
     MaxTemp:InInt;
     LevSR:InInt;
     TimeValve:array [1..2] of Byte;
     end;
type rTimerSiod=array [1..NumTimerSiod] of rT1TimerSiod;

procedure TTimerSiod.Init;//override;
begin
     CountX:=NumTimerSiod;
     CountY:=11;
//     if (((ParentCtr.CtrTip div 10)=4) or ((ParentCtr.SubTip and YesSiod)=0))then Num:=blTimerSiodOld
//         else Num:=blTimerSiodNew;
     SizeCol:=SizeOf(rT1TimerSiod);
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
//     EEPSize:=SizeCol*5;
     Pref:='���������';
     NameBlock:='��������� ����';
end;

function TTimerSiod.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;//override;
var  pTimer:^rTimerSiod;
begin
  Result:=ValX;
  pTimer:=Adr;
 case ValY of
   0: begin if ValX=0 then Txt:='����� �����'
         else  Txt:='���� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('���� N',
        Addr(pTimer^[ValX].SelTepl),SS,InBlock,ValX,ValY,Txt,'');
      end;
   2: begin
      Result:=Convers('����� ������',
        Addr(pTimer^[ValX].TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   3: begin
      Result:=Convers('����������� ���������',
        Addr(pTimer^[ValX].MinHum),FrmChan324[Hum1],InBlock,ValX,ValY,Txt,EdChan324[Hum1]);
      end;
   4: begin
      Result:=Convers('������������ �����������',
        Addr(pTimer^[ValX].MaxTemp),FrmChan324[Temp1],InBlock,ValX,ValY,Txt,EdChan324[Temp1]);
      end;
   5: begin
      Result:=Convers('��������,���� ����� ������',
        Addr(pTimer^[ValX].LevSR),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      end;
   6: begin
      Result:=Convers('����������� ������',
        Addr(pTimer^[ValX].MinPeriod),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   7: begin
      Result:=Convers('������������ ������',
        Addr(pTimer^[ValX].MaxPeriod),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   8: begin
      Result:=Convers('���� 1 ��� ��',
        Addr(pTimer^[ValX].TimeValve[1]),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   9: begin
      Result:=Convers('���� 2 ��� ��',
        Addr(pTimer^[ValX].TimeValve[2]),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   10: begin
      Result:=Convers('���� ������',
        Addr(pTimer^[ValX].DataStart),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   11: begin
      Result:=Convers('���� ���������',
        Addr(pTimer^[ValX].DataEnd),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   end;
end;
//--------- END ������� �� ����� Siod------------------
//--------- ������� �� ����� Siod22------------------
{typedef struct  eeTimerSiod
        uint    DataStart;
        uint    DataEnd;
        uint    TimeStart;
        uint    TimeEnd;
        char    SelValSiod;
        char    SelSens;
        uint    MinPeriod;
        uint    MaxPeriod;
        uint    MinHum;
        uint    MaxTemp;
        uint    LevSR;
        char    TimeValSiod;
    eTimerSiod;}
type rT1TimerSiod22=record
     DataStart:InInt;
     DataEnd:InInt;
     TimeStart:InInt;
     TimeEnd:InInt;
     SelValSiod:Byte;
     SelSens:Byte;
     MinPeriod:InInt;
     MaxPeriod:InInt;
     MinHum:InInt;
     MaxTemp:InInt;
     LevSR:InInt;
     TimeValSiod:Byte;
     end;
type rTimerSiod22=array [1..NumTimerSiod] of rT1TimerSiod22;

procedure TTimerSiod22.Init;//override;
begin
     CountX:=NumTimerSiod;
     CountY:=12;
//     Num:=blTimerSiodNew;
     SizeCol:=SizeOf(rT1TimerSiod22);
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
     Pref:='���������';
     NameBlock:='��������� ����';
end;

function TTimerSiod22.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;//override;
var  pTimer:^rTimerSiod22;
begin
  Result:=ValX;
  pTimer:=Adr;
 case ValY of
   0: begin if ValX=0 then Txt:='����� ���������'
         else  Txt:='���� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('����� ������ ������ ���������',
        Addr(pTimer^[ValX].TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   2: begin
      Result:=Convers('����� ��������� ������ ���������',
        Addr(pTimer^[ValX].TimeEnd),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   3: begin
      Result:=Convers('��������� ��������� ��� ������� �',
        Addr(pTimer^[ValX].SelValSiod),SS,InBlock,ValX,ValY,Txt,'');
      end;
   4: begin
      Result:=Convers('�����, �� ������� ���������� ������',
        Addr(pTimer^[ValX].TimeValSiod),SS,InBlock,ValX,ValY,Txt,'���');
      end;
   5: begin
      Result:=Convers('������������ ����� ����� �����������',
        Addr(pTimer^[ValX].MinPeriod),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   6: begin
      Result:=Convers('��� ������� �������� �������� �����',
        Addr(pTimer^[ValX].MaxPeriod),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   7: begin
      Result:=Convers('����� ������� ������/����� ��� �������',
        Addr(pTimer^[ValX].SelSens),SS,InBlock,ValX,ValY,Txt,'');
      end;
   8: begin
      Result:=Convers('�������� ��� ��������� �����',
        Addr(pTimer^[ValX].MinHum),FrmChan324[Hum1],InBlock,ValX,ValY,Txt,EdChan324[Hum1]);
      end;
   9: begin
      Result:=Convers('�������� ��� ����������� �����',
        Addr(pTimer^[ValX].MaxTemp),FrmChan324[Temp1],InBlock,ValX,ValY,Txt,EdChan324[Temp1]);
      end;
   10: begin
      Result:=Convers('�������� ��� ����������� �������� �����',
        Addr(pTimer^[ValX].LevSR),SSSS,InBlock,ValX,ValY,Txt,'��/��2');
      end;
   11: begin
      Result:=Convers('���� ������ �������� ���������',
        Addr(pTimer^[ValX].DataStart),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   12: begin
      Result:=Convers('���� ��������� �������� ���������',
        Addr(pTimer^[ValX].DataEnd),SSsSS,InBlock,ValX,ValY,Txt,'');
      end;
   end;
end;
//--------- END ������� �� ����� Siod22------------------
//--------- ������� �� ����� Siod403------------------
{typedef struct  eeTimerSiod
        uint    DataStart;    0
        uint    DataEnd;      2
        uint    TimeStart;    4
        uint    TimeEnd;      6
        char    NumZone;      8
        char    SelSens;      9
        uint    MinPeriod;    10
        uint    MaxPeriod;    12
        uint    MinHum;       14
        uint    MaxTemp;      16
        uint    LevSR;        18
        char    TimeValSiod;  20
    eTimerSiod;}
const cSizeColTimerSiod=21;
      iProp=6;
      cCountYTimerSiod=12;
var NameTimerSiod:array [1..cCountYTimerSiod] of TNameConst=(
    (Name:'����� ���� ����';Frm:SS;Ed:'����';TipSens:TipCalc;Min:0;Max:20;
        Def:0;Index:8;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'����� ������ ���';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:4;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'����� ��������� ���';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:6;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'�����, �� ������� ���������� ������';Frm:SS;Ed:'���';TipSens:TipCalc;Min:0;Max:99;
        Def:0;Index:20;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'������������ ����� ����� �����������';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:10;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'��� ������� �������� �������� �����';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:12;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'����� ������ ������/����� ��� �������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:4;
        Def:0;Index:9;Mech:32{cfBoxT_RH};AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'�������� ��� ��������� �����';Frm:SSpSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:0;Index:14;Mech:32{cfBoxT_RH};AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'�������� ��� ����������� �����';Frm:SSpSS;Ed:'�C';TipSens:TipControl;Min:0;Max:50;
        Def:0;Index:16;Mech:32{cfBoxT_RH};AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'�������� ��� ����������� �������� �����';Frm:SSSS;Ed:'��/��2';TipSens:TipCalc;Min:0;Max:1000;
        Def:0;Index:18;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'���� ������ �������� ���������';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:0;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER),
    (Name:'���� ��������� �������� ���������';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:0;Index:2;Mech:0;AccessR:RW_GUEST;AccessW:RW_USER));

procedure TTimerSiod403.Init;//override;
begin
     CountX:=NumTimerSiod;
     CountY:=cCountYTimerSiod;
     SizeCol:=cSizeColTimerSiod;
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
     Pref:=ProgMess[309]; //'���������';
     NameBlock:=ProgMess[310]; //'��������� ����';
     ConstNames:=Addr(NameTimerSiod[1]);
     Translator:=CountY;
end;

function TTimerSiod403.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;//override;
var  ADat:PByteArray; tPoint: pointer;
begin
     ADat:=Adr;
     Result:=ValX;
     if ValY=0 then
        begin
        if ValX=0 then begin Txt:=ParentCtr.CtrName;Exit;end;
        Txt:=ProgMess[202]+' '+IntToStr(ValX);  //'������� '
//        Txt:='������� '+IntToStr(ValX);
        Exit;
        end;
     tPoint:=Addr(ADat^[ConstNames[ValY].Index+SizeCol*(ValX-1)]);
     GetExist(1,ValY);
     Result:=Convers(ConstNames[ValY].Name,
            tPoint,ConstNames[ValY].Frm,InBlock,ValX,ValY,Txt,ConstNames[ValY].Ed);
{     if (ValX>0) and (Result< ConstNames[ValY].Min) then Txt:='?���� '+Txt;
     if (ValX>0)
        and (ConstNames[ValY].Max > 0)
        and (Result>ConstNames[ValY].Max )
          then Txt:='?����� '+Txt; }
end;
//--------- END ������� �� ����� Siod403------------------

//--------- ������� �� ����� ������ ------------------
type rT1TimerKamera=record
     TimeStart:InInt;
     ZDHum:InInt;
     ZDTem:InInt;
     PauseHum:InInt;
     PauseTem:InInt;
     WorkHum:Byte;
     WorkTem:Byte;
     end;
type rTimerKamera=array [1..NumTimerSiod] of rT1TimerKamera;

procedure TTimerKamera.Init;//override;
begin
     CountX:=NumTimerSiod;
     CountY:=3;
//     Num:=blTimerSiodNew;
     SizeCol:=SizeOf(rT1TimerKamera);
     FullSize:=SizeCol*CountX;
     SendByte:=FullSize;
     Pref:='������';
     NameBlock:='��������� ������';
end;

function TTimerKamera.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
     var Txt:String):Double;//override;
var  pTimer:^rTimerKamera;
begin
  Result:=ValX;
  pTimer:=Adr;
 case ValY of
   0: begin if ValX=0 then Txt:='����� �����'
         else  Txt:='���� N'+IntToStr(ValX);
      end;
   1: begin
      Result:=Convers('����� ������',
        Addr(pTimer^[ValX].TimeStart),SShSSm,InBlock,ValX,ValY,Txt,'���:���');
      end;
   2: begin
      Result:=Convers('���������',
        Addr(pTimer^[ValX].ZDHum),FrmChan324[Hum1],InBlock,ValX,ValY,Txt,EdChan324[Hum1]);
      end;
   3: begin
      Result:=Convers('�����������',
        Addr(pTimer^[ValX].ZDTem),FrmChan324[Temp1],InBlock,ValX,ValY,Txt,EdChan324[Temp1]);
      end;
   end;
end;
//--------- END ������� �� ����� Siod------------------
//--------- ����� Siod ------------------

{typedef struct eeArxSiod
        int      Data;
        uint     SolRad;
        uint     TimeSiod[NumTepl];
        int      Midl [NumChanTH][24];
        eArxSiod;
}
type rT1ArxSiod=record
     Data:InInt;
     SolRad:InInt;
     TimeSiod:array [1..NumTepl] of InInt;
     Midl:array [1..NumChanTH,1..24] of InInt;
     end;
type rArxSiod=array [1..SizeArxSiod]of rT1ArxSiod;


procedure TArxivSiod.Init;//override;
begin
     CountX:=SizeArxSiod*NumChanTH;
     CountY:=24+1;
//     Num:=blArxSiod;
     SizeCol:=SizeOf(rT1ArxSiod);
     FullSize:=SizeCol*SizeArxSiod;//SizeArxD;
     SendByte:=FullSize;
     FixRow:=1;
     Pref:=ProgMess[260]; //'����� �������';
     NameBlock:=ProgMess[261]; //'�������� ������ �������'
     Sort:=srNoGridGraf;
end;

function TArxivSiod.LoadXYvirt(InBlock:Byte;ValX,ValY:Integer;
       var Txt:String):Double;//override;
var    pArx:^rArxSiod;
       NDat,NArx,NHour:Byte;
begin
  NDat:=(ValX-1) mod NumChanTH +1;    //����� ������� � 1
  NHour:=ValY-1; //����� ���� � 1
  NArx:=(ValX-1) div NumChanTH +1; //����� ������
  pArx:=Adr;
  if (ValY>0) and (ValX>0) then
    if (pArx^[NArx].Data[0]<=0) or (pArx^[NArx].Data[0]>12)or
         (pArx^[NArx].Data[1]<=0) or (pArx^[NArx].Data[1]>31)then begin
            Txt:='';
            Result:=0;
            AccessW:=RW_NOEDIT;
            Exit;
            end;
  Result:=ValX;
  case ValY of
    0: if ValX=0 then Txt:=ParentCtr.CtrName
                  else Txt:=NameChan403[NDat+8];
    1: Result:=Convers(ProgMess[311],  //'����',
          Addr(pArx^[NArx].Data),SSsSS,InBlock,ValX,ValY,Txt,'');
    else begin
         Result:=Convers(Format(ProgMess[312],[NHour-1,NHour]), //' c '+IntToStr(NHour-1)+' �� '+IntToStr(NHour)+'����',
          Addr(pArx^[NArx].Midl[NDat][NHour]),FrmChan324[NDat+8],InBlock,ValX,ValY,Txt,EdChan403[NDat+8]);
         if Result<0.2 then Txt:=''; //'��� ���';
         end;
    end;
   AccessW:=RW_NOEDIT;
end;
//---- END ����� Siod ------------------

end.
