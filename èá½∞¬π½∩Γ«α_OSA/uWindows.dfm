object WindowsForm: TWindowsForm
  Left = 217
  Top = 160
  Width = 392
  Height = 377
  BorderStyle = bsSizeToolWin
  Caption = #1054#1082#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 277
    Top = 0
    Width = 107
    Height = 343
    Align = alRight
    TabOrder = 0
    object Button1: TButton
      Left = 12
      Top = 8
      Width = 85
      Height = 23
      Caption = #1055#1077#1088#1077#1081#1090#1080
      TabOrder = 0
    end
    object Button2: TButton
      Left = 12
      Top = 200
      Width = 85
      Height = 23
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 12
      Top = 72
      Width = 85
      Height = 23
      Action = MainForm.WindowClose
      ModalResult = 2
      TabOrder = 2
    end
    object Button4: TButton
      Left = 12
      Top = 40
      Width = 85
      Height = 23
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 3
    end
    object Button3: TButton
      Left = 12
      Top = 104
      Width = 85
      Height = 23
      Action = MainForm.WindowCascade
      ModalResult = 2
      TabOrder = 4
    end
    object Button6: TButton
      Left = 12
      Top = 136
      Width = 85
      Height = 23
      Action = MainForm.WindowTileHorizontal
      ModalResult = 2
      TabOrder = 5
    end
    object Button7: TButton
      Left = 12
      Top = 168
      Width = 85
      Height = 23
      Action = MainForm.WindowTileVertical
      ModalResult = 2
      TabOrder = 6
    end
  end
end
