unit Ethernet;

interface

implementation

procedure TFPort.EthernetSend;
var HeadTrue:Boolean;
cmdarg: integer;
begin
try
 case SelectSend of
1: begin
  TxtPortResult.Caption:='��������� ����������';
  wVersionRequested:=MAKEWORD(2,2);
  err:=WSAStartup(wVersionRequested,wsData);
  err:=0;

  s:=socket(AF_INET,SOCK_STREAM,0);
  err:=WSAGETLASTERROR;
  if (err<>0) then
  begin
    TxtPortResult.Caption:='������ �������� ������';
    exit;
  end;
  Inaddr.sin_family:=AF_INET;
  Inaddr.sin_addr.S_addr:=inet_addr(!�������� IP �����!);
  Inaddr.sin_port:=htons(3434);
  connect(s,Inaddr,sizeof(Inaddr));
  err:=WSAGETLASTERROR();
  if (err<>0) then
  begin
    TxtPortResult.Caption:='���������� � ������� �� ������'+IntToStr(err);
    closesocket(s);
    SelectSend:=0;
    exit;
  end;
 cmdarg:=0;
 ioctlsocket(s,FIONBIO,cmdarg);
 send(s,Head,cSizeHead,0);
 SelectSend:=SelectSend+1;
 end;
2: begin
 TxtPortResult.Caption:='����� ������ �� ���������';
 rNumUnit[1]:=0;
 //------ ����� ���������� ����� � ���������
 recv(s,rNumUnit,1,0);
 err:=WSAGETLASTERROR();
 if (err=WSAEWOULDBLOCK) then exit;
 if (err<>0) then
 begin
    closesocket(s);
    SelectSend:=0;
 end;

//------- �������� ������ �� ���������
 ModeCheckByte:=(Not Head[posDirect] = rNumUnit[1])
  or ((PortVersion < 2) and (Head[posDirect] = (rNumUnit[1]-1)));
 HeadTrue:= (PortVersion <> 1) and (Head[posDirect] = rNumUnit[1]);
 if Not ModeCheckByte and  Not HeadTrue
// PortVersion <> 0 (Head[posDirect] <> rNumUnit[1])
   then
    begin
    TxtPortResult.Caption:=ProgMess[157];
    closesocket(s);
    SelectSend:=0;
    Exit;
    end;
//------ ����� - �������� ������
 if ActivBlock <> nil then ActivBlock.Ready:=false;
  SelectSend:=SelectSend+1; end;
3:
  begin
 TxtPortResult.Caption:='�����/�������� ������';

  if Direct=IN_UNIT then
  begin
    send(s,BufSend^,SizeSend,0);
  end
  else
  begin
    recv(s,BufSend^,SizeSend,0);
  end;
  if (err=WSAEWOULDBLOCK) then exit;
  if (err<>0) then
  begin
    closesocket(s);
    SelectSend:=0;
  end;
  SelectSend:=SelectSend+1;
  end;
4: begin
   TxtPortResult.Caption:='��������� ������';

    if Not ModeCheckByte then begin GoodSend; Exit; end;
    rNumUnit[1]:=11;
    RWTransferBytes:=0;
 //------ ����� ����������� �����
    recv(s,rNumUnit,1,0);
    if (err=WSAEWOULDBLOCK) then exit;
    if (err<>0) then
    begin
      closesocket(s);
      SelectSend:=0;
    end;
    SelectSend:=SelectSend+1;
    end;
5: begin
 if (CheckSum(PByteArray(BufSend),SizeSend) <> rNumUnit[1]) then
    begin
    TxtPortResult.Caption:='False Check Sum';
    SelectSend:=0;
    Exit;
    end;
 GoodSend;
 end
else SelectSend:=0;
end;
except
  TxtPortResult.Caption:='Port Error '+IntToStr(SelectSend);
  SelectSend:=0;
end;
end;

end.
