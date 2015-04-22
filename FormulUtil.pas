unit FormulUtil;

interface
uses Classes, StrUtils, FConstType, FController, PicCtr, MessageU;

const
  // �������� ��������� ������ ���������� (MC - Mistake Code)
  MC_NOERROR=0;
  MC_INVALIDCHAR=1;
  MC_UNKNOWNFUNC=2;
  MC_INVALIDNUMBER=3;
  MC_LOSTOPERATOR=4;
  MC_INVALIDBRACKETS=5;
  MC_LOSTNUMBER=6;
  MC_INVALIDSTRUCTURE=7;
  MC_FUNCTIONERROR=8;
  
const
  FUNC_LOAD='VAL';
  FUNC_RULE='RULE';
  // ���������� �������� ���������� �������� LO_ (Logical Operations)
//  LO_AND='�';
//  LO_OR='���';
//  LO_NOT='��';
  L_AND=332;  //'�';
  L_OR=333;   //'���';
  L_NOT=334;  //'��';



type
  TFormula = class (TComponent)
  private
    FActCtr:TFPicCtr;
    // ��������� ������� ������ � ������� �������
    FFormulText:string;
    // ��������� ������� ����������:  true - ��������, false - ��������
    FResultStatus:boolean;
    // �������� ���������
    FFloatResult:extended;
    // ������� ���-�
    FBoolResult:boolean;
    // ��� ������
    FMistakeCode:byte;
    // ������� ������
    FMistakePos:word;
//    FHotBlock:TBlock;
//    FAuditBlock:TBlock;
    // ��������� ������ ������ �������
//    property Text:string read FFormulText write SetFormulText;
    property MistakePosition:word read FMistakePos;
    // ���� ���� ����������: true - ����������, false  - ��������
    property IsBoolean:boolean read FResultStatus;
    // ���������� ���������
    property BoolResult:boolean read FBoolResult;
    // �������� ���������
    property FloatResult:extended read FFloatResult;
//    function GetBlockValue(v:extended):extended;
  public
    procedure SetFormulText(aFormulText:string);
    // ��� ������ (�� ��������� MC_ )
    property MistakeCode:byte read FMistakeCode;
    // ������������ ������ � ������
    function GetMistakeText:string;
//    function BlockCalc(vX,vY:integer;Block:TBlock):boolean;
    function CalcFromText(aStr:string; Ctr:TFPicCtr):FormulResult;
//    function CalcFromText(aStr:string;vHotBlock:TBlock):FormulResult;
  end;

//procedure Register;
function GetFuncAddress(FuncName:string):pointer;

var  Formula:TFormula;
//  NewStr:string;  // ���������� ���������� ������

implementation
uses
  SysUtils, Math, audit;

const
  // ��������� ��� ����������� �������� � ������� TCodeOZ
  CM_PUSH=0;
  CM_MINUS=1;
  CM_PLUS=2;
  CM_MUL=3;
  CM_DIV=4;
  CM_CALC=5;

  // ��������� ���������� ��������
  CM_OR=6;
  CM_AND=7;
  CM_NOT=8;
  CM_BIGGER=9;
  CM_SMALLER=10;
  CM_IS=11;
  CM_NOBIGGER=12;
  CM_NOSMALLER=13;
  CM_ISNOT=14;

  // �������, ������� ��������� ������������ � ������ �������
  InvalidChars='&^!#$?<>={}';
  // � �� ���� �������� ����� ������ � ���, ��� ��������������� ������ - � �������
  InvalidCharsEx='&^!#$?<>=';

type
  TParamPtr=function(x:extended):extended;

  // ����� ���� ��� - "��� �������� ������"
  TCodeOZ=record
    CodeData:array[0..200] of integer; // ����� �������� ������������� ���� ��������
    PCode:integer; // ������� ��� ������ � CodeData ����� ��������
    Reals:array[0..100] of Extended; // ����� �������� ��������� ��� ����������
    PReals:integer;// ������� ��� ������ � Reals ����� ��������
    ParamData:array[0..100]of TParamPtr;// ������ � ����������� �� �������, �������������� � �����������
    PParam:integer; // ���������� �������
  end;

  // ��� ���� �������� ������ - �� ��� ��� ��� ������
  TBoolCodeOZ=record
    CodeData:array[0..200] of integer; // ����� �������� ������������� ���� ���������� ��������
    PCode:integer; // ������� ��� ������ � CodeData ����� ��������
    Reals:array[0..100] of Extended; // ����� �������� ����� - ���� �� ��-�� ����������!
    PReals:integer;// ������� ��� ������ � Reals ����� ��������
  end;

  // ��� ��� ����������� ������ (�� ���� � ���������)
  TMistake=record
    aMistakeCode:byte;
    aMistakePos:word;
  end;


function InvalidChar(aChar:string):boolean;
// �������� �� ������� ������������ �������� � ������
begin
  Result:=(StrPos(PChar(InvalidChars), PChar(aChar))<>nil);
end;

function InvalidCharEx(aChar:string):boolean;
// �������� �� ������� ������������ �������� � ������
begin
  Result:=(StrPos(PChar(InvalidCharsEx), PChar(aChar))<>nil);
end;

function GetFuncName(aStrWithFunc:string):string;
// �� ��������� ���� { �������(12345)} ���������� ��� �-�
var
  i:word;
  aFuncName:string;
begin
  aFuncName:='';
  for i:=2 to Length(aStrWithFunc)-3 do
  if not (aStrWithFunc[i]='(') then aFuncName:=aFuncName+aStrWithFunc[i]
  else break;
  Result:=aFuncName;
end;

function GetFuncParams(aStrWithFunc:string):string;
// �� ��������� ���� { �������(12345)} ���������� ���, ��� � �������
var
  i:word;
  aFuncParams:string;
begin
  i:=1;
  aFuncParams:='';
  while not (aStrWithFunc[i]='(') do
  inc(i);

  inc(i);
  while i<Length(aStrWithFunc)-1 do
  begin
    aFuncParams:=aFuncParams+aStrWithFunc[i];
    inc(i);
  end;
  Result:=aFuncParams;
end;

function CheckForMistakes(var aStr:string):TMistake;
var
  i:word;
  FuncStr:string;// ����� ����� ������������ ��� ������ �������
  FuncBrackets:array of Shortint; // ������� ���������� ������ ��� ������� - ������� �.�. ���������� ������� => �������. ������
  FuncCount:byte;// ������� ��������� �������
  aMistakeCode:Shortint;// ���������, ��� ������
  NewStr:string;// ����������� ����� ������

  Brackets:Shortint;// ������� ���������� ������ (������ �����������, � � ����� ����� 0)

  FirstPos, // ���� ������ �������, ������� �� ������������ ���. �������� (10+...)
  FuncClosed, // ������ � �������� ������� ����. �������� "}"
  PointFlag, // ���� ����������� �����
  MathFlag, // ���� ���. ��������� - +-/*
  FuncFlag,// ���� ����� ����� �������
  NumberFlag:boolean;// ���� ����� �����

begin
  aMistakeCode:=MC_NOERROR; //���� ������ ���
  NewStr:=''; // ����������� ������ ���� �����
  i:=1;
  FuncClosed:=false;
  NumberFlag:=false;
  FuncFlag:=false;
  MathFlag:=false;
  PointFlag:=false;
  FuncCount:=0;
  Brackets:=0;
  FirstPos:=true;
  // �������� �� ������� �������������� ������
  // ������� �������?
  // 1) ������������������ ������  123)*(12+10/(1,1+2)
  // 2) ���������� ��������        123(1210Func1(123)/(1,1+2))
  // 3) ��������� �������          123*/12+
  // 4) ����������� �������        123*(UnknownFunc(55/789+2)+10)-KnownFunc(55)
  // 5) ����� �������� ����������� 123.456.789+20-.12.6
  // �������, ���...
  while i<=Length(aStr) do
  begin
    case aStr[i] of
      '(':
      begin
        // ����� ������ - �������� �������
        inc(brackets);
        // ���� ������������� �� �������� ���� �������, �� ��������� � ��
        if (FuncCount>0)and(not FuncFlag) then inc(FuncBrackets[FuncCount-1]);
        // ���� ��� �����, � ����� ����� ������ - ������
        if NumberFlag then aMistakeCode:=MC_LOSTOPERATOR;
        // � ������ �������, �� ������ �� ��� �������� �������
        if FuncFlag then
        begin
          if GetFuncAddress(FuncStr)=nil then aMistakeCode:=MC_UNKNOWNFUNC;
          inc(FuncCount);
          SetLength(FuncBrackets,FuncCount);
          FuncBrackets[FuncCount-1]:=1;
        end;
        MathFlag:=false;
        FirstPos:=true;
        FuncFlag:=false;
       end;

      ')':
      begin
        // ���� ������������� ���� �������, �� ���������� � ��� ���
        if FuncFlag then
        begin
          NewStr:=NewStr+'()}';
          // ... ���� ��� ����������
          if GetFuncAddress(FuncStr)=nil then aMistakeCode:=MC_UNKNOWNFUNC;
        end;
        // ������ ������ - �������� �������
        dec(brackets);
        // ���� ������������� �� �������� ���� �������, �� ��������� � ��
        if FuncCount>0 then dec(FuncBrackets[FuncCount-1]);
        if Brackets<0 then aMistakeCode:=MC_INVALIDBRACKETS;
        if MathFlag then aMistakeCode:=MC_LOSTNUMBER;
        // � ������ ������, �� ������� �� �� �������
        if FuncCount>0 then
        if FuncBrackets[FuncCount-1]=0 then
        begin
          Dec(FuncCount);
          SetLength(FuncBrackets, FuncCount);
          FuncClosed:=true;
        end;
        FuncFlag:=false;
        NumberFlag:=false;
      end;

      '1','2','3','4','5','6','7','8','9','0'://��� ������� ����� ��� ����������� �������
      if not FuncFlag then
      begin
        // ���� ��������� �����, � ����� ��� ���� �� ����� �� ��� ���������� +-*/, �� �� �� ������
        if (not NumberFlag) and (not FirstPos) and (not MathFlag) then aMistakeCode:=MC_LOSTOPERATOR;

        // ����� ������� ����� ��� ������ ����� ����� (���� ����� ���� ������ �������)
        if not (NumberFlag) then PointFlag:=false;
        NumberFlag:=true;
        MathFlag:=false;
        FirstPos:=false;
      end else FuncStr:=FuncStr+aStr[i];

      ',','.': // ����������� �����
      begin
        //����� � ����� ������... ��... �� - �� �������, ���� �� ���?
        if FuncFlag then aMistakeCode:=MC_UNKNOWNFUNC;
        // ����� ���������� � ����� - ���������!
        if not NumberFlag then NewStr:=NewStr+'0';
        // ��� ������� - ��� �������
        if PointFlag then aMistakeCode:=MC_INVALIDNUMBER;
        NumberFlag:=true;
        PointFlag:=true;
        aStr[i]:='.'; // ������� �� ������ ��������� ����������... ������ �� �����
      end;

      '+','-','*','/': //����������
      begin
        // ���� */+ ���������� ��� ����� ����� ���� - �����
        if FirstPos and (aStr[i]<>'-') then aMistakeCode:=MC_LOSTNUMBER;
        // ������ �������������� �������
        if FuncFlag then
        begin
          NewStr:=NewStr+'()}';
          if GetFuncAddress(FuncStr)=nil then aMistakeCode:=MC_UNKNOWNFUNC;
          FuncFlag:=false;
        end;
        // ��� ��������� ������
        if MathFlag then aMistakeCode:=MC_LOSTNUMBER;
        MathFlag:=true;
        NumberFlag:=false;
      end;

      else if aStr[i]<>' ' then
      begin
        // �������� ������ �������
        if not FuncFlag then
        begin
          NewStr:=NewStr+'{';
          FuncStr:=aStr[i];
        end else FuncStr:=FuncStr+aStr[i];
        // �����, � ����� ������� - �������� ��������
        if NumberFlag then aMistakeCode:=MC_LOSTOPERATOR;
        // ���� ��������� �������, � ����� ��� ���� �� ����� �� ��� ���������� +-*/, �� �� �� ������
        if (not FuncFlag) and (not FirstPos) and (not MathFlag) then aMistakeCode:=MC_LOSTOPERATOR;
        FuncFlag:=true;
        MathFlag:=false;
        FirstPos:=false;
      end;
    end;{case}

    if not(aMistakeCode=MC_NOERROR) then break;
    if aStr[i]<>' ' then NewStr:=NewStr+aStr[i];
    if FuncClosed then
    begin
      FuncClosed:=false;
      NewStr:=NewStr+'}';
    end;
    inc(i);
  end;{while}

  // � ������ ���������, �� ���������� ������ ���������� �������
  if i>Length(aStr) then
  begin
    if FuncFlag then
    begin
      NewStr:=NewStr+'()}';
      if GetFuncAddress(FuncStr)=nil then aMistakeCode:=MC_UNKNOWNFUNC;
    end;
    // ����������� ��� ���������� - ������ ������
    if MathFlag then aMistakeCode:=MC_LOSTNUMBER;
    // �� ������� ������� - �����
    if (Brackets<>0)and(aMistakeCode=MC_NOERROR)then aMistakeCode:=MC_INVALIDBRACKETS;
    // �� ������ ������ ��������, ���� i �� �������� ����� ������� (�� �������)
    i:=Length(aStr);
  end;

    aStr:=NewStr;
    Result.aMistakeCode:=aMistakeCode;
    Result.aMistakePos:=i;
//  Form1.Memo2.Lines.Add(aStr);
end;


procedure ParseFormula(aStr:string; var aCodeOZ:TCodeOZ);
// �������������� ������ ������� ��� �������������� �� � ��������������� ���������� aCodeOZ
var
  FuncName:string;
  Brackets,FuncBrackets,// �������� ������ (){}
  i,Err:integer;
  a:extended;

begin
  Brackets:=0;
  FuncBrackets:=0;
  // ���� �������������� ��������� + � -
  for i:=Length(aStr) downto 1 do
  case aStr[i] of
    ')':inc(Brackets);
    '(':dec(Brackets);
    '{':inc(FuncBrackets);
    '}':dec(FuncBrackets);

    '+'://**************************
    if (Brackets=0)and(FuncBrackets=0) then
    begin
      ParseFormula(Copy(aStr,1,i-1), aCodeOZ);
      ParseFormula(Copy(aStr,i+1,Length(aStr)),aCodeOZ);
      aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_PLUS;
      inc(aCodeOZ.PCode);
      exit;
    end;
    '-'://**************************
    if (Brackets=0)and(FuncBrackets=0) then
    begin
      ParseFormula(Copy(aStr,1,i-1), aCodeOZ);
      ParseFormula(Copy(aStr,i+1,Length(aStr)),aCodeOZ);
      aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_MINUS;
      inc(aCodeOZ.PCode);
      exit;
    end;
  end;

  // ������ �������������� ��������� * � /
  for i:=Length(aStr) downto 1 do
  case aStr[i] of
    ')':inc(Brackets);
    '(':dec(Brackets);
    '{':inc(FuncBrackets);
    '}':dec(FuncBrackets);
    '*'://**************************
    if (Brackets=0)and(FuncBrackets=0) then
    begin
      ParseFormula(Copy(aStr,1,i-1), aCodeOZ);
      ParseFormula(Copy(aStr,i+1,Length(aStr)),aCodeOZ);
      aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_MUL;
      inc(aCodeOZ.PCode);
      exit;
    end;
    '/'://**************************
    if (Brackets=0)and(FuncBrackets=0) then
    begin
      ParseFormula(Copy(aStr,1,i-1), aCodeOZ);
      ParseFormula(Copy(aStr,i+1,Length(aStr)),aCodeOZ);
      aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_DIV;
      inc(aCodeOZ.PCode);
      exit;
    end;
  end;

  // ��� - ����� ���� ��� ���������� ������, ������� �������� ���� ��������� ������,
  // ���� ����� ���������� (������ � ������ ����), ���� ��� ���� ������� {� �������� �������}
  val(aStr,a,Err);

  // ����� �� ���?
  if Err=0 then
  begin
    aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_PUSH;
    inc(aCodeOZ.PCode);
    aCodeOZ.Reals[aCodeOZ.PReals]:=a;
    inc(aCodeOZ.PReals);
    exit;
  end;

  // ������ ������ �������� �� ���� - "-123=0-123"
  if aStr='' then
  begin
    aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_PUSH;
    inc(aCodeOZ.PCode);
    aCodeOZ.Reals[aCodeOZ.PReals]:=0;
    inc(aCodeOZ.PReals);
    exit;
  end;

  // � ��������� ������ ��� ���������, ����������� � ������...
  // �����, ��� �������?
  if aStr[1]='{' then
  begin
    FuncName:=GetFuncName(aStr);
    ParseFormula(GetFuncParams(aStr),aCodeOZ);
    aCodeOZ.ParamData[aCodeOZ.PParam]:=GetFuncAddress(FuncName);
    inc(aCodeOZ.PParam);
    aCodeOZ.CodeData[aCodeOZ.PCode]:=CM_CALC;
    inc(aCodeOZ.PCode);
    exit;
  end;

  // ��� - ��� ������ ��������� � �������! ����������� ������ � ��� �� �����...
  ParseFormula(Copy(aStr,2,Length(aStr)-2),aCodeOZ);
end;


function Calculate(aCodeOZ:TCodeOZ;var Crash:boolean):extended;
// ��������� ���������� �� ��������������� ���������
var
  aPCode,aPReals,aPParams:word;
  NumbersPointer:byte;
  NumbersStack: array[0..10] of extended;
begin
  Crash:=false;
  aPCode:=0;
  aPReals:=0;
  aPParams:=0;
  NumbersPointer:=0;
  while aPCode < aCodeOZ.PCode do
  begin
    Case aCodeOZ.CodeData[aPCode] of

      CM_PUSH://--------------------������� �����
      begin
        NumbersStack[NumbersPointer]:=aCodeOZ.Reals[aPReals];
        inc(aPReals);
        inc(NumbersPointer);
      end;

      CM_MINUS://-------------------���������
      begin
        dec(NumbersPointer);
        NumbersStack[NumbersPointer-1]:=NumbersStack[NumbersPointer-1]-NumbersStack[NumbersPointer];
      end;

      CM_PLUS://-------------------��������
      begin
        dec(NumbersPointer);
        NumbersStack[NumbersPointer-1]:=NumbersStack[NumbersPointer-1]+NumbersStack[NumbersPointer];
      end;

      CM_MUL://-------------------���������
      begin
        dec(NumbersPointer);
        NumbersStack[NumbersPointer-1]:=NumbersStack[NumbersPointer-1]*NumbersStack[NumbersPointer];
      end;

      CM_DIV://-------------------�������
      begin
        dec(NumbersPointer);
        try
      	  NumbersStack[NumbersPointer-1]:=NumbersStack[NumbersPointer-1]/NumbersStack[NumbersPointer];
        except
          Crash:=true;
          Result:=0;
          exit;
        end;
      end;

      CM_CALC://-------------------���������� �������
      begin
        try
          NumbersStack[NumbersPointer-1]:=aCodeOZ.ParamData[aPParams](NumbersStack[NumbersPointer-1]);
          inc(aPParams);
        except
          Crash:=true;
          Result:=0;
          exit;
        end;
      end;
    end;{case}
    inc(aPCode);
  end;
  Result:=NumbersStack[0];
end;

function GetFloatResult(aFormula:string;var aMistake:TMistake):extended;
//��������� ��������� ���������� �� ������ (� �������� �� ������)
var
  CodeOZ:TCodeOZ;
  aCrash:boolean;
begin
  aMistake:=CheckForMistakes(aFormula);
  if aMistake.aMistakeCode = MC_NOERROR then
  begin
    CodeOZ.PCode:=0;
    CodeOZ.PReals:=0;
    CodeOZ.PParam:=0;
    ParseFormula(aFormula, CodeOZ); // ��������������� ������
    Result:=Calculate(CodeOZ, aCrash); // �������� ����������
  end else Result:=0;
  // ���� ������ ��� �����������
  if aCrash then
  begin
    aMistake.aMistakeCode:=MC_FUNCTIONERROR;
    aMistake.aMistakePos:=0;
  end;
end;


function GetResultStatus(var aStr:string; var aMistake:TMistake):boolean;
// ���������, ���������� �������� ��� ��� ������ �����
// ��������� - AND - &
//           - OR  - ^
//           - NOT - !
//           - <>  - #
//           - <=  - $
//           - >=  - ?
//           - >   - >
//           - <   - <
var
  OtherFlg, // ���� �������������� ��������, �������� �� ����������
  CompareFlg:boolean; // ���� ��������������� ����� �������� ><=#$?
  i,j:word;
  IsBool:boolean; // ���������� ��� ����������
  NewStr,// ���������� ���������� ������
  TempStr:string;// �������, ���������� ��������� ���������� ���������
  LogPoz:integer;

  function AddNewStr(st:string):string;
  begin
        if LogPoz > 0 then
            Result:='>0'+st
        else Result:=st;
        LogPoz:=1;
  end;

begin
  i:=1;
  Result:=false;
  NewStr:='';
  TempStr:='';
  aStr:=aStr+' '; // ��� ���������� ��������� ��������� ��������  BackSpace
  LogPoz:=1;
  while i<=Length(aStr) do
  begin
    if (aStr[i]= #10) or (aStr[i]= #13) then
      begin inc(i); continue; end;
    case aStr[i] of
      // ����������� �������
      '1','2','3','4','5','6','7','8','9','0',')','(','+','-','*','/',' ':
      begin
        if TempStr<>'' then
        begin
          IsBool:=true;
          if TempStr=ProgMess[L_AND] then NewStr:=NewStr+AddNewStr('&') else
          if TempStr=ProgMess[L_OR] then NewStr:=NewStr+AddNewStr('^') else
          if TempStr=ProgMess[L_NOT] then NewStr:=NewStr+'!' else
          // ���� �������� ��������� ������ �� ��������� � ����� ����������
          // �� � ������ ��������� ���
          IsBool:=false;

          // ���� �� ���� ��� ������ ��������� - ������ ��� ��� ������
          if IsBool then
          begin
            Result:=true;
            TempStr:='';
          end;
        end;

        // ���� �� ������������� �� ������ ��� ��� ��������� �����,
        // �� ������� ��������� ������ � ������� ���� ������
        if (aStr[i]<>' ') then
        begin
          NewStr:=NewStr+TempStr+aStr[i];
          TempStr:='';
        end;
        if (i=Length(aStr)) then
        begin
          NewStr:=NewStr+TempStr+AddNewStr('');
          TempStr:='';
        end;
      end;

      '<': // ���, ��� ���� ����� ���� ��������, ���� �� ������ ������, �� ������� ��� ()
      begin
        LogPoz:=0;
        NewStr:=NewStr+TempStr;
        TempStr:='<';
        Result:=true;
      end;

      '>': // ���� ������ - ���� ����������� <>, ���� ������ >=, ���� ��� �� ����
      begin
        LogPoz:=0;
        Result:=true;
        if TempStr<>'' then
        begin
          // ���� �������������� ������ - <, �� ��� ������ - <>
          if TempStr[Length(TempStr)]='<' then
          begin
            TempStr:='';
            NewStr:=NewStr+'#';
          end
          // ����� - ������� ��� ������� (��� ���������)
          else begin
            NewStr:=NewStr+TempStr;
            TempStr:='>';
          end;
        end else TempStr:='>';
      end;

      '=': // ��� <= >= ��� =
      begin
        LogPoz:=0;
        Result:=true;
        if TempStr<>'' then
        begin
          // ���� �������������� ������ - <, �� ��� ������ - <=
          if TempStr[Length(TempStr)]='<' then
          begin
            TempStr:='';
            NewStr:=NewStr+'$';
          end
          // ���� �������������� ������ - >, �� ��� ������ - >=
          else if TempStr[Length(TempStr)]='>' then
          begin
            TempStr:='';
            NewStr:=NewStr+'?';
          end
          // ����� - ������� ��� ������� (��� ���������)
          else begin
            NewStr:=NewStr+TempStr;
            TempStr:='=';
          end;
        end else TempStr:='=';
      end;

      // ��� ��������� ������� ������ ������������ � �������� ���������� ��������
      else begin
        if (not InvalidChar(aStr[i])) then  TempStr:=TempStr+AnsiUpperCase(aStr[i])
        // ���� �������� ������������ ������
        else begin
          aMistake.aMistakeCode:=MC_INVALIDCHAR;
          aMistake.aMistakePos:=i;
          exit;
        end;
      end;
    end;{case}
    inc(i);
  end;

  aStr:=NewStr;
//  Form1.Memo2.Lines.Add(aStr);
  // ���� ������ ���, �� ��� ����� ������ ���� �� ����������...
  Result:=True;
//  if not Result then Exit;

  // � ������ ���������� ���������������� ���������� ���������
  // �� ������� ������ ���� "3<4>67 � �� 45"
  CompareFlg:=false;
  OtherFlg:=false;
  j:=0; // ������������ ������� ������
  for i:=1 to Length(aStr) do
  begin
    case aStr[i] of
      '>','<','=':
      begin
        // ���� ����� ���� �������� ����� ����� �� <>=#, ��� ������ �� ������ - ������
        if CompareFlg or (not OtherFlg) then aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
        CompareFlg:=true;
        OtherFlg:=false;
      end;
      '#','$','?':
      begin
        j:=j+1;// � �������� ����� ����� ���� ������ �� 1 ������.... ��! � �������-��? �����...
        if CompareFlg or (not OtherFlg) then aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
        CompareFlg:=true;
        OtherFlg:=false;
      end;
      '&':
      begin
        j:=j+Length(ProgMess[L_AND])-1;
        // ���� �� ��������� ���� ������ ������, ��� <>=... ��� �����, �� ��� ������� ����� - �����
        if not(CompareFlg) or (not OtherFlg) then aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
        CompareFlg:=false;
        OtherFlg:=false;
      end;
      '^':
      begin
        j:=j+Length(ProgMess[L_OR])-1;
        // ���� �� ��������� ���� ������ ������, ��� <>=... ��� �����, �� ��� ������� ����� - �����
        if not(CompareFlg) or (not OtherFlg) then aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
        CompareFlg:=false;
        OtherFlg:=false;
      end;
      '!':
      begin
        j:=j+Length(ProgMess[L_NOT])-1;
        // ���� ������ ����� ����������� ����� <>=
        if OtherFlg or CompareFlg then aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
        CompareFlg:=false;
        OtherFlg:=false;
      end;
      else if (aStr[i]<>')')and(aStr[i]<>'(')then OtherFlg:=true;
    end;{case}
    if aMistake.aMistakeCode<>MC_NOERROR then
    begin
      aMistake.aMistakePos:=i+j;
      exit;
    end;
  end;{for}

  // ������, ��� ��� �� ��� - ��� ������ ����������� ���������� � ��������� ������!
  if not(CompareFlg and OtherFlg) then
  begin
    aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
    aMistake.aMistakePos:=Length(aStr)+j;
  end;
end;


function StillBoolean(aStr:string):boolean;
var
  i:word;
begin
  Result:=false;
  i:=1;
  while i<=Length(aStr) do
  begin
    if InvalidCharEx(aStr[i]) then
    begin
      Result:=true;
      break;
    end;
    inc(i);
  end;
end;

function RealLength(BoolStr:string):word;
// ���������� ����� ������ ��� ��������, �� �� ���������� $#? � ��,
// � � ������ ����� /� ��� �� >= /� ��      ---- ��� ��� ������� ����������� ����� ������
var
  i,increment:word;
begin
  increment:=0;
  i:=1;
  while i<=Length(BoolStr) do
  begin
    case BoolStr[i] of
      '&':inc(increment, Length(ProgMess[L_AND])-1);
      '^':inc(increment, Length(ProgMess[L_OR])-1);
      '!':inc(increment, Length(ProgMess[L_NOT])-1);
      '#','$','?':inc(increment);
    end;{case}
    inc(i);
  end;
  Result:=Length(BoolStr)+increment;
end;

procedure ParseBoolFormula(aStr:string;var aBoolCodeOZ:TBoolCodeOZ; var aMistake:TMistake);
// �������������� ������ ���������� ������� ��� �������������� �� � ��������������� ���������� aBoolCodeOZ
var
  Brackets,// ������� ������ ()
  i:integer;
begin
  Brackets:=0;
  // ������, �� ���� - OR
  for i:=Length(aStr) downto 1 do
  case aStr[i] of
    ')':inc(Brackets);
    '(':dec(Brackets);
    '^'://************************** or
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_OR;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
  end;

  // ������ - AND
  for i:=Length(aStr) downto 1 do
  case aStr[i] of
    ')':inc(Brackets);
    '(':dec(Brackets);
    '&'://************************** and
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_AND;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
  end;

  // ������ - NOT
  for i:=Length(aStr) downto 1 do
  case aStr[i] of
    ')':inc(Brackets);
    '(':dec(Brackets);
    '!'://************************** not
    if Brackets=0 then
    begin
      // ��������� ������ ������ �����
      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_NOT;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
  end;

  // ������ - > <  = >= <= <>
  for i:=Length(aStr) downto 1 do
  case aStr[i] of
    ')':inc(Brackets);
    '(':dec(Brackets);
    '>'://**************************
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_BIGGER;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
    '<'://**************************
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_SMALLER;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
    '='://**************************
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_IS;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
    '?'://************************** >=
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_NOSMALLER;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
    '$'://************************** <=
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_NOBIGGER;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
    '#'://************************** <>
    if Brackets=0 then
    begin
      ParseBoolFormula(Copy(aStr,1,i-1), aBoolCodeOZ, aMistake);
      if aMistake.aMistakeCode<>MC_NOERROR then exit;

      ParseBoolFormula(Copy(aStr,i+1,Length(aStr)),aBoolCodeOZ, aMistake);
      // ������������� ��������� �� ����� ������ �� ����� ����� �����
      if aMistake.aMistakeCode<>MC_NOERROR then
      begin
        aMistake.aMistakePos:=aMistake.aMistakePos+RealLength(Copy(aStr,1,i));
        exit;
      end;
      aBoolCodeOZ.CodeData[aBoolCodeOZ.PCode]:=CM_ISNOT;
      inc(aBoolCodeOZ.PCode);
      exit;
    end;
  end;

  // ���, ��� ��������, ���� ��� ��� ���������� �������, �� � �������,
  // ���� ��������� ��� ������ (�������� �������)

  // ���� ��� ��� ��� ������ (� �������), �� ������������ �� ��-�����
  if StillBoolean(aStr) then
  begin
    // �������� �� ������� ���������� ������, ���� �� ��� - �� ���� �����-��...
    if not (aStr[1]+aStr[Length(aStr)]='()') then
    begin
      aMistake.aMistakeCode:=MC_INVALIDSTRUCTURE;
      aMistake.aMistakePos:=RealLength(aStr);
      exit;
    end;  
    ParseBoolFormula(Copy(aStr,2,Length(aStr)-2), aBoolCodeOZ, aMistake);
    // ���� ������ ����, �� �������� �� ������� �� 1 ( �� ���� ����� ������)
    if aMistake.aMistakeCode <> 0 then inc(aMistake.aMistakePos);
  end
  // � ��������� ������ - �������� �������� �������� ���������
  else begin
    aBoolCodeOZ.Reals[aBoolCodeOZ.PReals]:=GetFloatResult(aStr, aMistake);
    inc(aBoolCodeOZ.PReals);
  end;
end;

function CalculateBool(aBoolCodeOZ:TBoolCodeOZ):boolean;
var
  aPCode,aPReals:word;
  StackPointer:byte;
  BoolStack: array[0..10] of boolean;
begin
  aPCode:=0;
  aPReals:=0;
  StackPointer:=0;
  while aPCode < aBoolCodeOZ.PCode do
  begin
    Case aBoolCodeOZ.CodeData[aPCode] of

      CM_OR://-------------------- ���
      begin
        dec(StackPointer);
        BoolStack[StackPointer-1]:=(BoolStack[StackPointer-1] or BoolStack[StackPointer]);
      end;

      CM_AND://-------------------- �
      begin
        dec(StackPointer);
        BoolStack[StackPointer-1]:=(BoolStack[StackPointer-1] and BoolStack[StackPointer]);
      end;

      CM_NOT://-------------------- �� - ��������� ������ �����!
      begin
        BoolStack[StackPointer-1]:=not BoolStack[StackPointer-1];
      end;

      CM_BIGGER://-------------------��������� >
      begin
        // ������������ ���� �����
        BoolStack[StackPointer]:=aBoolCodeOZ.Reals[aPReals]>aBoolCodeOZ.Reals[aPReals+1];
        // ����������� ��������� �� ����� ����
        inc(aPreals,2);
        inc(StackPointer);
      end;

      CM_SMALLER://-------------------��������� <
      begin
        // ������������ ���� �����
        BoolStack[StackPointer]:=aBoolCodeOZ.Reals[aPReals]<aBoolCodeOZ.Reals[aPReals+1];
        // ����������� ��������� �� ����� ����
        inc(aPreals,2);
        inc(StackPointer);
      end;

      CM_IS://-------------------��������� =
      begin
        // ������������ ���� �����
        BoolStack[StackPointer]:=aBoolCodeOZ.Reals[aPReals]=aBoolCodeOZ.Reals[aPReals+1];
        // ����������� ��������� �� ����� ����
        inc(aPreals,2);
        inc(StackPointer);
      end;

      CM_NOBIGGER://-------------------��������� <=
      begin
        // ������������ ���� �����
        BoolStack[StackPointer]:=aBoolCodeOZ.Reals[aPReals]<=aBoolCodeOZ.Reals[aPReals+1];
        // ����������� ��������� �� ����� ����
        inc(aPreals,2);
        inc(StackPointer);
      end;

      CM_NOSMALLER://-------------------��������� >=
      begin
        // ������������ ���� �����
        BoolStack[StackPointer]:=aBoolCodeOZ.Reals[aPReals] >= aBoolCodeOZ.Reals[aPReals+1];
        // ����������� ��������� �� ����� ����
        inc(aPreals,2);
        inc(StackPointer);
      end;

      CM_ISNOT://-------------------��������� <>
      begin
        // ������������ ���� �����
        BoolStack[StackPointer]:=aBoolCodeOZ.Reals[aPReals]<>aBoolCodeOZ.Reals[aPReals+1];
        // ����������� ��������� �� ����� ����
        inc(aPreals,2);
        inc(StackPointer);
      end;
    end;{case}
    inc(aPCode);
  end;
  Result:=BoolStack[0];
end;

function GetBoolResult(aFormula:string;var aMistake:TMistake):boolean;
// ��������� ����������� �������� �������
var
  BoolCodeOZ:TBoolCodeOZ;
begin
  Result:=false;
  BoolCodeOZ.PCode:=0;
  BoolCodeOZ.PReals:=0;
  // �������� ��������� ������� �� ����� - � ������ ����� ���� ������
  ParseBoolFormula(aFormula, BoolCodeOZ, aMistake);
  if aMistake.aMistakeCode=MC_NOERROR then Result:=CalculateBool(BoolCodeOZ);
end;

function CorrectPos(aNoSpacesPos:word; aStrWithSpaces:string):word;
// ���������� ������� ������ � ������ �������� � ������ (��� ��������������)
var
  i,
  NonSpaces,// ������� ���� �������� ������ �������
  Spaces:word; // � �� ��� ��������
begin
  NonSpaces:=0;
  Spaces:=0;
  i:=1;

  While (NonSpaces<aNoSpacesPos) and (i<=Length(aStrWithSpaces))do
  begin
    if aStrWithSpaces[i]=' ' then inc(Spaces) else inc(NonSpaces);
    inc(i);
  end;

  Result:=aNoSpacesPos+Spaces;

  if NonSpaces<>aNoSpacesPos then Result:=Length(aStrWithSpaces); // ������������� ���������� ������!
end;

{function TFormula.GetBlockValue(v:extended):extended;
var st:string;
begin
  Result:=FHotBlock.LoadXY(cOutBlock,(round(v) div ctPicX) mod 10,round(v) mod 1000,st);
end; }

function TFormula.CalcFromText(aStr:string; Ctr:TFPicCtr):FormulResult;
begin
 Result:= fmNone;
 try
    FActCtr:=Ctr;
//    FAuditBlock:=vAuditBlock;
//    FHotBlock:=vAuditBlock.ParentCtr.Block[0];  // vHotBlock;
    Result:= fmNone;
    if  (aStr='') then Exit;   //Not FActCtr.Block[0].Ready or
    SetFormulText(aStr);
//cut3.11    if FResultStatus  then
    if FBoolResult then Result:= fmTrue else Result:= fmFalse;
 except
 Formula.FMistakeCode:=1;
 end;
end;

{function TFormula.BlockCalc(vX,vY:integer;vHotBlock:TBlock):boolean;
var st:string;
begin
    FHotBlock:=vHotBlock;
    FBlock.LoadXY(cOutBlock,vX,vY,st);
    SetFormulText(st);
    Result:= FResultStatus and FBoolResult;
end; }

procedure TFormula.SetFormulText(aFormulText:string);
var
  TempFormulStr:string;
  aMistake:TMistake;
begin
  // ������� ������
  aMistake.aMistakeCode:=MC_NOERROR;
  aMistake.aMistakePos:=0;
//cut3.11  FResultStatus:=False;
  FBoolResult:=False;
  // ����������� �����
  FFormulText:=aFormulText;   //TrimRight(
  // ���� ������������� ������ � �������� (��� ���������)
  TempFormulStr:=FFormulText;
  // ��������� ��� ���������� (�����. ��� ��������), � ������ ���������� ���
  FResultStatus:=GetResultStatus(TempFormulStr, aMistake);
  // ���� ��������� ������ - �������� �� � �������
//cut3.11  if aMistake.aMistakeCode <> MC_NOERROR then
//cut3.11  begin
//cut3.11    FMistakeCode:=aMistake.aMistakeCode;
//cut3.11    FMistakePos:=CorrectPos(aMistake.aMistakePos, aFormulText);
//cut3.11    exit;
//cut3.11  end;

  // � ������ ���� - ���� ���� ����� ������, ���� ������ ������� �����
//cut3.11  FBoolResult:=False;
//cut3.11  if FResultStatus then
   FBoolResult:=GetBoolResult(TempFormulStr,aMistake);
//cut3.11  else FFloatResult:=GetFloatResult(TempFormulStr, aMistake);

  // ������ �������� �� ������� ������ � ������� ��
  FMistakeCode:=aMistake.aMistakeCode;
  if FMistakeCode=MC_NOERROR then FMistakePos:=0
  else FMistakePos:=CorrectPos(aMistake.aMistakePos, aFormulText)
end;

function TFormula.GetMistakeText:string;
var i:integer;
  TxtMistake:string;
begin
    Result:='';
    if  MistakeCode <> MC_NOERROR then
    begin
    case MistakeCode of
      MC_INVALIDCHAR:TxtMistake:=ProgMess[542]; //' ������������ ������ ';
      MC_UNKNOWNFUNC:TxtMistake:=ProgMess[543]; //' ����������� ������� ';
      MC_INVALIDNUMBER:TxtMistake:=ProgMess[544]; //' ������� ���������� ����� ';
      MC_LOSTOPERATOR:TxtMistake:=ProgMess[545]; //' �������� �������� ';
      MC_INVALIDBRACKETS:TxtMistake:=ProgMess[546]; //' ������� ������ ';
      MC_LOSTNUMBER:TxtMistake:=ProgMess[547]; //' ��������� ����� ';
      MC_INVALIDSTRUCTURE:TxtMistake:=ProgMess[548]; //' �������� ��������� ';
      MC_FUNCTIONERROR:TxtMistake:=ProgMess[549]; //' ������! ��� ����� �� ������� ���������... ';
    end;
//   Result:=Copy(Text,1,MistakePosition)+' ?'+;
   for i:=1 to MistakePosition do
    if (FFormulText[i]<> #10) and (FFormulText[i] <> #13) then Result:= Result + FFormulText[i];
   Result:=Result+' ?'+ TxtMistake;    //NewStr{
   end;
end;
{function GetPi(x:extended):extended;
begin
  Result:=3.1415926535897932384626433832795; // :-)
end;

function GetSinus(x:extended):extended;
begin
  Result:=Sin(x);
end;

function GetCosinus(x:extended):extended;
begin
  Result:=Cos(x);
end;

function GetTg(x:extended):extended;
begin
  Result:=Tan(x);
end;

function GetCtg(x:extended):extended;
begin
  Result:=1/Tan(x);
end;

function GetLn(x:extended):extended;
begin
  Result:=Ln(x);
end;

function GetExp(x:extended):extended;
begin
  Result:=Exp(x);
end;

function GetLog(x:extended):extended;
begin
  Result:=Log10(x);
end;

function GetNul(x:extended):extended;
begin
  Result:=0;
end;

function GetSqrt(x:extended):extended;
begin
  Result:=Sqrt(x);
end;  }

function GetLoadValue(x:extended):extended;
var st:string;
begin
  Result:=Formula.FActCtr.Block[0].LoadXY(cOutBlock,TagToZone1(round(x)),Formula.FActCtr.TagToSens(round(x)),st);
end;

function GetRuleValue(x:extended):extended;
begin
  Result:=GetNowResRule(Formula.FActCtr, round(x));
end;

function GetFuncAddress(FuncName:string):pointer;
begin
  Result:=nil;
  if FuncName=FUNC_LOAD then Result:=@GetLoadValue;
  if FuncName=FUNC_RULE then Result:=@GetRuleValue;
{////  if FuncName='?????' then Result:=@GetSinus else
  if FuncName='SIN' then Result:=@GetSinus else
//  if FuncName='???????' then Result:=@GetCosinus else
  if FuncName='COS' then Result:=@GetCosinus else
  if FuncName='TG' then Result:=@GetTg else
  if FuncName='CTG' then Result:=@GetCtg else
  if FuncName='LOG' then Result:=@GetLog else
  if FuncName='LN' then Result:=@GetLn else
//  if FuncName='??????' then Result:=@GetSqrt else
  if FuncName='SQRT' then Result:=@GetSqrt else
//  if FuncName='????' then Result:=@GetExp else
  if FuncName='EXP' then Result:=@GetExp else
  if FuncName='NULL' then Result:=@GetNul else
//  if FuncName='??' then Result:=@GetPi; }
end;


{procedure Register;
begin
  RegisterComponents('Samples', [TFormula]);
end;
}
initialization
  Formula:=TFormula.Create(nil);
finalization
   Formula.Destroy;
end.
