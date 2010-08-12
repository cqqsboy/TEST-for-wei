// ver 2004-03-15  add by wei dong  add function is
// if have some alarm found then call preset position of high speed camera
unit DvrFormImpl1;
////2007-9-17 增加3个云台接口，把最大用户数扩展到32       2009-8-11 在老的版本上增加接口 2个云台

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Shellapi,// Unitverion,
  ActiveX, AxCtrls, DvrFormProj1_TLB, StdVcl, jpeg, ExtCtrls, fcLabel,FileCtrl,YT_COMLib_TLB,
  fcButton, fcImgBtn, StdCtrls, ComCtrls,inifiles;
const 
 maxuser=64;
type
  TDvrForm = class(TActiveForm, IDvrForm)
    ImageMain: TImage;
    Slider2: TImage;
    Slider3: TImage;
    Slider4: TImage;
    Slider5: TImage;
    Timer1: TTimer;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    CurCameraNumLabel: TfcLabel;
    Exitbtn: TImage;
    ImageSlider2: TImage;
    ImageSlider3: TImage;
    ImageSlider4: TImage;
    ImageSlider5: TImage;
    LockBtn: TImage;
    SetupBtn: TImage;
    SearchBtn: TImage;
    Mode1Btn: TImage;
    Mode4Btn: TImage;
    Mode9Btn: TImage;
    Mode16Btn: TImage;
    JbLogBtn: TImage;
    GriphicBtn: TImage;
    RecBtn: TImage;
    ColorDefaultBtn: TImage;
    CameraBtn1: TImage;
    CameraBtn2: TImage;
    CameraBtn3: TImage;
    CameraBtn4: TImage;
    CameraBtn5: TImage;
    CameraBtn6: TImage;
    CameraBtn7: TImage;
    CameraBtn8: TImage;
    CameraBtn9: TImage;
    CameraBtn10: TImage;
    CameraBtn11: TImage;
    CameraBtn12: TImage;
    CameraBtn13: TImage;
    CameraBtn14: TImage;
    CameraBtn15: TImage;
    CameraBtn16: TImage;
    SensorBtn13: TImage;
    SensorBtn14: TImage;
    SensorBtn15: TImage;
    SensorBtn16: TImage;
    SensorBtn12: TImage;
    SensorBtn11: TImage;
    SensorBtn10: TImage;
    SensorBtn9: TImage;
    SensorBtn5: TImage;
    SensorBtn1: TImage;
    SensorBtn2: TImage;
    SensorBtn6: TImage;
    SensorBtn3: TImage;
    SensorBtn7: TImage;
    SensorBtn4: TImage;
    SensorBtn8: TImage;
    displaySlider1: TLabel;
    displaySlider2: TLabel;
    displaySlider3: TLabel;
    displaySlider4: TLabel;
    displaySlider5: TLabel;
    VersionBtn: TImage;
    HighspeedBtn: TImage;
    LogBtn: TImage;
    YTLightBtn: TImage;
    YTBlowBtn: TImage;
    YTZoomInBtn: TImage;
    YTZoomOutBtn: TImage;
    YTLeftBtn: TImage;
    YTLupBtn: TImage;
    YTUpBtn: TImage;
    YTRupBtn: TImage;
    YTRightBtn: TImage;
    YTRDnBtn: TImage;
    YTDownBtn: TImage;
    YTLeftDnBtn: TImage;
    YTFocusfarBtn: TImage;
    YTFocusNearBtn: TImage;
    YTIrisLargeBtn: TImage;
    YTIrisSmallBtn: TImage;
    YTAutoBtn: TImage;
    MotionBtn: TImage;
    AutochangeBtn: TImage;
    PreBtn1: TImage;
    PreBtn2: TImage;
    PreBtn3: TImage;
    PreBtn4: TImage;
    PreBtn5: TImage;
    PreBtn6: TImage;
    PreBtn7: TImage;
    PreBtn8: TImage;
    PreBtn9: TImage;
    PreBtn10: TImage;
    PreBtn11: TImage;
    PreBtn12: TImage;
    PreBtn13: TImage;
    PreBtn14: TImage;
    PreBtn15: TImage;
    PreBtn16: TImage;
    HighEdit: TEdit;
    HighSetBtn: TImage;
    HighGoBtn: TImage;
    fcLabelWeek: TfcLabel;
    Timer2: TTimer;
    Slider1: TImage;
    ImageSlider1: TImage;
    ImagLogo: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure ExitbtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ExitbtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageSlider1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageSlider1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageSlider1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageSlider2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageSlider3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageSlider4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageSlider5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SetupBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetupBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SearchBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SearchBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Mode1BtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Mode1BtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LockBtnClick(Sender: TObject);
    procedure LogBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LogBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GriphicBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GriphicBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RecBtnClick(Sender: TObject);
    procedure ColorDefaultBtnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ColorDefaultBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CameraBtn1Click(Sender: TObject);
    procedure SensorBtnClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure VersionBtnClick(Sender: TObject);
    procedure HighspeedBtnClick(Sender: TObject);
    procedure JbLogBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JbLogBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure YTLightBtnClick(Sender: TObject);
    procedure YTBlowBtnClick(Sender: TObject);
    procedure YTAutoBtnClick(Sender: TObject);
    procedure YTIrisLargeBtnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure YTIrisLargeBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MotionBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MotionBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AutochangeBtnClick(Sender: TObject);
    procedure PreBtn1Click(Sender: TObject);
    procedure HighEditKeyPress(Sender: TObject; var Key: Char);
    procedure HighSetBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HighSetBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HighGoBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HighGoBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure ImagLogoClick(Sender: TObject);
    procedure ImageSlider1EndDock(Sender, Target: TObject; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure soundbtnClick(Sender: TObject);
    procedure ImageresetClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
    FEvents: IDvrFormEvents;
    yt_dll:Iytcon;
    procedure YTBtnUpdate(flag:boolean);
    procedure InitCameraBtn;
    procedure InitSensorBtn;
    procedure Open_YT_Com;
    procedure Close_YT_Com;
    procedure DisplayWeek;
    Function CheckYTConPass:boolean;
    procedure YTBtnStatusChange(Status:boolean);
    procedure YTBtnClick(CameraNO,Index:Byte);//Index=0-Auto,1-Blow,2-Light
    procedure HighBtn_Control(bl:boolean);
    procedure HighBtn_Status(TD:BYTE);
    procedure CallPrebit;
    procedure SavePrebit;
    procedure DeletePrebit;
    procedure XJPrebit;
    procedure Prebtnstatus(No:byte; bl:boolean);
    procedure Set_CurCamera_ColorValue(index, Value: Integer);
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    procedure CloseEvent(Sender: TObject; var Action: TCloseAction);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure SetCamera_ColorValue(CameraNo, index, Value: Integer); safecall;
    procedure PassWord(var PassFlag: SYSINT); safecall;
    procedure JJRecFinish; safecall;
    procedure DisplayRecType(CameraNo, Value: Integer); safecall;
    procedure AboutInfo(const name, ProductName, Version, Comments,
      timestr: WideString); safecall;
    procedure YTRemote_WriteAddr(Addr: Integer); safecall;
    procedure YTRemote_Command(Command, BeginorEnd, Mode: Integer); safecall;
    procedure YTRemote_ReadAddr(var Addr: Integer); safecall;
    procedure Set_CurCamera(CameraNo: Integer); safecall;
    procedure sys_init; safecall;
    procedure WriteLog(Bj: Integer; const LogRec: WideString); safecall;
    procedure UpdateParaset(Revalue: Integer); safecall;
    procedure DisplayAlarmType(SensorNo, mode: Integer); safecall;
    procedure GetSetupPass(var PassValue, SetPara: SYSINT); safecall;
    procedure GetSearchPass(var PassSearch, PassBackup: SYSINT); safecall;
    procedure SetupCameraNum(Num: Integer); safecall;
    procedure LockScreen; safecall;
    procedure IsCompany(out flag: SYSINT); safecall;
    procedure SoundOn(open: Integer); safecall;
    procedure YTRemote_CallPreset(pos: Integer); safecall;
    procedure YTRemote_SavePreset(pos: Integer); safecall;
  public
    { Public declarations }
    Function  CheckPass(Mode:Byte):boolean;
    procedure Initialize; override;
    // split bmpfile for ervry button
    procedure splitbmp( pos:TRECT ;bmpfilename:string; savefilename:string );
    // add by wei dong 2004-3-16
    procedure alarmtiger(k :integer ) ;     // 连动k 号报警器 对应的预制位

  end;

implementation


uses ComObj, ComServ, About1,UnitPara,Unituser,uDisplayLog,UnitJBLog;

{$R *.DFM}

{ TDvrForm }

{$R vc_res.res}
 // add next line for  define dycompany   有标示版本 else 无标示版本 wei dong 02-12-20

//{$define dycompany}


// add this line for camera light is red yel gre .
//{$define SDSG}                 this ver is for caixun



procedure TDvrForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_DvrFormPage); }
end;

procedure TDvrForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IDvrFormEvents;
end;

procedure TDvrForm.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
  OnClose := CloseEvent;
end;

function TDvrForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TDvrForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TDvrForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TDvrForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TDvrForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TDvrForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TDvrForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TDvrForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TDvrForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TDvrForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TDvrForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TDvrForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TDvrForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TDvrForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TDvrForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TDvrForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TDvrForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TDvrForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TDvrForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TDvrForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TDvrForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TDvrForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TDvrForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TDvrForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TDvrForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TDvrForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TDvrForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TDvrForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TDvrForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TDvrForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TDvrForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TDvrForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TDvrForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TDvrForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TDvrForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TDvrForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TDvrForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TDvrForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TDvrForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TDvrForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TDvrForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TDvrForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TDvrForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TDvrForm.Timer1Timer(Sender: TObject);
var
  yy,mm,dd,hh,min,ss,ms,week:word;
  weekflag:boolean;
begin
  decodeDate(date,yy,mm,dd);
  decodeTime(time,hh,min,ss,ms);
  week := dayofweek(date);
  fcLabel1.Caption:=format('%.4d-%.2d-%.2d',[yy,mm,dd]);
  fcLabel2.Caption:=format('%.2d:%.2d:%.2d',[hh,min,ss]);

  if blAutoChange then
  begin
       inc(AutoChangeCount);
       if AutoChangeCount>AutoChange then
       begin
          if FEvents<>nil then FEvents.OnModeChange(DisplayMode);     //画面状态更改事件
          AutoChangeCount := 0;
       end;
  end;
{
  if (ss = 0) and (min mod 30 = 0) then
     with FrmVerion.Create(self) do
     begin
        try
           ShowModal;
        finally
           free;
        end;
     end;   
 }
  if (hh=0)and(min=0)and(ss<3) then
  begin
     DisplayWeek;
     CheckLogFile;
  end;
  if LockBtnFlag then
  begin
     LockBtnClick(Sender);
     LockBtnFlag:=false;
  end;

  if(ss>=2)then  exit; //退出条件只对分钟
  weekflag:=false;
  case week of
     1: if Sysexit.Week7 = 1 then  weekflag:=true;
     2: if Sysexit.Week1 = 1 then  weekflag:=true;
     3: if Sysexit.Week2 = 1 then  weekflag:=true;
     4: if Sysexit.Week3 = 1 then  weekflag:=true;
     5: if Sysexit.Week4 = 1 then  weekflag:=true;
     6: if Sysexit.Week5 = 1 then  weekflag:=true;
     7: if Sysexit.Week6 = 1 then  weekflag:=true;
  end;

  if weekflag then
  begin
     if (Sysexit.BootHour = hh) and (Sysexit.BootMin = min) then
     begin
       //退出
          Close_YT_Com;
          WriteColorInfo;  //保存色彩信息
          WritePrebit;    //保存高速球预置位信息
          WriteLogFile(1,'程序自动中止系统重启计算机');
        if Fevents<>nil then  Fevents.OnClose(1);  //重启系统
     end;
  end;

  if Sysexit.ExitIndex = 2 then
  begin
     if (Sysexit.CloseHour = hh) and (Sysexit.CloseMin = min) then
     begin
       //退出
          Close_YT_Com;
          WriteColorInfo;  //保存色彩信息
          WritePrebit;    //保存高速球预置位信息
          WriteLogFile(1,'程序自动中止系统关闭计算机');
        if Fevents<>nil then  Fevents.OnClose(2);  //退出到关机
     end;
  end;
end;

Function TDvrForm.CheckPass(Mode:Byte):boolean;
begin
 //  result:=false;
   with TFrmUser.Create(nil) do      //用户登录
   begin
      try
         if FEvents <> nil then FEvents.OnFacetoWork(1);
         if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
         result:=InputUSerPass(Mode);
         if result = true then
         if FEvents<>nil then FEvents.OnLockPass(Cur_User.wSearchView);   //不同用户监看权限通知
         if FEvents <> nil then FEvents.OnFacetoWork(0);
      finally
        free;
      end;
   end;
end;

procedure TDvrForm.ImageSlider1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    i:integer;
begin
  if not UnLock_flag then exit;
  if Cur_User.blCOLOR = false then exit; //无权限
  if Button=TMouseButton(mbLeft) then
  begin
      moveflag:=True;
      oldmoveflag:=True;
      oldx:=x; oldy:=y;
      i:=Timage(sender).tag;
      if (i>0)and(i<6) then
         ColorUpValue:=bColorValue[i-1][Cur_camera-1];
  end;
end;

procedure TDvrForm.ImageSlider1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    i:integer;
begin
  if not UnLock_flag then exit;
  if Cur_User.blCOLOR = false then exit; //无权限

  if Button=TMouseButton(mbLeft) then
  begin
      oldmoveflag:=False;
      moveflag:=False;
      i:=Timage(sender).tag;
      case i of
         1:begin
             bColorValue[0][Cur_camera-1]:=ColorUpValue;
             WriteLogFile(0,'调节摄像机'+inttostr(Cur_camera)+'的亮度'); //adjust Brightness
           end;
         2:begin
             bColorValue[1][Cur_camera-1]:=ColorUpValue;
             WriteLogFile(0,'调节摄像机'+inttostr(Cur_camera)+'的对比度');//adjust contrast
           end;
         3:begin
             bColorValue[2][Cur_camera-1]:=ColorUpValue;
             WriteLogFile(0,'调节摄像机'+inttostr(Cur_camera)+'的色度');   //adjust tone
           end;
         4:begin
             bColorValue[3][Cur_camera-1]:=ColorUpValue;
             WriteLogFile(0,'调节摄像机'+inttostr(Cur_camera)+'的饱和度');   //adjust saturation
             end;
         5:begin
             bColorValue[4][Cur_camera-1]:=ColorUpValue;
             WriteLogFile(0,'调节摄像机'+inttostr(Cur_camera)+'的音量');   //adjust Voice
           end;
      end;
  end;
end;

procedure TDvrForm.ImageSlider1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i,k:integer;
  upx,downx:integer;
begin
    // add by wei dong

    if not UnLock_flag then exit;
    if Cur_User.blCOLOR = false then exit; //无权限

     if(Slider1.Left<ImageSlider1.Left+1)then begin Slider1.Left:=ImageSlider1.Left+2; exit; end;
     if(Slider1.Left+Slider1.Width>ImageSlider1.Left+ImageSlider1.Width-1)then
     begin Slider1.Left:=ImageSlider1.Left+ImageSlider1.Width-Slider1.Width-2; exit; end;

    if (x<0) or (x>ImageSlider1.Width) or (y<0) or (y>ImageSlider1.Height) then moveflag:=False
      else begin if oldmoveflag then moveflag:=True; end;

    if moveflag then
    begin
      upx:=ImageSlider1.Left-Slider1.Width div 2;
      downx:=ImageSlider1.Left+ImageSlider1.Width-(Slider1.Width div 2);
      if (X>=Slider1.Width div 2) and (X<ImageSlider1.Width-Slider1.Width div 2) and
         (Slider1.Left<downX) and (Slider1.Left>=upX)then
      begin
         Slider1.Left:=Slider1.Left+X-oldX;
         k:=Slider1.Left+Slider1.Width div 2-ImageSlider1.Left;
         i:=255 *k{(ImageSlider1.Width-k)} div ImageSlider1.Width;  //默认色彩范围0－255
         if(i>255)or(i<0)then exit;
         displaySlider1.Caption:=inttostr(i);
         // add by weidong for delete message
         //if(abs(oldx-x)>(ImageSlider1.Width /256.0)) then
         if FEvents<>nil then FEvents.OnColorSet(Cur_camera,1,i);  //OnColorSet事件的第一个参数为摄像机号
            //第二个参数index意义1－调整亮度，2－对比度，3－色度，4－饱和度，5－此通道音量；第三个参数为
            //value为具体值，范围均为0－255；默认值均为100
         ColorUpValue:=i;
         oldx:=x;
      end;
    end;

end;

procedure TDvrForm.ImageSlider2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i,k:integer;
  upx,downx:integer;
begin
     if not UnLock_flag then exit;
     if Cur_User.blCOLOR = false then exit; //无权限

     if(Slider2.Left<ImageSlider2.Left+1)then begin Slider2.Left:=ImageSlider2.Left+2; exit; end;
     if(Slider2.Left+Slider2.Width>ImageSlider2.Left+ImageSlider2.Width-1)then
     begin Slider2.Left:=ImageSlider2.Left+ImageSlider2.Width-Slider2.Width-2; exit; end;

    if (x<0) or (x>ImageSlider2.Width) or (y<0) or (y>ImageSlider2.Height) then moveflag:=False
      else begin if oldmoveflag then moveflag:=True; end;

    if moveflag then
    begin
      upx:=ImageSlider2.Left-Slider2.Width div 2;
      downx:=ImageSlider2.Left+ImageSlider2.Width-(Slider2.Width div 2);
      if (X>=Slider2.Width div 2) and (X<ImageSlider2.Width-Slider2.Width div 2) and
         (Slider2.Left<downX) and (Slider2.Left>=upX)then
      begin
         Slider2.Left:=Slider2.Left+X-oldX;
         k:=Slider2.Left+Slider2.Width div 2-ImageSlider2.Left;
         i:=255 *k{(ImageSlider2.Width-k)} div ImageSlider2.Width;  //默认色彩范围0－255
         if(i>255)or(i<0)then exit;
         displaySlider2.Caption:=inttostr(i);
            if FEvents<>nil then FEvents.OnColorSet(Cur_camera,2,i);  //OnColorSet事件的第一个参数为摄像机号
            //第二个参数index意义1－调整亮度，2－对比度，3－色度，4－饱和度，5－此通道音量；第三个参数为
            //value为具体值，范围均为0－255；默认值均为100
            ColorUpValue:=i;
         oldx:=x;
      end;
    end;
end;

procedure TDvrForm.ImageSlider3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i,k:integer;
  upx,downx:integer;
begin
     if not UnLock_flag then exit;
     if Cur_User.blCOLOR = false then exit; //无权限

     if(Slider3.Left<ImageSlider3.Left+1)then begin Slider3.Left:=ImageSlider3.Left+2; exit; end;
     if(Slider3.Left+Slider3.Width>ImageSlider3.Left+ImageSlider3.Width-1)then
     begin Slider3.Left:=ImageSlider3.Left+ImageSlider3.Width-Slider3.Width-2; exit; end;

    if (x<0) or (x>ImageSlider3.Width) or (y<0) or (y>ImageSlider3.Height) then moveflag:=False
      else begin if oldmoveflag then moveflag:=True; end;

    if moveflag then
    begin
      upx:=ImageSlider3.Left-Slider3.Width div 2;
      downx:=ImageSlider3.Left+ImageSlider3.Width-(Slider3.Width div 2);
      if (X>=Slider3.Width div 2) and (X<ImageSlider3.Width-Slider3.Width div 2) and
         (Slider3.Left<downX) and (Slider3.Left>=upX)then
      begin
         Slider3.Left:=Slider3.Left+X-oldX;
         k:=Slider3.Left+Slider3.Width div 2-ImageSlider3.Left;
         i:=255 *k{(ImageSlider3.Width-k)} div ImageSlider3.Width;  //默认色彩范围0－255
         if(i>255)or(i<0)then exit;
         displaySlider3.Caption:=inttostr(i);
            if FEvents<>nil then FEvents.OnColorSet(Cur_camera,3,i);  //OnColorSet事件的第一个参数为摄像机号
            //第二个参数index意义1－调整亮度，2－对比度，3－色度，4－饱和度，5－此通道音量；第三个参数为
            //value为具体值，范围均为0－255；默认值均为100
            ColorUpValue:=i;
         oldx:=x;
      end;
    end;
end;

procedure TDvrForm.ImageSlider4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i,k:integer;
  upx,downx:integer;
begin
     if not UnLock_flag then exit;
     if Cur_User.blCOLOR = false then exit; //无权限

     if(Slider4.Left<ImageSlider4.Left+1)then begin Slider4.Left:=ImageSlider4.Left+2; exit; end;
     if(Slider4.Left+Slider4.Width>ImageSlider4.Left+ImageSlider4.Width-1)then
     begin Slider4.Left:=ImageSlider4.Left+ImageSlider4.Width-Slider4.Width-2; exit; end;

    if (x<0) or (x>ImageSlider4.Width) or (y<0) or (y>ImageSlider4.Height) then moveflag:=False
      else begin if oldmoveflag then moveflag:=True; end;

    if moveflag then
    begin
      upx:=ImageSlider4.Left-Slider4.Width div 2;
      downx:=ImageSlider4.Left+ImageSlider4.Width-(Slider4.Width div 2);
      if (X>=Slider4.Width div 2) and (X<ImageSlider4.Width-Slider4.Width div 2) and
         (Slider4.Left<downX) and (Slider4.Left>=upX)then
      begin
         Slider4.Left:=Slider4.Left+X-oldX;
         k:=Slider4.Left+Slider4.Width div 2-ImageSlider4.Left;
         i:=255 *k{(ImageSlider4.Width-k)} div ImageSlider4.Width;  //默认色彩范围0－255
         if(i>255)or(i<0)then exit;
         displaySlider4.Caption:=inttostr(i);
            if FEvents<>nil then FEvents.OnColorSet(Cur_camera,4,i);  //OnColorSet事件的第一个参数为摄像机号
            //第二个参数index意义1－调整亮度，2－对比度，3－色度，4－饱和度，5－此通道音量；第三个参数为
            //value为具体值，范围均为0－255；默认值均为100
            ColorUpValue:=i;
         oldx:=x;
      end;
    end;
end;

procedure TDvrForm.ImageSlider5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i,k:integer;
  upx,downx:integer;
begin
     if not UnLock_flag then exit;
     if Cur_User.blCOLOR = false then exit; //无权限

     if(Slider5.Left<ImageSlider5.Left+1)then begin Slider5.Left:=ImageSlider5.Left+2; exit; end;
     if(Slider5.Left+Slider5.Width>ImageSlider5.Left+ImageSlider5.Width-1)then
     begin Slider5.Left:=ImageSlider5.Left+ImageSlider5.Width-Slider5.Width-2; exit; end;

    if (x<0) or (x>ImageSlider5.Width) or (y<0) or (y>ImageSlider5.Height) then moveflag:=False
      else  begin if oldmoveflag then moveflag:=True; end;

    if moveflag then
    begin
      upx:=ImageSlider5.Left-Slider5.Width div 2;
      downx:=ImageSlider5.Left+ImageSlider5.Width-(Slider5.Width div 2);
      if (X>=Slider5.Width div 2) and (X<ImageSlider5.Width-Slider5.Width div 2) and
         (Slider5.Left<downX) and (Slider2.Left>=upX)then
      begin
         Slider5.Left:=Slider5.Left+X-oldX;
         k:=Slider5.Left+Slider5.Width div 2-ImageSlider5.Left;
         i:=100*k{(ImageSlider5.Width-k)} div ImageSlider5.Width;  //默认色彩范围0－255
         if(i>255)or(i<0)then exit;
         displaySlider5.Caption:=inttostr(i);
            if FEvents<>nil then FEvents.OnColorSet(Cur_camera,5,i);  //OnColorSet事件的第一个参数为摄像机号
            //第二个参数index意义1－调整亮度，2－对比度，3－色度，4－饱和度，5－此通道音量；第三个参数为
            //value为具体值，范围均为0－255；默认值均为100
            ColorUpValue:=i;
         oldx:=x;
      end;
    end;
end;

procedure TDvrForm.SetCamera_ColorValue(CameraNo, index, Value: Integer);
begin
   if(CameraNo>0)and(CameraNo<=MaxCameraCount) then
   if(index>0)and(index<6) then
   begin
      bColorValue[index-1][CameraNo-1]:= Value;
      if(CameraNo = Cur_camera) then Set_CurCamera_ColorValue(index,Value);
   end;
end;

procedure TDvrForm.Set_CurCamera_ColorValue(index, Value: Integer);
var
  m:integer;
begin
   case index of
     1:begin
          m:={ImageSlider1.Width-}value*ImageSlider1.Width div 255;
          Slider1.Left:= ImageSlider1.Left+m-Slider1.Width div 2;
          if (m-Slider1.Width div 2 )<0 then Slider1.Left:= ImageSlider1.Left;
          displaySlider1.Caption:=inttostr(value);
       end;
     2:begin
          m:={ImageSlider2.Width-}value*ImageSlider2.Width div 255;
          Slider2.Left:= ImageSlider2.Left+m-Slider2.Width div 2;
          if (m-Slider2.Width div 2 )<0 then Slider2.Left:= ImageSlider2.Left;
          displaySlider2.Caption:=inttostr(value);
       end;
     3:begin
          m:={ImageSlider3.Width-}value*ImageSlider3.Width div 255;
          Slider3.Left:= ImageSlider3.Left+m-Slider3.Width div 2;
          if (m-Slider3.Width div 2 )<0 then Slider3.Left:= ImageSlider3.Left;
          displaySlider3.Caption:=inttostr(value);
       end;
     4:begin
          m:={ImageSlider4.Width-}value*ImageSlider4.Width div 255;
          Slider4.Left:= ImageSlider4.Left+m-Slider4.Width div 2;
          if (m-Slider4.Width div 2 )<0 then Slider4.Left:= ImageSlider4.Left;
          displaySlider4.Caption:=inttostr(value);
       end;
     5:begin
          m:={ImageSlider5.Width-}value*ImageSlider5.Width div 100;
          Slider5.Left:= ImageSlider5.Left+m-Slider5.Width div 2;
          if (m-Slider5.Width div 2 )<0 then Slider5.Left:= ImageSlider5.Left;
          displaySlider5.Caption:=inttostr(value);
       end;
   end;
end;

procedure TDvrForm.SetupBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'SETUPDN');
  SetupBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.SetupBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
//  Flag:boolean;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'SETUPUP');
  SetupBtn.Picture.Assign(Bmp);
  Bmp.Free;
{
  if Cur_User.blSETUP = false then
  begin
    Flag:=CheckPass(1);
    if (Flag = false) or (Cur_User.blSETUP = false) then
    begin
     //  if FEvents <> nil then FEvents.OnFacetoWork(1);
     //  MessageBox(handle,'你没有进行参数设置的权限','系统提示',MB_OK);
     //  if FEvents <> nil then FEvents.OnFacetoWork(0);
       exit;
    end;
  end;  }
  if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
  if FEvents<>nil then FEvents.OnSetup;
end;

procedure TDvrForm.SearchBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'SEARCHDN');
  SearchBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.SearchBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
//  Flag:boolean;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'SEARCHUP');
  SearchBtn.Picture.Assign(Bmp);
  Bmp.Free;
{  if Cur_User.blSEARCH = false then
  begin
    Flag:=CheckPass(1);
    if (Flag = false) or (Cur_User.blSEARCH = false) then
    begin
      // MessageBox(handle,'你没有检索录像的权限','系统提示',MB_OK);
       exit;
    end;
  end;
   }
   if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
   if FEvents<>nil then FEvents.OnSearch;
end;

procedure TDvrForm.Mode1BtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  i:integer;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  i:=Timage(sender).tag;
  case i of
    1:begin
        Bmp.LoadFromResourceName(HInstance,'MODE1DN');
        Mode1Btn.Picture.Assign(Bmp);
      end;
    4:begin
        Bmp.LoadFromResourceName(HInstance,'MODE4DN');
        Mode4Btn.Picture.Assign(Bmp);
      end;
    9:begin
        Bmp.LoadFromResourceName(HInstance,'MODE9DN');
        Mode9Btn.Picture.Assign(Bmp);
      end;
    16:begin
        Bmp.LoadFromResourceName(HInstance,'MODE16DN');
        Mode16Btn.Picture.Assign(Bmp);
      end;
  end;
  Bmp.Free;
end;

procedure TDvrForm.Mode1BtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  DisplayMode:=Timage(sender).tag;
  case DisplayMode of
    1:begin
        Bmp.LoadFromResourceName(HInstance,'MODE1UP');
        Mode1Btn.Picture.Assign(Bmp);
      end;
    4:begin
        Bmp.LoadFromResourceName(HInstance,'MODE4UP');
        Mode4Btn.Picture.Assign(Bmp);
      end;
    9:begin
        Bmp.LoadFromResourceName(HInstance,'MODE9UP');
        Mode9Btn.Picture.Assign(Bmp);
      end;
    16:begin
        Bmp.LoadFromResourceName(HInstance,'MODE16UP');
        Mode16Btn.Picture.Assign(Bmp);
      end;
  end;
  Bmp.Free;
  if FEvents<>nil then FEvents.OnModeChange(DisplayMode);     //画面状态更改事件
end;

procedure TDvrForm.LockBtnClick(Sender: TObject);
var
  Bmp: TBitmap;
  i,SearchView:integer;
begin
  if not blUseManage then exit;

  Bmp := TBitmap.Create;
   if UnLock_flag  then
   begin
     Bmp.LoadFromResourceName(HInstance,'LOCKDN');
     LockBtn.Picture.Assign(Bmp);
     UnLock_flag := False;
     if FEvents<>nil then FEvents.OnLockScreen(1);//加锁
      //当前用户的查看权限为所有用户相与
      SearchView:=$FFFF;
      for i:=0 to maxuser do
         if UserPass[i].USERNAME <> '' then
         begin
            SearchView:=UserPass[i].wSearchView and SearchView;
         end;
      if FEvents<>nil then FEvents.OnLockPass(SearchView);
     WriteLogFile(0,'离开加锁');
     LockBtn.Hint:='解锁';
   end
   else
   begin
      if CheckPass(1) then
      begin
         Bmp.LoadFromResourceName(HInstance,'LOCKUP');
         LockBtn.Picture.Assign(Bmp);
         UnLock_flag := TRUE;
         if FEvents<>nil then FEvents.OnLockScreen(0);//解锁
         JBeginTime :=now;
        // if FEvents<>nil then FEvents.OnLockPass(Cur_User.wSearchView);
         WriteLogFile(0,'接班进入系统');
         LockBtn.Hint:='加锁';

     end;
   end;
  Bmp.Free;
end;

procedure TDvrForm.JbLogBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not blUseManage then exit;
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'JBLOGDN');
  JbLogBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.JbLogBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not blUseManage then exit;
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'JBLOGUP');
  JbLogBtn.Picture.Assign(Bmp);
  Bmp.Free;

    with TFrmJbLog.Create(self) do
    begin
       try
          if FEvents <> nil then FEvents.OnFacetoWork(1);
          if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
          showmodal;
          if FEvents <> nil then FEvents.OnFacetoWork(0);
       finally
         free;
       end;
    end;
   WriteLogFile(0,'填写交班记录');    
end;

procedure TDvrForm.LogBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'LOGDN');
  LogBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.LogBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  Flag:boolean;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'LOGUP');
  LogBtn.Picture.Assign(Bmp);
  Bmp.Free;
  if Cur_User.blLOG = false then
  begin
    Flag:=CheckPass(1);
    if (Flag = false) or (Cur_User.blLOG = false) then
    begin
      // MessageBox(handle,'你没有查看日志的权限','系统提示',MB_OK);
       exit;
    end;
  end;
    with TFrmlog.Create(self) do
    begin
       try
          if FEvents <> nil then FEvents.OnFacetoWork(1);
          if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
          showmodal;
          if FEvents <> nil then FEvents.OnFacetoWork(0);
       finally
         free;
       end;
    end;
  WriteLogFile(0,'查看系统日志');    
end;

procedure TDvrForm.GriphicBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'GRAPHDN');
  GriphicBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.GriphicBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'GRAPHUP');
  GriphicBtn.Picture.Assign(Bmp);
  Bmp.Free;
  if FEvents<>nil then FEvents.OnGraphPicture;  //抓图事件
  WriteLogFile(0,'执行抓图动作');
end;

procedure TDvrForm.RecBtnClick(Sender: TObject);
var
  Bmp: TBitmap;
  Flag:boolean;
begin
  if not UnLock_flag  then  exit;     // zxl add
  if RecBtn.hint='手动录像' then
  begin
    // ***** zxl add by lock jjrec****
    if Cur_User.blCamera = false then
    begin
      Flag:=CheckPass(1);
      if (Flag = false) or (Cur_User.blCamera = false) then
      begin
         //MessageBox(handle,'你没有紧急录像的权限','系统提示',MB_OK);
         exit;
      end;
    end;
    // ********************************
    Bmp := TBitmap.Create;
    Bmp.LoadFromResourceName(HInstance,'RECDN');
    RecBtn.Picture.Assign(Bmp);
    Bmp.Free;
    if FEvents<>nil then FEvents.OnJJRecStart;  //紧急录像事件
    WriteLogFile(0,'执行紧急录像,请查看');
    RecBtn.hint:='计划录像';
 end
 else
  begin
      // ***** zxl add by lock jjrec****
      if Cur_User.blCamera = false then
      begin
        Flag:=CheckPass(1);
        if (Flag = false) or (Cur_User.blCamera = false) then
        begin
          //MessageBox(handle,'你没有紧急录像的权限','系统提示',MB_OK);
          exit;
        end;
      end;
      // ********************************
      Bmp := TBitmap.Create;
      Bmp.LoadFromResourceName(HInstance,'RECUP');
      RecBtn.Picture.Assign(Bmp);
      Bmp.Free;
      if FEvents<>nil then FEvents.OnJJRecStart;
      WriteLogFile(0,'停止紧急录像,请查看');
      RecBtn.hint:='手动录像';
  end;


end;

//紧急录像完成
procedure TDvrForm.JJRecFinish;
var
  Bmp: TBitmap;
begin
  {Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'RECUP');
  RecBtn.Picture.Assign(Bmp);
  Bmp.Free;
  RecBtn.hint:='手动录像'}
end;

procedure TDvrForm.ExitbtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'EXITDN');
  Exitbtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.ExitbtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  Flag:boolean;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'EXITUP');
  Exitbtn.Picture.Assign(Bmp);
  Bmp.Free;
  if Cur_User.blEXIT = false then
  begin
    Flag:=CheckPass(1);
    if (Flag = false) or (Cur_User.blEXIT = false) then
    begin
      // MessageBox(handle,'你没有退出系统的权限','系统提示',MB_OK);
       exit;
    end;
  end;
  //退出
  Close_YT_Com;
  WriteColorInfo;  //保存色彩信息
  WritePrebit;    //保存高速球预置位信息
  WriteLogFile(0,'退出系统');

  if Fevents<>nil then
  begin
     if Sysexit.ExitIndex = 1 then Fevents.OnClose(2)       //退出到关机
       else Fevents.OnClose(0);      //退出到windows
  end;

end;

procedure TDvrForm.ColorDefaultBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'DEFAULTDN');
  ColorDefaultBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.ColorDefaultBtnMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  str:string;
  i,j,revalue:integer;
  Flag:boolean;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'DEFAULTUP');
  ColorDefaultBtn.Picture.Assign(Bmp);
  Bmp.Free;
  if Cur_User.blCOLOR = false then
  begin
    Flag:=CheckPass(1);
    if (Flag = false) or (Cur_User.blCOLOR = false) then  exit;
  end;

  str:= '将摄像机'+inttostr(Cur_camera)+'的颜色设置拷贝到其它报警机!';
  if FEvents <> nil then FEvents.OnFacetoWork(1);
  if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
  revalue:= MessageBox(handle,pchar(str),'系统提示',MB_OKCANCEL);
  if FEvents <> nil then FEvents.OnFacetoWork(0);
  if revalue = IDOK then
  begin
     for i:=0 to 4 do
     for j:=0 to CameraNum-1 do
        if(j<>Cur_camera-1) then
        begin
          bColorValue[i][j]:=bColorValue[i][Cur_camera-1];
          if FEvents<>nil then FEvents.OnColorSet(j+1,i+1,bColorValue[i][Cur_camera-1]);
        end;

    WriteLogFile(0,str); //恢复为缺省色
  end;

   //  if Fevents<>nil then Fevents.OnDefaultClor(Cur_camera);       //恢复原始色彩事件
end;

procedure TDvrForm.CameraBtn1Click(Sender: TObject);
var
  n:integer;
begin
  if not UnLock_flag  then  exit;
  n:= Timage(Sender).tag;
  Set_CurCamera(n); //设置当前摄像机的其它相应更改项
  if Fevents<>nil then Fevents.OnSelectCamera(n);       //传送当前摄像机
end;

procedure TDvrForm.SensorBtnClick(Sender: TObject);
var
  n:integer;
begin
  if not UnLock_flag  then  exit;
  n:= Timage(Sender).tag;
  if Fevents<>nil then Fevents.OnSensorBtn(n);       //传送当前摄像机
end;

//PassFlag进入为2：要求加锁，3：要求解锁,返回0失败，1－成功,
procedure TDvrForm.PassWord(var PassFlag: SYSINT);
var
  Bmp: TBitmap;
  i:integer;
begin
   if not blUseManage then exit;

//启动时做密码验证
{  if CheckPass(PassFlag) then PassFlag:=1
    else PassFlag:=0;

  if Cur_User.blEnter = false then PassFlag:=0;
  if PassFlag = 1 then
  begin
     JBeginTime :=now;
     WriteLogFile(0,'进入系统');
  end;
 }

   if PassFlag=2 then
   begin
     if UnLock_flag then
     begin
       Bmp := TBitmap.Create;
       Bmp.LoadFromResourceName(HInstance,'LOCKDN');
       LockBtn.Picture.Assign(Bmp);
       Bmp.Free;
       UnLock_flag := False;

      //当前用户的查看权限为所有用户相与
        Cur_User.wSearchView:=$FFFF;
        Cur_User.wBackup:=$FFFF;
        for i:=0 to maxuser do
           if UserPass[i].USERNAME <> '' then
           begin
              Cur_User.wSearchView:=UserPass[i].wSearchView and Cur_User.wSearchView;
              Cur_User.wBackup:=UserPass[i].wBackup and Cur_User.wBackup;
           end;

        PassFlag:=1;
     end;
   end
   else
   begin
     if not UnLock_flag then
     begin
       Bmp := TBitmap.Create;
       Bmp.LoadFromResourceName(HInstance,'LOCKUP');
       LockBtn.Picture.Assign(Bmp);
       Bmp.Free;
       UnLock_flag := true;

      //当前用户的查看权限为所有用户相与
        Cur_User.wSearchView:=$FFFF;
        Cur_User.wBackup:=$FFFF;
         Cur_User.USERNAME:='sys';
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
         if FEvents<>nil then FEvents.OnLockPass(Cur_User.wSearchView);   //不同用户监看权限通知
        PassFlag:=1;
     end;
   end;
end;

//显示录像类型,CameraNo摄像机号1-16,value设置的值0－未录像，1一直录像，2－报警录像
procedure TDvrForm.DisplayRecType(CameraNo, Value: Integer);
var
  Bmp: TBitmap;
  Btnstr,Picstr:string;
  CameraBtn:Timage;
begin
  if (CameraNo<1)or(CameraNo>CameraNum) then  exit;
  if (CameraUseFlag[CameraNo-1] = false) then exit;

  Bmp := TBitmap.Create;
  if Value = -1 then    //此摄像机被设为不使用
  begin
     CameraUseFlag[CameraNo-1] := FALSE;
     Picstr:=inttostr(CameraNo)+'DS';
     Bmp.LoadFromResourceName(HInstance,Picstr);
     {$IFDEF SDSG}
      //     Bmp.LoadFromResourceName(HInstance,'CIRGHUI');
     {$ENDIF}

     Btnstr:='CameraBtn'+inttostr(CameraNo);
     CameraBtn:= Timage(FindComponent(Btnstr));
     CameraBtn.Picture.Assign(Bmp);
     CameraBtn.Enabled:=FALSE;
     Bmp.Free;
     exit;
  end;

  if Value = 1 then Picstr:=inttostr(CameraNo)+'DN'
    else if Value = 2 then Picstr:=inttostr(CameraNo)+'MO'
      else Picstr:=inttostr(CameraNo)+'UP';

   {$IFDEF SDSG}
    // if Value = 1 then Picstr:='CIRRED'
    //else if Value = 2 then Picstr:='CIRYEL'
    //  else Picstr:='CIRGRE';
     {$ENDIF}

  Bmp.LoadFromResourceName(HInstance,Picstr);
  Btnstr:='CameraBtn'+inttostr(CameraNo);
  Timage(FindComponent(Btnstr)).Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.CloseEvent(Sender: TObject; var Action: TCloseAction);
begin
  if FEvents <> nil then FEvents.OnClose(0);
end;

procedure TDvrForm.ActiveFormCreate(Sender: TObject);
begin
  ApplicationPath:=ExtractFilePath(Application.EXEName);
  if not DirectoryExists(ApplicationPath+'Log') then  MkDir(ApplicationPath+'Log');
  Init_CurUser;   //初始化当前用户
  //初始化系统参数
 //  sys_init;
 // add by wei dong for dyna add logo for help 2002-12-16
  {$ifndef dycompany}

    if FileExists(ApplicationPath+'mylogo.bmp') then
          versionbtn.Picture.LoadFromFile(ApplicationPath+'mylogo.bmp');
           // delete by wei dong 2003-5-13  retore by wei 2009-8-11 凯讯版本
  if Fileexists(ApplicationPath+'toplogo.bmp') then
          begin
          ImagLogo.Picture.LoadFromFile(ApplicationPath+'toplogo.bmp');
          end;
       // add by wei dong 2004-1-10 for change bmpfilenanme
   if Fileexists(ApplicationPath+'dvrflag.bmp') then
          begin
          ImagLogo.Picture.LoadFromFile(ApplicationPath+'dvrflag.bmp');
          end

  {$endif}

   // top logo

   // now check sound preview status for disp staus




end;

procedure TDvrForm.AboutInfo(const name, ProductName, Version, Comments,
  timestr: WideString);
begin
  if FEvents <> nil then FEvents.OnFacetoWork(1);
  if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
  ShowAbout(name,ProductName,Version,Comments,timestr);
  if FEvents <> nil then FEvents.OnFacetoWork(0);
end;

procedure TDvrForm.VersionBtnClick(Sender: TObject);
//var    ReturnValue:integer;
begin
   if not UnLock_flag  then  exit;
   if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
   //{$IFDEF dycompany}
   if FEvents <> nil then FEvents.OnAbout;
   //del by wei dong  for no sign verison
   // next add by wei dong for pop help file
   //{$endif}

end;

//云台远程改写Addr
procedure TDvrForm.YTRemote_WriteAddr(Addr: Integer);
begin
  if not YT_OpenFlag then exit;
  YT_DLL.YTWriteAddr(Addr);
  Cur_YT_Addr:=Addr - 1;
end;

  //云台远程Command
procedure TDvrForm.YTRemote_Command(Command, BeginorEnd, Mode: Integer);
begin
  if not YT_OpenFlag then exit;
  if((Cur_YT_Addr<0) or (Cur_YT_Addr>=CameraNum)) then exit;
  case Command of
    13: if (blAuto[Cur_YT_Addr]and(BeginorEnd=0)) or ((blAuto[Cur_YT_Addr] = false)and(BeginorEnd=1)) then YTBtnClick(Cur_YT_Addr+1,0);
    14: if (blBlow[Cur_YT_Addr]and(BeginorEnd=0)) or ((blBlow[Cur_YT_Addr] = false)and(BeginorEnd=1)) then YTBtnClick(Cur_YT_Addr+1,1);
    15: if (blLight[Cur_YT_Addr]and(BeginorEnd=0)) or ((blLight[Cur_YT_Addr] = false)and(BeginorEnd=1)) then YTBtnClick(Cur_YT_Addr+1,2);
    else
       if blYtMove = false then YT_DLL.YTCommand(Command, BeginorEnd, Mode);
  end;
end;

  //云台远程Read Addr
procedure TDvrForm.YTRemote_ReadAddr(var Addr: Integer);
begin
  if not YT_OpenFlag then exit;
  YT_DLL.YTReadAddr(Addr);
end;
// 云台远程预置位
procedure TDvrForm.YTRemote_Savepreset( pos: Integer);
begin
  if not YT_OpenFlag then exit;
  YT_DLL.Savepreset(pos);
end;
  // 云台远程预置位
procedure TDvrForm.YTRemote_Callpreset( pos: Integer);
begin
  if not YT_OpenFlag then exit;
  YT_DLL.Callpreset(pos);
end;


procedure TDvrForm.YTBtnUpdate(flag:boolean);
begin
    YTLightBtn.Enabled:=flag;
    YTBlowBtn.Enabled:=flag;
    YTZoomInBtn.Enabled:=flag;
    YTZoomOutBtn.Enabled:=flag;
    YTLeftBtn.Enabled:=flag;
    YTLupBtn.Enabled:=flag;
    YTUpBtn.Enabled:=flag;
    YTRupBtn.Enabled:=flag;
    YTRightBtn.Enabled:=flag;
    YTRDnBtn.Enabled:=flag;
    YTDownBtn.Enabled:=flag;
    YTLeftDnBtn.Enabled:=flag;
    YTFocusfarBtn.Enabled:=flag;
    YTFocusNearBtn.Enabled:=flag;
    YTIrisLargeBtn.Enabled:=flag;
    YTIrisSmallBtn.Enabled:=flag;
    YTAutoBtn.Enabled:=flag;
end;

//初始化摄像机按钮
procedure TDvrForm.InitCameraBtn;
var
  i:integer;
  stc:string;
  CurBtn:Timage;
  Bmp: TBitmap;
begin
   Bmp := TBitmap.Create;
   for i:=0 to MaxCameraCount-1 do
   begin
      stc:='CameraBtn'+inttostr(i+1);
      CurBtn:=Timage(FindComponent(stc));
      if Assigned(CurBtn) then
      begin
        if CameraUseFlag[i] then
        begin
           CurBtn.Enabled:=true;
           Bmp.LoadFromResourceName(HInstance,inttostr(i+1)+'UP');
           {$IFDEF SDSG}
           Bmp.LoadFromResourceName(HInstance,'CIRGRE');
          {$ENDIF}

           CurBtn.Picture.Assign(Bmp);
           if CameraPosition[i]<>'' then CurBtn.Hint:=CameraPosition[i]
            else CurBtn.Hint:='摄像机'+inttostr(i+1);
        end
        else
        begin
           CurBtn.Enabled:=false;
           Bmp.LoadFromResourceName(HInstance,inttostr(i+1)+'DS');
           {$IFDEF SDSG}
           Bmp.LoadFromResourceName(HInstance,'CIRHUI');
          {$ENDIF}

           CurBtn.Picture.Assign(Bmp);
           CurBtn.Hint:='未用';
        end;
      end;
   end;
   Bmp.free;
end;

//初始化传感器按钮
procedure TDvrForm.InitSensorBtn;
var
  i:integer;
  stc:string;
  CurBtn:Timage;
begin
   for i:=0 to MaxSensorInCount-1 do
   begin
     stc:='SensorBtn'+inttostr(i+1);
     CurBtn:=Timage(FindComponent(stc));
     if Assigned(CurBtn) then
     begin
        if SensorUseFlag[i] then
        begin
           DisplayAlarmType(i+1,0);
           if SensorPosition[i]<>'' then CurBtn.Hint:=SensorPosition[i]
              else CurBtn.Hint:='传感器'+inttostr(i+1);
        end
        else
        begin
           DisplayAlarmType(i+1,-1);
           CurBtn.Hint:='未用';
        end;
     end;
   end;
end;

procedure TDvrForm.YTLightBtnClick(Sender: TObject);
begin
  if not UnLock_flag then exit;
  if not CheckYTConPass then exit;
  YTBtnClick(Cur_Camera,2);
end;

procedure TDvrForm.YTBlowBtnClick(Sender: TObject);
begin
  if not UnLock_flag then exit;
  if not CheckYTConPass then exit;
  YTBtnClick(Cur_Camera,1);
end;

procedure TDvrForm.YTAutoBtnClick(Sender: TObject);
begin
  if not UnLock_flag then exit;
  if not CheckYTConPass then exit;
  YTBtnClick(Cur_Camera,0);
end;

//Status =false状态取反
procedure TDvrForm.YTBtnStatusChange(Status:boolean);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  if blAuto[Cur_camera-1] and Status then
  begin
     Bmp.LoadFromResourceName(HInstance,'YT_AUTODN');
     YTAutoBtn.Picture.Assign(Bmp);
  end
  else
  begin
     Bmp.LoadFromResourceName(HInstance,'YT_AUTOUP');
     YTAutoBtn.Picture.Assign(Bmp);
  end;
  
  if blBlow[Cur_camera-1] and Status then
  begin
     Bmp.LoadFromResourceName(HInstance,'YT_BLOWDN');
     YTBlowBtn.Picture.Assign(Bmp);
  end
  else
  begin
     Bmp.LoadFromResourceName(HInstance,'YT_BLOWUP');
     YTBlowBtn.Picture.Assign(Bmp);
  end;

  if blLight[Cur_camera-1] and Status then
  begin
     Bmp.LoadFromResourceName(HInstance,'YT_LIGHTDN');
     YTLightBtn.Picture.Assign(Bmp);
  end
  else
  begin
     Bmp.LoadFromResourceName(HInstance,'YT_LIGHTUP');
     YTLightBtn.Picture.Assign(Bmp);
  end;
  Bmp.Free;
end;

procedure TDvrForm.YTBtnClick(CameraNO,Index:Byte);//Index=0-Auto,1-Blow,2-Light
var
  Bmp: TBitmap;
  Addr:Integer;
begin
  Bmp := TBitmap.Create;
  // ** zxl为解决地址改变增加**
  YT_DLL.YTReadAddr(Addr);
  if Addr<>CameraNo then
  begin
    YT_DLL.YTWriteAddr(Addr);
    Cur_YT_Addr:=CameraNo - 1;
  end;
  //**************************
   case Index of
      0: begin
          if blAuto[CameraNO-1] then
          begin
             blAuto[CameraNO-1]:=false; YT_DLL.YTCommand(13,0,1);
             Bmp.LoadFromResourceName(HInstance,'YT_AUTOUP');
             YTAutoBtn.Picture.Assign(Bmp);
          end
          else
          begin
             blAuto[CameraNO-1]:=true;  YT_DLL.YTCommand(13,1,1);
             Bmp.LoadFromResourceName(HInstance,'YT_AUTODN');
             YTAutoBtn.Picture.Assign(Bmp);
          end;
         end;
      1: begin
          if blBlow[CameraNO-1] then
          begin
             blBlow[CameraNO-1]:=false; YT_DLL.YTCommand(14,0,1);
             Bmp.LoadFromResourceName(HInstance,'YT_BLOWUP');
             YTBlowBtn.Picture.Assign(Bmp);
          end
          else
          begin
             blBlow[CameraNO-1]:=true; YT_DLL.YTCommand(14,1,1);
             Bmp.LoadFromResourceName(HInstance,'YT_BLOWDN');
             YTBlowBtn.Picture.Assign(Bmp);
          end;
         end;
      2: begin
          if blLight[CameraNO-1] then
          begin
             blLight[CameraNO-1]:=false; YT_DLL.YTCommand(15,0,1);
             Bmp.LoadFromResourceName(HInstance,'YT_LIGHTUP');
             YTLightBtn.Picture.Assign(Bmp);
          end
          else
          begin
             blLight[CameraNO-1]:=true; YT_DLL.YTCommand(15,1,1);
             Bmp.LoadFromResourceName(HInstance,'YT_LIGHTDN');
             YTLightBtn.Picture.Assign(Bmp);
          end;
         end;
   end;
   Bmp.Free;
end;

procedure TDvrForm.YTIrisLargeBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  Btn:integer;
  Addr:integer;
begin
  if not UnLock_flag then exit;
  if not CheckYTConPass then exit;
  // ** zxl为解决地址改变增加**
  YT_DLL.YTReadAddr(Addr);
  if Addr<>Cur_camera then
  begin
    YT_DLL.YTWriteAddr(Addr);
    Cur_YT_Addr:=Cur_camera - 1;
  end;
  //**************************
  blYtMove := true;
  Bmp := TBitmap.Create;
  Btn:=Timage(Sender).Tag;
  if Btn in [1,2,3,4,5,6,7,8,9,10,11,12,16,17] then
  begin
    case Btn of
       2,3,16:Bmp.LoadFromResourceName(HInstance,'YT_SXDN');
       1,4,17:Bmp.LoadFromResourceName(HInstance,'YT_FDDN');
       5:Bmp.LoadFromResourceName(HInstance,'YT_UPDN');
       6:Bmp.LoadFromResourceName(HInstance,'YT_DOWNDN');
       7:Bmp.LoadFromResourceName(HInstance,'YT_RIGHTDN');
       8:Bmp.LoadFromResourceName(HInstance,'YT_LEFTDN');
       9:Bmp.LoadFromResourceName(HInstance,'YT_LUPDN');
       10:Bmp.LoadFromResourceName(HInstance,'YT_RUPDN');
       11:Bmp.LoadFromResourceName(HInstance,'YT_LDNDN');
       12:Bmp.LoadFromResourceName(HInstance,'YT_RDNDN');
    end;
     Timage(Sender).Picture.Assign(Bmp);
     YT_DLL.YTCommand(Btn,1,1);
  end;
  Bmp.Free;
end;

procedure TDvrForm.YTIrisLargeBtnMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  Btn:integer;
  Addr:integer;
begin
  if not UnLock_flag then exit;
  if not blYtMove then exit;
  // ** zxl为解决地址改变增加**
  YT_DLL.YTReadAddr(Addr);
  if Addr<>Cur_camera then
  begin
    YT_DLL.YTWriteAddr(Addr);
    Cur_YT_Addr:=Cur_camera - 1;
  end;
  //**************************
  Bmp := TBitmap.Create;
  Btn:=Timage(Sender).Tag;
  if Btn in [1,2,3,4,5,6,7,8,9,10,11,12,16,17] then
  begin
    case Btn of
       2,3,16:Bmp.LoadFromResourceName(HInstance,'YT_SXUP');
       1,4,17:Bmp.LoadFromResourceName(HInstance,'YT_FDUP');
       5:Bmp.LoadFromResourceName(HInstance,'YT_UPUP');
       6:Bmp.LoadFromResourceName(HInstance,'YT_DOWNUP');
       7:Bmp.LoadFromResourceName(HInstance,'YT_RIGHTUP');
       8:Bmp.LoadFromResourceName(HInstance,'YT_LEFTUP');
       9:Bmp.LoadFromResourceName(HInstance,'YT_LUPUP');
       10:Bmp.LoadFromResourceName(HInstance,'YT_RUPUP');
       11:Bmp.LoadFromResourceName(HInstance,'YT_LDNUP');
       12:Bmp.LoadFromResourceName(HInstance,'YT_RDNUP');
    end;
     Timage(Sender).Picture.Assign(Bmp);
     YT_DLL.YTCommand(Btn,0,1);
  end;
  Bmp.Free;
  blYtMove := False;
end;

//当前摄像机号变化
procedure TDvrForm.Set_CurCamera(CameraNo: Integer);
var
  Flag,i:integer;
begin
  if(CameraNo>0)and(CameraNo<=MaxCameraCount)and(Cur_camera<>CameraNo) then
  begin
     if blHighSpeed[Cur_camera-1] then  HighBtn_Control(false);

    Cur_camera:=CameraNo;
    CurCameraNumLabel.Caption:=inttostr(CameraNo);

    //更改色彩显示
    for i:=0 to 4 do
    Set_CurCamera_ColorValue(i+1,bColorValue[i][Cur_camera-1]);
    //云台控制更改地址
    if YT_OpenFlag then    // HighspeedBtn
    begin
       Timer2.Enabled:=false;
       YT_DLL.YTWriteAddr(Cur_camera);
       //检查是否为高速球控制
       Flag:=0;
       YT_DLL.CheckHighSpeed(Flag);
       if Flag = 0 then
       begin
          HighspeedBtn.Visible:=False;
       end
       else
       begin
          HighspeedBtn.Visible:=True;
          if blHighSpeed[Cur_camera-1] then
          begin
             HighBtn_Control(true);
             HighBtn_Status(Cur_camera-1);
          end;
       end;
       Cur_YT_Addr := Cur_camera -1;
       YTBtnStatusChange(true); //更改按钮状态
    end;
  end;
end;

procedure TDvrForm.Open_YT_Com;
begin
  YT_OpenFlag:=false;
  if not (YTUseCom in [1,2,3,4]) then exit;
  try
     YT_DLL:=CreateComObject(CLASS_ytcon) as Iytcon;
  except
     on EoleSysError do
     begin
        if FEvents <> nil then FEvents.OnFacetoWork(1);
        if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
        MessageBox(handle,pchar(' 文件YT_Com.dll未注册,'+#13#10+#13#10+' 云台控制暂不能使用,请注册!'),'重要提示',MB_OK);
        if FEvents <> nil then FEvents.OnFacetoWork(0);
        exit;
     end;
  end;

    YT_DLL.YTComOpen(YTUseCom,CameraNum);
    YT_OpenFlag:=true;
    Cur_YT_Com:= YTUseCom;
end;

procedure TDvrForm.Close_YT_Com;
var
  i:integer;
begin
  if YT_OpenFlag = false then exit;

   for i:= 0 to CameraNum-1 do     //停止已打开的开关量
   begin
      if blBlow[i] or blLight[i] or blAuto[i] then YT_DLL.YTWriteAddr(i+1);
      if blBlow[i] then YTBtnClick(i+1,1);
      if blLight[i] then YTBtnClick(i+1,2);
      if blAuto[i] then YTBtnClick(i+1,0);
   end;
   YTBtnStatusChange(false); //更改按钮状态 ,全部弹起

  YT_DLL.YTComClose;
  YT_DLL:=nil;
  YT_OpenFlag:=false;
end;

procedure TDvrForm.sys_init;
var
  i:integer;
begin
  //初始化系统参数
  for i:=0 to MaxCameraCount-1 do
  begin
     blBlow[i]:=false;
     blLight[i]:=false;
     blAuto[i]:=false;
  end;

  ReadSysInfo; //读取系统信息
  ReadSensorInfo;//读取传感器信息
  ReadCameraInfo;//读取摄像机信息
  ReadColorInfo;//读取移动和色彩信息
  ReadPrebit;   //读取高速球预置位信息
  //检查日志文件
  CheckLogFile;

  //初始化色彩、摄像机按钮等界面
  for i:=0 to 4 do Set_CurCamera_ColorValue(i+1,bColorValue[i][Cur_camera-1]);
  InitCameraBtn;
  InitSensorBtn;

  //初始化云台控制
  Open_YT_Com;
  if not YT_OpenFlag then YTbtnUpdate(false) else YTbtnUpdate(true);

  Set_CurCamera(1); //设置当前摄像机为1，其它相应更改项
  DisplayWeek;
  if AutoChange = 0 then
  begin
     AutochangeBtn.Enabled := False;
  end;
end;

procedure TDvrForm.DisplayWeek;
var
  k:integer;
  str:string;
begin
   k:=dayofweek(date);
   case k of
      1: str:='星期日';
      2: str:='星期一';
      3: str:='星期二';
      4: str:='星期三';
      5: str:='星期四';
      6: str:='星期五';
      7: str:='星期六';
      else str:='星期一';
   end;
   fcLabelWeek.Caption:=str;
end;

procedure TDvrForm.WriteLog(Bj: Integer; const LogRec: WideString);
begin
   WriteLogFile(Bj,LogRec);
end;

procedure TDvrForm.UpdateParaset(Revalue: Integer);
var
 flag:boolean;
begin
  flag:=false;
  if revalue > 0 then
  begin
       //更新参数
       if (Revalue and $20) = 32 then  flag:=true;
       if (Revalue and $10) = 16 then  ReadSysInfo;
       if (Revalue and $08) = 8 then  begin ReadCameraInfo; InitCameraBtn; end;
       if (Revalue and $04) = 4 then  begin ReadSensorInfo; InitSensorBtn; end;

       if (Cur_YT_Com <> YTUseCom) or flag then
       begin
          if YT_OpenFlag then
          begin
              Close_YT_Com;   //关闭云台
              YTbtnUpdate(false);
          end;
          Open_YT_Com;
          if YT_OpenFlag then  YTbtnUpdate(true);
       end;

       if AutoChange = 0 then
       begin
           if blAutoChange then AutochangeBtnClick(nil);
           AutochangeBtn.Enabled := False;
       end
       else AutochangeBtn.Enabled := true;

       if (Revalue and $01) = 1 then
       begin
           Init_CurUser;
           LockBtnClick(nil);
       end;
  end;
end;

//报警按钮显示报警状态
procedure TDvrForm.DisplayAlarmType(SensorNo, mode: Integer);
var
  Bmp: TBitmap;
  stc:string;
  CurBtn:Timage;
begin
  if (SensorNo<1)or(SensorNo>MaxSensorInCount)then exit;
  //if Sensor[SensorNo-1].IFUSE = false then exit;
  stc:='SensorBtn'+inttostr(SensorNo);
  CurBtn:=Timage(FindComponent(stc));
  if Assigned(CurBtn) then
  begin
    Bmp := TBitmap.Create;
    if mode = 1 then
       begin        //报警
       Bmp.LoadFromResourceName(HInstance,inttostr(SensorNo)+'DN') ;
       {$IFDEF SDSG}
           Bmp.LoadFromResourceName(HInstance,'CIRRED');
           Curbtn.Hint:='报警' ;
           // add for alarm then tiger recall reset
           alarmtiger(sensorno-1 );//sensor0---seneor15  联动预制位
       {$ENDIF}
       end
    else if mode = 0 then
        begin //布防
//       Bmp.LoadFromResourceName(HInstance,inttostr(SensorNo)+'SE') 2003-5-18 change by wei dong
         Bmp.LoadFromResourceName(HInstance,inttostr(SensorNo)+'MO');
       {$IFDEF SDSG}
           Bmp.LoadFromResourceName(HInstance,'CIRYEL');
           Curbtn.Hint:='已布防'
       {$ENDIF}
       end
    else if mode = 2 then
        begin             //未布防
       Bmp.LoadFromResourceName(HInstance,inttostr(SensorNo)+'UP');
       {$IFDEF SDSG}
           Bmp.LoadFromResourceName(HInstance,'CIRGRE');
           Curbtn.Hint:='未布防'

       {$ENDIF}
       end
    else                          //3--未用
        begin
       Bmp.LoadFromResourceName(HInstance,inttostr(SensorNo)+'DS');
       {$IFDEF SDSG}
           Bmp.LoadFromResourceName(HInstance,'CIRHUI');
           Curbtn.Hint:='未使用'
       {$ENDIF}
       end;
    CurBtn.Picture.Assign(Bmp);
    Bmp.Free;
  end;
end;

procedure TDvrForm.MotionBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'MOTIONDN');
  MotionBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.MotionBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
  Flag:boolean;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'MOTIONUP');
  MotionBtn.Picture.Assign(Bmp);
  Bmp.Free;

  if Cur_User.blMotion = false then
  begin
    Flag:=CheckPass(1);
    if (Flag = false) or (Cur_User.blMotion = false) then  exit;
  end;

    WriteLogFile(0,'设置移动报警');
  if blAutoChange then AutochangeBtnClick(nil);//如果正在自动切换，则停止
  if FEvents <> nil then  FEvents.OnSetYDAlarm(Cur_Camera);
end;

function TDvrForm.CheckYTConPass:boolean;
var
  Flag:boolean;
begin
  result:=true;
  if Cur_User.blYTCon = false then
  begin
    Flag:=CheckPass(1);
    result:=Flag and Cur_User.blYTCon;
  end;
end;

procedure TDvrForm.AutochangeBtnClick(Sender: TObject);
var
  Bmp: TBitmap;         //DisplayMode
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  if not blAutoChange then
  begin
     Bmp.LoadFromResourceName(HInstance,'AUTOCHANGEDN');
     AutochangeBtn.Picture.Assign(Bmp);
     AutoChangeCount :=0;
     blAutoChange := true;
     WriteLogFile(0,'执行定时画面切换');
     // add by weidong
     AutoChangeBtn.hint:='停止切换';
  end
  else
  begin
     Bmp.LoadFromResourceName(HInstance,'AUTOCHANGEUP');
     AutochangeBtn.Picture.Assign(Bmp);
     blAutoChange := false;
     WriteLogFile(0,'停止定时画面切换');
     AutoChangeBtn.hint:='开始切换';

  end;
  Bmp.Free;
end;

procedure TDvrForm.GetSetupPass(var PassValue, SetPara: SYSINT);
var
   value:integer;
begin
   PassValue:=Cur_User.bManager; //管理权限
   value:=0;              //设置权限,对应位依次为,1－sys,2-camera,4-sensor,8-filesys,16-ytsetup
   if Cur_User.blSysPara then  value:=value or 1;
   if Cur_User.blCamera then  value:=value or 2;
   if Cur_User.blSensor then  value:=value or 4;
   if Cur_User.blFileSys then  value:=value or 8;
   if Cur_User.blYtPz then  value:=value or 16;
   SetPara:=value;
end;

procedure TDvrForm.GetSearchPass(var PassSearch, PassBackup: SYSINT);
begin
   PassSearch:=Cur_User.wSearchView;
   PassBackup:=Cur_User.wBackup;
end;


//***************高速球控制*****************************

procedure TDvrForm.HighspeedBtnClick(Sender: TObject);
{var
  Bmp: TBitmap;  }
begin
  if not UnLock_flag then exit;
  if not CheckYTConPass then exit;

  if (Cur_camera<1) and (Cur_camera>MaxCameraCount) then exit;
  if blHighSpeed[Cur_camera-1] then   //操作界面已打开
  begin
     blHighSpeed[Cur_camera-1]:=false;
     HighBtn_Control(false);
     WriteLogFile(0,'关闭高速球控制面板');
  end
  else
  begin
     HighBtn_Control(true);
     HighBtn_Status(Cur_camera-1);
     blHighSpeed[Cur_camera-1]:=true;
     WriteLogFile(0,'打开高速球控制面板');
  end;
end;

procedure TDvrForm.PreBtn1Click(Sender: TObject);
var
  n:integer;
begin
  if not UnLock_flag  then  exit;
  n:= Timage(Sender).tag;
  HighEdit.Text:=inttostr(n);
  YT_DLL.CallPreset(n);
end;

procedure TDvrForm.HighBtn_Control(bl:boolean);
begin

   PreBtn1.Visible:=bl;
   PreBtn2.Visible:=bl;
   PreBtn3.Visible:=bl;
   PreBtn4.Visible:=bl;
   PreBtn5.Visible:=bl;
   PreBtn6.Visible:=bl;
   PreBtn7.Visible:=bl;
   PreBtn8.Visible:=bl;
   PreBtn9.Visible:=bl;
   PreBtn10.Visible:=bl;
   PreBtn11.Visible:=bl;
   PreBtn12.Visible:=bl;
   PreBtn13.Visible:=bl;
   PreBtn14.Visible:=bl;
   PreBtn15.Visible:=bl;
   PreBtn16.Visible:=bl;
   HighSetBtn.Visible:=bl;
   HighGoBtn.Visible:=bl;
   HighEdit.Visible:=bl;

   // add by wei dong
   //imagespeedpanel.Visible :=bl;
   if bl then
   begin
        PreBtn1.BringToFront;
        PreBtn2.BringToFront;
        PreBtn3.BringToFront;
        PreBtn4.BringToFront;
        PreBtn5.BringToFront;
        PreBtn6.BringToFront;
        PreBtn7.BringToFront;
        PreBtn8.BringToFront;
        PreBtn9.BringToFront;
        PreBtn10.BringToFront;
        PreBtn11.BringToFront;
        PreBtn12.BringToFront;
        PreBtn13.BringToFront;
        PreBtn14.BringToFront;
        PreBtn15.BringToFront;
        PreBtn16.BringToFront;
        HighSetBtn.BringToFront;
        HighGoBtn.BringToFront;

   end;

end;

procedure TDvrForm.HighBtn_Status(TD:BYTE);
begin
   Prebtnstatus(1, PreBit[TD][0]);
   Prebtnstatus(2, PreBit[TD][1]);
   Prebtnstatus(3, PreBit[TD][2]);
   Prebtnstatus(4, PreBit[TD][3]);
   Prebtnstatus(5, PreBit[TD][4]);
   Prebtnstatus(6, PreBit[TD][5]);
   Prebtnstatus(7, PreBit[TD][6]);
   Prebtnstatus(8, PreBit[TD][7]);
   Prebtnstatus(9, PreBit[TD][8]);
   Prebtnstatus(10, PreBit[TD][9]);
   Prebtnstatus(11, PreBit[TD][10]);
   Prebtnstatus(12, PreBit[TD][11]);
   Prebtnstatus(13, PreBit[TD][12]);
   Prebtnstatus(14, PreBit[TD][13]);
   Prebtnstatus(15, PreBit[TD][14]);
   Prebtnstatus(16, PreBit[TD][15]);
end;

procedure TDvrForm.HighEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not UnLock_flag  then  exit;
//  showmessage(inttostr(ord(key)));
  if(commandkey = #0) and (keychar[0] = #0) and (keychar[1] = #0) then HighEdit.Text:='';
  case key of
     #32:   //空格
        begin
//            showmessage(inttostr(ord(key)));
            if commandkey = #45 then DeletePrebit
            else if (commandkey = #84)or(commandkey = #116)then XJPrebit
            else CallPrebit;
            commandkey := #0;
            key:=#0;
        end;
     #8:      //backspace
        begin
           if keychar[1] <> #0 then keychar[1] := #0
           else if keychar[0] <> #0 then keychar[0] := #0
           else commandkey:=#0;
        end;
     #48,#49,#50,#51,#52,#53,#54,#55,#56,#57:  //0-9
        begin
           if keychar[0] = #0 then keychar[0] := key
           else if keychar[1] = #0 then keychar[1] := key
           else key := #0;
        end;
     #45: //-号指令
        begin
           commandkey := key;
        end;
     #84,#116: //t,T
        begin
           commandkey := key;
        end;
     else
        begin
          // WriteLog(0,inttostr(ord(key)));
           Key := #0;
        end;
  end;
end;

procedure TDvrForm.HighSetBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'HIGHSETDN');
  HighSetBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.HighSetBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'HIGHSETUP');
  HighSetBtn.Picture.Assign(Bmp);
  Bmp.Free;

  SavePrebit;
end;

procedure TDvrForm.HighGoBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'HIGHGODN');
  HighGoBtn.Picture.Assign(Bmp);
  Bmp.Free;
end;

procedure TDvrForm.HighGoBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Bmp: TBitmap;
begin
  if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(HInstance,'HIGHGOUP');
  HighGoBtn.Picture.Assign(Bmp);
  Bmp.Free;

  if commandkey = #45 then DeletePrebit
  else if (commandkey = #84)or(commandkey = #116)then XJPrebit
  else CallPrebit;
  commandkey := #0;
end;

//bl = true-可用, bl=false不可用
procedure TDvrForm.Prebtnstatus(No:byte; bl:boolean);
var
  Bmp: TBitmap;
  Btnstr,Picstr:string;
  PrebitBtn:Timage;
begin
  Bmp := TBitmap.Create;
  Btnstr:='PreBtn'+inttostr(No);
  PrebitBtn:= Timage(FindComponent(Btnstr));
  if bl then    //此摄像机被设为不使用
  begin
     Picstr:=inttostr(No)+'UP';
     Bmp.LoadFromResourceName(HInstance,Picstr);
     PrebitBtn.Picture.Assign(Bmp);
     PrebitBtn.Enabled:=bl;
  end
  else
  begin
     Picstr:=inttostr(No)+'DS';
     Bmp.LoadFromResourceName(HInstance,Picstr);
     PrebitBtn.Picture.Assign(Bmp);
     PrebitBtn.Enabled:=bl;
  end;
  Bmp.Free;
end;

//呼叫预置位
procedure TDvrForm.CallPrebit;
var
 k:integer;
begin
   if (keychar[0]<>#0) and (keychar[1]=#0) then
   begin
      k:=Ord(keychar[0])-48;
      if(k>0)then YT_DLL.CallPreset(k);
   end;
   if (keychar[0]<>#0) and (keychar[1]<>#0) then
   begin
      k:=(Ord(keychar[0])-48)*10+Ord(keychar[1])-48;
      if(k>0)and(k<65)then YT_DLL.CallPreset(k);
   end;
   keychar[0]:=#0;
   keychar[1]:=#0;
   Timer2.Enabled:=false;
//   HighEdit.Text:='';
end;
//保存预置位
procedure TDvrForm.SavePrebit;
var
 k:integer;
begin
   if commandkey <>#0 then
   begin
      commandkey:=#0;
      keychar[0]:=#0;
      keychar[1]:=#0;
   end;
   if (keychar[0]<>#0) and (keychar[1]=#0) then
   begin
      k:=Ord(keychar[0])-48;
      if(k>0)then
      begin
         YT_DLL.SavePreset(k);
         PreBit[Cur_Camera-1][k-1]:=true;
         Prebtnstatus(k, true);
      end;
   end;
   if (keychar[0]<>#0) and (keychar[1]<>#0) then
   begin
      k:=(Ord(keychar[0])-48)*10+Ord(keychar[1])-48;
      if(k>0)and(k<65)then
      begin
         YT_DLL.SavePreset(k);
         PreBit[Cur_Camera-1][k-1]:=true;
         if(k<17)then Prebtnstatus(k, true);
      end;
   end;
   keychar[0]:=#0;
   keychar[1]:=#0;
   Timer2.Enabled:=false;
//   HighEdit.Text:='';
end;

procedure TDvrForm.DeletePrebit;
var
 k:integer;
begin
   if (keychar[0]<>#0) and (keychar[1]=#0) then
   begin
      k:=Ord(keychar[0])-48;
      if(k>0)then
      begin
        // YT_DLL.SavePreset(k);
         PreBit[Cur_Camera-1][k-1]:=false;
         Prebtnstatus(k, false);
      end;
   end;
   if (keychar[0]<>#0) and (keychar[1]<>#0) then
   begin
      k:=(Ord(keychar[0])-48)*10+Ord(keychar[1])-48;
      if(k>0)and(k<65)then
      begin
        // YT_DLL.SavePreset(k);
         PreBit[Cur_Camera-1][k-1]:=false;
         if(k<17)then Prebtnstatus(k, false);
      end;
   end;
   keychar[0]:=#0;
   keychar[1]:=#0;
   HighEdit.Text:='';
   Timer2.Enabled:=false;
end;

procedure TDvrForm.XJPrebit;
var
 k:integer;
begin
   if not (commandkey in [#84,#116]) then exit;
   k:=0;
   if (keychar[0]<>#0) and (keychar[1]=#0) then  k:=Ord(keychar[0])-48;
   if (keychar[0]<>#0) and (keychar[1]<>#0) then  k:=(Ord(keychar[0])-48)*10+Ord(keychar[1])-48;
   if(k<2)then exit;  //不能小于2秒
   XJCamera:=Cur_Camera-1;
   Timer2.Interval:=k*1000;
   XJCount:=0;
   Timer2.Enabled:=true;
end;

procedure TDvrForm.Timer2Timer(Sender: TObject);
begin
   repeat
      inc(XJCount);
      if XJCount>63 then XJCount:=0;
   until PreBit[XJCamera][XJCount] = true;
   YT_DLL.CallPreset(XJCount);
end;

procedure TDvrForm.SetupCameraNum(Num: Integer);
begin
  CameraNum:=Num;
  ReadCameraInfo;
  InitCameraBtn;
end;

procedure TDvrForm.ImagLogoClick(Sender: TObject);
var i,j:integer;
begin
// test for auto splict
//random push button add by wei dong
{
  if FEvents <> nil then
  begin
        FEvents.OnSetYDAlarm(Cur_Camera);
        for i:=0 to 30 do
        begin

                fevents.OnModeChange(1);
                sleep(100);
                for j:=0 to 15 do
                begin
                       Fevents.OnSelectCamera(j);
                       sleep(50);
                end;
                fevents.OnModeChange(4);
                sleep(100);
                fevents.OnModeChange(9);
                sleep(100);
                fevents.OnModeChange(16);
        end ;
  end;

 }
end;

procedure TDvrForm.ImageSlider1EndDock(Sender, Target: TObject; X,
  Y: Integer);
 var
      i,k:integer;
  upx,downx:integer;
begin
    if not UnLock_flag then exit;
    if Cur_User.blCOLOR = false then exit; //无权限

     if(Slider1.Left<ImageSlider1.Left+1)then begin Slider1.Left:=ImageSlider1.Left+2; exit; end;
     if(Slider1.Left+Slider1.Width>ImageSlider1.Left+ImageSlider1.Width-1)then
     begin Slider1.Left:=ImageSlider1.Left+ImageSlider1.Width-Slider1.Width-2; exit; end;

    if (x<0) or (x>ImageSlider1.Width) or (y<0) or (y>ImageSlider1.Height) then moveflag:=False
      else begin if oldmoveflag then moveflag:=True; end;

    if moveflag then
    begin
      upx:=ImageSlider1.Left-Slider1.Width div 2;
      downx:=ImageSlider1.Left+ImageSlider1.Width-(Slider1.Width div 2);
      if (X>=Slider1.Width div 2) and (X<ImageSlider1.Width-Slider1.Width div 2) and
         (Slider1.Left<downX) and (Slider1.Left>=upX)then
      begin
         Slider1.Left:=Slider1.Left+X-oldX;
         k:=Slider1.Left+Slider1.Width div 2-ImageSlider1.Left;
         i:=255 *k{(ImageSlider1.Width-k)} div ImageSlider1.Width;  //默认色彩范围0－255
         if(i>255)or(i<0)then exit;
         displaySlider1.Caption:=inttostr(i);
         // add by weidong for delete message
         if(abs(oldx-x)>(ImageSlider1.Width /256.0)) then
         begin
         if FEvents<>nil then FEvents.OnColorSet(Cur_camera,1,i);  //OnColorSet事件的第一个参数为摄像机号
            //第二个参数index意义1－调整亮度，2－对比度，3－色度，4－饱和度，5－此通道音量；第三个参数为
            //value为具体值，范围均为0－255；默认值均为100
         end;
         ColorUpValue:=i;
         oldx:=x;
      end;
    end;
end;

 // add by wei dong  2003-01-15 for lock screen
procedure TDvrForm.LockScreen;
var
  Bmp: TBitmap;
  i,SearchView:integer;
begin
  if not blUseManage then exit;

  Bmp := TBitmap.Create;
   if UnLock_flag  then
   begin
     Bmp.LoadFromResourceName(HInstance,'LOCKDN');
     LockBtn.Picture.Assign(Bmp);
     UnLock_flag := False;
     if FEvents<>nil then FEvents.OnLockScreen(1);//加锁
      //当前用户的查看权限为所有用户相与
      SearchView:=$FFFF;
      for i:=0 to maxuser do
         if UserPass[i].USERNAME <> '' then
         begin
            SearchView:=UserPass[i].wSearchView and SearchView;
         end;
      if FEvents<>nil then FEvents.OnLockPass(SearchView);
     WriteLogFile(0,'离开加锁');
     LockBtn.Hint:='解锁';
   end
   else
   begin
      if CheckPass(1) then
      begin
         Bmp.LoadFromResourceName(HInstance,'LOCKUP');
         LockBtn.Picture.Assign(Bmp);
         UnLock_flag := TRUE;
         if FEvents<>nil then FEvents.OnLockScreen(0);//解锁
         JBeginTime :=now;
        // if FEvents<>nil then FEvents.OnLockPass(Cur_User.wSearchView);
         WriteLogFile(0,'接班进入系统');
         LockBtn.Hint:='加锁';

     end;
   end;
  Bmp.Free;
end;

procedure TDvrForm.IsCompany(out flag: SYSINT);
begin
    //add by wei dong
     flag:=1;

    {$ifndef dycompany}
     // 无标示版本
     flag:=0;

    {$endif}

end;

// add by wei dong to split bmp for every imagebutton 2003-5-12
procedure TDVRForm.splitbmp( pos:TRECT ;bmpfilename:string; savefilename:string );
var
  Bitmap: TBitmap;
  myimage:Timage;
begin
    Bitmap := TBitmap.Create;
    bitmap.LoadFromFile(bmpfilename);
    myimage:=TImage.Create(NIL);
    myimage.Height :=pos.Bottom-pos.Top;
    myimage.Width :=pos.Right-pos.left;
    myimage.Canvas.CopyRect(RECT(0,0,myimage.Width,myimage.height),Bitmap.Canvas,pos);
    myimage.picture.SaveToFile(savefilename);
    bitmap.Free;
    myimage.Free;
end;

procedure TDvrForm.Button1Click(Sender: TObject);
var

  I: Integer;
  Temp: TComponent;
  m:Tcontrol;
  mylabel:Tlabel;
  mycombox:TCombobox;
  mycheckbox:Tcheckbox;
  mygroupbox:Tgroupbox;
  mytabsheet:Ttabsheet;
  mystatictext:Tstatictext;
  pini: TIniFile;
  pos:TRECT;
  myimage:Timage;
  p:pchar;

  ires:integer;
  mys,mys1:string;
  ws:array[1..4] of string;
  j:integer;

begin
 {pini:=Tinifile.create('c:\test11.ini');
  for I :=60 to ComponentCount - 1 do
  begin
    Temp := Components[I];

    if  (Temp is TControl) then
    begin
      //RemoveComponent(Temp);
      //DataModule2.InsertComponent(Temp);
//      showmessage(temp.name);
       if (temp is  TImage)  then
       begin
          myimage:=(temp as TImage);
          pos.Left :=myimage.Left;
          pos.right :=myimage.left+myimage.Width;
          pos.top :=myimage.top;
          pos.Bottom :=myimage.top+myimage.Height;
          str(pos.left,ws[1]);
          str(pos.top,ws[2]);
          str(myimage.Width,ws[3]);
          str(myimage.Height,ws[4]);
          mys1:=temp.name ;
          for j:=1 to 4 do
                mys1:=mys1+','+ws[j];
          mys1:=mys1+','+myimage.Hint ;

          str(I,mys);

          pini.WriteString('mainform',temp.name,mys1);

        ires:=Application.MessageBox(pchar(temp.name+ '...'+mys), 'process',
        MB_YESNOCANCEL + MB_DEFBUTTON1) ;
    {  if ires= IDYES then
        begin
          opendialog1.Title:= myimage.name+' up';
            if (opendialog1.Execute()) then
              begin
                    splitbmp(pos,'c:\temp\mainup.bmp',opendialog1.FileName);
              end  ;

              opendialog1.Title:= myimage.name+' down ';
            if (opendialog1.Execute()) then
              begin
                    splitbmp(pos,'c:\temp\maindown.bmp',opendialog1.FileName);
              end

        end else
        if ires=IDCANCEL then break;
       end
       else
            pini.WriteString('set_form',temp.name,'');

    end;
  end;
  pini.Free;
 }
end;

//添加预备浏览声音按钮 2004-1-10 weidong
procedure TDvrForm.soundbtnClick(Sender: TObject);

var
  Bmp: TBitmap;         //DisplayMode

begin
  {if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  // 通过检测提示的内容，确定目前按钮状态

  if soundbtn.hint='关闭监控声音' then
  begin
     Bmp.LoadFromResourceName(HInstance,'SOUNDdn');
     soundbtn.Picture.Assign(Bmp);
     WriteLogFile(0,'关闭监控声音');
     SOUNDBtn.hint:='打开监控声音';
     if FEvents<>nil then FEvents.OnSound(0); //new mound 0-CLOSE 1-OPEN

  end
  else
  begin
     Bmp.LoadFromResourceName(HInstance,'SOUNDup');
     soundbtn.Picture.Assign(Bmp);
     WriteLogFile(0,'打开监控声音');
     // add by weidong
     SOUNDBTN.hint:='关闭监控声音';
       // SEND EVENT
     if FEvents<>nil then FEvents.OnSound(1); //new mound
  end;
  Bmp.Free;
  }
end;




procedure TDvrForm.SoundOn(open: Integer);
begin
// close open preview sound



end;

procedure TDvrForm.ImageresetClick(Sender: TObject);
var
  Bmp: TBitmap;         //DisplayMode

begin     // OPEN CLOSE ALL OUTPUT
  {if not UnLock_flag  then  exit;
  Bmp := TBitmap.Create;
  // 通过检测提示的内容，确定目前按钮状态

  if imagereset.hint='关闭输出' then
  begin
     Bmp.LoadFromResourceName(HInstance,'RESETNO');
     imagereset.Picture.Assign(Bmp);
     WriteLogFile(0,'关闭输出');
     imagereset.hint:='打开输出';
     if FEvents<>nil then FEvents.OnReset(0); //new mound 0-CLOSE 1-OPEN

  end
  else
  begin
     Bmp.LoadFromResourceName(HInstance,'RESET');
     imagereset.Picture.Assign(Bmp);
     WriteLogFile(0,'打开输出');
     // add by weidong
     imagereset.hint:='关闭输出';
       // SEND EVENT
     if FEvents<>nil then FEvents.OnReset(1); //new mound
  end;
  Bmp.Free;
  }
end;


procedure TDvrForm.Button2Click(Sender: TObject);
var
      i,j:integer;
  stc,stc1:string;
  Sensorini:Tinifile;



begin
// ========================================
 //add for test read ini  and check
 //setp 1 read ini
 //增加项位于sensor.ini 中 [sensor0]  presetyt1=9  表示一号云台的预制位9
 //============================================

  //for i:=0 to MaxSensorInCount-1 do SensorUseFlag[i] := false;
   //if(IOCom = 0) then  exit;
  Sensorini:=Tinifile.Create(ApplicationPath+'SetPara\SensorSet.ini');
  try
     for i:=0 to SensorInNum-1 do
     begin
      stc:='Sensor'+inttostr(i); //[sersor0]
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
   //save camera
   //call preset



// YT_DLL.CallPreset(k);// call preset pos k

end;

procedure TDvrform.alarmtiger(k :integer ) ;     // k  号报警器触发联动预制位
var
   j :integer;
   tmpcamera:integer;
begin
    for  j:=1 to Maxcameracount do
    begin
       if alarmtopreset[k][j]<>0 then
        begin
        // save curcamera
        set_curcamera(j);
        YT_DLL.CallPreset(alarmtopreset[k][j]);
        end;
        set_curcamera(cur_camera);  // 恢复原来的当前摄像机
    end ;

end ;



initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TDvrForm,
    Class_DvrForm,
    1,
    '{36BFA9D0-A7AC-4797-B4BE-D17F5489010E}',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
