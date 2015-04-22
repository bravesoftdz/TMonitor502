unit DefineBoil;

interface

uses FConstType, FController,MessageU, BoilConfig;

const
//    sumBoilers  = 4;
//    sumGroups   = 9;
    SumTask = 10; // ���������� �������� �������
    SumElTask=40;

//*********************************************************************
//***************** ��������� � ��������� ������ ��� ******************
//*********************************************************************
     // ������ ���������� � ��������� cDefineMech
DZM_NBOIL         = 1;
DZM_NGROUP        = 2;

DZM_STORAGE       = 1;

DZM_GRVALVE1      = 7;
DZM_GRVALVE2      = 8;
DZM_GRVALVE3      = 9;
DZM_GRVALVE4      = 10;
DZM_GRVALVE5      = 11;
DZM_GRVALVE6      = 12;
DZM_GRVALVE7      = 13;
DZM_GRVALVE8      = 14;
DZM_GRVALVE9      = 15;
DZM_GRVALVE10     = 16;

DZM_BURN1         = 17;
DZM_BURN2         = 18;
DZM_BURN3         = 19;
DZM_BURN4         = 20;
DZM_BURN5         = 21;
DZM_BURN6         = 22;

DZM_BVALVE1       = 23;
DZM_BVALVE2       = 24;
DZM_BVALVE3       = 25;
DZM_BVALVE4       = 26;
DZM_BVALVE5       = 27;
DZM_BVALVE6       = 28;

DZM_BREGPUMP1     = 29;
DZM_BREGPUMP2     = 30;
DZM_BREGPUMP3     = 31;
DZM_BREGPUMP4     = 32;
DZM_BREGPUMP5     = 33;
DZM_BREGPUMP6     = 34;

DZM_BSHMIX1       = 35;
DZM_BSHMIX2       = 36;
DZM_BSHMIX3       = 37;
DZM_BSHMIX4       = 38;
DZM_BSHMIX5       = 39;
DZM_BSHMIX6       = 40;

DZM_BCOND1        = 41;
DZM_BCOND2        = 42;
DZM_BCOND3        = 43;
DZM_BCOND4        = 44;
DZM_BCOND5        = 45;
DZM_BCOND6        = 46;

DZM_HPMIX1        = 47;
DZM_HPMIX2        = 48;
DZM_HPMIX3        = 49;
DZM_HPMIX4        = 50;
DZM_HPMIX5        = 51;
DZM_HPMIX6        = 52;
DZM_HPMIX7        = 53;
DZM_HPMIX8        = 54;
DZM_HPMIX9        = 55;
DZM_HPMIX10        = 56;

DZM_HPVALVE1      = 57;
DZM_HPVALVE2      = 58;
DZM_HPVALVE3      = 59;
DZM_HPVALVE4      = 60;
DZM_HPVALVE5      = 61;
DZM_HPVALVE6      = 62;
DZM_HPVALVE7      = 63;
DZM_HPVALVE8      = 64;
DZM_HPVALVE9      = 65;
DZM_HPVALVE10     = 66;


DZM_ECOVALVE      = 67;

DZM_GRPUMP1       = 68;
DZM_GRPUMP2       = 69;
DZM_GRPUMP3       = 70;
DZM_GRPUMP4       = 71;
DZM_GRPUMP5       = 72;
DZM_GRPUMP6       = 73;
DZM_GRPUMP7       = 74;
DZM_GRPUMP8       = 75;
DZM_GRPUMP9       = 76;
DZM_GRPUMP10      = 77;

DZM_BoilON1       = 78;
DZM_BoilON2       = 79;
DZM_BoilON3       = 80;
DZM_BoilON4       = 81;
DZM_BoilON5       = 82;
DZM_BoilON6       = 83;

DZM_BoilCtrl1     = 84;
DZM_BoilCtrl2     = 85;
DZM_BoilCtrl3     = 86;
DZM_BoilCtrl4     = 87;
DZM_BoilCtrl5     = 88;
DZM_BoilCtrl6     = 89;

DZM_BPUMP1        = 90;
DZM_BPUMP2        = 91;
DZM_BPUMP3        = 92;
DZM_BPUMP4        = 93;
DZM_BPUMP5        = 94;
DZM_BPUMP6        = 95;

DZM_BSHPUMP1      = 96;
DZM_BSHPUMP2      = 97;
DZM_BSHPUMP3      = 98;
DZM_BSHPUMP4      = 99;
DZM_BSHPUMP5      = 100;
DZM_BSHPUMP6      = 101;

DZM_BCONPUMP1     = 102;
DZM_BCONPUMP2     = 103;
DZM_BCONPUMP3     = 104;
DZM_BCONPUMP4     = 105;
DZM_BCONPUMP5     = 106;
DZM_BCONPUMP6     = 107;

DZM_BREZPUMP1     = 108;
DZM_BREZPUMP2     = 109;
DZM_BREZPUMP3     = 110;
DZM_BREZPUMP4     = 111;
DZM_BREZPUMP5     = 112;
DZM_BREZPUMP6     = 113;


DZM_COVENT1       = 114;
DZM_COVENT2       = 115;
DZM_COVENT3       = 116;
DZM_COVENT4       = 117;
DZM_COVENT5       = 118;
DZM_COVENT6       = 119;

DZM_PANELON1      = DZM_COVENT6+1;
DZM_PANELON2      = DZM_COVENT6+2;
DZM_PANELON3      = DZM_COVENT6+3;
DZM_PANELON4      = DZM_COVENT6+4;
DZM_PANELON5      = DZM_COVENT6+5;
DZM_PANELON6      = DZM_COVENT6+6;
DZM_PANELON7      = DZM_COVENT6+7;
DZM_PANELON8      = DZM_COVENT6+8;
DZM_PANELON9      = DZM_COVENT6+9;
DZM_PANELON10     = DZM_COVENT6+10;
DZM_PANELON11     = DZM_COVENT6+11;
DZM_PANELON12     = DZM_COVENT6+12;
DZM_PANELON13     = DZM_COVENT6+13;
DZM_PANELON14     = DZM_COVENT6+14;
DZM_PANELON15     = DZM_COVENT6+15;
DZM_PANELON16     = DZM_COVENT6+16;
DZM_PANELON17     = DZM_COVENT6+17;
DZM_PANELON18     = DZM_COVENT6+18;
DZM_PANELON19     = DZM_COVENT6+19;
DZM_PANELON20     = DZM_COVENT6+20;
DZM_PANELON21     = DZM_COVENT6+21;
DZM_PANELON22     = DZM_COVENT6+22;
DZM_PANELON23     = DZM_COVENT6+23;
DZM_PANELON24     = DZM_COVENT6+24;
DZM_PANELON25     = DZM_COVENT6+25;
DZM_PANELON26     = DZM_COVENT6+26;
DZM_PANELON27     = DZM_COVENT6+27;
DZM_PANELON28     = DZM_COVENT6+28;
DZM_PANELON29     = DZM_COVENT6+29;
DZM_PANELON30     = DZM_COVENT6+30;
DZM_PANELON31     = DZM_COVENT6+31;
DZM_PANELON32     = DZM_COVENT6+32;
DZM_PANELON33     = DZM_COVENT6+33;
DZM_PANELON34     = DZM_COVENT6+34;
DZM_PANELON35     = DZM_COVENT6+35;
DZM_PANELON36     = DZM_COVENT6+36;
DZM_PANELON37     = DZM_COVENT6+37;
DZM_PANELON38     = DZM_COVENT6+38;
DZM_PANELON39     = DZM_COVENT6+39;
DZM_PANELON40     = DZM_COVENT6+40;
DZM_PANELON41     = DZM_COVENT6+41;
DZM_PANELON42     = DZM_COVENT6+42;
DZM_PANELON43     = DZM_COVENT6+43;
DZM_PANELON44     = DZM_COVENT6+44;
DZM_PANELON45     = DZM_COVENT6+45;
DZM_PANELON46     = DZM_COVENT6+46;
DZM_PANELON47     = DZM_COVENT6+47;
DZM_PANELON48     = DZM_COVENT6+48;
DZM_PANELON49     = DZM_COVENT6+49;
DZM_PANELON50     = DZM_COVENT6+50;
DZM_PANELON51     = DZM_COVENT6+51;
DZM_PANELON52     = DZM_COVENT6+52;
DZM_PANELON53     = DZM_COVENT6+53;
DZM_PANELON54     = DZM_COVENT6+54;
DZM_PANELON55     = DZM_COVENT6+55;
DZM_PANELON56     = DZM_COVENT6+56;
DZM_PANELON57     = DZM_COVENT6+57;
DZM_PANELON58     = DZM_COVENT6+58;
DZM_PANELON59     = DZM_COVENT6+59;
DZM_PANELON60     = DZM_COVENT6+60;
DZM_PANELON61     = DZM_COVENT6+61;
DZM_PANELON62     = DZM_COVENT6+62;
DZM_PANELON63     = DZM_COVENT6+63;
DZM_PANELON64     = DZM_COVENT6+64;
DZM_PANELON65     = DZM_COVENT6+65;
DZM_PANELON66     = DZM_COVENT6+66;
DZM_PANELON67     = DZM_COVENT6+67;
DZM_PANELON68     = DZM_COVENT6+68;
DZM_PANELON69     = DZM_COVENT6+69;
DZM_PANELON70     = DZM_COVENT6+70;
DZM_PANELON71     = DZM_COVENT6+71;
DZM_PANELON72     = DZM_COVENT6+72;
DZM_PANELON73     = DZM_COVENT6+73;
DZM_PANELON74     = DZM_COVENT6+74;
DZM_PANELON75     = DZM_COVENT6+75;
DZM_PANELON76     = DZM_COVENT6+76;
DZM_PANELON77     = DZM_COVENT6+77;
DZM_PANELON78     = DZM_COVENT6+78;
DZM_PANELON79     = DZM_COVENT6+79;
DZM_PANELON80     = DZM_COVENT6+80;
DZM_PANELON81     = DZM_COVENT6+81;
DZM_PANELON82     = DZM_COVENT6+82;
DZM_PANELON83     = DZM_COVENT6+83;
DZM_PANELON84     = DZM_COVENT6+84;
DZM_PANELON85     = DZM_COVENT6+85;
DZM_PANELON86     = DZM_COVENT6+86;
DZM_PANELON87     = DZM_COVENT6+87;
DZM_PANELON88     = DZM_COVENT6+88;
DZM_PANELON89     = DZM_COVENT6+89;
DZM_PANELON90     = DZM_COVENT6+90;
DZM_PANELON91     = DZM_COVENT6+91;
DZM_PANELON92     = DZM_COVENT6+92;
DZM_PANELON93     = DZM_COVENT6+93;
DZM_PANELON94     = DZM_COVENT6+94;
DZM_PANELON95     = DZM_COVENT6+95;
DZM_PANELON96     = DZM_COVENT6+96;
DZM_PANELON97     = DZM_COVENT6+97;
DZM_PANELON98     = DZM_COVENT6+98;
DZM_PANELON99     = DZM_COVENT6+99;
DZM_PANELON100    = DZM_COVENT6+100;
DZM_PANELON101    = DZM_COVENT6+101;
DZM_PANELON102     = DZM_COVENT6+102;
DZM_PANELON103     = DZM_COVENT6+103;
DZM_PANELON104     = DZM_COVENT6+104;
DZM_PANELON105     = DZM_COVENT6+105;
DZM_PANELON106     = DZM_COVENT6+106;
DZM_PANELON107     = DZM_COVENT6+107;
DZM_PANELON108     = DZM_COVENT6+108;
DZM_PANELON109     = DZM_COVENT6+109;
DZM_PANELON110     = DZM_COVENT6+110;
DZM_PANELON111     = DZM_COVENT6+111;
DZM_PANELON112     = DZM_COVENT6+112;
DZM_PANELON113     = DZM_COVENT6+113;
DZM_PANELON114     = DZM_COVENT6+114;
DZM_PANELON115     = DZM_COVENT6+115;
DZM_PANELON116     = DZM_COVENT6+116;
DZM_PANELON117     = DZM_COVENT6+117;
DZM_PANELON118     = DZM_COVENT6+118;
DZM_PANELON119     = DZM_COVENT6+119;
DZM_PANELON120     = DZM_COVENT6+120;
DZM_PANELON121     = DZM_COVENT6+121;
DZM_PANELON122     = DZM_COVENT6+122;
DZM_PANELON123     = DZM_COVENT6+123;
DZM_PANELON124     = DZM_COVENT6+124;
DZM_PANELON125     = DZM_COVENT6+125;
DZM_PANELON126     = DZM_COVENT6+126;
DZM_PANELON127     = DZM_COVENT6+127;
DZM_PANELON128     = DZM_COVENT6+128;
DZM_PANELON129     = DZM_COVENT6+129;
DZM_PANELON130     = DZM_COVENT6+130;
DZM_PANELON131     = DZM_COVENT6+131;
DZM_PANELON132     = DZM_COVENT6+132;
DZM_PANELON133     = DZM_COVENT6+133;
DZM_PANELON134     = DZM_COVENT6+134;
DZM_PANELON135     = DZM_COVENT6+135;
DZM_PANELON136     = DZM_COVENT6+136;
DZM_PANELON137     = DZM_COVENT6+137;
DZM_PANELON138     = DZM_COVENT6+138;
DZM_PANELON139     = DZM_COVENT6+139;
DZM_PANELON140     = DZM_COVENT6+140;
DZM_PANELON141     = DZM_COVENT6+141;
DZM_PANELON142     = DZM_COVENT6+142;
DZM_PANELON143     = DZM_COVENT6+143;
DZM_PANELON144     = DZM_COVENT6+144;
DZM_PANELON145     = DZM_COVENT6+145;
DZM_PANELON146     = DZM_COVENT6+146;
DZM_PANELON147     = DZM_COVENT6+147;
DZM_PANELON148     = DZM_COVENT6+148;
DZM_PANELON149     = DZM_COVENT6+149;
DZM_PANELON150    = DZM_COVENT6+150;

DZM_GRON1           = DZM_PANELON150+1;
DZM_GRON2           = DZM_PANELON150+2;
DZM_GRON3           = DZM_PANELON150+3;
DZM_GRON4           = DZM_PANELON150+4;
DZM_GRON5           = DZM_PANELON150+5;
DZM_GRON6           = DZM_PANELON150+6;
DZM_GRON7           = DZM_PANELON150+7;
DZM_GRON8           = DZM_PANELON150+8;
DZM_GRON9           = DZM_PANELON150+9;
DZM_GRON10          = DZM_PANELON150+10;
DZM_GRON11          = DZM_PANELON150+11;
DZM_GRON12          = DZM_PANELON150+12;
DZM_GRON13          = DZM_PANELON150+13;
DZM_GRON14          = DZM_PANELON150+14;
DZM_GRON15          = DZM_PANELON150+15;
DZM_GRON16          = DZM_PANELON150+16;
DZM_GRON17          = DZM_PANELON150+17;
DZM_GRON18          = DZM_PANELON150+18;
DZM_GRON19          = DZM_PANELON150+19;
DZM_GRON20          = DZM_PANELON150+20;

DZM_GRLIGHT1        = DZM_GRON20+1;
DZM_GRLIGHT2        = DZM_GRON20+2;
DZM_GRLIGHT3        = DZM_GRON20+3;
DZM_GRLIGHT4        = DZM_GRON20+4;
DZM_GRLIGHT5        = DZM_GRON20+5;
DZM_GRLIGHT6        = DZM_GRON20+6;
DZM_GRLIGHT7        = DZM_GRON20+7;
DZM_GRLIGHT8        = DZM_GRON20+8;
DZM_GRLIGHT9        = DZM_GRON20+9;
DZM_GRLIGHT10       = DZM_GRON20+10;
DZM_GRLIGHT11       = DZM_GRON20+11;
DZM_GRLIGHT12       = DZM_GRON20+12;
DZM_GRLIGHT13       = DZM_GRON20+13;
DZM_GRLIGHT14       = DZM_GRON20+14;
DZM_GRLIGHT15       = DZM_GRON20+15;
DZM_GRLIGHT16       = DZM_GRON20+16;
DZM_GRLIGHT17       = DZM_GRON20+17;
DZM_GRLIGHT18       = DZM_GRON20+18;
DZM_GRLIGHT19       = DZM_GRON20+19;
DZM_GRLIGHT20       = DZM_GRON20+20;

DZM_HPON1           = DZM_GRLIGHT20+1;
DZM_HPON2           = DZM_GRLIGHT20+2;
DZM_HPON3           = DZM_GRLIGHT20+3;
DZM_HPON4           = DZM_GRLIGHT20+4;
DZM_HPON5           = DZM_GRLIGHT20+5;
DZM_HPON6           = DZM_GRLIGHT20+6;
DZM_HPON7           = DZM_GRLIGHT20+7;
DZM_HPON8           = DZM_GRLIGHT20+8;
DZM_HPON9           = DZM_GRLIGHT20+9;
DZM_HPON10          = DZM_GRLIGHT20+10;

DZM_LightOk1        = DZM_HPON10+1;
DZM_LightOk2        = DZM_HPON10+2;
DZM_LightOk3        = DZM_HPON10+3;
DZM_LightOk4        = DZM_HPON10+4;
DZM_LightOk5        = DZM_HPON10+5;
DZM_LightOk6        = DZM_HPON10+6;
DZM_LightOk7        = DZM_HPON10+7;
DZM_LightOk8        = DZM_HPON10+8;
DZM_LightOk9        = DZM_HPON10+9;
DZM_LightOk10       = DZM_HPON10+10;

DZM_BoilFeed1       = DZM_LightOk10+1;
DZM_BoilFeed2       = DZM_LightOk10+2;
DZM_BoilFeed3       = DZM_LightOk10+3;
DZM_BoilFeed4       = DZM_LightOk10+4;
DZM_BoilFeed5       = DZM_LightOk10+5;
DZM_BoilFeed6       = DZM_LightOk10+6;

DZM_BoilAlrm1       = DZM_BoilFeed6+1;
DZM_BoilAlrm2       = DZM_BoilFeed6+2;
DZM_BoilAlrm3       = DZM_BoilFeed6+3;
DZM_BoilAlrm4       = DZM_BoilFeed6+4;
DZM_BoilAlrm5       = DZM_BoilFeed6+5;
DZM_BoilAlrm6       = DZM_BoilFeed6+6;

DZM_COAlrm1         = DZM_BoilAlrm6+1;
DZM_COAlrm2         = DZM_BoilAlrm6+2;
DZM_COAlrm3         = DZM_BoilAlrm6+3;
DZM_COAlrm4         = DZM_BoilAlrm6+4;
DZM_COAlrm5         = DZM_BoilAlrm6+5;
DZM_COAlrm6         = DZM_BoilAlrm6+6;

DZM_COReq1          = DZM_COAlrm6+1;
DZM_COReq2          = DZM_COAlrm6+2;
DZM_COReq3          = DZM_COAlrm6+3;
DZM_COReq4          = DZM_COAlrm6+4;
DZM_COReq5          = DZM_COAlrm6+5;
DZM_COReq6          = DZM_COAlrm6+6;


DZM_GRAlrm1         = DZM_COReq6+1;
DZM_GRAlrm2         = DZM_COReq6+2;
DZM_GRAlrm3         = DZM_COReq6+3;
DZM_GRAlrm4         = DZM_COReq6+4;
DZM_GRAlrm5         = DZM_COReq6+5;
DZM_GRAlrm6         = DZM_COReq6+6;
DZM_GRAlrm7         = DZM_COReq6+7;
DZM_GRAlrm8         = DZM_COReq6+8;
DZM_GRAlrm9         = DZM_COReq6+9;
DZM_GRAlrm10        = DZM_COReq6+10;
DZM_GRAlrm11        = DZM_COReq6+11;
DZM_GRAlrm12        = DZM_COReq6+12;
DZM_GRAlrm13        = DZM_COReq6+13;
DZM_GRAlrm14        = DZM_COReq6+14;
DZM_GRAlrm15        = DZM_COReq6+15;
DZM_GRAlrm16        = DZM_COReq6+16;
DZM_GRAlrm17        = DZM_COReq6+17;
DZM_GRAlrm18        = DZM_COReq6+18;
DZM_GRAlrm19        = DZM_COReq6+19;
DZM_GRAlrm20        = DZM_COReq6+20;

DZM_HPREQ1          = DZM_GRAlrm20+1;
DZM_HPREQ2          = DZM_GRAlrm20+2;
DZM_HPREQ3          = DZM_GRAlrm20+3;
DZM_HPREQ4          = DZM_GRAlrm20+4;
DZM_HPREQ5          = DZM_GRAlrm20+5;
DZM_HPREQ6          = DZM_GRAlrm20+6;
DZM_HPREQ7          = DZM_GRAlrm20+7;
DZM_HPREQ8          = DZM_GRAlrm20+8;
DZM_HPREQ9          = DZM_GRAlrm20+9;
DZM_HPREQ10         = DZM_GRAlrm20+10;

DZM_HPOK1           = DZM_HPREQ10+1;
DZM_HPOK2           = DZM_HPREQ10+2;
DZM_HPOK3           = DZM_HPREQ10+3;
DZM_HPOK4           = DZM_HPREQ10+4;
DZM_HPOK5           = DZM_HPREQ10+5;
DZM_HPOK6           = DZM_HPREQ10+6;
DZM_HPOK7           = DZM_HPREQ10+7;
DZM_HPOK8           = DZM_HPREQ10+8;
DZM_HPOK9           = DZM_HPREQ10+9;
DZM_HPOK10          = DZM_HPREQ10+10;

DZM_HPINFO1         = DZM_HPOK10+1;
DZM_HPINFO2         = DZM_HPOK10+2;
DZM_HPINFO3         = DZM_HPOK10+3;
DZM_HPINFO4         = DZM_HPOK10+4;
DZM_HPINFO5         = DZM_HPOK10+5;
DZM_HPINFO6         = DZM_HPOK10+6;
DZM_HPINFO7         = DZM_HPOK10+7;
DZM_HPINFO8         = DZM_HPOK10+8;
DZM_HPINFO9         = DZM_HPOK10+9;
DZM_HPINFO10        = DZM_HPOK10+10;

DZM_FATAL           = DZM_HPINFO10+1;
DZM_COMALR          = DZM_HPINFO10+2;
DZM_CONTROL         = DZM_HPINFO10+3;

DZM_EXTTANK         = DZM_HPINFO10+4;
DZM_RESET           = DZM_HPINFO10+5;
DZM_FIRE            = DZM_HPINFO10+6;
DZM_TANKNITRO       = DZM_HPINFO10+7;
DZM_PUMPSALARM      = DZM_HPINFO10+8;

DZM_COLLZERO        = DZM_HPINFO10+9;
DZM_BUSNET          = DZM_COLLZERO+6;


type GlobalHotRecord=record
      News:Byte;      //0
      Time:InInt;     //1
      Date:InInt;     //3
      Year:Byte;      //5
      Hand:Byte;      //6
      TaskForGroups:array [1..10] of InInt;       //7
      TaskForCO2:array [1..6] of InInt;     //27
      Power:array[1..2] of InInt;          //39
//      WarmNet:TrHotBoilGroups;
//      ClientMC:array[1..SumBoilClient] of TrClientMC;
//      Meteo:TrHotBoilMeteo;
      PIDPos:   array [1..eMAX_SUM_PID] of Byte;  //39
      Pump:     array[1..eMAX_SUM_PUMP] of Byte;  //119
      PIDRCS:   array[1..eMAX_SUM_PID] of Byte;   //79
//      PumpRCS:     array[1..eMAX_SUM_PUMP] of Byte;  //119
      SensValue:array[1..eMAX_SUM_SENS] of InInt; //149
      SensRCS:  array[1..eMAX_SUM_SENS] of Byte;  //233
      InputReg: array[1..4] of Byte;              //275
      Calc:     array[1..eMAX_SUM_CALC] of InInt; //279
      ClientsData:array[1..60] of Byte;            //579    SumClientsData = 30;
      end;
const



      boil_iTimeBoil   = 1;
      iComPower=39;

      iValidData  =6;
      iPCSun      =41;

      iPIDPos     = 43; // ������ ��������� ������������ Hot
      iPump       = iPIDPos+eMAX_SUM_PID;
      iPIDRCS     = iPump+eMAX_SUM_PUMP;
      iInputs     = iPIDRCS+eMAX_SUM_PID;
      iSensValue  = iInputs+eMAX_SUM_INPUT;
      iSensRCS    = iSensValue+eMAX_SUM_SENS*2;
      iCalc       = iSensRCS+eMAX_SUM_SENS;

      iPIDGrMix   = iPIDPos;     //������������ ������ ������
      iPIDBurn    = iPIDGrMix+eSumGroups; //��������� ��������� �������
      iPIDBlMix   = iPIDBurn+eSumBoilers; //C����������� ������ �����
      iPIDBlPmp   = iPIDBlMix+eSumBoilers; //��������� ��������� ������ �����
      iPIDShMix = iPIDBlPmp+eSumBoilers; //��������� ��������� ������ �����
      iPIDCondMix = iPIDShMix+eSumBoilers; //��������� ��������� ������ �����
      iPIDHPMix   = iPIDCondMix+eSumBoilers;
      iPIDHPVal   = iPIDHPMix+eSumHPUnits;
      iPIDEco     = iPIDHPVal+eSumHPUnits; //��������� ������������

      irPIDGrMix   = iPIDRCS;     //������������ ������ ������
      irPIDBurn    = irPIDGrMix+eSumGroups; //��������� ��������� �������
      irPIDBlMix   = irPIDBurn+eSumBoilers; //C����������� ������ �����
      irPIDBlPmp   = irPIDBlMix+eSumBoilers; //��������� ��������� ������ �����
      irPIDShMix   = irPIDBlPmp+eSumBoilers; //��������� ��������� ������ �����
      irPIDCondMix = irPIDShMix+eSumBoilers; //��������� ��������� ������ �����
      irPIDHPMix   = irPIDCondMix+eSumBoilers;
      irPIDHPVal   = irPIDHPMix+eSumHPUnits;
      irPIDEco     = irPIDHPVal+eSumHPUnits; //��������� ������������

      iRlGrPmp    = iPump;      //����� ������
      iRlBlOn     = iRlGrPmp+eSumGroups;
      iRlBlCtrl   = iRlBlOn+eSumBoilers;
      iRlBlPmp    = iRlBlCtrl+eSumBoilers; //����� �����
      iRlShPmp    = iRlBlPmp+eSumBoilers; //����� ������ �� ����
      iRlCondPmp    = iRlShPmp+eSumBoilers; //����� ������ �� ����
      iRlRezPmp    = iRlCondPmp+eSumBoilers; //����� ������ �� ����
      iRlCO2      = iRlRezPmp+eSumBoilers; //���������� ��2
      iRlPanelOn  = iRlCO2+eSumCO2Units;      //�������� ���
      iRlGrOn     = iRlPanelOn+eSumPanels;
      iRlGrLight   = iRlGrOn+eSumElGroups;
      iRlHPOn     = iRlGrLight+eSumElGroups;
      iRlLightOK  = iRlHPOn+eSumHPUnits;
      iRlCtrlOK   = iRlLightOK+eSumHPUnits;
      iRlFatal    = iRlCtrlOK+1;
      iRlCommonAlr= iRlFatal+1;



      iLevBoil    = iInputs;
      iLevAlrBoil = iLevBoil+eSumBoilers;
      iLevAlrCO2  = iLevAlrBoil+eSumBoilers;
      iLevCO2Req  = iLevAlrCO2+eSumCO2Units;
      iLevAlrGr   = iLevCO2Req+eSumCO2Units;
      iLevHPOn    = iLevAlrGr+eSumElGroups;
      iLevHPReq   = iLevHPOn+eSumHPUnits;
      iLevAlrTank = iLevHPReq+eSumHPUnits;
      iLevReset   = iLevAlrTank+1;
      iLevFire    = iLevReset+1;
      iLevFilling = iLevFire+1;
      iLevPumpAlarm= iLevFilling+1;

      iSensGrTemp   =iSensValue;                  //����������� ������
      iSensBlSTemp  =iSensGrTemp+eSumGroups*2;    //������ ���� �����
      iSensBlRSTemp =iSensBlSTemp+eSumBoilers*2;  //�������� ���� ����� ���
      iSensBlRTemp  =iSensBlRSTemp+eSumBoilers*2;  //�������� ���� �����
      iSensBlPBurn  =iSensBlRTemp+eSumBoilers*2;  //��������� �������
      iSensMSTemp   =iSensBlPBurn+eSumBoilers*2;  //������ ���� ����������
      iSensMRTemp   =iSensMSTemp+2;               //�������� ���� ����������
      iSensMSPres   =iSensMRTemp+2;               //�������� ������ ����������
      iSensMRPres   =iSensMSPres+2;               //�������� ������� ����������
      iSensTTTemp   =iSensMRPres+2;               //����������� ����� ����
      iSensTnkTemp  =iSensTTTemp+4;                    //����������� � ���� ������������
             //����������� � ���
      iSensFlows    =iSensTnkTemp+2*eSumTankSens;              //�������
      iSensHPSTemp  =iSensFlows+2*3;              //����������� � ���
      iSensHPRTemp  =iSensHPSTemp+2*eSumHPUnits;              //����������� � ���
      iSensHPCoolSTemp  =iSensHPRTemp+2*eSumHPUnits;              //����������� � ���
      iSensHPCoolRTemp  =iSensHPCoolSTemp+2*eSumHPUnits;              //����������� � ���
      iSensSun      =iSensHPCoolRTemp+2*eSumHPUnits;
      iSensInLight  =iSensSun+2;
      iSensLevel    =iSensInLight+2*10;
      iSensInTemp   =iSensLevel+2;
      iSensBurnGas  =iSensInTemp+2;

      iBoilCollect  =iCalc;                       //�������� ���� �����
      iBoilCTemp    =iBoilCollect+eSumBoilers*2;    //����������� ���� �����
      iBoilMinTemp  =iBoilCTemp+eSumBoilers*2;    //����������� ���� �����
      iBoilMode     =iBoilMinTemp+eSumBoilers*2;  //������������ ���� �����
      iBoilStatus   =iBoilMode+eSumBoilers*4;  //����� ������ �����
      iBoilPrior    =iBoilStatus+eSumBoilers*2;       //��������� ������ �����
      iBoilCPower   =iBoilPrior+eSumBoilers*2;      //��������� �������� �����
      iBoilPower    =iBoilCPower+eSumBoilers*2;   //�������� ��������
      iDiffCO2      =iBoilPower+eSumBoilers*2;    //�������� ��2
      iBoilRez1      =iDiffCO2+eSumBoilers*2;    //������
      iBoilRez2      =iBoilRez1+eSumBoilers*2;    //������

      iGroupTTemp   =7;      //������ ���� �����
      iGroupCTemp   =iBoilRez2+eSumBoilers*2+eSumGroups*2;    //��������� ���� �����
      iGroupMinTemp =iGroupCTemp+eSumGroups*2;    //����������� ���� �����
      iGroupStatus =iGroupMinTemp+eSumGroups*2;  //������������ ���� �����
      iGroupMode    =iGroupStatus+eSumGroups*2;  //����� ������ ������
      iGroupPres    =iGroupMode+eSumGroups*2;       //�������� ������� � ������
      iGroupRez1    =iGroupPres+eSumGroups*2;       //�������� ������� � ������
      iGroupRez2    =iGroupRez1+eSumGroups*2;       //�������� ������� � ������

      iClMaxPower   =iGroupRez2+eSumGroups*2;  //������ ��� ���
      iClOptPower   =iClMaxPower+eSumCollector*2;  //������ ��� ���
      iClMinPower   =iClOptPower+eSumCollector*2;  //����� ������ ���
      iClFullPower  =iClMinPower+eSumCollector*2;  //������ ���
      iClNBoils     =iClFullPower+eSumCollector*2;  //������ ���
      iClRez1       =iClNBoils+eSumCollector*2;  //������ ���
      iClRez2       =iClRez1+eSumCollector*2;  //������ ���

      iPanelTime    =iClRez2+eSumCollector*2;                       //����� ������ ���� �� ������� �����
      iPanelBurn    =iPanelTime+eSumPanels*2;    //������������ �������� �����
      iPanelRez     =iPanelBurn+eSumPanels*2;    //������������ �������� �����

      iElGroupTime    =iPanelRez+eSumPanels*2;    //����������� ���� �����
      iElGroupBurn    =iELGroupTime+eSumElGroups*2;  //������������ ���� �����
      iElGroupMode    =iElGroupBurn+eSumElGroups*2;  //����� ������ �����
      iElGroupStatus  =iELGroupMode+eSumElGroups*2;       //��������� ������ �����
      iElGroupPower   =iELGroupStatus+eSumElGroups*2;      //��������� �������� �����
      iElGroupSens    =iElGroupPower+eSumElGroups*2;      //��������� �������� �����
      iElGroupMaxL    =iElGroupSens+eSumElGroups*2;      //��������� �������� �����
      iElGroupMinL    =iElGroupMaxL+eSumElGroups*2;      //��������� �������� �����
      iElGroupLight   =iElGroupMinL+eSumElGroups*2;      //��������� �������� �����
      iElGroupRez1   =iElGroupLight+eSumElGroups*2;      //��������� �������� �����
      iElGroupRez2   =iElGroupRez1+eSumElGroups*2;      //��������� �������� �����

      iHPTime       =iElGroupRez2+eSumElGroups*2;      //������ ���� �����
      iHPBurn       =iHPTime+eSumHPUnits*2;    //��������� ���� �����
      iHPPower      =iHPBurn+eSumHPUnits*2;    //����������� ���� �����
      iHPAmp        =iHPPower+eSumHPUnits*2;  //������������ ���� �����
      iHPVoltage    =iHPAmp+eSumHPUnits*2;  //����� ������ ������
      iHPMode       =iHPVoltage+eSumHPUnits*2;       //�������� ������� � ������
      iHPStatus     =iHPMode+eSumHPUnits*2;       //�������� ������� � ������
      iHPRez1       =iHPStatus+eSumHPUnits*2;       //�������� ������� � ������
      iHPRez2       =iHPRez1+eSumHPUnits*2;       //�������� ������� � ������


      iBusMaxPower =iHPRez2+eSumHPUnits*2;      //������ ���� �����
      iBusNeedPower =iBusMaxPower+eSumHPUnits*2;      //������ ���� �����
      iBusFactPower =iBusNeedPower+eSumHPUnits*2;    //��������� ���� �����
      iBusNHPs      =iBusFactPower+eSumHPUnits*2;    //����������� ���� �����
      iBusRez1      =iBusNHPs+eSumHPUnits*2;    //����������� ���� �����
      iBusRez2      =iBusRez1+eSumHPUnits*2;    //����������� ���� �����

      iFullElPower  =iBusRez2+eSumHPUnits*2;
      iBurnElToday  =iFullElPower+2;

      iKeepSupply   =iBurnElToday+2;     //������� ����������� ������
      iDeltaP       =iKeepSupply+2;
      iFullPower    =iDeltaP+2;
      iCurrFilling  =iFullPower+4;
      iMaxFillingYD   =iCurrFilling+4;
      iMinFillingYD  =iMaxFillingYD+4;
      iCalcFSpeed   =iMinFillingYD+2;
      iPlusPower    =iCalcFSpeed+2;
      iCollectorMode=iPlusPower+2;
      iTankMode     =iCollectorMode+2;
      iMainMode     =iTankMode+2;
      iBoilPause    =iMainMode+2;

      iCO2Mode      =iBoilPause+4;
      iModuleCheck  =iCO2Mode+2;
      iEndOfHot     =iModuleCheck+38;

      cHotRecieveSize=iEndOfHot;
      iClientsData= cHotRecieveSize;
      cClientsDataSize=60;
      cHotFullSize=cHotRecieveSize+cClientsDataSize;


      SumValYHotBoilers =13;

//*********************************************************************
//******************  ���� ��������� ������  ******************
//*********************************************************************
DefHotBoilers:array [1..SumValYHotBoilers] of TNameConst=(
  (Name:'������^';Frm:ComboSSSS;Ed:'';TipSens:TipCalc;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iBoilCTemp; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensBlSTemp; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensBlRTemp; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipIzm;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensBlRSTemp; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� ��2';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:10;
        Def:HIDE_MIN_MAX;Index:iBoilCollect; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ������';Frm:ComboSSSS;Ed:'';TipSens:TipCalc;Min:comAutoOffOn;Max:comAutoOffOn+2;
        Def:HIDE_MIN_MAX;Index:iBoilMode; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� ������';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:10;
        Def:HIDE_MIN_MAX; Index:iBoilPrior; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),         //
  (Name:'����� ����� �����';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iPIDBlPmp; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��������';Frm:SSpSS;Ed:'M��';TipSens:TipCalc;Min:0;Max:15;
        Def:HIDE_MIN_MAX; Index:iBoilPower; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ��2 (������� ��� � �����)';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;
    Def:HIDE_MIN_MAX; Index:iDiffCO2; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 1';Frm:SSpSS;Ed:'M��';TipSens:TipCalc;Min:0;Max:15;
        Def:HIDE_MIN_MAX; Index:iBoilRez1; Mech:DZM_BURN1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 2';Frm:SSpSS;Ed:'M��';TipSens:TipCalc;Min:0;Max:15;
        Def:HIDE_MIN_MAX; Index:iBoilRez2; Mech:DZM_BURN1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );

//*********************************************************************
//******************  ���� ��������� ����� ���������  *****************
//*********************************************************************
      SumValHotGroups =11;
      pozGroupTask=3;
      pozCalcGroupPower=6;
DefBoilGroup:array [1..SumValHotGroups] of TNameConst=(
  (Name:'������^';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensGrTemp; Mech:DZM_GRVALVE1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:7; Mech:DZM_GRVALVE1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iGroupCTemp; Mech:DZM_GRVALVE1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ �������������';Frm:SSSpS;Ed:'�3/�';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iGroupMinTemp; Mech:DZM_GRVALVE1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iGroupMinTemp; Mech:DZM_GRVALVE1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'����� ������';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comModeGroup;Max:comModeGroup+3;
        Def:HIDE_MIN_MAX;Index:iGroupMode; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX;Index:iPIDGrMix; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� ������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;
        Def:HIDE_MIN_MAX;Index:iRlGrPmp; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 1';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comModeGroup;Max:comModeGroup+3;
        Def:HIDE_MIN_MAX;Index:iGroupRez1; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 2';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comModeGroup;Max:comModeGroup+3;
        Def:HIDE_MIN_MAX;Index:iGroupRez2; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );


//*********************************************************************
//******************  ���� ��������� �����������  *****************
//*********************************************************************
      SumValYHotCL =7;
DefHotCLs:array [1..SumValYHotCL] of TNameConst=(
  (Name:'������������ ��������^';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iClFullPower; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iClOptPower; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iClMaxPower; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iClMinPower; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� �����';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:10;
        Def:HIDE_MIN_MAX;Index:iClNBoils; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 1';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iClRez1; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 1';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX;Index:iClRez2; Mech:DZM_COLLZERO; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );


//*********************************************************************
//******************  ���� ��������� �����  ******************
//*********************************************************************
      SumValYHotPanels =4;
DHP_Status=1;
DHP_Time=3;
DefHotPanels:array [1..SumValYHotPanels] of TNameConst=(
  (Name:'������';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comOnOff;Max:comOnOff+1;
        Def:HIDE_MIN_MAX;Index:iRlPanelOn; Mech:DZM_PANELON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'M��*�';TipSens:TipCalc;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:iPanelBurn; Mech:DZM_PANELON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ������';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:2000;
        Def:HIDE_MIN_MAX; Index:iPanelTime; Mech:DZM_PANELON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:2000;
        Def:HIDE_MIN_MAX; Index:iPanelRez; Mech:DZM_PANELON1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );


//*********************************************************************
//******************  ���� ��������� ���  ******************
//*********************************************************************
      SumValYHotBus =6;
DefHotBus:array [1..SumValYHotBus] of TNameConst=(
  (Name:'������������ ��������^';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:30000;
        Def:HIDE_MIN_MAX; Index:iBusMaxPower; Mech:DZM_BUSNET; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20000;
        Def:HIDE_MIN_MAX; Index:iBusNeedPower; Mech:DZM_BUSNET; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��������';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:20000;
        Def:HIDE_MIN_MAX; Index:iBusFactPower; Mech:DZM_BUSNET; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���������� ���';Frm:SSSS;Ed:'';TipSens:TipSun;Min:0;Max:10;
    Def:HIDE_MIN_MAX; Index:iBusNHPs; Mech:DZM_BUSNET; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� ��������';Frm:SSSS;Ed:'���';TipSens:TipSun;Min:0;Max:30000;
    Def:HIDE_MIN_MAX; Index:iBusRez1; Mech:DZM_BUSNET; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 2';Frm:SSSS;Ed:'';TipSens:TipSun;Min:0;Max:10;
    Def:HIDE_MIN_MAX; Index:iBusRez2; Mech:DZM_BUSNET; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );


//*********************************************************************
//******************  ���� ���� �����  ******************
//*********************************************************************
SumValYPlanPanels =5;
DPP_NumGrp =1;
DPP_NumBus =5;

DefPlanPanels:array [1..SumValYPlanPanels] of TNameConst=(
  (Name:'����� ������^';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:20;
        Def:HIDE_MIN_MAX;Index:0; Mech:DZM_PANELON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���. ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:500;
        Def:HIDE_MIN_MAX; Index:eSumPanels*2; Mech:DZM_PANELON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ �� �����';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:60;
        Def:HIDE_MIN_MAX; Index:eSumPanels*4; Mech:DZM_PANELON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:60;
        Def:HIDE_MIN_MAX; Index:eSumPanels*6; Mech:DZM_PANELON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ����';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
        Def:HIDE_MIN_MAX; Index:eSumPanels*8; Mech:DZM_PANELON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER)
  );

//*********************************************************************
//******************  ���� ���� �����  ******************
//*********************************************************************
SumValYPlanElGroups =5;

DefPlanElGroups:array [1..SumValYPlanElGroups] of TNameConst=(
  (Name:'������^';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:10;
        Def:HIDE_MIN_MAX;Index:0; Mech:DZM_GRON1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'���������';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:20;
        Def:HIDE_MIN_MAX; Index:eSumElGroups*2; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��� ��������� 50%';Frm:SSSS;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:1000;
        Def:HIDE_MIN_MAX; Index:eSumElGroups*4; Mech:DZM_GRON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��� ��������� 100%';Frm:SSSS;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:1000;
        Def:HIDE_MIN_MAX; Index:eSumElGroups*6; Mech:DZM_GRON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������';Frm:SSSS;Ed:'��/��2';TipSens:TipIzm;Min:0;Max:1000;
        Def:HIDE_MIN_MAX; Index:eSumElGroups*8; Mech:DZM_GRON1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );
//*********************************************************************
//******************  ���� ���� ���  ******************
//*********************************************************************
SumValYPlanHPs =5;

DefPlanHPs:array [1..SumValYPlanHPs] of TNameConst=(
  (Name:'����� ����^';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:20;
        Def:HIDE_MIN_MAX;Index:0; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���. ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:10000;
        Def:HIDE_MIN_MAX; Index:eSumHPUnits*2; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:1;Max:10;
        Def:HIDE_MIN_MAX; Index:eSumHPUnits*4; Mech:DZM_HPON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�����';Frm:ComboSSSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
        Def:HIDE_MIN_MAX; Index:eSumHPUnits*6; Mech:DZM_HPON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:10;
        Def:HIDE_MIN_MAX; Index:eSumHPUnits*8; Mech:DZM_HPON1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );


//*********************************************************************
//******************  ���� ���� ������  ******************
//*********************************************************************
SumValYPlanBoilers =10;

DefPlanBoilers:array [1..SumValYPlanBoilers] of TNameConst=(
  (Name:'����� ����������^';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:6;
        Def:HIDE_MIN_MAX;Index:0; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*2; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ��������';Frm:SSpSS;Ed:'M��';TipSens:TipIzm;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*4; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������������� ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*12; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:2;Max:9;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*6; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���';Frm:ComboSSSS;Ed:'';TipSens:TipCalc;Min:comBoilMode;Max:comBoilMode+5;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*8; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� �����';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:20;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*10; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ � ������';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*14; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSSS;Ed:'%';TipSens:TipIzm;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*16; Mech:DZM_BURN1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 2';Frm:SSSS;Ed:'';TipSens:TipIzm;Min:0;Max:6;
        Def:HIDE_MIN_MAX; Index:eSumBoilers*18; Mech:DZM_BURN1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );

//*********************************************************************
//******************  ���� ���� CO2  ******************
//*********************************************************************
SumValYPlanCO =4;

DefPlanCO:array [1..SumValYPlanCO] of TNameConst=(
  (Name:'����� ����������^';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:6;
        Def:HIDE_MIN_MAX;Index:0; Mech:DZM_COVENT1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������';Frm:SSpSS;Ed:'M��';TipSens:TipCalc;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:eSumCO2Units*2; Mech:DZM_COVENT1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ��������';Frm:SSpSS;Ed:'M��';TipSens:TipIzm;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:eSumCO2Units*4; Mech:DZM_COVENT1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������';Frm:SSpSS;Ed:'M��';TipSens:TipIzm;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:eSumCO2Units*6; Mech:DZM_COVENT1; Tag:1; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );




//*********************************************************************
//******************  ���� ��������� ����� ��������  *****************
//*********************************************************************
      SumValYHotElGroups =11;
DEG_Time=4;
DEG_Proc=9;
DefElGroups:array [1..SumValYHotElGroups] of TNameConst=(
  (Name:'������^';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus; Mech:DZM_GRON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ������';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comModeElGroup;Max:comModeElGroup+2;
        Def:HIDE_MIN_MAX;Index:iELGroupMode; Mech:DZM_GRON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'M��*�';TipSens:TipCalc;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:iElGroupBurn; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ������';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:2000;
        Def:HIDE_MIN_MAX; Index:iElGroupTime; Mech:DZM_GRON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:20000;
        Def:HIDE_MIN_MAX; Index:iElGroupPower; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ������������';Frm:SSSS;Ed:'��';TipSens:TipCalc;Min:0;Max:1500;
        Def:HIDE_MIN_MAX; Index:iElGroupSens; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iElGroupMaxL; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iElGroupMinL; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ������������';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iElGroupLight; Mech:DZM_GRON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 1';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iElGroupRez1; Mech:DZM_GRON1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 2';Frm:SSSS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iElGroupRez2; Mech:DZM_GRON1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );


//*********************************************************************
//******************  ���� ��������� ���  *****************
//*********************************************************************
      SumValYHotHP =13;
DefHotHPs:array [1..SumValYHotHP] of TNameConst=(
  (Name:'������^';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus; Mech:DZM_HPON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ������';Frm:ComboSSSS;Ed:'';TipSens:TipControl;Min:comAutoOffOn;Max:comAutoOffOn+2;
        Def:HIDE_MIN_MAX;Index:iHPMode; Mech:DZM_HPON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ���� ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensHPSTemp; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ���� ���';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensHPRTemp; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensHPCoolSTemp; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensHPCoolRTemp; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'M��*�';TipSens:TipCalc;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:iHPBurn; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����� ������';Frm:SSSS;Ed:'���';TipSens:TipIzm;Min:0;Max:2000;
        Def:HIDE_MIN_MAX; Index:iHPTime; Mech:DZM_HPON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ��������';Frm:SSpSS;Ed:'M��';TipSens:TipCalc;Min:0;Max:50;
        Def:HIDE_MIN_MAX; Index:iHPPower; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��� ��������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:0;Max:1000;
        Def:HIDE_MIN_MAX; Index:iHPAmp; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iHPVoltage; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ 1';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iHPRez1; Mech:DZM_HPON1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 2';Frm:SSpSS;Ed:'��';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iHPRez2; Mech:DZM_HPON1; Tag:2; AccessR:RW_INVISIBLE; AccessW:RW_USER)
  );




//*********************************************************************
//******************  ���� ����� ������  *****************
//*********************************************************************

const SumValYCommonHot =73;
  posComPower=4;
  posCO2Task=47;
CommonHotName:array [1..SumValYCommonHot] of TNameConst=(
  (Name:'�������� �������^';Frm:ComboSSSS;Ed:'';TipSens:TipCalc;Min:comGroupMain;Max:comGroupMain+8;
        Def:HIDE_MIN_MAX;Index:iMainMode; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
//  (Name:'�������� ���������� ��2';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:6;
//        Def:HIDE_MIN_MAX;Index:iCollectorMode; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),  //iCO2Mode
  (Name:'���� ��������';Frm:SSSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:HIDE_MIN_MAX;Index:iCO2Mode; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������� ����';Frm:ComboSS;Ed:'';TipSens:TipCalc;Min:comGroupTank;Max:comGroupTank+8;
        Def:HIDE_MIN_MAX;Index:iTankMode; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ �������� �� ������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:99;
        Def:HIDE_MIN_MAX;Index:iComPower; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:99;
        Def:HIDE_MIN_MAX;Index:iFullPower; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'��������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:99;
        Def:HIDE_MIN_MAX;Index:iFullPower+2; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������� ��������� - ����������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iDeltaP; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ������ ���� - �������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iKeepSupply; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� ������ ���� - ��������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensMSTemp; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'����������� �������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensMRTemp; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������� ������ ����';Frm:SSpSS;Ed:'��/��';TipSens:TipCalc;Min:0;Max:13;
        Def:HIDE_MIN_MAX; Index:iSensMSPres; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������� �������� ����';Frm:SSpSS;Ed:'��/��';TipSens:TipCalc;Min:0;Max:13;
        Def:HIDE_MIN_MAX; Index:iSensMRPres; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'�������� �� ���������� ����';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:99;
        Def:HIDE_MIN_MAX;Index:iPlusPower; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������� ������������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipCalc;Min:0;Max:99;
        Def:HIDE_MIN_MAX;Index:iFullElPower; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������������ ������������� ��������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:99;
        Def:HIDE_MIN_MAX;Index:iBurnElToday; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'������ ���� �� �������';Frm:SSSpS;Ed:'�3/�*10';TipSens:TipCalc;Min:0;Max:2000;
        Def:HIDE_MIN_MAX;Index:iSensFlows+2; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ���� �� �����';Frm:SSSpS;Ed:'�3/�*10';TipSens:TipCalc;Min:0;Max:2000;
        Def:HIDE_MIN_MAX;Index:iSensFlows; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'����������� � ���������';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:5000;
        Def:HIDE_MIN_MAX;Index:iSensInTemp; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'���� - �������� ��� ������ ��2';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iMaxFillingYD; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - �������� ��� ������ ��2';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:90;
        Def:HIDE_MIN_MAX; Index:iMinFillingYD; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - �������� ��� ��2';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iCurrFilling+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ������� ��� ��2';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:80;
        Def:HIDE_MIN_MAX; Index:iMaxFillingYD+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'���� - ������� ����������';Frm:SSSpS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
        Def:HIDE_MIN_MAX; Index:iCurrFilling; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'���� - ��������� �������� ����������';Frm:SSSpS;Ed:'%/�';TipSens:TipCalc;Min:-40;Max:40;
        Def:HIDE_MIN_MAX; Index:iCalcFSpeed; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'���� - ����������� �����';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTTTemp; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� ���';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTTTemp+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'���� - �������';Frm:SSSpS;Ed:'��';TipSens:TipCalc;Min:0;Max:2000;
        Def:HIDE_MIN_MAX;Index:iSensLevel; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),


  (Name:'���� - ����������� 1';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 2';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 3';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+4; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 4';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+6; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 5';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+8; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 6';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+10; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 7';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+12; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 8';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+14; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 9';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+16; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 10';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+18; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 11';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+20; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 12';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+22; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 13';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+24; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 14';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+26; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 15';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+28; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 16';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+30; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 17';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+32; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 18';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+34; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 19';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+36; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'���� - ����������� 20';Frm:SSSpS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
        Def:HIDE_MIN_MAX; Index:iSensTnkTemp+38; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'������ ��2 ��� ����������� 1';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:1500;
        Def:HIDE_MIN_MAX; Index:27; Mech:DZM_COVENT1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ��2 ��� ����������� 2';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:150;
        Def:HIDE_MIN_MAX; Index:29; Mech:DZM_COVENT2; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ��2 ��� ����������� 3';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:150;
        Def:HIDE_MIN_MAX; Index:31; Mech:DZM_COVENT3; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ��2 ��� ����������� 4';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:150;
        Def:HIDE_MIN_MAX; Index:33; Mech:DZM_COVENT4; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ��2 ��� ����������� 5';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:150;
        Def:HIDE_MIN_MAX; Index:35; Mech:DZM_COVENT5; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ��2 ��� ����������� 6';Frm:SSSpS;Ed:'ppm/10';TipSens:TipSun;Min:0;Max:150;
        Def:HIDE_MIN_MAX; Index:37; Mech:DZM_COVENT6; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'������ ����� 1';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 2';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+2; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 3';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+4; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 4';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+6; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 5';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+8; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 6';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+10; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 7';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+12; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 8';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+14; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 9';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
  (Name:'������ ����� 10';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+18; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),

  (Name:'������ 1';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 2';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 3';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 4';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 5';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 6';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 7';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 8';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 9';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
  (Name:'������ 10';Frm:SSSS;Ed:'��/�2';TipSens:TipCalc;Min:0;Max:1300;
        Def:HIDE_MIN_MAX; Index:iSensInLight+16; Mech:DZM_GRON1; AccessR:RW_INVISIBLE; AccessW:RW_USER)

   );

const SumValYAlarmHot =50;
AlarmHotName:array [1..SumValYAlarmHot] of TNameConst=(

(Name:'�������^';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupMain;Max:comGroupMain+8;
        Def:HIDE_MIN_MAX;Index:iMainMode; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupTank;Max:comGroupTank+8;
        Def:HIDE_MIN_MAX;Index:iTankMode; Mech:DZM_STORAGE; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'CO2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+5;
        Def:HIDE_MIN_MAX;Index:iCO2Mode; Mech:0; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),

(Name:'��������� ������';Frm:CpMpN;Ed:'';TipSens:TipCalc;Min:0;Max:0;
        Def:HIDE_MIN_MAX;Index:iModuleCheck; Mech:0; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����� 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus; Mech:DZM_BURN1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����� 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus+2; Mech:DZM_BURN2; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����� 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus+4; Mech:DZM_BURN3; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����� 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus+6; Mech:DZM_BURN4; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����� 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus+8; Mech:DZM_BURN5; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'����� 6';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iBoilStatus+10; Mech:DZM_BURN6; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),


(Name:'������ 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus; Mech:DZM_GRVALVE1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+2; Mech:DZM_GRVALVE2; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+4; Mech:DZM_GRVALVE3; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+6; Mech:DZM_GRVALVE4; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+8; Mech:DZM_GRVALVE5; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 6';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+10; Mech:DZM_GRVALVE6; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 7';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+12; Mech:DZM_GRVALVE7; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 8';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+14; Mech:DZM_GRVALVE8; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 9';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+16; Mech:DZM_GRVALVE9; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������ 10';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iGroupStatus+18; Mech:DZM_GRVALVE10; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),

(Name:'��� 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus; Mech:DZM_HPON1; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+2; Mech:DZM_HPON2; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+4; Mech:DZM_HPON3; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+6; Mech:DZM_HPON4; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+8; Mech:DZM_HPON5; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 6';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+10; Mech:DZM_HPON6; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 7';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+12; Mech:DZM_HPON7; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 8';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+14; Mech:DZM_HPON8; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 9';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+16; Mech:DZM_HPON9; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'��� 10';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comGroupBoil;Max:comGroupBoil+10;
        Def:HIDE_MIN_MAX;Index:iHPStatus+18; Mech:DZM_HPON10; Tag:2; AccessR:RW_GUEST; AccessW:RW_USER),


(Name:'������������� 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus; Mech:DZM_GRON1; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+2; Mech:DZM_GRON2; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+4; Mech:DZM_GRON3; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+6; Mech:DZM_GRON4; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+8; Mech:DZM_GRON5; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 6';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+10; Mech:DZM_GRON6; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 7';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+12; Mech:DZM_GRON7; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 8';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+14; Mech:DZM_GRON8; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 9';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+16; Mech:DZM_GRON9; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 10';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+18; Mech:DZM_GRON10; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 11';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+20; Mech:DZM_GRON11; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 12';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+22; Mech:DZM_GRON12; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 13';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+24; Mech:DZM_GRON13; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 14';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+26; Mech:DZM_GRON14; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 15';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+28; Mech:DZM_GRON15; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 16';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+30; Mech:DZM_GRON16; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 17';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+32; Mech:DZM_GRON17; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 18';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+34; Mech:DZM_GRON18; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 19';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+36; Mech:DZM_GRON19; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER),
(Name:'������������� 20';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comStatusElGroup;Max:comStatusElGroup+8;
        Def:HIDE_MIN_MAX;Index:iElGroupStatus+38; Mech:DZM_GRON20; Tag:1; AccessR:RW_GUEST; AccessW:RW_USER)


);

const SumValYMechHot =658;
DSM_HOT_MECH=1313;
DMH_PanelStart=227;
DMH_GroupStart=DMH_PanelStart+eSumPanels*2;

MechHotName:array [1..SumValYMechHot] of TNameConst=(
//1
(Name:'��. ������ ������ 1 - �����^';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix; Mech:DZM_GRVALVE1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix; Mech:DZM_GRVALVE1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+1; Mech:DZM_GRVALVE2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+1; Mech:DZM_GRVALVE2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+2; Mech:DZM_GRVALVE3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+2; Mech:DZM_GRVALVE3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+3; Mech:DZM_GRVALVE4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+3; Mech:DZM_GRVALVE4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+4; Mech:DZM_GRVALVE5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+4; Mech:DZM_GRVALVE5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+5; Mech:DZM_GRVALVE6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+5; Mech:DZM_GRVALVE6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 7 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+6; Mech:DZM_GRVALVE7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 7 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+6; Mech:DZM_GRVALVE7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 8 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+7; Mech:DZM_GRVALVE8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 8 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+7; Mech:DZM_GRVALVE8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 9 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+8; Mech:DZM_GRVALVE9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 9 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+8; Mech:DZM_GRVALVE9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 10 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDGrMix+9; Mech:DZM_GRVALVE10; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��. ������ ������ 10 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDGrMix+9; Mech:DZM_GRVALVE10; AccessR:R_CONFIG;AccessW:W_CONFIG),
//21

(Name:'������� ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBurn; Mech:DZM_BURN1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBurn; Mech:DZM_BURN1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBurn+1; Mech:DZM_BURN2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBurn+1; Mech:DZM_BURN2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBurn+2; Mech:DZM_BURN3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBurn+2; Mech:DZM_BURN3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBurn+3; Mech:DZM_BURN4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBurn+3; Mech:DZM_BURN4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBurn+4; Mech:DZM_BURN5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBurn+4; Mech:DZM_BURN5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBurn+5; Mech:DZM_BURN6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������� ����� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBurn+5; Mech:DZM_BURN6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//33
(Name:'������ ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlMix; Mech:DZM_BVALVE1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlMix; Mech:DZM_BVALVE1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlMix+1; Mech:DZM_BVALVE2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlMix+1; Mech:DZM_BVALVE2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlMix+2; Mech:DZM_BVALVE3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlMix+2; Mech:DZM_BVALVE3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlMix+3; Mech:DZM_BVALVE4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlMix+3; Mech:DZM_BVALVE4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlMix+4; Mech:DZM_BVALVE5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlMix+4; Mech:DZM_BVALVE5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlMix+5; Mech:DZM_BVALVE6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlMix+5; Mech:DZM_BVALVE6; AccessR:R_CONFIG;AccessW:W_CONFIG),

//45
(Name:'��������� ������ ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlPmp; Mech:DZM_BREGPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlPmp; Mech:DZM_BREGPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlPmp+1; Mech:DZM_BREGPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlPmp+1; Mech:DZM_BREGPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlPmp+2; Mech:DZM_BREGPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlPmp+2; Mech:DZM_BREGPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlPmp+3; Mech:DZM_BREGPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlPmp+3; Mech:DZM_BREGPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlPmp+4; Mech:DZM_BREGPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlPmp+4; Mech:DZM_BREGPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDBlPmp+5; Mech:DZM_BREGPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'��������� ������ ����� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDBlPmp+5; Mech:DZM_BREGPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),

//57
(Name:'������ ���� ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDShMix; Mech:DZM_BSHMIX1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDShMix; Mech:DZM_BSHMIX1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDShMix+1; Mech:DZM_BSHMIX2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDShMix+1; Mech:DZM_BSHMIX2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDShMix+2; Mech:DZM_BSHMIX3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDShMix+2; Mech:DZM_BSHMIX3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDShMix+3; Mech:DZM_BSHMIX4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDShMix+3; Mech:DZM_BSHMIX4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDShMix+4; Mech:DZM_BSHMIX5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDShMix+4; Mech:DZM_BSHMIX5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDShMix+5; Mech:DZM_BSHMIX6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� ����� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDShMix+5; Mech:DZM_BSHMIX6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//69
(Name:'������ ���������� ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDCondMix; Mech:DZM_BCOND1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDCondMix; Mech:DZM_BCOND1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDCondMix+1; Mech:DZM_BCOND2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDCondMix+1; Mech:DZM_BCOND2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDCondMix+2; Mech:DZM_BCOND3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDCondMix+2; Mech:DZM_BCOND3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDCondMix+3; Mech:DZM_BCOND4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDCondMix+3; Mech:DZM_BCOND4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDCondMix+4; Mech:DZM_BCOND5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDCondMix+4; Mech:DZM_BCOND5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDCondMix+5; Mech:DZM_BCOND6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ���������� ����� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDCondMix+5; Mech:DZM_BCOND6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
//81
(Name:'������������ ������ ��� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix; Mech:DZM_HPMIX1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix; Mech:DZM_HPMIX1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+1; Mech:DZM_HPMIX2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+1; Mech:DZM_HPMIX2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+2; Mech:DZM_HPMIX3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+2; Mech:DZM_HPMIX3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+3; Mech:DZM_HPMIX4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+3; Mech:DZM_HPMIX4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+4; Mech:DZM_HPMIX5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+4; Mech:DZM_HPMIX5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+5; Mech:DZM_HPMIX6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+5; Mech:DZM_HPMIX6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 7 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+6; Mech:DZM_HPMIX7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 7 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+6; Mech:DZM_HPMIX7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 8 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+7; Mech:DZM_HPMIX8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 8 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+7; Mech:DZM_HPMIX8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 9 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+8; Mech:DZM_HPMIX9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 9 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+8; Mech:DZM_HPMIX9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 10 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPMix+9; Mech:DZM_HPMIX10; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������������ ������ ��� 10 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPMix+9; Mech:DZM_HPMIX10; AccessR:R_CONFIG;AccessW:W_CONFIG),
//101
(Name:'������ ��� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal; Mech:DZM_HPVALVE1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 1 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal; Mech:DZM_HPVALVE1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+1; Mech:DZM_HPVALVE2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 2 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+1; Mech:DZM_HPVALVE2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+2; Mech:DZM_HPVALVE3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 3 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+2; Mech:DZM_HPVALVE3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+3; Mech:DZM_HPVALVE4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 4 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+3; Mech:DZM_HPVALVE4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+4; Mech:DZM_HPVALVE5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 5 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+4; Mech:DZM_HPVALVE5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+5; Mech:DZM_HPVALVE6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 6 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+5; Mech:DZM_HPVALVE6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 7 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+6; Mech:DZM_HPVALVE7; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 7 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+6; Mech:DZM_HPVALVE7; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 8 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+7; Mech:DZM_HPVALVE8; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 8 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+7; Mech:DZM_HPVALVE8; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 9 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+8; Mech:DZM_HPVALVE9; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 9 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+8; Mech:DZM_HPVALVE9; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 10 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDHPVal+9; Mech:DZM_HPVALVE10; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'������ ��� 10 - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:100;Def:0;
    Index:iPIDHPVal+9; Mech:DZM_HPVALVE10; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),

//121
(Name:'������ ���� - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:irPIDEco; Mech:DZM_BREGPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ���� - ���������';Frm:SS;Ed:'%';TipSens:TipControl;Min:0;Max:MAX_SUM_RELAY;Def:0;
    Index:iPIDEco; Mech:DZM_ECOVALVE; AccessR:R_CONFIG;AccessW:W_CONFIG),
//123
(Name:'����� ������ 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp; Mech:DZM_GRPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp; Mech:DZM_GRPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+1; Mech:DZM_GRPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+1; Mech:DZM_GRPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+2; Mech:DZM_GRPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+2; Mech:DZM_GRPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+3; Mech:DZM_GRPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+3; Mech:DZM_GRPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+4; Mech:DZM_GRPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+4; Mech:DZM_GRPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+5; Mech:DZM_GRPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+5; Mech:DZM_GRPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 7 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+6; Mech:DZM_GRPUMP7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 7 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+6; Mech:DZM_GRPUMP7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 8 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+7; Mech:DZM_GRPUMP8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 8 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+7; Mech:DZM_GRPUMP8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 9 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+8; Mech:DZM_GRPUMP9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 9 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+8; Mech:DZM_GRPUMP9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 10 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrPmp+9; Mech:DZM_GRPUMP10; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ 10 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrPmp+9; Mech:DZM_GRPUMP10; AccessR:R_CONFIG;AccessW:W_CONFIG),

//143
(Name:'������ ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlOn; Mech:DZM_BoilON1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlOn; Mech:DZM_BoilON1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlOn+1; Mech:DZM_BoilON2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlOn+1; Mech:DZM_BoilON2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlOn+2; Mech:DZM_BoilON3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlOn+2; Mech:DZM_BoilON3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlOn+3; Mech:DZM_BoilON4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlOn+3; Mech:DZM_BoilON4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlOn+4; Mech:DZM_BoilON5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlOn+4; Mech:DZM_BoilON5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlOn+5; Mech:DZM_BoilON6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlOn+5; Mech:DZM_BoilON6; AccessR:R_CONFIG;AccessW:W_CONFIG),

//155
(Name:'���������� ������ 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlCtrl; Mech:DZM_BoilCtrl1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlCtrl; Mech:DZM_BoilCtrl1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlCtrl+1; Mech:DZM_BoilCtrl2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlCtrl+1; Mech:DZM_BoilCtrl2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlCtrl+2; Mech:DZM_BoilCtrl3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlCtrl+2; Mech:DZM_BoilCtrl3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlCtrl+3; Mech:DZM_BoilCtrl4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlCtrl+3; Mech:DZM_BoilCtrl4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlCtrl+4; Mech:DZM_BoilCtrl5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlCtrl+4; Mech:DZM_BoilCtrl5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlCtrl+5; Mech:DZM_BoilCtrl6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ������ 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlCtrl+5; Mech:DZM_BoilCtrl6; AccessR:R_CONFIG;AccessW:W_CONFIG),

//167
(Name:'����� ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlPmp; Mech:DZM_BPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlPmp; Mech:DZM_BPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlPmp+1; Mech:DZM_BPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlPmp+1; Mech:DZM_BPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlPmp+2; Mech:DZM_BPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlPmp+2; Mech:DZM_BPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlPmp+3; Mech:DZM_BPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlPmp+3; Mech:DZM_BPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlPmp+4; Mech:DZM_BPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlPmp+4; Mech:DZM_BPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlBlPmp+5; Mech:DZM_BPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ����� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlBlPmp+5; Mech:DZM_BPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),

//179
(Name:'����� ������ ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlShPmp; Mech:DZM_BSHPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlShPmp; Mech:DZM_BSHPUMP1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlShPmp+1; Mech:DZM_BSHPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlShPmp+1; Mech:DZM_BSHPUMP2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlShPmp+2; Mech:DZM_BSHPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlShPmp+2; Mech:DZM_BSHPUMP3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlShPmp+3; Mech:DZM_BSHPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlShPmp+3; Mech:DZM_BSHPUMP4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlShPmp+4; Mech:DZM_BSHPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlShPmp+4; Mech:DZM_BSHPUMP5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlShPmp+5; Mech:DZM_BSHPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������ ����� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlShPmp+5; Mech:DZM_BSHPUMP6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//191
(Name:'����� ���������� ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCondPmp; Mech:DZM_BCONPUMP1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCondPmp; Mech:DZM_BCONPUMP1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCondPmp+1; Mech:DZM_BCONPUMP2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCondPmp+1; Mech:DZM_BCONPUMP2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCondPmp+2; Mech:DZM_BCONPUMP3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCondPmp+2; Mech:DZM_BCONPUMP3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCondPmp+3; Mech:DZM_BCONPUMP4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCondPmp+3; Mech:DZM_BCONPUMP4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCondPmp+4; Mech:DZM_BCONPUMP5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCondPmp+4; Mech:DZM_BCONPUMP5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCondPmp+5; Mech:DZM_BCONPUMP6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ���������� ����� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCondPmp+5; Mech:DZM_BCONPUMP6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
//203
(Name:'����� ������� ����� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlRezPmp; Mech:DZM_BREZPUMP1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlRezPmp; Mech:DZM_BREZPUMP1; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlRezPmp+1; Mech:DZM_BREZPUMP2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlRezPmp+1; Mech:DZM_BREZPUMP2; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlRezPmp+2; Mech:DZM_BREZPUMP3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlRezPmp+2; Mech:DZM_BREZPUMP3; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlRezPmp+3; Mech:DZM_BREZPUMP4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlRezPmp+3; Mech:DZM_BREZPUMP4; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlRezPmp+4; Mech:DZM_BREZPUMP5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlRezPmp+4; Mech:DZM_BREZPUMP5; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlRezPmp+5; Mech:DZM_BREZPUMP6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
(Name:'����� ������� ����� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlRezPmp+5; Mech:DZM_BREZPUMP6; AccessR:RW_INVISIBLE;AccessW:W_CONFIG),
//215
(Name:'���������� ��2 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCO2; Mech:DZM_COVENT1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCO2; Mech:DZM_COVENT1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCO2+1; Mech:DZM_COVENT2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCO2+1; Mech:DZM_COVENT2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCO2+2; Mech:DZM_COVENT3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCO2+2; Mech:DZM_COVENT3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCO2+3; Mech:DZM_COVENT4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCO2+3; Mech:DZM_COVENT4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCO2+4; Mech:DZM_COVENT5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCO2+4; Mech:DZM_COVENT5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlCO2+5; Mech:DZM_COVENT6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'���������� ��2 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCO2+5; Mech:DZM_COVENT6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//227
(Name:'��� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn; Mech:DZM_PANELON1; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn; Mech:DZM_PANELON1; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+1; Mech:DZM_PANELON2; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+1; Mech:DZM_PANELON2; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+2; Mech:DZM_PANELON3; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+2; Mech:DZM_PANELON3; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+3; Mech:DZM_PANELON4; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+3; Mech:DZM_PANELON4; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+4; Mech:DZM_PANELON5; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+4; Mech:DZM_PANELON5; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+5; Mech:DZM_PANELON6; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+5; Mech:DZM_PANELON6; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 7 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+6; Mech:DZM_PANELON7; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 7 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+6; Mech:DZM_PANELON7; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 8 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+7; Mech:DZM_PANELON8; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 8 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+7; Mech:DZM_PANELON8; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 9 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+8; Mech:DZM_PANELON9; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 9 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+8; Mech:DZM_PANELON9; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 10 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+9; Mech:DZM_PANELON10; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 10 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+9; Mech:DZM_PANELON10; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 11 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+10; Mech:DZM_PANELON11; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 11 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+10; Mech:DZM_PANELON11; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 12 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+11; Mech:DZM_PANELON12; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 12 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+11; Mech:DZM_PANELON12; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 13 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+12; Mech:DZM_PANELON13; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 13 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+12; Mech:DZM_PANELON13; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 14 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+13; Mech:DZM_PANELON14; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 14 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+13; Mech:DZM_PANELON14; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 15 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+14; Mech:DZM_PANELON15; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 15 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+14; Mech:DZM_PANELON15; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 16 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+15; Mech:DZM_PANELON16; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 16 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+15; Mech:DZM_PANELON16; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 17 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+16; Mech:DZM_PANELON17; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 17 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+16; Mech:DZM_PANELON17; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 18 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+17; Mech:DZM_PANELON18; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 18 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+17; Mech:DZM_PANELON18; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 19 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+18; Mech:DZM_PANELON19; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 19 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+18; Mech:DZM_PANELON19; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 20 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+19; Mech:DZM_PANELON20; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 20 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+19; Mech:DZM_PANELON20; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 21 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+20; Mech:DZM_PANELON21; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 21 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+20; Mech:DZM_PANELON21; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 22 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+21; Mech:DZM_PANELON22; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 22 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+21; Mech:DZM_PANELON22; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 23 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+22; Mech:DZM_PANELON23; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 23 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+22; Mech:DZM_PANELON23; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 24 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+23; Mech:DZM_PANELON24; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 24 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+23; Mech:DZM_PANELON24; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 25 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+24; Mech:DZM_PANELON25; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 25 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+24; Mech:DZM_PANELON25; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 26 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+25; Mech:DZM_PANELON26; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 26 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+25; Mech:DZM_PANELON26; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 27 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+26; Mech:DZM_PANELON27; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 27 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+26; Mech:DZM_PANELON27; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 28 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+27; Mech:DZM_PANELON28; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 28 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+27; Mech:DZM_PANELON28; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 29 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+28; Mech:DZM_PANELON29; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 29 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+28; Mech:DZM_PANELON29; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 30 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+29; Mech:DZM_PANELON30; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 30 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+29; Mech:DZM_PANELON30; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 31 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+30; Mech:DZM_PANELON31; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 31 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+30; Mech:DZM_PANELON31; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 32 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+31; Mech:DZM_PANELON32; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 32 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+31; Mech:DZM_PANELON32; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 33 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+32; Mech:DZM_PANELON33; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 33 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+32; Mech:DZM_PANELON33; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 34 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+33; Mech:DZM_PANELON34; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 34 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+33; Mech:DZM_PANELON34; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 35 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+34; Mech:DZM_PANELON35; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 35 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+34; Mech:DZM_PANELON35; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 36 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+35; Mech:DZM_PANELON36; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 36 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+35; Mech:DZM_PANELON36; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 37 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+36; Mech:DZM_PANELON37; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 37 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+36; Mech:DZM_PANELON37; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 38 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+37; Mech:DZM_PANELON38; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 38 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+37; Mech:DZM_PANELON38; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 39 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+38; Mech:DZM_PANELON39; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 39 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+38; Mech:DZM_PANELON39; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 40 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+39; Mech:DZM_PANELON40; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 40 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+39; Mech:DZM_PANELON40; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 41 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+40; Mech:DZM_PANELON41; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 41 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+40; Mech:DZM_PANELON41; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 42 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+41; Mech:DZM_PANELON42; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 42 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+41; Mech:DZM_PANELON42; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 43 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+42; Mech:DZM_PANELON43; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 43 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+42; Mech:DZM_PANELON43; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 44 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+43; Mech:DZM_PANELON44; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 44 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+43; Mech:DZM_PANELON44; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 45 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+44; Mech:DZM_PANELON45; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 45 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+44; Mech:DZM_PANELON45; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 46 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+45; Mech:DZM_PANELON46; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 46 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+45; Mech:DZM_PANELON46; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 47 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+46; Mech:DZM_PANELON47; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 47 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+46; Mech:DZM_PANELON47; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 48 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+47; Mech:DZM_PANELON48; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 48 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+47; Mech:DZM_PANELON48; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 49 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+48; Mech:DZM_PANELON49; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 49 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+48; Mech:DZM_PANELON49; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 50 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+49; Mech:DZM_PANELON50; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 50 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+49; Mech:DZM_PANELON50; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 51 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+50; Mech:DZM_PANELON51; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 51 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+50; Mech:DZM_PANELON51; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 52 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+51; Mech:DZM_PANELON52; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 52 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+51; Mech:DZM_PANELON52; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 53 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+52; Mech:DZM_PANELON53; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 53 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+52; Mech:DZM_PANELON53; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 54 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+53; Mech:DZM_PANELON54; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 54 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+53; Mech:DZM_PANELON54; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 55 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+54; Mech:DZM_PANELON55; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 55 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+54; Mech:DZM_PANELON55; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 56 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+55; Mech:DZM_PANELON56; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 56 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+55; Mech:DZM_PANELON56; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 57 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+56; Mech:DZM_PANELON57; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 57 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+56; Mech:DZM_PANELON57; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 58 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+57; Mech:DZM_PANELON58; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 58 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+57; Mech:DZM_PANELON58; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 59 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+58; Mech:DZM_PANELON59; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 59 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+58; Mech:DZM_PANELON59; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 60 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+59; Mech:DZM_PANELON60; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 60 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+59; Mech:DZM_PANELON60; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 61 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+60; Mech:DZM_PANELON61; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 61 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+60; Mech:DZM_PANELON61; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 62 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+61; Mech:DZM_PANELON62; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 62 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+61; Mech:DZM_PANELON62; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 63 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+62; Mech:DZM_PANELON63; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 63 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+62; Mech:DZM_PANELON63; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 64 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+63; Mech:DZM_PANELON64; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 64 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+63; Mech:DZM_PANELON64; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 65 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+64; Mech:DZM_PANELON65; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 65 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+64; Mech:DZM_PANELON65; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 66 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+65; Mech:DZM_PANELON66; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 66 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+65; Mech:DZM_PANELON66; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 67 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+66; Mech:DZM_PANELON67; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 67 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+66; Mech:DZM_PANELON67; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 68 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+67; Mech:DZM_PANELON68; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 68 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+67; Mech:DZM_PANELON68; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 69 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+68; Mech:DZM_PANELON69; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 69 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+68; Mech:DZM_PANELON69; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 70 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+69; Mech:DZM_PANELON70; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 70 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+69; Mech:DZM_PANELON70; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 71 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+70; Mech:DZM_PANELON71; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 71 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+70; Mech:DZM_PANELON71; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 72 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+71; Mech:DZM_PANELON72; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 72 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+71; Mech:DZM_PANELON72; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 73 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+72; Mech:DZM_PANELON73; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 73 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+72; Mech:DZM_PANELON73; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 74 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+73; Mech:DZM_PANELON74; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 74 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+73; Mech:DZM_PANELON74; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 75 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+74; Mech:DZM_PANELON75; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 75 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+74; Mech:DZM_PANELON75; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 76 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+75; Mech:DZM_PANELON76; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 76 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+75; Mech:DZM_PANELON76; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 77 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+76; Mech:DZM_PANELON77; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 77 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+76; Mech:DZM_PANELON77; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 78 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+77; Mech:DZM_PANELON78; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 78 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+77; Mech:DZM_PANELON78; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 79 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+78; Mech:DZM_PANELON79; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 79 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+78; Mech:DZM_PANELON79; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 80 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+79; Mech:DZM_PANELON80; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 80 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+79; Mech:DZM_PANELON80; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 81 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+80; Mech:DZM_PANELON81; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 81 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+80; Mech:DZM_PANELON81; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 82 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+81; Mech:DZM_PANELON82; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 82 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+81; Mech:DZM_PANELON82; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 83 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+82; Mech:DZM_PANELON83; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 83 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+82; Mech:DZM_PANELON83; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 84 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+83; Mech:DZM_PANELON84; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 84 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+83; Mech:DZM_PANELON84; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 85 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+84; Mech:DZM_PANELON85; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 85 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+84; Mech:DZM_PANELON85; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 86 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+85; Mech:DZM_PANELON86; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 86 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+85; Mech:DZM_PANELON86; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 87 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+86; Mech:DZM_PANELON87; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 87 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+86; Mech:DZM_PANELON87; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 88 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+87; Mech:DZM_PANELON88; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 88 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+87; Mech:DZM_PANELON88; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 89 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+88; Mech:DZM_PANELON89; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 89 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+88; Mech:DZM_PANELON89; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 90 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+89; Mech:DZM_PANELON90; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 90 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+89; Mech:DZM_PANELON90; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 91 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+90; Mech:DZM_PANELON91; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 91 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+90; Mech:DZM_PANELON91; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 92 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+91; Mech:DZM_PANELON92; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 92 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+91; Mech:DZM_PANELON92; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 93 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+92; Mech:DZM_PANELON93; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 93 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+92; Mech:DZM_PANELON93; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 94 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+93; Mech:DZM_PANELON94; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 94 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+93; Mech:DZM_PANELON94; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 95 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+94; Mech:DZM_PANELON95; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 95 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+94; Mech:DZM_PANELON95; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 96 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+95; Mech:DZM_PANELON96; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 96 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+95; Mech:DZM_PANELON96; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 97 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+96; Mech:DZM_PANELON97; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 97 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+96; Mech:DZM_PANELON97; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 98 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+97; Mech:DZM_PANELON98; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 98 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+97; Mech:DZM_PANELON98; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 99 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+98; Mech:DZM_PANELON99; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 99 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+98; Mech:DZM_PANELON99; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 100 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+99; Mech:DZM_PANELON100; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 100 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+99; Mech:DZM_PANELON100; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 101 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+100; Mech:DZM_PANELON101; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 101 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+100; Mech:DZM_PANELON101; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 102 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+101; Mech:DZM_PANELON102; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 102 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+101; Mech:DZM_PANELON102; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 103 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+102; Mech:DZM_PANELON103; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 103 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+102; Mech:DZM_PANELON103; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 104 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+103; Mech:DZM_PANELON104; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 104 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+103; Mech:DZM_PANELON104; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 105 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+104; Mech:DZM_PANELON105; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 105 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+104; Mech:DZM_PANELON105; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 106 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+105; Mech:DZM_PANELON106; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 106 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+105; Mech:DZM_PANELON106; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 107 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+106; Mech:DZM_PANELON107; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 107 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+106; Mech:DZM_PANELON107; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 108 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+107; Mech:DZM_PANELON108; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 108 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+107; Mech:DZM_PANELON108; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 109 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+108; Mech:DZM_PANELON109; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 109 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+108; Mech:DZM_PANELON109; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 110 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+109; Mech:DZM_PANELON110; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 110 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+109; Mech:DZM_PANELON110; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 111 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+110; Mech:DZM_PANELON111; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 111 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+110; Mech:DZM_PANELON111; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 112 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+111; Mech:DZM_PANELON112; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 112 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+111; Mech:DZM_PANELON112; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 113 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+112; Mech:DZM_PANELON113; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 113 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+112; Mech:DZM_PANELON113; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 114 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+113; Mech:DZM_PANELON114; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 114 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+113; Mech:DZM_PANELON114; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 115 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+114; Mech:DZM_PANELON115; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 115 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+114; Mech:DZM_PANELON115; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 116 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+115; Mech:DZM_PANELON116; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 116 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+115; Mech:DZM_PANELON116; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 117 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+116; Mech:DZM_PANELON117; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 117 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+116; Mech:DZM_PANELON117; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 118 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+117; Mech:DZM_PANELON118; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 118 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+117; Mech:DZM_PANELON118; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 119 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+118; Mech:DZM_PANELON119; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 119 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+118; Mech:DZM_PANELON119; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 120 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+119; Mech:DZM_PANELON120; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 120 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+119; Mech:DZM_PANELON120; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 121 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+120; Mech:DZM_PANELON121; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 121 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+120; Mech:DZM_PANELON121; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 122 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+121; Mech:DZM_PANELON122; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 122 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+121; Mech:DZM_PANELON122; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 123 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+122; Mech:DZM_PANELON123; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 123 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+122; Mech:DZM_PANELON123; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 124 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+123; Mech:DZM_PANELON124; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 124 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+123; Mech:DZM_PANELON124; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 125 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+124; Mech:DZM_PANELON125; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 125 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+124; Mech:DZM_PANELON125; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 126 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+125; Mech:DZM_PANELON126; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 126 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+125; Mech:DZM_PANELON126; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 127 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+126; Mech:DZM_PANELON127; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 127 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+126; Mech:DZM_PANELON127; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 128 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+127; Mech:DZM_PANELON128; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 128 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+127; Mech:DZM_PANELON128; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 129 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+128; Mech:DZM_PANELON129; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 129 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+128; Mech:DZM_PANELON129; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 130 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+129; Mech:DZM_PANELON130; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 130 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+129; Mech:DZM_PANELON130; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 131 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+130; Mech:DZM_PANELON131; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 131 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+130; Mech:DZM_PANELON131; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 132 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+131; Mech:DZM_PANELON132; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 132 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+131; Mech:DZM_PANELON132; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 133 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+132; Mech:DZM_PANELON133; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 133 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+132; Mech:DZM_PANELON133; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 134 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+133; Mech:DZM_PANELON134; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 134 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+133; Mech:DZM_PANELON134; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 135 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+134; Mech:DZM_PANELON135; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 135 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+134; Mech:DZM_PANELON135; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 136 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+135; Mech:DZM_PANELON136; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 136 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+135; Mech:DZM_PANELON136; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 137 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+136; Mech:DZM_PANELON137; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 137 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+136; Mech:DZM_PANELON137; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 138 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+137; Mech:DZM_PANELON138; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 138 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+137; Mech:DZM_PANELON138; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 139 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+138; Mech:DZM_PANELON139; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 139 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+138; Mech:DZM_PANELON139; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 140 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+139; Mech:DZM_PANELON140; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 140 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+139; Mech:DZM_PANELON140; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 141 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+140; Mech:DZM_PANELON141; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 141 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+140; Mech:DZM_PANELON141; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 142 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+141; Mech:DZM_PANELON142; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 142 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+141; Mech:DZM_PANELON142; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 143 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+142; Mech:DZM_PANELON143; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 143 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+142; Mech:DZM_PANELON143; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 144 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+143; Mech:DZM_PANELON144; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 144 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+143; Mech:DZM_PANELON144; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 145 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+144; Mech:DZM_PANELON145; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 145 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+144; Mech:DZM_PANELON145; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 146 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+145; Mech:DZM_PANELON146; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 146 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+145; Mech:DZM_PANELON146; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 147 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+146; Mech:DZM_PANELON147; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 147 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+146; Mech:DZM_PANELON147; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 148 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+147; Mech:DZM_PANELON148; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 148 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+147; Mech:DZM_PANELON148; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 149 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+148; Mech:DZM_PANELON149; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 149 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+148; Mech:DZM_PANELON149; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 150 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlPanelOn+149; Mech:DZM_PANELON150; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'��� 150 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlPanelOn+149; Mech:DZM_PANELON150; AccessR:RW_GUEST;AccessW:RW_USER),
//477

(Name:'������������� 1 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+0; Mech:DZM_GRON1; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 1 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+0; Mech:DZM_GRON1; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 2 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+1; Mech:DZM_GRON2; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 2 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+1; Mech:DZM_GRON2; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 3 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+2; Mech:DZM_GRON3; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 3 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+2; Mech:DZM_GRON3; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 4 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+3; Mech:DZM_GRON4; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 4 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+3; Mech:DZM_GRON4; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 5 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+4; Mech:DZM_GRON5; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 5 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+4; Mech:DZM_GRON5; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 6 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+5; Mech:DZM_GRON6; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 6 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+5; Mech:DZM_GRON6; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 7 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+6; Mech:DZM_GRON7; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 7 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+6; Mech:DZM_GRON7; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 8 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+7; Mech:DZM_GRON8; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 8 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+7; Mech:DZM_GRON8; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 9 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+8; Mech:DZM_GRON9; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 9 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+8; Mech:DZM_GRON9; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 10 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+9; Mech:DZM_GRON10; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 10 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+9; Mech:DZM_GRON10; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 11 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+10; Mech:DZM_GRON11; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 11 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+10; Mech:DZM_GRON11; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 12 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+11; Mech:DZM_GRON12; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 12 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+11; Mech:DZM_GRON12; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 13 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+12; Mech:DZM_GRON13; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 13 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+12; Mech:DZM_GRON13; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 14 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+13; Mech:DZM_GRON14; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 14 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+13; Mech:DZM_GRON14; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 15 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+14; Mech:DZM_GRON15; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 15 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+14; Mech:DZM_GRON15; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 16 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+15; Mech:DZM_GRON16; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 16 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+15; Mech:DZM_GRON16; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 17 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+16; Mech:DZM_GRON17; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 17 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+16; Mech:DZM_GRON17; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 18 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+17; Mech:DZM_GRON18; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 18 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+17; Mech:DZM_GRON18; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 19 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+18; Mech:DZM_GRON19; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 19 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+18; Mech:DZM_GRON19; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 20 - �����';Frm:ComboBit;Ed:'7';TipSens:TipBit;Min:comAutoHand;Max:comAutoHand+1;Def:0;
    Index:iRlGrOn+19; Mech:DZM_GRON20; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������������� 20 - ���������';Frm:ComboBit;Ed:'0';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlGrOn+19; Mech:DZM_GRON20; AccessR:RW_GUEST;AccessW:RW_USER),

//517
(Name:'������ ��� 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn; Mech:DZM_HPON1; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+1; Mech:DZM_HPON2; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+2; Mech:DZM_HPON3; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+3; Mech:DZM_HPON4; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+4; Mech:DZM_HPON5; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 6';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+5; Mech:DZM_HPON6; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 7';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+6; Mech:DZM_HPON7; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 8';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+7; Mech:DZM_HPON8; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 9';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+8; Mech:DZM_HPON9; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'������ ��� 10';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlHPOn+9; Mech:DZM_HPON10; AccessR:RW_GUEST;AccessW:RW_USER),

//527
(Name:'���������� �������� 1';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK; Mech:DZM_LightOk1; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 2';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+1; Mech:DZM_LightOk2; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 3';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+2; Mech:DZM_LightOk3; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 4';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+3; Mech:DZM_LightOk4; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 5';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+4; Mech:DZM_LightOk5; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 6';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+5; Mech:DZM_LightOk6; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 7';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+6; Mech:DZM_LightOk7; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 8';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+7; Mech:DZM_LightOk8; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 9';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+8; Mech:DZM_LightOk9; AccessR:RW_GUEST;AccessW:RW_USER),
(Name:'���������� �������� 10';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlLightOK+9; Mech:DZM_LightOk10; AccessR:RW_GUEST;AccessW:RW_USER),
//537
(Name:'������ ����� 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevBoil; Mech:DZM_BoilFeed1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevBoil+1; Mech:DZM_BoilFeed2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevBoil+2; Mech:DZM_BoilFeed3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevBoil+3; Mech:DZM_BoilFeed4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevBoil+4; Mech:DZM_BoilFeed5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevBoil+5; Mech:DZM_BoilFeed6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//543
(Name:'������ ����� 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrBoil; Mech:DZM_BoilAlrm1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrBoil+1; Mech:DZM_BoilAlrm2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrBoil+2; Mech:DZM_BoilAlrm3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrBoil+3; Mech:DZM_BoilAlrm4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrBoil+4; Mech:DZM_BoilAlrm5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ����� 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrBoil+5; Mech:DZM_BoilAlrm6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//549
(Name:'������ ��2 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrCO2; Mech:DZM_COAlrm1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrCO2+1; Mech:DZM_COAlrm2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrCO2+2; Mech:DZM_COAlrm3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrCO2+3; Mech:DZM_COAlrm4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrCO2+4; Mech:DZM_COAlrm5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrCO2+5; Mech:DZM_COAlrm6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//555
(Name:'������ ��2 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevCO2Req; Mech:DZM_COReq1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevCO2Req+1; Mech:DZM_COReq2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevCO2Req+2; Mech:DZM_COReq3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevCO2Req+3; Mech:DZM_COReq4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevCO2Req+4; Mech:DZM_COReq5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��2 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevCO2Req+5; Mech:DZM_COReq6; AccessR:R_CONFIG;AccessW:W_CONFIG),
//561
(Name:'������ ������ 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr; Mech:DZM_GRAlrm1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+1; Mech:DZM_GRAlrm2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+2; Mech:DZM_GRAlrm3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+3; Mech:DZM_GRAlrm4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+4; Mech:DZM_GRAlrm5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+5; Mech:DZM_GRAlrm6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 7';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+6; Mech:DZM_GRAlrm7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 8';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+7; Mech:DZM_GRAlrm8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 9';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+8; Mech:DZM_GRAlrm9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 10';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+9; Mech:DZM_GRAlrm10; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 11';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+10; Mech:DZM_GRAlrm11; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 12';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+11; Mech:DZM_GRAlrm12; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 13';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+12; Mech:DZM_GRAlrm13; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 14';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+13; Mech:DZM_GRAlrm14; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 15';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+14; Mech:DZM_GRAlrm15; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 16';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+15; Mech:DZM_GRAlrm16; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 17';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+16; Mech:DZM_GRAlrm17; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 18';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+17; Mech:DZM_GRAlrm18; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 19';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+18; Mech:DZM_GRAlrm19; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ������ 20';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrGr+19; Mech:DZM_GRAlrm20; AccessR:R_CONFIG;AccessW:W_CONFIG),
//581
(Name:'������ ��� 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq; Mech:DZM_HPREQ1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+1; Mech:DZM_HPREQ2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+2; Mech:DZM_HPREQ3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+3; Mech:DZM_HPREQ4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+4; Mech:DZM_HPREQ5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+5; Mech:DZM_HPREQ6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 7';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+6; Mech:DZM_HPREQ7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 8';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+7; Mech:DZM_HPREQ8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 9';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+8; Mech:DZM_HPREQ9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 10';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpReq+9; Mech:DZM_HPREQ10; AccessR:R_CONFIG;AccessW:W_CONFIG),
//591
(Name:'������ ��� 1';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn; Mech:DZM_HPOK1; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 2';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+1; Mech:DZM_HPOK2; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 3';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+2; Mech:DZM_HPOK3; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 4';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+3; Mech:DZM_HPOK4; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 5';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+4; Mech:DZM_HPOK5; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 6';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+5; Mech:DZM_HPOK6; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 7';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+6; Mech:DZM_HPOK7; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 8';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+7; Mech:DZM_HPOK8; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 9';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+8; Mech:DZM_HPOK9; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ ��� 10';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevHpOn+9; Mech:DZM_HPOK10; AccessR:R_CONFIG;AccessW:W_CONFIG),
//601
(Name:'��������� ������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlFatal; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� ������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCommonAlr; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'���� ����������';Frm:ComboSS;Ed:'';TipSens:TipControl;Min:comOnOff;Max:comOnOff+1;Def:0;
    Index:iRlCtrlOK; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),

(Name:'������� ������ ����';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevAlrTank; Mech:DZM_STORAGE; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'����� �����������';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevReset; Mech:0; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� ������������';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevFire; Mech:DZM_FIRE; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'�������� (������)';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevFilling; Mech:DZM_FIRE; AccessR:R_CONFIG;AccessW:W_CONFIG),
(Name:'������ �������';Frm:ComboSS;Ed:'-����';TipSens:TipControl;Min:comNoYes;Max:comNoYes+1;Def:0;
    Index:iLevPumpAlarm; Mech:DZM_FIRE; AccessR:R_CONFIG;AccessW:W_CONFIG)
//609
    );

//*********************************************************************
//******************** ������ �������� ��������� **********************
//*********************************************************************
// ���� "���������� �������"
{type TCalSensor=record
      uCal:array[1..2] of InInt; // ���������� 1,2
      vCal:array[1..2] of InInt; // ������ 1,2
      nPort:Byte; // ����� �����
      nInput:Byte; // ����� ����� � �����
      end;
}
const
 SumSens = 122;
 sizeCalibrSensor =10;   // ������ TCalSensor
      iVCal = 0;
      iUCal = 4;
      iRez = 8;
      iInput = 9;

  iCalGrTemp=     4;
  iCalBlSTemp=    sizeCalibrSensor*eSumGroups+iCalGrTemp;
  iCalBlRSTemp=   sizeCalibrSensor*eSumBoilers+iCalBlSTemp;
  iCalBlRTemp=    sizeCalibrSensor*eSumBoilers+iCalBlRSTemp;
  iCalBlPBurn=    sizeCalibrSensor*eSumBoilers+iCalBlRTemp;
  iCalMSTemp=     sizeCalibrSensor*eSumBoilers+iCalBlPBurn;
  iCalMRTemp=     sizeCalibrSensor+iCalMSTemp;
  iCalMSPres=     sizeCalibrSensor+iCalMRTemp;
  iCalMRPres=     sizeCalibrSensor+iCalMSPres;
  iCalTankTop=    sizeCalibrSensor+iCalMRPres;
  iCalTankTemp=   sizeCalibrSensor*2+iCalTankTop;
  iCalFlows=      iCalTankTemp+ sizeCalibrSensor*eSumTankSens;
  iCalHPSTemp  =iCalFlows+ sizeCalibrSensor*3;              //����������� � ���
  iCalHPRTemp  =iCalHPSTemp+sizeCalibrSensor*eSumHPUnits;              //����������� � ���
  iCalHPCoolSTemp  =iCalHPRTemp+sizeCalibrSensor*eSumHPUnits;              //����������� � ���
  iCalHPCoolRTemp  =iCalHPCoolSTemp+sizeCalibrSensor*eSumHPUnits;              //����������� � ���
  iCalSun       =iCalHPCoolRTemp+eSumHPUnits*sizeCalibrSensor;
  iCalInLight   =iCalSun+sizeCalibrSensor;
  iCalLev       = iCalInLight+ sizeCalibrSensor*10;
  iCalInTemp    = iCalLev+ sizeCalibrSensor;
  iCalGas       = iCalInTemp+ sizeCalibrSensor;
  sizeFullCalibr=  eMAX_SUM_SENS*sizeCalibrSensor;


 DefSensBoil:array[1..SumSens] of TNameConst=(
    (Name:'����������� 1 - ����������� ����^';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp; Mech:DZM_GRVALVE1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 2 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*1; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 3 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*2; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 4 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*3; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 5 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*4; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 6 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*5; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 7 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*6; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 8 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*7; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 9 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*8; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� 10 - ����������� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
      Def:NO_MIN_MAX;Index:iCalGrTemp+sizeCalibrSensor*9; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),


    (Name:'����� 1 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlSTemp; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 2 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlSTemp+sizeCalibrSensor*1; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 3 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlSTemp+sizeCalibrSensor*2; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 4 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlSTemp+sizeCalibrSensor*3; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 5 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlSTemp+sizeCalibrSensor*4; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 6 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlSTemp+sizeCalibrSensor*5; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'����� 1 - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRSTemp; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 2 - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRSTemp+sizeCalibrSensor*1; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 3 - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRSTemp+sizeCalibrSensor*2; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 4 - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRSTemp+sizeCalibrSensor*3; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 5 - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRSTemp+sizeCalibrSensor*4; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 6 - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRSTemp+sizeCalibrSensor*5; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'����� 1 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRTemp; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 2 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRTemp+sizeCalibrSensor*1; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 3 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRTemp+sizeCalibrSensor*2; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 4 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRTemp+sizeCalibrSensor*3; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 5 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRTemp+sizeCalibrSensor*4; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 6 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalBlRTemp+sizeCalibrSensor*5; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'����� 1 - ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalBlPBurn; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 2 - ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalBlPBurn+sizeCalibrSensor*1; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 3 - ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalBlPBurn+sizeCalibrSensor*2; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 4 - ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalBlPBurn+sizeCalibrSensor*3; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 5 - ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalBlPBurn+sizeCalibrSensor*4; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 6 - ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalBlPBurn+sizeCalibrSensor*5; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'����������� ���� ������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;
        Def:NO_MIN_MAX; Index:iCalMSTemp; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� ���� ��������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:100;
        Def:NO_MIN_MAX; Index:iCalMRTemp; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�������� ���� ������';Frm:SSSpS;Ed:'��/��2';TipSens:TipSensor;Min:0;Max:16;
        Def:NO_MIN_MAX; Index:iCalMSPres; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�������� ���� ��������';Frm:SSSpS;Ed:'��/��2';TipSens:TipSensor;Min:0;Max:14;
        Def:NO_MIN_MAX; Index:iCalMRpres; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),


    (Name:'���� - ����������� �����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:150;
        Def:NO_MIN_MAX; Index:iCalTankTop; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:0;Max:100;
        Def:NO_MIN_MAX; Index:iCalTankTop+sizeCalibrSensor; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'���� - ����������� 1';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),   ///!!!
    (Name:'���� - ����������� 2';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*1; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 3';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 4';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*3; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 5';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*4; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 6';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*5; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 7';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*6; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 8';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*7; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 9';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*8; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 10';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*9; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 11';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*10; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 12';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*11; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 13';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*12; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 14';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*13; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 15';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*14; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 16';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*15; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 17';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*16; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 18';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*17; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 19';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*18; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� 20';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:40;Max:130;
        Def:NO_MIN_MAX; Index:iCalTankTemp+sizeCalibrSensor*19; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),


    (Name:'������ ���� �� �����';Frm:SSSS;Ed:'�3/�';TipSens:TipSensor;Min:-2000;Max:2000;
        Def:NO_MIN_MAX; Index:iCalFlows; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'������ ���� �� �������';Frm:SSSS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalFlows+sizeCalibrSensor*1; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ����������';Frm:SSSS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalFlows+sizeCalibrSensor*2; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'��� 1 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 2 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*1; Mech:DZM_HPON2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 3 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*2; Mech:DZM_HPON3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 4 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*3; Mech:DZM_HPON4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 5 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*4; Mech:DZM_HPON5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 6 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*5; Mech:DZM_HPON6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 7 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*6; Mech:DZM_HPON7; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 8 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*7; Mech:DZM_HPON8; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 9 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*8; Mech:DZM_HPON9; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 10 - ����������� �� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPSTemp+sizeCalibrSensor*9; Mech:DZM_HPON10; AccessR:RW_GUEST; AccessW:RW_USER),
//11
    (Name:'��� 1 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 2 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*1; Mech:DZM_HPON2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 3 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*2; Mech:DZM_HPON3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 4 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*3; Mech:DZM_HPON4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 5 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*4; Mech:DZM_HPON5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 6 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*5; Mech:DZM_HPON6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 7 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*6; Mech:DZM_HPON7; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 8 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*7; Mech:DZM_HPON8; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 9 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*8; Mech:DZM_HPON9; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 10 - ����������� ��� ����';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPRTemp+sizeCalibrSensor*9; Mech:DZM_HPON10; AccessR:RW_GUEST; AccessW:RW_USER),
 //21
    (Name:'��� 1 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 2 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*1; Mech:DZM_HPON2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 3 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*2; Mech:DZM_HPON3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 4 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*3; Mech:DZM_HPON4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 5 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*4; Mech:DZM_HPON5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 6 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*5; Mech:DZM_HPON6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 7 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*6; Mech:DZM_HPON7; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 8 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*7; Mech:DZM_HPON8; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 9 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*8; Mech:DZM_HPON9; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 10 - ����������� ������������ ��';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolSTemp+sizeCalibrSensor*9; Mech:DZM_HPON10; AccessR:RW_GUEST; AccessW:RW_USER),
//31
    (Name:'��� 1 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 2 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*1; Mech:DZM_HPON2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 3 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*2; Mech:DZM_HPON3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 4 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*3; Mech:DZM_HPON4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 5 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*4; Mech:DZM_HPON5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 6 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*5; Mech:DZM_HPON6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 7 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*6; Mech:DZM_HPON7; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 8 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*7; Mech:DZM_HPON8; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 9 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*8; Mech:DZM_HPON9; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� 10 - ����������� ������������ ���';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:20;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp+sizeCalibrSensor*9; Mech:DZM_HPON10; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'������������� ������';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalSun; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
//43
    (Name:'������ ����� 1';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 2';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 3';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+2*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 4';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+3*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 5';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+4*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 6';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+5*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 7';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+6*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 8';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+7*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 9';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+8*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ ����� 10';Frm:SSSS;Ed:'��/�2';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalInLight+9*sizeCalibrSensor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'���� - ������';Frm:SSSS;Ed:'��';TipSens:TipSensor;Min:0;Max:2000;
        Def:NO_MIN_MAX; Index:iCalLev; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipSensor;Min:-5;Max:130;
        Def:NO_MIN_MAX; Index:iCalHPCoolRTemp; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'����� 1 - ����������� ����';Frm:SSSpS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalGas; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 2 - ����������� ����';Frm:SSSpS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalGas+sizeCalibrSensor*1; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 3 - ����������� ����';Frm:SSSpS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalGas+sizeCalibrSensor*2; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 4 - ����������� ����';Frm:SSSpS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalGas+sizeCalibrSensor*3; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 5 - ����������� ����';Frm:SSSpS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalGas+sizeCalibrSensor*4; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� 6 - ����������� ����';Frm:SSSpS;Ed:'�3/�';TipSens:TipSensor;Min:0;Max:6500;
        Def:NO_MIN_MAX; Index:iCalGas+sizeCalibrSensor*5; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER)

   );
//*********************************************************************
//******************** END ������ �������� ��������� ******************
//*********************************************************************

//*********************************************************************
//******************** ������� ��������� ******************************
//*********************************************************************

const iStartTask = 0; // ��������� ����
      iTaskGrTemp =   iStartTask + 2; // ������ ���-��� ������� �� �����
      iTaskGrMode =   iTaskGrTemp + eSumGroups;
      iTaskBlMode =   iTaskGrMode + eSumGroups;
      iTaskHPMode =   iTaskBlMode + eSumBoilers;
      iTaskMaxFillLevYD =  iTaskHPMode + 6;
      iTaskMinFillLevND =   iTaskMaxFillLevYD + 1;
      iTaskMaxFillLevND =   iTaskMinFillLevND + 1;
      iTaskModeFill=     iTaskMaxFillLevND+1;
      iTaskMinFillLevYD =   iTaskModeFill + 1;
      SizeBoilTimer = iTaskMinFillLevYD + 11;
      SumValYBoilTimer = 32;
var
DefBoilersTimer:array [1..SumValYBoilTimer] of TNameConst=(
 (Name:'����� ������ �������� ��������� (���� 0 - ����� �� �������)^';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:24*60;
    Def:NO_MIN_MAX; Index:iStartTask; GridColor:$ffef00; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'���� - �������� ��� ������ ��2 �� ������ �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:0; Index:iTaskMaxFillLevYD; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'���� - ������� ��� ������ ��2 �� ������ �������'; Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:0; Index:iTaskMinFillLevYD; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'���� - �������� ��� ������ ��2 �� ������ �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:0; Index:iTaskMaxFillLevND; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'���� - ������� ��� ������ ��2 �� ������ �������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:0; Index:iTaskMinFillLevND; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'���� - ������������ ������� ���������� ���� �������'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comTaskBoilMode;Max:comTaskBoilMode+3;
    Def:0; Index:iTaskModeFill; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 1 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+0; Mech:DZM_GRVALVE1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 1 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode; Mech:DZM_GRVALVE1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 2 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+1; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 2 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+1; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+2; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+2; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 4 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+3; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 4 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+3; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 5 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+4; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 5 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+4; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 6 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+5; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 6 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+5; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 7 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+6; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 7 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+6; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 8 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+7; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 8 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+7; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 9 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+8; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 9 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+8; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 10 - ������� ����������� ����';Frm:SS;Ed:'�C';TipSens:TipCalc;Min:0;Max:130;
    Def:0; Index:iTaskGrTemp+9; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 10 - ����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeGroup;Max:comModeGroup+3;
    Def:0; Index:iTaskGrMode+9; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 1 - ����� ������ (����,���,����)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+3;
    Def:0; Index:iTaskBlMode; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - ����� ������ (����,���,����)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+3;
    Def:0; Index:iTaskBlMode+1; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - ����� ������ (����,���,����)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+3;
    Def:0; Index:iTaskBlMode+2; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - ����� ������ (����,���,����)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+3;
    Def:0; Index:iTaskBlMode+3; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - ����� ������ (����,���,����)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+3;
    Def:0; Index:iTaskBlMode+4; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - ����� ������ (����,���,����)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+3;
    Def:0; Index:iTaskBlMode+5; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER)

{ (Name:'��� 1 - ����� ������ (����,����,���)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
    Def:0; Index:iTaskHPMode; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'��� 2 - ����� ������ (����,����,���)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
    Def:0; Index:iTaskHPMode+1; Mech:DZM_HPON2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'��� 3 - ����� ������ (����,����,���)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
    Def:0; Index:iTaskHPMode+2; Mech:DZM_HPON3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'��� 4 - ����� ������ (����,����,���)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
    Def:0; Index:iTaskHPMode+3; Mech:DZM_HPON4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'��� 5 - ����� ������ (����,����,���)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
    Def:0; Index:iTaskHPMode+4; Mech:DZM_HPON5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'��� 6 - ����� ������ (����,����,���)'; Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comAutoOffOn;Max:comAutoOffOn+2;
    Def:0; Index:iTaskHPMode+5; Mech:DZM_HPON6; AccessR:RW_GUEST; AccessW:RW_USER)
 }
 );

//*********************************************************************
//******************* END ������� ��������� ***************************
//*********************************************************************

//*********************************************************************
//******************** ������� ��������� ******************************
//*********************************************************************

const iElStartTask = 0; // ��������� ����
      iElEndTask =   iELStartTask + 2; // ������ ���-��� ������� �� �����
      iElTaskGrNum =   iELEndTask + 2;
      iElTaskSensNum =   iELTaskGrNum + 1;
      iELTaskMaxLight =   iELTaskSensNum + 1;
      iELTaskMinLight =  iELTaskMaxLight + 1;
      iELTaskMode =   iElTaskMinLight + 1;
      SizeLightTimer = iELTaskMode + 7;
      SumValYLightTimer = 7;
var
DefLightTimer:array [1..SumValYLightTimer] of TNameConst=(
 (Name:'����� ������ �������� ��������� (���� 0 - ����� �� �������)^';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:24*60;
    Def:NO_MIN_MAX; Index:iELStartTask; GridColor:$ffef00; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� ��������� �������� ��������� (���� 0 - ����� �� �������)';Frm:SShSSm;Ed:'���:���';TipSens:TipCalc;Min:0;Max:24*60;
    Def:NO_MIN_MAX; Index:iELEndTask; GridColor:$ffef00; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� ������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:20;
    Def:0; Index:iELTaskGrNum; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� ������������ �������';Frm:SS;Ed:'';TipSens:TipCalc;Min:0;Max:20;
    Def:0; Index:iElTaskSensNum; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'�������� ��������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:0; Index:iELTaskMaxLight; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'������� ��������';Frm:SS;Ed:'%';TipSens:TipCalc;Min:0;Max:100;
    Def:0; Index:iELTaskMinLight; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� ������';Frm:ComboSS;Ed:'';TipSens:TipCombo;Min:comModeElGroup;Max:comModeElGroup+2;
    Def:0; Index:iELTaskMode; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER)


 );

//*********************************************************************
//******************* END ������� ���������  ***************************
//*********************************************************************

//*********************************************************************
//******************** ��������� ���������� ***********************
//*********************************************************************
{const
  iMechTGrMix =   0;
  iMechTGrPmp =   iMechTGrMix+eSumGroups*2;
  iMechTBurn =    iMechTGrPmp+eSumGroups*2;
  iMechTBlMix =   iMechTBurn+eSumBoilers*2;
  iMechTBlPmp =   iMechTBlMix+eSumBoilers*2;
  iMechPGrMix =   iMechTGrMix+eMAX_SUM_PID*2;
  iMechPGrPmp =   iMechPGrMix+eSumGroups*2;
  iMechPBurn =    iMechPGrPmp+eSumGroups*2;
  iMechPBlMix =   iMechPBurn+eSumBoilers*2;
  iMechPBlPmp =   iMechPBlMix+eSumBoilers*2;
  iMechIGrMix =   iMechPGrMix+eMAX_SUM_PID*2;
  iMechIGrPmp =   iMechIGrMix+eSumGroups*2;
  iMechIBurn =    iMechIGrPmp+eSumGroups*2;
  iMechIBlMix =   iMechIBurn+eSumBoilers*2;
  iMechIBlPmp =   iMechIBlMix+eSumBoilers*2;
  sizeBoilMech = iMechIBlPmp+eSumBoilers*2;

  SumValBoilMech = 114;

DefBoilersMech:array [1..SumValBoilMech] of TNameConst=(
 (Name:'����������� 1 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 1 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 1 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 1 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 1 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 1 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 2 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 2 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 2 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 2 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 2 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 2 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+2; Mech:DZM_GRVALVE2; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 3 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+4; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+4; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+4; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+4; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+4; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 3 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+4; Mech:DZM_GRVALVE3; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 4 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+6; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 4 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+6; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 4 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+6; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 4 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+6; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 4 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+6; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 4 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+6; Mech:DZM_GRVALVE4; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 5 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+8; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 5 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+8; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 5 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+8; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 5 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+8; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 5 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+8; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 5 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+8; Mech:DZM_GRVALVE5; AccessR:RW_GUEST; AccessW:RW_USER),


 (Name:'����������� 6 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+10; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 6 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+10; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 6 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+10; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 6 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+10; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 6 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+10; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 6 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+10; Mech:DZM_GRVALVE6; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 7 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+12; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 7 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+12; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 7 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+12; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 7 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+12; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 7 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+12; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 7 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+12; Mech:DZM_GRVALVE7; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 8 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+14; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 8 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+14; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 8 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+14; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 8 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+14; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 8 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+14; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 8 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+14; Mech:DZM_GRVALVE8; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 9 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+16; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 9 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+16; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 9 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+16; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 9 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+16; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 9 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+16; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 9 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+16; Mech:DZM_GRVALVE9; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����������� 10 - ����� ���� ������������� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrMix+18; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 10 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrMix+18; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 10 - �-����������� ����. �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrMix+18; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 10 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTGrPmp+18; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 10 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPGrPmp+18; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����������� 10 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIGrPmp+18; Mech:DZM_GRVALVE10; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 1 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBurn; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBurn; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBurn; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlMix; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlMix; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlMix; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlPmp; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlPmp; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 1 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlPmp; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 2 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBurn+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBurn+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBurn+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlMix+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlMix+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlMix+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlPmp+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlPmp+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 2 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlPmp+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 3 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBurn+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBurn+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBurn+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlMix+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlMix+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlMix+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlPmp+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlPmp+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 3 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlPmp+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 4 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBurn+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBurn+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBurn+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlMix+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlMix+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlMix+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlPmp+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlPmp+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 4 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlPmp+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 5 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBurn+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBurn+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBurn+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlMix+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlMix+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlMix+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlPmp+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlPmp+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 5 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlPmp+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),

 (Name:'����� 6 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBurn+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBurn+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBurn+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - ����� ���� �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlMix+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlMix+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - �-����������� �������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlMix+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - ����� ����������� ������� ������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:1000;
    Def:60; Index:iMechTBlPmp+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:10;
    Def:1.2; Index:iMechPBlPmp+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
 (Name:'����� 6 - �-����������� ������';Frm:SSpSS;Ed:'%/�C';TipSens:TipCalc;Min:0;Max:1;
    Def:0.2; Index:iMechIBlPmp+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER)
); }

//*********************************************************************
//******************** END ��������� ***********************
//*********************************************************************

//*********************************************************************
//******************* ��������� ��������� � ����� *********************
//*********************************************************************
{type TKotParams=record
      MinTValue:InInt;	 // ���������� ���������� t �����
	    MaxTValue:InInt; 	 // ����������� ���������� t �����
	    Rez:array[1..3] of InInt;
	    RCS:Byte;
      end;
}
const
  sumValYControl=58;

  iContBoilPrior=0;
  iContBoilPower=iContBoilPrior+eSumBoilers*2;
  iContBoilRez=iContBoilPower+eSumBoilers*2;
  iContKAvTank=iContBoilRez+3*2;
  iContSetUtilTemp=iContKAvTank+2;
  iContUtilDeadBand=iContSetUtilTemp+2;
  iContBoilTimeOnOff=iContUtilDeadBand+2;
  iContTempMore=iContBoilTimeOnOff+10;
  iContTempMax=iContTempMore+2;
  iContTempMin=iContTempMax+2;
  iContTempCor=iContTempMin+2;
  iContTMaxEmpty=iContTempCor+10;
  iContTSetTemp=iContTMaxEmpty+4;
  iContBoilRestart=iContTSetTemp+10;
  iContFillTime=iContBoilRestart+6;
  iContIntTank=iContFillTime+8;
  iContHPTry=iContIntTank+12;
  iContMidlSens=iContHPTry+4;
  iContHPMinTime=iContMidlSens+4;
  iContTimeBus=iContHPMinTime+8;
  iContHPAlrL=iContTimeBus+4;
  iContHeaters=iContHPAlrL+2;
  iContShockBoil=iContHeaters+8;
  iContMaxNetPower=iContShockBoil+6;


  sizeBoilControl=eMAX_SUM_CONST*2;

  DefControlBoil:array [1..sumValYControl] of TNameConst=(
    (Name:'����������� ������^';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:60;Max:100;
        Def:90; Index:iContTSetTemp; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������������ ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:100;
        Def:95; Index:iContTempMax; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:90;
        Def:70; Index:iContTempMin; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
{    (Name:'�����1 - ���������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:1;Max:9;
        Def:0; Index:iContBoilPrior; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����2 - ���������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:1;Max:9;
        Def:0; Index:iContBoilPrior+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����3 - ���������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:1;Max:9;
        Def:0; Index:iContBoilPrior+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����4 - ���������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:1;Max:9;
        Def:0; Index:iContBoilPrior+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����5 - ���������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:1;Max:9;
        Def:0; Index:iContBoilPrior+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����6 - ���������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:1;Max:9;
        Def:0; Index:iContBoilPrior+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����1 - ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:20;
        Def:0; Index:iContBoilPower; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����2 - ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:20;
        Def:0; Index:iContBoilPower+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����3 - ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:20;
        Def:0; Index:iContBoilPower+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����4 - ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:20;
        Def:0; Index:iContBoilPower+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����5 - ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:20;
        Def:0; Index:iContBoilPower+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����6 - ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:20;
        Def:0; Index:iContBoilPower+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����1 - ����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:5;
        Def:0; Index:iContBoilMinPower; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����2 - ����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:5;
        Def:0; Index:iContBoilMinPower+2; Mech:DZM_BURN2; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����3 - ����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:5;
        Def:0; Index:iContBoilMinPower+4; Mech:DZM_BURN3; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����4 - ����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:5;
        Def:0; Index:iContBoilMinPower+6; Mech:DZM_BURN4; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����5 - ����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:5;
        Def:0; Index:iContBoilMinPower+8; Mech:DZM_BURN5; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'�����6 - ����������� ��������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:5;
        Def:0; Index:iContBoilMinPower+10; Mech:DZM_BURN6; AccessR:RW_GUEST; AccessW:RW_USER),}
    (Name:'����� - ����� ����� ����������/�����������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:600;Max:1800;
        Def:1200; Index:iContBoilTimeOnOff; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ��� �������� �������� ����� ������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:600;Max:1800;
        Def:1200; Index:iContFillTime+6; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ����� ������� �� ������(+20%)';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:60;Max:1200;
        Def:300; Index:iContBoilTimeOnOff+2; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ����� ������ ����� ��������� ������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:0;Max:1800;
        Def:300; Index:iContBoilRestart; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ����������� ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:50;
        Def:0; Index:iContTempCor+8; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ����������� ��������� �������';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:10;Max:90;
        Def:0; Index:iContTempCor+6; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ������� ���������� �������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:10;Max:50;
        Def:0; Index:iContBoilRestart+2; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ������� ���������� ��������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:0;Max:40;
        Def:0; Index:iContBoilRestart+4; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:40;Max:80;
        Def:65; Index:iContTSetTemp+8; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - �������� ��������� ��� �����������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:0;Max:6;
        Def:1; Index:iContShockBoil; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - �������� �� �������� ����� �����������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:0;Max:60;
        Def:20; Index:iContShockBoil+4; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ���������, ���� (���-����) ������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:-10;Max:40;
        Def:10; Index:iContMaxNetPower+2; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ���������� ��������� �������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:0;Max:6;
        Def:0; Index:iContBoilTimeOnOff+4; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����� - ����� ����������� �����������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:300;Max:1200;
        Def:600; Index:iContBoilTimeOnOff+6; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� �������� ��� ����������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0.10;Max:2;
        Def:0; Index:iContBoilTimeOnOff+8; Mech:DZM_BURN1; AccessR:RW_INVISIBLE; AccessW:RW_USER),
    (Name:'������ - ��������� ����������� �� ����������� ��';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:2;Max:10;
        Def:5; Index:iContTempMore; Mech:DZM_GRPUMP1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ - ����� ������ ����� ��������� ������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:0;Max:1800;
        Def:300; Index:iContIntTank+10; Mech:DZM_GRPUMP1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������ - ���������� ��������� �������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:0;Max:6;
        Def:0; Index:iContHPTry+2; Mech:DZM_GRPUMP1; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'���� - ����������� ����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:40;Max:100;
        Def:80; Index:iContSetUtilTemp; Mech:DZM_COLLZERO; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'���� - (%����-%�����) ��������� ������ ��';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:0;Max:40;
        Def:5; Index:iContTempCor+2; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - (%����-%�����) ��������� ������ ��';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:0;Max:20;
        Def:10; Index:iContTempCor; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - (%����-%�����) ��������� ������ ��';Frm:SSSS;Ed:'%';TipSens:TipProg;Min:0;Max:100;
        Def:30; Index:iContTempCor+4; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ������������ ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:40;Max:80;
        Def:70; Index:iContTMaxEmpty; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����������� �����������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:20;Max:50;
        Def:30; Index:iContTMaxEmpty+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ���������� �������� ����������';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:70;Max:99;
        Def:95; Index:iContTSetTemp+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ���������� ������� ����������';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:0;Max:30;
        Def:10; Index:iContTSetTemp+4; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ���� ������������������';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:0;Max:15;
        Def:10; Index:iContTSetTemp+6; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ������ ���������� ���� ��������� ��';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:2;Max:50;
        Def:10; Index:iContUtilDeadBand; Mech:DZM_COLLZERO; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ������� ����';Frm:SSSS;Ed:'�3';TipSens:TipProg;Min:0;Max:8000;
        Def:2000; Index:iContFillTime+4; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ������� ���������� �� ���������';Frm:SSSpS;Ed:'%';TipSens:TipProg;Min:10;Max:95;
        Def:15; Index:iContIntTank+10; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ������������ �������� ����������';Frm:SSSpS;Ed:'%/�';TipSens:TipProg;Min:5;Max:30;
        Def:15; Index:iContFillTime+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ��������������� ���������� ��';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:10;Max:120;
        Def:30; Index:iContFillTime; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - �������� �� ������';Frm:SSpSS;Ed:'���';TipSens:TipProg;Min:0;Max:10;
        Def:5; Index:iContIntTank+2; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ������������ �����������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0;Max:1;
        Def:0.01; Index:iContIntTank; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ���������� ������� ����������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0;Max:1;
        Def:0.9; Index:iContKAvTank; Mech:DZM_STORAGE; AccessR:RW_GUEST; AccessW:RW_USER),

    (Name:'��� - ����������� ������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:60;Max:100;
        Def:90; Index:iContMidlSens+2; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ����� ������� �� ������(+20%)';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:60;Max:1200;
        Def:300; Index:iContIntTank+4; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ����� ������ ����� ��������� ������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:0;Max:1800;
        Def:300; Index:iContIntTank+6; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - �������� ����������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:0;Max:1800;
        Def:300; Index:iContIntTank+8; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ���������� ��������� �������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:0;Max:6;
        Def:0; Index:iContHPTry; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ����������� ������������ ��������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0.2;Max:1;
        Def:0; Index:iContHPMinTime+4; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ����������� ����������� ��������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0.2;Max:1;
        Def:0; Index:iContHPMinTime+6; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - �����. �������� ����������� ��������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0;Max:0.5;
        Def:0; Index:iContHPAlrL; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'��� - ��� ��������� �������� �� �����';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:60;Max:3600;
        Def:0; Index:iContHPMinTime; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'����������� - ���������� ��������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:100;Max:30000;
        Def:600; Index:iContMaxNetPower; Mech:DZM_BUSNET; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'���� - ����� ��������� �������� �� 100���';Frm:SSSS;Ed:'�';TipSens:TipProg;Min:2;Max:1200;
        Def:0; Index:iContHPMinTime+2; Mech:DZM_PanelON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������������� - ��������/��������� �� ����';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:60;Max:3600;
        Def:0; Index:iContTimeBus+2; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������������� - ����� ���������� �����';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:1;Max:30;
        Def:0; Index:iContMidlSens; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������������� - ����� ������ �� ��������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:102;Max:300;
        Def:0; Index:iContTimeBus; Mech:DZM_GRON1; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������� ��������� - ����������� �������';Frm:SSSpS;Ed:'�C';TipSens:TipProg;Min:5;Max:25;
        Def:10; Index:iContHeaters; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������� ��������� - ����� ������';Frm:SSSS;Ed:'';TipSens:TipProg;Min:0;Max:10;
        Def:1; Index:iContHeaters+2; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������� ��������� - � - �����������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0.1;Max:10;
        Def:1; Index:iContHeaters+4; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������� ��������� - � - �����������';Frm:SSpSSS;Ed:'';TipSens:TipProg;Min:0;Max:1;
        Def:0.2; Index:iContHeaters+6; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������� ��2 - ������� �� �������� ��2';Frm:SSSS;Ed:'';TipSens:TipProg;Min:0;Max:10;
        Def:0; Index:iContMaxNetPower+4; Mech:0; AccessR:RW_GUEST; AccessW:RW_USER),
    (Name:'������� - ������� ������ ����� ������� �����������';Frm:SSSS;Ed:'���';TipSens:TipProg;Min:0;Max:120;
        Def:40; Index:iContShockBoil+2; Mech:DZM_BURN1; AccessR:RW_GUEST; AccessW:RW_USER)


);
//*********************************************************************
//******************** END ��������� ��������� ************************
//*********************************************************************


//*********************************************************************
//******************** ����� ��������� ******************************
//*********************************************************************

const iDateArx = 0; // ��������� ����
      iArxFullHeat =   iDateArx + 2;
      iArxElPower =   iArxFullHeat + 2;
      iArxBoilPower =   iArxElPower + 2;
      iArxHPPower =   iArxBoilPower + 2;
      iArxInTank =  iArxHPPower + 2;
      iArxOutTank =   iArxInTank + 2;
      iArxBoilRun =   iArxOutTank + 2;
      iArxHPRun =   iArxBoilRun + eSumBoilers*2;
      iArxElGrPower =   iArxHPRun + eSumHPUnits*2;
      iArxBoilGas =   iArxElGrPower + eSumElGroups*2;
      iArxTotalGas =  iArxBoilGas + eSumBoilers*2;
      
      SizeBoilArx = 162;
      SumValYBoilArx = 51;
var
DefBoilersArx:array [1..SumValYBoilArx] of TNameConst=(
//1
 (Name:'����^';Frm:SSsSS;Ed:'';TipSens:TipCalc;Min:0;Max:0;
    Def:NO_MIN_MAX; Index:iDateArx; GridColor:$ffef00; Mech:0; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'������������ �����������';Frm:SShSSm;Ed:'�:�';TipSens:TipCalc;Min:0;Max:0;
    Def:NO_MIN_MAX; Index:iArxTotalGas+2; GridColor:$ffef00; Mech:0; AccessR:RW_GUEST; AccessW:RW_NOEDIT),

 (Name:'������������ �����'; Frm:SSSpS;Ed:'����';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxFullHeat; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'������������ ��������������';Frm:SSSpS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElPower; Mech:DZM_PANELON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),

 (Name:'����� �� ������'; Frm:SSSpS;Ed:'����';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilPower; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),

 (Name:'����������� ����'; Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxTotalGas; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
//5
 (Name:'������������� �� ���';Frm:SSSpS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPPower; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� �� ���������� ���� ';Frm:SSSpS;Ed:'����';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxInTank; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'�����, ���������� �� ����';Frm:SSSpS;Ed:'����';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxOutTank; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
//8
 (Name:'����� 1 - �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilRun+0; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 2 - �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilRun+2; Mech:DZM_BoilON2; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 3 - �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilRun+4; Mech:DZM_BoilON3; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 4 - �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilRun+6; Mech:DZM_BoilON4; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 5 - �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilRun+8; Mech:DZM_BoilON5; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 6 - �������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilRun+10; Mech:DZM_BoilON6; AccessR:RW_GUEST; AccessW:RW_NOEDIT),

//8
 (Name:'����� 1 - ����������� ����';Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilGas+0; Mech:DZM_BoilON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 2 - ����������� ����';Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilGas+2; Mech:DZM_BoilON2; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 3 - ����������� ����';Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilGas+4; Mech:DZM_BoilON3; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 4 - ����������� ����';Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilGas+6; Mech:DZM_BoilON4; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 5 - ����������� ����';Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilGas+8; Mech:DZM_BoilON5; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'����� 6 - ����������� ����';Frm:SSSS;Ed:'�3';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxBoilGas+10; Mech:DZM_BoilON6; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
//14
 (Name:'��� 1 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+0; Mech:DZM_HPON1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 2 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+2; Mech:DZM_HPON2; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 3 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+4; Mech:DZM_HPON3; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 4 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+6; Mech:DZM_HPON4; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 5 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+8; Mech:DZM_HPON5; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 6 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+10; Mech:DZM_HPON6; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 7 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+12; Mech:DZM_HPON7; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 8 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+14; Mech:DZM_HPON8; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 9 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+16; Mech:DZM_HPON9; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��� 10 - ��������';Frm:SSSS;Ed:'���';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxHPRun+18; Mech:DZM_HPON10; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
//24
 (Name:'��. ������ 1 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+0; Mech:DZM_GRLIGHT1; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 2 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+2; Mech:DZM_GRLIGHT2; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 3 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+4; Mech:DZM_GRLIGHT3; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 4 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+6; Mech:DZM_GRLIGHT4; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 5 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+8; Mech:DZM_GRLIGHT5; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 6 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+10; Mech:DZM_GRLIGHT6; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 7 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+12; Mech:DZM_GRLIGHT7; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 8 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+14; Mech:DZM_GRLIGHT8; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 9 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+16; Mech:DZM_GRLIGHT9; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 10 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+18; Mech:DZM_GRLIGHT10; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 11 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+20; Mech:DZM_GRLIGHT11; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 12 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+22; Mech:DZM_GRLIGHT12; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 13 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+24; Mech:DZM_GRLIGHT13; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 14 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+26; Mech:DZM_GRLIGHT14; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 15 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+28; Mech:DZM_GRLIGHT15; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 16 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+30; Mech:DZM_GRLIGHT16; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 17 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+32; Mech:DZM_GRLIGHT17; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 18 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+34; Mech:DZM_GRLIGHT18; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 19 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+36; Mech:DZM_GRLIGHT19; AccessR:RW_GUEST; AccessW:RW_NOEDIT),
 (Name:'��. ������ 20 - �������������';Frm:SSpSS;Ed:'���*�';TipSens:TipCalc;Min:0;Max:0;
    Def:0; Index:iArxElGrPower+38; Mech:DZM_GRLIGHT20; AccessR:RW_GUEST; AccessW:RW_NOEDIT)


 );

//*********************************************************************
//******************* END ����� ��������� ***************************
//*********************************************************************

implementation

end.
