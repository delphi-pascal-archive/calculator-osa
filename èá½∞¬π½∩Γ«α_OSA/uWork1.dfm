object WorkForm1: TWorkForm1
  Left = 201
  Top = 200
  Width = 445
  Height = 369
  HelpContext = 4
  Caption = #1050#1074#1072#1076#1088#1072#1090#1085#1086#1077' '#1091#1088#1072#1074#1085#1077#1085#1080#1077' - '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    000001002000000000000000000000000000000000000000000000000000FFFF
    FF000000001D0000003400000036000000360000003600000036000000360000
    003600000036000000360000003600000036000000330000001DFFFFFF00FFFF
    FF0000000034F9F9F9F5FCFCFCFDFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
    FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFDF9F9F9F300000033FFFFFF000000
    000100000036FCFCFCFEFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
    FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFD00000036FFFFFF000000
    000100000036FCFCFCFFFCFCFCFF18435AFF2B6189FF4C8ABEFF6FA8CBFFE0E9
    F1FFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFCFCFCFF00000036000000010000
    000100000036FCFCFCFFFCFCFCFF2E6785FF94C7F9FF91C9F9FF4185C9FF266B
    AEFFD4E2EEFFFAFAFAFFFAFAFAFFFAFAFAFFFCFCFCFF00000036000000010000
    000100000036FCFCFCFFFCFCFCFF4389AAFFE0F2FFFF549AD8FF1A7ABEFF4998
    C5FF488EC7FFD8E6F3FFF8F8F8FFF8F8F8FFFCFCFCFF00000036000000010000
    000100000036FCFCFCFFFCFCFCFFA5C3D7FF7AB6D5FF90B7D1FF55C9E4FF5BDF
    F5FF78D0EDFF519DDDFFDFEBF5FFF8F8F8FFFCFCFCFF00000036000000010000
    000100000036FCFCFCFFFCFCFCFFFCFCFCFFB2D5E5FF76BAD7FFC2F6FDFF63DF
    F7FF5DE2F8FF79D3F0FF4998DCFFDEE9F2FFFCFCFCFF00000036000000010000
    000100000036FCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFAFD4E5FF77CBE7FFC7F7
    FDFF5EDCF5FF5AE1F7FF7BD4F1FF4B9ADDFFD4E5F5FF00000036000000010000
    000100000036FCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFBDE5F2FF79D3
    EEFFC7F7FDFF5FDCF5FF5BE2F7FF7AD6F2FF51A2E2FF234A6B5C000000010000
    000100000036FCFCFCFFFBFBFBFFFCFCFCFFFCFCFCFFFBFBFBFFF8F8F8FFBAE3
    F0FF7DD4EEFFC4F6FDFF6CDDF6FF6DCAEDFF63A3D7FF5C99CFF04F8EC4270000
    000100000036FCFCFCFFF9F9F9FFF9F9F9FFF9F9F9FFF7F7F7FFF6F6F6FFF2F2
    F2FFA8D9E8FF81D6EEFFB2E3F9FF8BC0E7FFAED3F6FFC4E0FCFF669FD3F70000
    000100000036FCFCFCFFF7F7F7FFF9F9F9FFF7F7F7FFF7F7F7FFF3F3F3FFF0F0
    F0FFEAEAEAFFAFE4F3FF77BEE7FFB4D2F0FFE5F3FFFFACD2EFFF488CC7E8FFFF
    FF0000000036FBFBFBFDF4F4F4FFF5F5F5FFF5F5F5FFF5F5F5FFF1F1F1FFEFEF
    EFFFE9E9E9FFFCFCFCFFACD5E4FF58A5D8FF85B1DBFF469DD0FF2B95D15EFFFF
    FF0000000033F8F8F8F0FBFBFBFDFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
    FCFFFCFCFCFFF8F8F8FF949494910000002000000002FFFFFF00FFFFFF00FFFF
    FF000000001C0000003300000036000000360000003600000036000000360000
    003600000036000000360000002000000002FFFFFF00FFFFFF00FFFFFF00FFFF
    0000C0030000C0030000C0030000C0030000C0030000C0030000C0030000C003
    0000C0030000C0010000C0000000C0000000C0010000C00F0000FFFF0000}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 437
    Height = 152
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alTop
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 176
      Top = 0
      Width = 257
      Height = 148
      Align = alRight
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 0
      object aEdit: TLabeledEdit
        Left = 144
        Top = 16
        Width = 100
        Height = 21
        EditLabel.Width = 80
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1040
        LabelPosition = lpLeft
        PopupMenu = MainForm.PopupMenu3
        TabOrder = 0
        Text = '1'
        OnKeyPress = cEditKeyPress
      end
      object bEdit: TLabeledEdit
        Left = 144
        Top = 48
        Width = 100
        Height = 21
        EditLabel.Width = 80
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1042
        LabelPosition = lpLeft
        PopupMenu = MainForm.PopupMenu3
        TabOrder = 1
        Text = '2'
        OnKeyPress = cEditKeyPress
      end
      object cEdit: TLabeledEdit
        Left = 144
        Top = 80
        Width = 100
        Height = 21
        EditLabel.Width = 80
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1057
        LabelPosition = lpLeft
        PopupMenu = MainForm.PopupMenu3
        TabOrder = 2
        Text = '1'
        OnKeyPress = cEditKeyPress
      end
      object RunB: TBitBtn
        Left = 142
        Top = 112
        Width = 105
        Height = 25
        Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
        TabOrder = 3
        OnClick = RunBClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000130B0000130B00000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00216324B81D5E2006FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF002A702F38256929F7216324D9FFFFFF00FFFFFF00FFFFFF00FFFFFF0061BE
          6DFF5DB868FF58B162FF53A95CFF4DA156FF47994FFF419149FF3B8842FF3580
          3BFF3F8845FF59A15EFF448B49FF216324CFFFFFFF00FFFFFF00FFFFFF0065C3
          71FFA0D7A9FF9CD5A5FF98D3A1FF94D09DFF90CE98FF8BCB93FF87C98EFF82C6
          89FF7EC384FF7AC180FF76BE7CFF458C4AFF216324C4FFFFFF00FFFFFF0068C7
          74FFA5DAAEFFA2D8ABFF9ED6A7FF9AD4A3FF96D29FFF93CF9AFF8ECC95FF89CA
          90FF85C78BFF81C587FF7DC282FF4A9150FF256929C9FFFFFF00FFFFFF0068C7
          74FF68C774FF65C371FF61BE6DFF5DB868FF58B162FF53A95CFF4DA156FF4799
          4FFF419149FF5AA362FF559D5CFF2F7835D1FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00419149F73B8842DBFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0047994FBB41914906FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      end
    end
  end
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 152
    Width = 437
    Height = 183
    HelpContext = 4
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object Image: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      Transparent = True
    end
  end
end
