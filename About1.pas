unit About1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,shellapi,
  StdCtrls, ExtCtrls, Buttons, jpeg;

type
  TDvrFormAbout = class(TForm)
    OkBtn: TButton;
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

procedure ShowAbout(name, Product, Ver, Comment,time: WideString);

implementation

{$R *.DFM}
// zxl 2003��2��9��Ϊ����ޱ�ʶ�����ʾflag.jpg����
{$define dycompany}

procedure ShowAbout(name, Product, Ver, Comment,time: WideString);
begin
  with TDvrFormAbout.Create(nil) do
    try
      ProductName.Caption:=Product;
      Version.Caption:=Ver;
      Comments.Caption:=Comment;
      Label1.Caption:=time;
      {$ifndef dycompany}
       if Fileexists(ExtractFilePath(Application.EXEName)+'flag.jpg') then
          begin
          programicon.picture.LoadFromFile(ExtractFilePath(Application.EXEName)+'flag.jpg');
          end;
       {$endif}
      ShowModal;
    finally
      Free;
    end;
end;

procedure TDvrFormAbout.Button1Click(Sender: TObject);
var
  ReturnValue:integer;
begin
  {$ifdef dycompany}
  ReturnValue := ShellExecute(handle, 'open',pchar(Extractfilepath(Application.ExeName)+'995E_Help.chm'),nil,nil,SW_SHOW);
  {$else}
  ReturnValue := ShellExecute(handle, 'open',pchar(Extractfilepath(Application.ExeName)+'Help.chm'),nil,nil,SW_SHOW);
  {$endif}
  if ReturnValue<=32 then
     MessageBox(handle,pchar('���ܴ����������������Ǵ�ģ�鱻�Ƴ�!'),pchar('ϵͳ��ʾ'),MB_OK);
end;

procedure TDvrFormAbout.FormShow(Sender: TObject);
begin
  AnimateWindow(handle,200,AW_CENTER);
  Invalidate;
end;

procedure TDvrFormAbout.Button2Click(Sender: TObject);
var
  ReturnValue:integer;
begin
  ReturnValue := ShellExecute(handle, 'open',pchar(Extractfilepath(Application.ExeName)+'SysInfo.exe'),nil,nil,SW_SHOW);
  if ReturnValue<=32 then
     MessageBox(handle,pchar('SysInfo.exe���ܴ򿪣������Ǵ�ģ�鱻�Ƴ�!'),pchar('ϵͳ��ʾ'),MB_OK);
end;
end.
