unit YT_COMLib_TLB;

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
// File generated on 2002-3-31 10:54:22 from Type Library described below.

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
// Type Lib: C:\Program Files\HY995e\YT_Com.dll (1)
// IID\LCID: {AC712021-CFD5-4935-9FCF-AC0D9EFBEF38}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// Errors:
//   Error creating palette bitmap of (Tytcon) : Server C:\PROGRA~1\HY995e\YT_Com.dll contains no icons
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
  YT_COMLibMajorVersion = 1;
  YT_COMLibMinorVersion = 0;

  LIBID_YT_COMLib: TGUID = '{AC712021-CFD5-4935-9FCF-AC0D9EFBEF38}';

  IID_Iytcon: TGUID = '{B46CB471-EB6E-4736-B424-8752F8EB2398}';
  CLASS_ytcon: TGUID = '{72BFCF7D-8D54-43D4-B15F-41CA51DCB8BF}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Iytcon = interface;
  IytconDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ytcon = Iytcon;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PSYSINT1 = ^SYSINT; {*}


// *********************************************************************//
// Interface: Iytcon
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B46CB471-EB6E-4736-B424-8752F8EB2398}
// *********************************************************************//
  Iytcon = interface(IDispatch)
    ['{B46CB471-EB6E-4736-B424-8752F8EB2398}']
    procedure YTComOpen(port: SYSINT; nCameraNum: SYSINT); safecall;
    procedure YTComClose; safecall;
    procedure YTCommand(command: SYSINT; BeginorEnd: SYSINT; Mode: SYSINT); safecall;
    procedure YTWriteAddr(addr: SYSINT); safecall;
    procedure YTReadAddr(var addr: SYSINT); safecall;
    procedure YTVersionInfo(ver: PChar); safecall;
    procedure CheckHighSpeed(var Flag: SYSINT); safecall;
    procedure CallPreset(pos: SYSINT); safecall;
    procedure SavePreset(pos: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  IytconDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B46CB471-EB6E-4736-B424-8752F8EB2398}
// *********************************************************************//
  IytconDisp = dispinterface
    ['{B46CB471-EB6E-4736-B424-8752F8EB2398}']
    procedure YTComOpen(port: SYSINT; nCameraNum: SYSINT); dispid 1;
    procedure YTComClose; dispid 2;
    procedure YTCommand(command: SYSINT; BeginorEnd: SYSINT; Mode: SYSINT); dispid 3;
    procedure YTWriteAddr(addr: SYSINT); dispid 4;
    procedure YTReadAddr(var addr: SYSINT); dispid 5;
    procedure YTVersionInfo(ver: {??PChar} OleVariant); dispid 6;
    procedure CheckHighSpeed(var Flag: SYSINT); dispid 7;
    procedure CallPreset(pos: SYSINT); dispid 8;
    procedure SavePreset(pos: SYSINT); dispid 9;
  end;

// *********************************************************************//
// The Class Coytcon provides a Create and CreateRemote method to          
// create instances of the default interface Iytcon exposed by              
// the CoClass ytcon. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Coytcon = class
    class function Create: Iytcon;
    class function CreateRemote(const MachineName: string): Iytcon;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : Tytcon
// Help String      : ytcon Class
// Default Interface: Iytcon
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TytconProperties= class;
{$ENDIF}
  Tytcon = class(TOleServer)
  private
    FIntf:        Iytcon;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TytconProperties;
    function      GetServerProperties: TytconProperties;
{$ENDIF}
    function      GetDefaultInterface: Iytcon;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: Iytcon);
    procedure Disconnect; override;
    procedure YTComOpen(port: SYSINT; nCameraNum: SYSINT);
    procedure YTComClose;
    procedure YTCommand(command: SYSINT; BeginorEnd: SYSINT; Mode: SYSINT);
    procedure YTWriteAddr(addr: SYSINT);
    procedure YTReadAddr(var addr: SYSINT);
    procedure YTVersionInfo(ver: PChar);
    procedure CheckHighSpeed(var Flag: SYSINT);
    procedure CallPreset(pos: SYSINT);
    procedure SavePreset(pos: SYSINT);
    property  DefaultInterface: Iytcon read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TytconProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : Tytcon
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TytconProperties = class(TPersistent)
  private
    FServer:    Tytcon;
    function    GetDefaultInterface: Iytcon;
    constructor Create(AServer: Tytcon);
  protected
  public
    property DefaultInterface: Iytcon read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function Coytcon.Create: Iytcon;
begin
  Result := CreateComObject(CLASS_ytcon) as Iytcon;
end;

class function Coytcon.CreateRemote(const MachineName: string): Iytcon;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ytcon) as Iytcon;
end;

procedure Tytcon.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{72BFCF7D-8D54-43D4-B15F-41CA51DCB8BF}';
    IntfIID:   '{B46CB471-EB6E-4736-B424-8752F8EB2398}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure Tytcon.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as Iytcon;
  end;
end;

procedure Tytcon.ConnectTo(svrIntf: Iytcon);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure Tytcon.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function Tytcon.GetDefaultInterface: Iytcon;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor Tytcon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TytconProperties.Create(Self);
{$ENDIF}
end;

destructor Tytcon.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function Tytcon.GetServerProperties: TytconProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure Tytcon.YTComOpen(port: SYSINT; nCameraNum: SYSINT);
begin
  DefaultInterface.YTComOpen(port, nCameraNum);
end;

procedure Tytcon.YTComClose;
begin
  DefaultInterface.YTComClose;
end;

procedure Tytcon.YTCommand(command: SYSINT; BeginorEnd: SYSINT; Mode: SYSINT);
begin
  DefaultInterface.YTCommand(command, BeginorEnd, Mode);
end;

procedure Tytcon.YTWriteAddr(addr: SYSINT);
begin
  DefaultInterface.YTWriteAddr(addr);
end;

procedure Tytcon.YTReadAddr(var addr: SYSINT);
begin
  DefaultInterface.YTReadAddr(addr);
end;

procedure Tytcon.YTVersionInfo(ver: PChar);
begin
  DefaultInterface.YTVersionInfo(ver);
end;

procedure Tytcon.CheckHighSpeed(var Flag: SYSINT);
begin
  DefaultInterface.CheckHighSpeed(Flag);
end;

procedure Tytcon.CallPreset(pos: SYSINT);
begin
  DefaultInterface.CallPreset(pos);
end;

procedure Tytcon.SavePreset(pos: SYSINT);
begin
  DefaultInterface.SavePreset(pos);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TytconProperties.Create(AServer: Tytcon);
begin
  inherited Create;
  FServer := AServer;
end;

function TytconProperties.GetDefaultInterface: Iytcon;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('ActiveX',[Tytcon]);
end;

end.
