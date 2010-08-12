unit UnitPara;

interface

uses SysUtils,Inifiles,Windows,dialogs,FileCtrl,Forms;

/////////////////////////////////////////////////////////////////////
///////                                                        //////
///////      1 ϵͳ��ư������16·���ϵͳ����                //////
///////      2 CameraNum�����ϵͳ���������Ŀ����,��Դ��ini   //////
///////                                                        //////
/////////////////////////////////////////////////////////////////////

const
  MaxCameraCount = 16;
  MaxSensorInCount = 16;   maxuser=64;

//�û�Ȩ������
type
  TUserInfo=record
    USERNAME:string[12];      //�û���
    CHINANAME:string[12];     //�û�������
    PASSWORDS:string[12];     //����      ����ΪȨ�޷���
    ANOTE:string[12];        // ��ע
    wSearchView:word;     //�����ͼ࿴
    wBackup:word;         //����Ȩ��
    bManager:Byte;         //����Ȩ��
    blMotion:boolean;     //   �ƶ�����Ȩ��
    blJZCH:boolean;      //   ��������Ȩ��
    blYTCon:boolean;     //   ��̨����Ȩ��
    blCOLOR:boolean;     //  ������ɫȨ��
    blLOG:boolean;       //  �鿴��־Ȩ��
    blEXIT:boolean;       //  ϵͳ�˳�Ȩ��
    //����
    blSysPara:boolean;     // ����ϵͳ����
    blCamera:boolean;      // �������������
    blSensor:boolean;      //���ô�����
    blFileSys:boolean;     //�ļ�ϵͳ
    blYtPz:boolean;        //������̨������
    //�Ƿ�ʹ���������
    blManage:boolean;     //��ϵͳ����Ա����
  end;

//ϵͳ�˳�
Type
  tSysExit=record
     ExitIndex  :byte;
     CloseHour  :byte;
     CloseMin   :byte;
     Week1      :byte;
     Week2      :byte;
     Week3      :byte;
     Week4      :byte;
     Week5      :byte;
     Week6      :byte;
     Week7      :byte;
     BootHour   :byte;
     BootMin    :byte;
 end;

//*************��־�ļ��ṹ******************************
Type
  tLogFile=record
    bBJ:byte;       //��Ϣ���ͱ�� 0-�û������࣬1��ϵͳ��ʾ�࣬2��������
    Date:Tdatetime;
    Time:Tdatetime;
    UserName:string[12];    //�����û�
    LogInfo:string[100];   //ÿ����¼�����޶���50������
 end;

var
   ApplicationPath:string = '';
   //ϵͳ����
    CameraNum:Byte = 16;
    SensorInNum:Byte = 8;
    WriteLogTime:Byte = 30; //д��־ʱ��
    YTUseCom:Byte = 0;  //��̨ʹ�ô���
    IOCom:Byte = 0;
    AutoChange:Byte = 0; //�Զ��л�
    AutoChangeCount:Byte = 0;
    blAutoChange:boolean = false;
    DisplayMode:Byte = 1;  //�����л�ģʽ

    // JZCHCom:Byte = 0;
    Sysexit: tSysExit;
   RecStopIndex:integer = 0; //0-�޹ز�����1��ֹͣ¼��2����ʼ¼��3�����¶�д���ò���

   //sensor��Camera����
   SensorPosition:array[0..MaxSensorInCount-1] of string;
   SensorUseFlag:array[0..MaxCameraCount-1] of boolean;
   CameraPosition:array[0..MaxCameraCount-1] of string;
   CameraUseFlag:array[0..MaxCameraCount-1] of boolean;

   //��̨����
   YT_OpenFlag:boolean = false;
   Cur_YT_Com:byte = 0;  //��̨��ǰʹ�õĴ���
   blBlow:array[0..MaxCameraCount-1] of boolean;
   blLight:array[0..MaxCameraCount-1] of boolean;
   blAuto:array[0..MaxCameraCount-1] of boolean;
   blYtMove:boolean = false;
   Cur_YT_Addr:integer = 0;
   //��̨Ԥ��λ����
   blHighSpeed:array[0..MaxCameraCount-1] of boolean;
   keychar:array[0..1] of char;
   commandkey:char;
   PreBit:array[0..MaxCameraCount-1, 0..63] of boolean;   //Ԥ��λ�Ƿ����
   XJCount:Byte = 0;
   XJCamera:Byte = 0;
   //�û�����
   UserPass:array[0..maxuser] of TUserInfo;
   Cur_User:TUserInfo;
   //ɫ�ʡ���������
   moveflag:boolean = false;
   oldmoveflag:boolean = false;  //���������������ڿ�
   oldx,oldy:integer;
   ColorUpValue:Byte;  //
   bColorValue:array[0..4,0..MaxCameraCount-1] of Byte;    //������������ֵ

   UnLock_flag:Boolean=true;    // �������־
   Cur_camera:integer = 1;  //��ǰ�����
   blUseManage:boolean = true;  //ʹ�����������,true-ʹ��
//   YDTestFlag:boolean = false;   //�����춯������
   //���Ӱ��¼
   JBeginTime:Tdatetime; //�Ӱ�ʱ��
   LockBtnFlag:boolean = false;

   //===============================================================
   // add by wei dong  ������/Ԥ��λ��Ӧ����  presetyt1
    alarmtopreset:array[0..MaxSensorincount-1,1..MAXCameraCount] of integer;
  //������alarm[0][1]=5   alarm[0][3]=12
  //��ʾ0�ű����� --- ����1����̨��5��Ԥ��λ
  //                     ����3����̨��12��Ԥ��λ
  //======================================================================


//�Զ��庯��
   procedure CheckLogFile;
   function  GetLogFileName(DDate:TdateTime):string;
   procedure WriteLogFile(BJ:Word; LogStr:string);
   procedure Init_CurUser;
   //��ȡϵͳ��Ϣ
   Procedure ReadSysInfo;
   //��ȡ��������Ϣ
   Procedure ReadSensorInfo;
   //��ȡ�������Ϣ
   Procedure ReadCameraInfo;
   //��ȡɫ����Ϣ
   Procedure ReadColorInfo;
  //����ɫ����Ϣ
   Procedure WriteColorInfo;
   //��ȡ������Ԥ��λ��Ϣ
   Procedure ReadPrebit;
  //���������Ԥ��λ��Ϣ
   Procedure WritePrebit;
   procedure MyDelay(MSecs:longint);
   //add by wei dong



implementation

//�����־�ļ����Գ���������������־�ļ�ɾ��
procedure CheckLogFile;
var
  yy,mm,dd,i:word;
  s:string;
begin
   for i:=0 to 7 do
   begin
      decodeDate(date-WriteLogTime-i,yy,mm,dd);
      s:=Format('Log%.4d%.2d%.2d.dat',[yy,mm,dd]);
      if not fileExists(ApplicationPath+'Log\'+s) then continue;
      DeleteFile(pchar(ApplicationPath+'Log\'+s));
   end;
end;


function  GetLogFileName(DDate:Tdatetime):string;
var
  yy,mm,dd:word;
  s:string;
begin
  decodeDate(DDate,yy,mm,dd);
  s:=Format('Log%.4d%.2d%.2d.dat',[yy,mm,dd]);
  result:=s;
end;

//**********************************************************//
//                д��־�ļ�
//**********************************************************//
procedure WriteLogFile(BJ:Word; LogStr:string);
var
 Log:tLogFile;
 I_Log:integer;
 Logfile:string;
begin
  Log.bBJ:=BJ;
  Log.Date:=Date;
  Log.Time:=Time;
  if BJ = 0 then //�û�������
     Log.UserName:=Cur_User.USERNAME
  else
     Log.UserName:='';
  Log.LogInfo:=LogStr;

  Logfile:=ApplicationPath+'Log\'+GetLogFileName(Date);

  if FileExists(Logfile) then
     I_Log:=Fileopen(Logfile,fmShareDenyNone or fmOpenWrite)
  else
     I_Log:=FileCreate(Logfile);
     try
        FileSeek(I_Log,0,2);
        FileWrite(I_Log,Log,Sizeof(Log));
     finally
       fileClose(I_Log);
     end;
end;

//**********************************************************//
//                ��ʼ����ǰ�û�
//**********************************************************//
procedure ReadUserInfo;
var
  Userfile,revalue,i,j:integer;
  path:string;
begin
   //for i:=0 to 15 do UserPass[i].USERNAME := '';
   ZeroMemory(@UserPass,sizeof(UserPass));
   path:=ExtractFilePath(Application.EXEName)+'SetPara';
   Userfile:=-1;
   if FileExists(path+'\UserInfo.dat') then
      Userfile:=FileOpen(path+'\UserInfo.dat',fmOpenRead or fmShareDenyNone);

      if Userfile <> -1 then
      begin
         try
           FileSeek(Userfile,0,0);
           for i:=0 to maxuser do   //change by weidong from 15 to maxuser
           begin
             revalue:=FileRead(Userfile,UserPass[i],sizeof(TUserInfo));
             if(revalue<>sizeof(TUserInfo)) then  break;
             for j:=1 to length(UserPass[i].PASSWORDS) do
             begin
                  UserPass[i].PASSWORDS[j]:=chr(not ord(UserPass[i].PASSWORDS[j]));   //chr($f0 XOR (not ord(password[i])));
             end;
           end;
         finally
            FileClose(Userfile);
         end;
      end
      else
      begin
         UserPass[0].USERNAME:='sys';
         UserPass[0].CHINANAME:='';
         UserPass[0].PASSWORDS:='sys';
{         for i:=1 to length(UserPass[0].PASSWORDS) do
         begin
              UserPass[0].PASSWORDS[i]:=chr(not ord(UserPass[0].PASSWORDS[i]));   //chr($f0 XOR (not ord(password[i])));
         end;    }
         UserPass[0].ANOTE:='';
         UserPass[0].wSearchView:=$FFFF;
         UserPass[0].wBackup:=$FFFF;
         UserPass[0].bManager:=0;
         UserPass[0].blMotion:=true;
         UserPass[0].blJZCH:=true;
         UserPass[0].blYTCon:=true;
         UserPass[0].blCOLOR:=true;
         UserPass[0].blLOG:=true;
         UserPass[0].blEXIT:=true;
         //setup
         UserPass[0].blSysPara:=true;
         UserPass[0].blCamera:=true;
         UserPass[0].blSensor:=true;
         UserPass[0].blFileSys:=true;
         UserPass[0].blYtPz:=true;
         UserPass[0].blManage:=True;
      end;
end;

//��ʼ���û���Ϣ
procedure Init_CurUser;
Var
  i:integer;
  Flag:boolean;
begin
   ReadUserInfo;
   Flag:=False;
   for i:=0 to maxuser do
   begin
      if UserPass[i].USERNAME <> '' then
      if UserPass[i].bManager = 0 then
      begin
         if not UserPass[i].blManage then Flag:=true;   //ʹ�ù���Ȩ��
      end;
   end;

   if not Flag then //��ʹ�ù���Ȩ��
   begin
       blUseManage:=False;
       UnLock_flag:=true;
         Cur_User.USERNAME:='sys';
         Cur_User.CHINANAME:='';
         Cur_User.PASSWORDS:='sys';
{         for i:=1 to length(Cur_User.PASSWORDS) do
         begin
              Cur_User.PASSWORDS[i]:=chr(not ord(Cur_User.PASSWORDS[i]));   //chr($f0 XOR (not ord(password[i])));
         end; }
         Cur_User.ANOTE:='';
         Cur_User.wSearchView:=$FFFF;
         Cur_User.wBackup:=$FFFF;
         Cur_User.bManager:=0;
         Cur_User.blMotion:=true;
         Cur_User.blJZCH:=true;
         Cur_User.blYTCon:=true;
         Cur_User.blCOLOR:=true;
         Cur_User.blLOG:=true;
         Cur_User.blEXIT:=true;
         //setup
         Cur_User.blSysPara:=true;
         Cur_User.blCamera:=true;
         Cur_User.blSensor:=true;
         Cur_User.blFileSys:=true;
         Cur_User.blYtPz:=true;
         Cur_User.blManage:=true;
   end
   else
   begin
       blUseManage:=true;
   end;
end;

//��ȡϵͳ��Ϣ
Procedure ReadSysInfo;
var
  Sysini:Tinifile;
  num:integer;
begin
  Sysini:=Tinifile.Create(ApplicationPath+'SetPara\SysParam.ini');
  try
  //system
     CameraNum:=Sysini.ReadInteger('system','CameraNum',16);
       if(CameraNum>MaxCameraCount) then CameraNum:=MaxCameraCount;
       if(CameraNum<1) then CameraNum:=1;
     SensorInNum:=Sysini.ReadInteger('system','IO_Inum',8);
       if(SensorInNum>MaxSensorInCount) then SensorInNum:=MaxSensorInCount;
       if(SensorInNum<1) then SensorInNum:=1;
     WriteLogTime:=Sysini.ReadInteger('system','WriteLogTime',30);
     //YTandNet
     YTUseCom:= Sysini.ReadInteger('YTandNET','YTUseCom',0);
     IOCom:= Sysini.ReadInteger('YTandNET','IOUseCom',0);
     //JZCHCom:= Sysini.ReadInteger('YTandNET','JZCHUseCom',0);
     //sysexit
     Sysexit.ExitIndex:= Sysini.ReadInteger('exit','ExitIndex',0);
     Sysexit.CloseHour:= Sysini.ReadInteger('exit','CloseHour',0);
     Sysexit.CloseMin:= Sysini.ReadInteger('exit','CloseMin',0);
     Sysexit.Week1:= Sysini.ReadInteger('Boot','Week1',0);
     Sysexit.Week2:= Sysini.ReadInteger('Boot','Week2',0);
     Sysexit.Week3:= Sysini.ReadInteger('Boot','Week3',0);
     Sysexit.Week4:= Sysini.ReadInteger('Boot','Week4',0);
     Sysexit.Week5:= Sysini.ReadInteger('Boot','Week5',0);
     Sysexit.Week6:= Sysini.ReadInteger('Boot','Week6',0);
     Sysexit.Week7:= Sysini.ReadInteger('Boot','Week7',0);
     Sysexit.BootHour:= Sysini.ReadInteger('Boot','BootHour',0);
     Sysexit.BootMin:= Sysini.ReadInteger('Boot','BootMin',0);
     //�Զ��л�
     AutoChange := Sysini.ReadInteger('Lock','AutoChange',2);
     num := Sysini.ReadInteger('system','Init_Mode',1);
     case num of
       0: DisplayMode := 1;
       1: DisplayMode := 4;
       2: DisplayMode := 9;
       3: DisplayMode := 16;
     end;
  finally
     Sysini.free;
  end;
end;



//��ȡ��������Ϣ
Procedure ReadSensorInfo;
var
  i,j:integer;
  stc,stc1:string;
  Sensorini:Tinifile;
begin
   for i:=0 to MaxSensorInCount-1 do SensorUseFlag[i] := false;
   if(IOCom = 0) then  exit;
  Sensorini:=Tinifile.Create(ApplicationPath+'SetPara\SensorSet.ini');
  try
     for i:=0 to SensorInNum-1 do
     begin
        stc:='Sensor'+inttostr(i);
        SensorUseFlag[i]:=Sensorini.ReadBool(stc,'IFUSE',True);
        SensorPosition[i]:=Sensorini.ReadString(stc,'POSITION','');
        // add new line for read tiger preset pos
        for j:=1 to MaxCameraCount do
        begin

        stc1:='presetyt'+inttostr(j);//presetyt1
        alarmtopreset[i][j]:=Sensorini.ReadInteger(stc,stc1,0);
        //showmessage(stc+' '+stc1+' ='+inttostr(alarmtopreset[i][j]));
        end;
     end;
   finally
     Sensorini.free;
   end;
end;

//��ȡ�������Ϣ
Procedure ReadCameraInfo;
var
  i:integer;
  stc:string;
  Cameraini:Tinifile;
begin
  for i:=0 to MaxCameraCount-1 do  CameraUseFlag[i]:=false;
  Cameraini:=Tinifile.Create(ApplicationPath+'SetPara\CameraSet.ini');
  try
     for i:=0 to CameraNum-1 do
     begin
        stc:='Camera'+inttostr(i);
        //ON_OFF
        CameraUseFlag[i]:=Cameraini.ReadBool(stc,'ON_OFF',true);
        //Position
        CameraPosition[i]:=Cameraini.ReadString(stc,'Position','');
     end;
   finally
     Cameraini.free;
   end;
end;

//��ȡɫ����Ϣ
Procedure ReadColorInfo;
var
  Colorini:Tinifile;
  i:integer;
  str:string;
begin
  Colorini:=Tinifile.Create(ApplicationPath+'SetPara\ColorParam.ini');
  try
     for i:=0 to MaxCameraCount-1 do
     begin
       str:='Camera'+inttostr(i);
       bColorValue[0][i]:=Colorini.ReadInteger(str,'Brightness',120);
       bColorValue[1][i]:=Colorini.ReadInteger(str,'contrast',100);
       bColorValue[2][i]:=Colorini.ReadInteger(str,'tone',100);
       bColorValue[3][i]:=Colorini.ReadInteger(str,'saturation',100);
       bColorValue[4][i]:=Colorini.ReadInteger(str,'Voice',90);
     end;
  finally
     Colorini.free;
  end;
end;


//����ɫ����Ϣ
Procedure WriteColorInfo;
var
  Colorini:Tinifile;
  i:integer;
  str:string;
begin
  if not DirectoryExists(ApplicationPath+'SetPara') then  MkDir(ApplicationPath+'SetPara');
  Colorini:=Tinifile.Create(ApplicationPath+'SetPara\ColorParam.ini');
  try
     for i:=0 to CameraNum-1 do
     begin
       str:='Camera'+inttostr(i);
       Colorini.WriteInteger(str,'Brightness',bColorValue[0][i]);
       Colorini.WriteInteger(str,'contrast',bColorValue[1][i]);
       Colorini.WriteInteger(str,'tone',bColorValue[2][i]);
       Colorini.WriteInteger(str,'saturation',bColorValue[3][i]);
       Colorini.WriteInteger(str,'Voice',bColorValue[4][i]);
     end;
  finally
     Colorini.free;
  end;
end;

  //��ȡ������Ԥ��λ��Ϣ
Procedure ReadPrebit;
var
  preini:Tinifile;
  i,j:integer;
  str:string;
  Num:integer;
begin
  if not DirectoryExists(ApplicationPath+'YTConIni') then  MkDir(ApplicationPath+'YTConIni');
  preini:=Tinifile.Create(ApplicationPath+'YTConIni\PrebitParam.ini');
  try
     for i:=0 to CameraNum-1 do
     begin
       blHighSpeed[i]:=false;
       str:='YT'+inttostr(i+1);
       num:=preini.ReadInteger(str,'Prebit1',0);
       for j:=0 to 31 do
       begin
          if (num and 1) = 1 then PreBit[i][j]:=true
          else PreBit[i][j]:=false;
          num:=num shr 1;
       end;
       num:=preini.ReadInteger(str,'Prebit2',0);
       for j:=32 to 63 do
       begin
          if (num and 1) = 1 then PreBit[i][j]:=true
          else PreBit[i][j]:=false;
          num:=num shr 1;
       end;
     end;
  finally
     preini.free;
  end;
end;

  //���������Ԥ��λ��Ϣ
Procedure WritePrebit;
var
  preini:Tinifile;
  i,j:integer;
  str:string;
  Num:integer;
begin
  if not DirectoryExists(ApplicationPath+'YTConIni') then  MkDir(ApplicationPath+'YTConIni');
  preini:=Tinifile.Create(ApplicationPath+'YTConIni\PrebitParam.ini');
  try
     for i:=0 to CameraNum-1 do
     begin
       str:='YT'+inttostr(i+1);
       num:=0;
       for j:=31 downto 0 do
       begin
          if PreBit[i][j] then num:=num or 1;
          if j=0 then break;
          num:=num shl 1;
       end;
       preini.WriteInteger(str,'Prebit1',num);
       num:=0;
       for j:=63 downto 32 do
       begin
          if PreBit[i][j] then num:=num or 1;
          if j=32 then break;
          num:=num shl 1;
       end;
       preini.WriteInteger(str,'Prebit2',num);
     end;
  finally
     preini.free;
  end;
end;

//*****************************************************************************
//                        ʱ���ӳ�
//*****************************************************************************
procedure MyDelay(MSecs:longint);
var
  FirstTickCount,inow:longint;
begin
  FirstTickcount:=GetTickCount;
  repeat
    Application.ProcessMessages ; 
    inow:=GetTickCount;
  until (inow-FirstTickCount>=MSecs) or (inow<FirstTickCount);
end;

//*****************************************************************************
//                        ��pc���﷢��
//*****************************************************************************
{function _GetPort(address:word):word;//��ȡ�˿�
var
  bValue: byte;
begin
  asm
    mov dx,address
    in al,dx
    mov bValue,al
  end;
  Result := bValue;
end;


procedure _SetPort(address,Value:Word);//���ö˿�
var
  bValue: byte;
begin
  bValue := Trunc(Value and 255);
  asm
    mov dx,address
    mov al,bValue
    out dx,al
  end;
end;


procedure StartBeep(Freq : Word);//��ʼ����,FreqΪƵ��
var
  B: Byte;
begin
  if Freq >18 then
  begin
    Freq := Word(1193181 div LongInt(Freq));
    B := Byte(_GetPort($61));
    if (B and 3) = 0 then
    begin
      _SetPort($61,Word(B or 3));
      _SetPort($43,$B6);
    end;
    _SetPort($42,Freq);
    _SetPort($42,Freq shr 8);
  end;
end;


procedure StopBeep;//ֹͣ����
var
  Value: Word;
begin
  value := _GetPort($61) and $FC;
  _SetPort($61,Value);
end;


procedure BeepFor(Tone : word; MSecs : integer);//������ͬ��������ͬʱ�䳤�ȵ�����
var
  StartTime : LongInt;
begin
  StartBeep(Tone);
  StartTime:=GetTickCount;
  while ( (GetTickCount - StartTime) < LongInt(MSecs) )
  do Application.ProcessMessages;
  StopBeep;
end;
      }
end.
