unit UnitJBLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmJbLog = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmJbLog: TFrmJbLog;

implementation

  uses UnitPara,DvrFormImpl1;

{$R *.DFM}

procedure TFrmJbLog.FormShow(Sender: TObject);
begin
   Edit1.Text:=Cur_User.USERNAME;
   Edit2.Text:=DateTimetostr(JBeginTime);
   Edit3.Text:=DateTimetostr(now);
  AnimateWindow(handle,200,AW_CENTER);
  Invalidate;   
end;

procedure TFrmJbLog.Button1Click(Sender: TObject);
var
  i,line:integer;
begin
   line:=memo1.Lines.Count;
   WriteLogFile(10,'操作人员：'+Cur_User.USERNAME);
   WriteLogFile(11,'接班时间：'+Edit2.text+'   交班时间：'+Edit3.Text);
   for i:=0 to line-1 do
      WriteLogFile(12,memo1.Lines[i]);
   LockBtnFlag:=true; //锁上按钮
   close;
end;

procedure TFrmJbLog.Button2Click(Sender: TObject);
begin
  close;
end;

end.
