library DvrFormProj1;

uses
  ComServ,
  DvrFormProj1_TLB in 'DvrFormProj1_TLB.pas',
  DvrFormImpl1 in 'DvrFormImpl1.pas' {DvrForm: TActiveForm} {DvrForm: CoClass},
  About1 in 'About1.pas' {DvrFormAbout},
  UnitPara in 'UnitPara.pas',
  Unituser in 'Unituser.pas' {FrmUser},
  uDisplayLog in 'uDisplayLog.pas' {Frmlog},
  UnitJBLog in 'UnitJBLog.pas' {FrmJbLog},
  YT_COMLib_TLB in 'c:\Borland\Delphi5\Imports\YT_COMLib_TLB.pas';

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}


//{$R DvrFormProj1.RES}

begin
end.
