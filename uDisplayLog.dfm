object Frmlog: TFrmlog
  Left = 207
  Top = 117
  Width = 553
  Height = 539
  BorderIcons = [biSystemMenu]
  Caption = '日志浏览'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0888AA000000000000000000000000088888AABB000000000000000000000088
    8888ABBEE0000000000000000000008F8888ABEE800000000000000000000878
    F88FABE88800000000000000000008888F707E88880000000666666666600888
    8A0F0888880700007FFFFFFFFF600888AE70787888087088077777777F60088A
    AEB88F88780870FF800000007F6000AAEBB888F8808870FFF88888807F6000AE
    EBB8888F808700FFFFFFFF807F60000EBBB888880870707FFFFFFF807F600000
    0BB88800778870F77FFFFF807F600000600000FFFF8870FFF7777F807F600000
    6F0FFFFFFF8700FFFFFFFF807F6000006F0FFFFFF870707FFFFFFF807F600000
    6F0FF777778870F77FFFFF807F6000006F0FFFFFFF8700FFF7777F807F600000
    6F0FFFFFF87070FFFFFFFF807F6000006F0FF7777788707FFFFFFF807F600000
    6F0FFFFFFF8870F77FFFFF807F6000006F0FFFFFFF8700FFF7777F807F600000
    6F0FFFFFF87070FFFFFFFF807F6000006F0FF777778870FFFFFFFF807F600000
    660FFFFFFF8870FFFFFFFF8076600000000FFFFFFF87000FFFFFFF8000000000
    000FFFFFF80000000FFFFF80000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFF83FFFFFE00FFFFFC007FFFF8003FFFF8003FFFF0000
    E000000040000000000000000000000000008000000080000000C0000000E000
    0000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E000
    0000E0000000E0000000E0000000E0000000E0004000FC00E00FFC03F80F}
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 112
    Width = 529
    Height = 361
    Color = 13684944
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = ComboBox1KeyPress
  end
  object Button1: TButton
    Left = 433
    Top = 480
    Width = 100
    Height = 28
    Caption = '退 出'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 529
    Height = 97
    Caption = '按条件浏览'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 31
      Width = 88
      Height = 16
      Caption = '按日期查看:'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 66
      Width = 72
      Height = 16
      Caption = '分类查看:'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 300
      Top = 66
      Width = 160
      Height = 16
      Caption = '(限于选择日期的记录)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 296
      Top = 24
      Width = 169
      Height = 28
      AllowAllUp = True
      GroupIndex = 1
      Caption = '查看交班登记情况'
      OnClick = DateTimePicker1Change
    end
    object DateTimePicker1: TDateTimePicker
      Left = 103
      Top = 26
      Width = 158
      Height = 24
      CalAlignment = dtaLeft
      Date = 37252
      Time = 37252
      DateFormat = dfLong
      DateMode = dmComboBox
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = '宋体'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 0
      OnCloseUp = DateTimePicker1Change
    end
    object ComboBox1: TComboBox
      Left = 103
      Top = 62
      Width = 90
      Height = 24
      ItemHeight = 16
      TabOrder = 1
      OnChange = ComboBox1Change
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        '操作'
        '系统提示'
        '报警')
    end
    object ComboBox2: TComboBox
      Left = 199
      Top = 62
      Width = 90
      Height = 24
      ItemHeight = 16
      TabOrder = 2
      OnChange = ComboBox2Change
      OnKeyPress = ComboBox1KeyPress
    end
  end
end
