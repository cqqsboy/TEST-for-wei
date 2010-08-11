unit Unituser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls,shellapi;

type
  TFrmUser = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditName: TEdit;
    Editpass: TEdit;
    Button1: TButton;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    procedure EditpassKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Function InputUSerPass(Mode:Byte):Boolean;
  end;

var
  FrmUser: TFrmUser;

implementation

uses UnitPara;

{$R *.DFM}
const maxuser=64;
var
   UserPassFlag:boolean;
   ErrorNum:integer=0;
   SysFlag:boolean=false;   //系统用户吗

Function TFrmUser.InputUSerPass(Mode:Byte):Boolean;
//var
//  Userfile,revalue,i:integer;
//  path:string;
begin
   ErrorNum:=0;
   UserPassFlag:=false;
{   for i:=0 to 15 do UserPass[i].USERNAME := '';
   path:=ExtractFilePath(Application.EXEName)+'SetPara';
   Userfile:=FileOpen(path+'\UserInfo.dat',fmOpenRead or fmShareDenyNone);
      if Userfile <> -1 then
      begin
         try
           FileSeek(Userfile,0,0);
           for i:=0 to 15 do
           begin
             revalue:=FileRead(Userfile,UserPass[i],sizeof(TUserInfo));
             if(revalue<>sizeof(TUserInfo)) then  break;
           end;
         finally
            FileClose(Userfile);
         end;
      end
      else
      begin
         UserPass[0].USERNAME:='sys';
         UserPass[0].CHINANAME:='系统管理员';
         UserPass[0].PASSWORDS:='sys';
          UserPass[0].blEnter :=true;
          UserPass[0].blSETUP :=true;
          UserPass[0].blSEARCH :=true;
          UserPass[0].blJZCH :=true;
          UserPass[0].blYTCon :=true;
          UserPass[0].blCOLOR :=true;
          UserPass[0].blLOG :=true;
          UserPass[0].blEXIT :=true;
      end;
}
   if Mode=0 then SysFlag:=true   //只对sys用户
   else SysFlag:=false;

    ShowModal;
    result:=UserPassFlag;
end;

procedure TFrmUser.EditpassKeyPress(Sender: TObject; var Key: Char);
var
  name,pass:string;
  i:integer;
begin
   if key=#13 then
   begin
      UserPassFlag:=false;
      name:=EditName.Text;
      pass:=EditPass.Text;
      for i:=0 to maxuser   do    //change 15 to maxuser wei
        if(UserPass[i].USERNAME <> '')and(UserPass[i].USERNAME = name) then
        begin
             if UserPass[i].PASSWORDS <> pass then
             begin
                MessageBox(handle,'输入口令不正确，请重新输入','系统提示：',MB_OK);
                EditPass.Text :='';
                inc(ErrorNum);
                if(ErrorNum>3) then close; //Button1Click(Sender);
                exit;
             end;

             UserPassFlag:=true;     //用户名和密码都通过
             Cur_User:=UserPass[i];
             break;
        end;
      if UserPassFlag then close //Button1Click(Sender)
      else
      begin
          MessageBox(handle,'你不是本系统的合法用户!','系统提示：',MB_OK);
          EditName.Text :='';
          EditPass.Text :='';
          FormShow(Sender);
          inc(ErrorNum);
          if(ErrorNum>3) then close;//Button1Click(Sender);
      end;
   end;
end;

procedure TFrmUser.FormShow(Sender: TObject);
begin
  if (SysFlag=false) then EditName.SetFocus
  else
  begin
    EditPass.SetFocus;
    EditName.Text:='sys';
  end;
  AnimateWindow(handle,200,AW_CENTER);
  Invalidate;
end;

procedure TFrmUser.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
   if SysFlag and ((sender as TEdit).tag = 1) then key:=#0;  //屏蔽sys用户
   if ord(key)=VK_RETURN then Editpass.setfocus;
end;

procedure TFrmUser.Button1Click(Sender: TObject);
var
  key:char;
begin
   key:=#13;
   EditpassKeyPress(sender,key);
end;

procedure TFrmUser.SpeedButton1Click(Sender: TObject);
var
  ReturnValue:integer;
begin
  ReturnValue := ShellExecute(handle, 'open',pchar(Extractfilepath(Application.ExeName)+'OnscreenKeyboard.exe'),nil,nil,SW_SHOW);
  if ReturnValue<=32 then
     MessageBox(handle,pchar('不能打开软键盘，可能是此模块被移除!'),pchar('系统提示'),MB_OK);
end;

procedure TFrmUser.Button2Click(Sender: TObject);
begin
  close;
end;

end.
