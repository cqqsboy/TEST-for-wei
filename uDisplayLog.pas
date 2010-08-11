unit uDisplayLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TFrmlog = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
  private
    procedure MemoAdd(JBLog:boolean;D,T:Tdatetime;UName:string;S:string);
  public
    { Public declarations }
  end;

var
  Frmlog: TFrmlog;

implementation

uses UnitPara;

{$R *.DFM}


var
  LogFileName:string;


procedure TFrmlog.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmlog.MemoAdd(JBLog:boolean; D,T:Tdatetime;UName:string;S:string);
begin
  if JBLog then
    memo1.Lines.Add(UName+''+s)
  else
    memo1.Lines.Add(Datetostr(D)+' '+timetoStr(T)+'   '+UName+'  '+s);
end;

procedure TFrmlog.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=date;
  DateTimePicker1Change(Sender);
  AnimateWindow(handle,400,AW_CENTER);
  Invalidate;
end;

procedure TFrmlog.ComboBox1Change(Sender: TObject);
var
 BJ:integer;
 Log:tLogFile;
 I_Log,i,Length:integer;
begin
 memo1.Lines.Clear;
 if not fileExists(LogFileName) then exit;

 BJ:=ComboBox1.ItemIndex;
 ComboBox2.Items.Clear;
 ComboBox2.Text:='';
 if BJ = 0 then
 begin
    for i:=0 to 15 do
      if(UserPass[i].USERNAME <> '') then
      ComboBox2.Items.Add(UserPass[i].USERNAME);
 end;
  I_Log:=FileOpen(LogFileName,fmOpenRead or fmShareDenyNone);
  try
     Length := FileSeek(I_Log,0,2);
     Length:=Length div sizeof(Log);
     for i:=0 to Length-1 do
     begin
        FileSeek(I_Log,i*Sizeof(Log),0);
        FileRead(I_Log,Log,Sizeof(Log));
        if (BJ=Log.bBJ) then MemoAdd(false, Log.Date,Log.Time,Log.UserName,Log.LogInfo);
     end;
  finally
    fileclose(I_Log);
  end;
end;

procedure TFrmlog.DateTimePicker1Change(Sender: TObject);
var
  Log:tLogFile;
  I_Log,i,Length:integer;
  Tdate:Tdatetime;
begin
 Tdate:=DateTimePicker1.Date;
 memo1.Lines.Clear;

 LogFileName:=ApplicationPath+'Log\'+GetLogFileName(Tdate);
 if not fileExists(LogFileName) then exit;

  I_Log:=FileOpen(LogFileName,fmOpenRead or fmShareDenyNone);
  try
     Length := FileSeek(I_Log,0,2);
     Length:=Length div sizeof(Log);
     if SpeedButton1.Down=true then
     begin
        for i:=0 to Length-1 do
        begin
           FileSeek(I_Log,i*Sizeof(Log),0);
           FileRead(I_Log,Log,Sizeof(Log));
           if(Log.bBJ=10)then
           begin
               MemoAdd(TRUE, Log.Date,Log.Time,'',''); //隔行
               MemoAdd(TRUE, Log.Date,Log.Time,'',Log.LogInfo);
           end
           else if(Log.bBJ=11)then
           begin
               MemoAdd(TRUE, Log.Date,Log.Time,'',Log.LogInfo);
               MemoAdd(TRUE, Log.Date,Log.Time,'','值班情况记录: '); //隔行
           end
           else if(Log.bBJ>11)then
               MemoAdd(true, Log.Date,Log.Time,'   ',Log.LogInfo);
        end;
     end
     else
     begin
        for i:=0 to Length-1 do
        begin
           FileSeek(I_Log,i*Sizeof(Log),0);
           FileRead(I_Log,Log,Sizeof(Log));
           if(Log.bBJ<10)then
           MemoAdd(false, Log.Date,Log.Time,Log.UserName,Log.LogInfo);
        end;
     end;
  finally
    fileclose(I_Log);
  end;
end;

procedure TFrmlog.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#0 then
     key:=#0;
end;

procedure TFrmlog.ComboBox2Change(Sender: TObject);
var
  Log:tLogFile;
  I_Log,i,Length:integer;
begin
  if(ComboBox2.Text = '')then exit;
  memo1.Lines.Clear;
 if not fileExists(LogFileName) then exit;

  I_Log:=FileOpen(LogFileName,fmOpenRead or fmShareDenyNone);
  try
     Length := FileSeek(I_Log,0,2);
     Length:=Length div sizeof(Log);
     for i:=0 to Length-1 do
     begin
        FileSeek(I_Log,i*Sizeof(Log),0);
        FileRead(I_Log,Log,Sizeof(Log));
        if ComboBox2.Text = Log.UserName then
          MemoAdd(false, Log.Date,Log.Time,Log.UserName,Log.LogInfo);
     end;
  finally
    fileclose(I_Log);
  end;
end;

end.
