object FrmJbLog: TFrmJbLog
  Left = 476
  Top = 181
  Width = 375
  Height = 395
  Caption = '交接班'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000070000000000000000000000000003307070000000000000000000
    0000003330070000000000000000000000000033307070000000000000000000
    0000003330070000000000000000000000000033307070000000000000000000
    0000003330070000000000000000000000000033307070000000000000000000
    0000003330070080700000000000000000000033300088808780000000000000
    0000003300888880787870000000000000000000888888808787878000000000
    0000008888888880787878780000000000008888888888808787878700000000
    0088888888887880787878780000000088700888887008808787800700000008
    800908887000078078780F70000000088099087000078F8087870F7000000008
    809900000788F8F0787088700000000880990007888F8F808780770700000008
    80900788F8F8F8F808780078000000088007888F8F8FFFFF0787878000000008
    8888F8F8FFFFFFFF807878700000000F8F8F8F8FFFFFF8F8F800870000000008
    F8F8FFFFFFFF8F88887700000000000F8FFFFFFFF8F8F8887700000000000000
    FFFFFFFF8F8888770000000000000000FFFFF8F8F88877000000000000000000
    0F8F8F8888770000000000000000000007F88888770000000000000000000000
    000888770000000000000000000000000000000000000000000000000000FFF8
    FFFFFFE03FFFFF803FFFFF803FFFFF803FFFFF803FFFFF803FFFFF8007FFFF80
    01FFFF80007FFF80001FFF800007FF000007FC000007F0000007C0000007C000
    0007C0000007C0000007C0000007C0000007C000000FC000000FC000001FC000
    003FC00000FFE00003FFE0000FFFF0003FFFF000FFFFF803FFFFFE0FFFFF}
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 56
    Height = 16
    Caption = '交班人:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 43
    Width = 72
    Height = 16
    Caption = '接班时间:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 69
    Width = 72
    Height = 16
    Caption = '交班时间:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 96
    Width = 104
    Height = 16
    Caption = '值班情况记录:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 128
    Width = 337
    Height = 193
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 48
    Top = 331
    Width = 75
    Height = 25
    Caption = '交班'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 331
    Width = 75
    Height = 25
    Caption = '取消'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 13
    Width = 209
    Height = 23
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 96
    Top = 40
    Width = 209
    Height = 23
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 96
    Top = 66
    Width = 209
    Height = 23
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
end
