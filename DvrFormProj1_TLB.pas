unit DvrFormProj1_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 2010-8-12 ÉÏÎç 10:38:53 from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: D:\newnoflag\DvrFormProj1.tlb (1)
// IID\LCID: {68D08E3C-41C4-4CDF-A7C0-0C010CB0E931}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\system32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DvrFormProj1MajorVersion = 1;
  DvrFormProj1MinorVersion = 0;

  LIBID_DvrFormProj1: TGUID = '{68D08E3C-41C4-4CDF-A7C0-0C010CB0E931}';

  IID_IDvrForm: TGUID = '{8B1896D6-05FF-42F2-A160-6FF774C29247}';
  DIID_IDvrFormEvents: TGUID = '{5A95D19D-F023-47F8-A06B-49EA225E8E49}';
  CLASS_DvrForm: TGUID = '{49814CC1-DBA0-4FB4-9E07-25E11797BA17}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDvrForm = interface;
  IDvrFormDisp = dispinterface;
  IDvrFormEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DvrForm = IDvrForm;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPUserType1 = ^IFontDisp; {*}


// *********************************************************************//
// Interface: IDvrForm
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B1896D6-05FF-42F2-A160-6FF774C29247}
// *********************************************************************//
  IDvrForm = interface(IDispatch)
    ['{8B1896D6-05FF-42F2-A160-6FF774C29247}']
    function  Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function  Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function  Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function  Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function  Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function  Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function  Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    function  Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function  Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function  Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function  Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function  Get_Active: WordBool; safecall;
    function  Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function  Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function  Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function  Get_VisibleDockClientCount: Integer; safecall;
    function  Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function  Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure SetCamera_ColorValue(CameraNo: Integer; index: Integer; Value: Integer); safecall;
    procedure PassWord(var PassFlag: SYSINT); safecall;
    procedure JJRecFinish; safecall;
    procedure DisplayRecType(CameraNo: Integer; Value: Integer); safecall;
    procedure AboutInfo(const name: WideString; const ProductName: WideString; 
                        const Version: WideString; const Comments: WideString; 
                        const timestr: WideString); safecall;
    procedure YTRemote_WriteAddr(Addr: Integer); safecall;
    procedure YTRemote_ReadAddr(var Addr: Integer); safecall;
    procedure YTRemote_Command(Command: Integer; BeginorEnd: Integer; Mode: Integer); safecall;
    procedure Set_CurCamera(CameraNo: Integer); safecall;
    procedure sys_init; safecall;
    procedure WriteLog(Bj: Integer; const LogRec: WideString); safecall;
    procedure UpdateParaset(Revalue: Integer); safecall;
    procedure DisplayAlarmType(SensorNo: Integer; Mode: Integer); safecall;
    procedure GetSetupPass(var PassValue: SYSINT; var SetPara: SYSINT); safecall;
    procedure GetSearchPass(var PassSearch: SYSINT; var PassBackup: SYSINT); safecall;
    procedure SetupCameraNum(Num: Integer); safecall;
    procedure LockScreen; safecall;
    procedure IsCompany(out flag: SYSINT); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IDvrFormDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B1896D6-05FF-42F2-A160-6FF774C29247}
// *********************************************************************//
  IDvrFormDisp = dispinterface
    ['{8B1896D6-05FF-42F2-A160-6FF774C29247}']
    property Visible: WordBool dispid 1;
    property AutoScroll: WordBool dispid 2;
    property AutoSize: WordBool dispid 3;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 4;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 5;
    property PixelsPerInch: Integer dispid 6;
    property PrintScale: TxPrintScale dispid 7;
    property Scaled: WordBool dispid 8;
    property Active: WordBool readonly dispid 9;
    property DropTarget: WordBool dispid 10;
    property HelpFile: WideString dispid 11;
    property DoubleBuffered: WordBool dispid 12;
    property VisibleDockClientCount: Integer readonly dispid 13;
    property Enabled: WordBool dispid -514;
    property Cursor: Smallint dispid 14;
    procedure SetCamera_ColorValue(CameraNo: Integer; index: Integer; Value: Integer); dispid 15;
    procedure PassWord(var PassFlag: SYSINT); dispid 16;
    procedure JJRecFinish; dispid 17;
    procedure DisplayRecType(CameraNo: Integer; Value: Integer); dispid 18;
    procedure AboutInfo(const name: WideString; const ProductName: WideString; 
                        const Version: WideString; const Comments: WideString; 
                        const timestr: WideString); dispid 20;
    procedure YTRemote_WriteAddr(Addr: Integer); dispid 22;
    procedure YTRemote_ReadAddr(var Addr: Integer); dispid 23;
    procedure YTRemote_Command(Command: Integer; BeginorEnd: Integer; Mode: Integer); dispid 24;
    procedure Set_CurCamera(CameraNo: Integer); dispid 25;
    procedure sys_init; dispid 27;
    procedure WriteLog(Bj: Integer; const LogRec: WideString); dispid 28;
    procedure UpdateParaset(Revalue: Integer); dispid 29;
    procedure DisplayAlarmType(SensorNo: Integer; Mode: Integer); dispid 19;
    procedure GetSetupPass(var PassValue: SYSINT; var SetPara: SYSINT); dispid 21;
    procedure GetSearchPass(var PassSearch: SYSINT; var PassBackup: SYSINT); dispid 26;
    procedure SetupCameraNum(Num: Integer); dispid 30;
    procedure LockScreen; dispid 31;
    procedure IsCompany(out flag: SYSINT); dispid 32;
  end;

// *********************************************************************//
// DispIntf:  IDvrFormEvents
// Flags:     (4096) Dispatchable
// GUID:      {5A95D19D-F023-47F8-A06B-49EA225E8E49}
// *********************************************************************//
  IDvrFormEvents = dispinterface
    ['{5A95D19D-F023-47F8-A06B-49EA225E8E49}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 5;
    procedure OnDestroy; dispid 6;
    procedure OnDeactivate; dispid 7;
    procedure OnKeyPress(var Key: Smallint); dispid 11;
    procedure OnPaint; dispid 16;
    procedure OnClose(Mode: Integer); dispid 9;
    procedure OnColorSet(CameraNo: Integer; index: Integer; Value: Integer); dispid 10;
    procedure OnModeChange(Mode: Integer); dispid 4;
    procedure OnJJRecStart; dispid 8;
    procedure OnDefaultColor(CameraNo: Integer); dispid 12;
    procedure OnSelectCamera(CameraNo: Integer); dispid 13;
    procedure OnAbout; dispid 17;
    procedure OnSetYDAlarm(CameraNo: Integer); dispid 18;
    procedure OnLockScreen(blLock: Integer); dispid 19;
    procedure OnGraphPicture; dispid 20;
    procedure OnSearch; dispid 15;
    procedure OnSetup; dispid 21;
    procedure OnFacetoWork(ON_OFF: Integer); dispid 14;
    procedure OnLockPass(para: Integer); dispid 22;
    procedure OnSensorBtn(SensorNo: Integer); dispid 23;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDvrForm
// Help String      : DvrForm Control
// Default Interface: IDvrForm
// Def. Intf. DISP? : No
// Event   Interface: IDvrFormEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TDvrFormOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TDvrFormOnClose = procedure(Sender: TObject; Mode: Integer) of object;
  TDvrFormOnColorSet = procedure(Sender: TObject; CameraNo: Integer; index: Integer; Value: Integer) of object;
  TDvrFormOnModeChange = procedure(Sender: TObject; Mode: Integer) of object;
  TDvrFormOnDefaultColor = procedure(Sender: TObject; CameraNo: Integer) of object;
  TDvrFormOnSelectCamera = procedure(Sender: TObject; CameraNo: Integer) of object;
  TDvrFormOnSetYDAlarm = procedure(Sender: TObject; CameraNo: Integer) of object;
  TDvrFormOnLockScreen = procedure(Sender: TObject; blLock: Integer) of object;
  TDvrFormOnFacetoWork = procedure(Sender: TObject; ON_OFF: Integer) of object;
  TDvrFormOnLockPass = procedure(Sender: TObject; para: Integer) of object;
  TDvrFormOnSensorBtn = procedure(Sender: TObject; SensorNo: Integer) of object;

  TDvrForm = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TDvrFormOnKeyPress;
    FOnPaint: TNotifyEvent;
    FOnClose: TDvrFormOnClose;
    FOnColorSet: TDvrFormOnColorSet;
    FOnModeChange: TDvrFormOnModeChange;
    FOnJJRecStart: TNotifyEvent;
    FOnDefaultColor: TDvrFormOnDefaultColor;
    FOnSelectCamera: TDvrFormOnSelectCamera;
    FOnAbout: TNotifyEvent;
    FOnSetYDAlarm: TDvrFormOnSetYDAlarm;
    FOnLockScreen: TDvrFormOnLockScreen;
    FOnGraphPicture: TNotifyEvent;
    FOnSearch: TNotifyEvent;
    FOnSetup: TNotifyEvent;
    FOnFacetoWork: TDvrFormOnFacetoWork;
    FOnLockPass: TDvrFormOnLockPass;
    FOnSensorBtn: TDvrFormOnSensorBtn;
    FIntf: IDvrForm;
    function  GetControlInterface: IDvrForm;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure SetCamera_ColorValue(CameraNo: Integer; index: Integer; Value: Integer);
    procedure PassWord(var PassFlag: SYSINT);
    procedure JJRecFinish;
    procedure DisplayRecType(CameraNo: Integer; Value: Integer);
    procedure AboutInfo(const name: WideString; const ProductName: WideString; 
                        const Version: WideString; const Comments: WideString; 
                        const timestr: WideString);
    procedure YTRemote_WriteAddr(Addr: Integer);
    procedure YTRemote_ReadAddr(var Addr: Integer);
    procedure YTRemote_Command(Command: Integer; BeginorEnd: Integer; Mode: Integer);
    procedure Set_CurCamera(CameraNo: Integer);
    procedure sys_init;
    procedure WriteLog(Bj: Integer; const LogRec: WideString);
    procedure UpdateParaset(Revalue: Integer);
    procedure DisplayAlarmType(SensorNo: Integer; Mode: Integer);
    procedure GetSetupPass(var PassValue: SYSINT; var SetPara: SYSINT);
    procedure GetSearchPass(var PassSearch: SYSINT; var PassBackup: SYSINT);
    procedure SetupCameraNum(Num: Integer);
    procedure LockScreen;
    procedure IsCompany(out flag: SYSINT);
    property  ControlInterface: IDvrForm read GetControlInterface;
    property  DefaultInterface: IDvrForm read GetControlInterface;
    property Visible: WordBool index 1 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 9 read GetWordBoolProp;
    property DropTarget: WordBool index 10 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 11 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 12 read GetWordBoolProp write SetWordBoolProp;
    property VisibleDockClientCount: Integer index 13 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property  ParentColor;
    property  ParentFont;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property AutoScroll: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 14 read GetSmallintProp write SetSmallintProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TDvrFormOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnClose: TDvrFormOnClose read FOnClose write FOnClose;
    property OnColorSet: TDvrFormOnColorSet read FOnColorSet write FOnColorSet;
    property OnModeChange: TDvrFormOnModeChange read FOnModeChange write FOnModeChange;
    property OnJJRecStart: TNotifyEvent read FOnJJRecStart write FOnJJRecStart;
    property OnDefaultColor: TDvrFormOnDefaultColor read FOnDefaultColor write FOnDefaultColor;
    property OnSelectCamera: TDvrFormOnSelectCamera read FOnSelectCamera write FOnSelectCamera;
    property OnAbout: TNotifyEvent read FOnAbout write FOnAbout;
    property OnSetYDAlarm: TDvrFormOnSetYDAlarm read FOnSetYDAlarm write FOnSetYDAlarm;
    property OnLockScreen: TDvrFormOnLockScreen read FOnLockScreen write FOnLockScreen;
    property OnGraphPicture: TNotifyEvent read FOnGraphPicture write FOnGraphPicture;
    property OnSearch: TNotifyEvent read FOnSearch write FOnSearch;
    property OnSetup: TNotifyEvent read FOnSetup write FOnSetup;
    property OnFacetoWork: TDvrFormOnFacetoWork read FOnFacetoWork write FOnFacetoWork;
    property OnLockPass: TDvrFormOnLockPass read FOnLockPass write FOnLockPass;
    property OnSensorBtn: TDvrFormOnSensorBtn read FOnSensorBtn write FOnSensorBtn;
  end;

procedure Register;

implementation

uses ComObj;

procedure TDvrForm.InitControlData;
const
  CEventDispIDs: array [0..22] of DWORD = (
    $00000001, $00000002, $00000003, $00000005, $00000006, $00000007,
    $0000000B, $00000010, $00000009, $0000000A, $00000004, $00000008,
    $0000000C, $0000000D, $00000011, $00000012, $00000013, $00000014,
    $0000000F, $00000015, $0000000E, $00000016, $00000017);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{49814CC1-DBA0-4FB4-9E07-25E11797BA17}';
    EventIID: '{5A95D19D-F023-47F8-A06B-49EA225E8E49}';
    EventCount: 23;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040112*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TDvrForm.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IDvrForm;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDvrForm.GetControlInterface: IDvrForm;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TDvrForm.SetCamera_ColorValue(CameraNo: Integer; index: Integer; Value: Integer);
begin
  DefaultInterface.SetCamera_ColorValue(CameraNo, index, Value);
end;

procedure TDvrForm.PassWord(var PassFlag: SYSINT);
begin
  DefaultInterface.PassWord(PassFlag);
end;

procedure TDvrForm.JJRecFinish;
begin
  DefaultInterface.JJRecFinish;
end;

procedure TDvrForm.DisplayRecType(CameraNo: Integer; Value: Integer);
begin
  DefaultInterface.DisplayRecType(CameraNo, Value);
end;

procedure TDvrForm.AboutInfo(const name: WideString; const ProductName: WideString; 
                             const Version: WideString; const Comments: WideString; 
                             const timestr: WideString);
begin
  DefaultInterface.AboutInfo(name, ProductName, Version, Comments, timestr);
end;

procedure TDvrForm.YTRemote_WriteAddr(Addr: Integer);
begin
  DefaultInterface.YTRemote_WriteAddr(Addr);
end;

procedure TDvrForm.YTRemote_ReadAddr(var Addr: Integer);
begin
  DefaultInterface.YTRemote_ReadAddr(Addr);
end;

procedure TDvrForm.YTRemote_Command(Command: Integer; BeginorEnd: Integer; Mode: Integer);
begin
  DefaultInterface.YTRemote_Command(Command, BeginorEnd, Mode);
end;

procedure TDvrForm.Set_CurCamera(CameraNo: Integer);
begin
  DefaultInterface.Set_CurCamera(CameraNo);
end;

procedure TDvrForm.sys_init;
begin
  DefaultInterface.sys_init;
end;

procedure TDvrForm.WriteLog(Bj: Integer; const LogRec: WideString);
begin
  DefaultInterface.WriteLog(Bj, LogRec);
end;

procedure TDvrForm.UpdateParaset(Revalue: Integer);
begin
  DefaultInterface.UpdateParaset(Revalue);
end;

procedure TDvrForm.DisplayAlarmType(SensorNo: Integer; Mode: Integer);
begin
  DefaultInterface.DisplayAlarmType(SensorNo, Mode);
end;

procedure TDvrForm.GetSetupPass(var PassValue: SYSINT; var SetPara: SYSINT);
begin
  DefaultInterface.GetSetupPass(PassValue, SetPara);
end;

procedure TDvrForm.GetSearchPass(var PassSearch: SYSINT; var PassBackup: SYSINT);
begin
  DefaultInterface.GetSearchPass(PassSearch, PassBackup);
end;

procedure TDvrForm.SetupCameraNum(Num: Integer);
begin
  DefaultInterface.SetupCameraNum(Num);
end;

procedure TDvrForm.LockScreen;
begin
  DefaultInterface.LockScreen;
end;

procedure TDvrForm.IsCompany(out flag: SYSINT);
begin
  DefaultInterface.IsCompany(flag);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TDvrForm]);
end;

end.
