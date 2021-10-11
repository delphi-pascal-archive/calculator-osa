object WorkForm6: TWorkForm6
  Left = 265
  Top = 202
  Width = 739
  Height = 503
  HelpContext = 8
  Caption = #1043#1083#1086#1073#1072#1083#1100#1085#1072#1103' '#1080#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103' - '
  Color = clWhite
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 731
    Height = 289
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alTop
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    object sg: TStringGrid
      Left = 381
      Top = 0
      Width = 152
      Height = 285
      Align = alRight
      Color = clWhite
      ColCount = 2
      Ctl3D = False
      DefaultRowHeight = 21
      FixedColor = clWhite
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowMoving, goColMoving, goEditing, goTabs]
      ParentCtl3D = False
      PopupMenu = MainForm.PopupMenu3
      TabOrder = 0
      OnClick = sgClick
      OnKeyPress = sgKeyPress
      ColWidths = (
        70
        75)
    end
    object Chart1: TChart
      Left = 0
      Top = 0
      Width = 297
      Height = 285
      AllowPanning = pmNone
      AllowZoom = False
      AnimatedZoom = True
      BackWall.Brush.Color = clWhite
      BackWall.Color = clWhite
      BottomWall.Brush.Color = clScrollBar
      Foot.Brush.Color = clScrollBar
      Foot.Color = clScrollBar
      Gradient.EndColor = clWhite
      LeftWall.Brush.Color = clScrollBar
      LeftWall.Color = 4211508
      MarginBottom = 5
      MarginLeft = 5
      MarginRight = 5
      MarginTop = 9
      PrintProportional = False
      Title.Brush.Color = clWhite
      Title.Brush.Style = bsClear
      Title.Color = clScrollBar
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -13
      Title.Font.Name = 'Arial'
      Title.Font.Style = []
      Title.Text.Strings = (
        '')
      Title.Visible = False
      BackColor = clWhite
      BottomAxis.Axis.Width = 1
      BottomAxis.LabelStyle = talValue
      BottomAxis.Title.Caption = 'X'
      Chart3DPercent = 45
      DepthAxis.LabelsMultiLine = True
      DepthAxis.Title.Font.Charset = DEFAULT_CHARSET
      DepthAxis.Title.Font.Color = clBlack
      DepthAxis.Title.Font.Height = -13
      DepthAxis.Title.Font.Name = 'Arial'
      DepthAxis.Title.Font.Style = [fsBold]
      LeftAxis.Axis.Width = 1
      LeftAxis.LabelStyle = talValue
      LeftAxis.RoundFirstLabel = False
      LeftAxis.Title.Angle = 0
      LeftAxis.Title.Caption = 'Y'
      Legend.Alignment = laTop
      Legend.Brush.Color = clScrollBar
      Legend.Color = clSilver
      Legend.Font.Charset = RUSSIAN_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -13
      Legend.Font.Name = 'MS Sans Serif'
      Legend.Font.Style = []
      Legend.LegendStyle = lsSeries
      Legend.ResizeChart = False
      Legend.Visible = False
      RightAxis.Title.Angle = 360
      RightAxis.Visible = False
      TopAxis.Title.Font.Charset = DEFAULT_CHARSET
      TopAxis.Title.Font.Color = clBlack
      TopAxis.Title.Font.Height = -13
      TopAxis.Title.Font.Name = 'Arial'
      TopAxis.Title.Font.Style = []
      TopAxis.Visible = False
      View3D = False
      View3DOptions.Elevation = 320
      View3DOptions.HorizOffset = -23
      View3DOptions.Perspective = 52
      View3DOptions.VertOffset = 8
      View3DOptions.Zoom = 93
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      object Series1: TFastLineSeries
        Marks.Arrow.Color = clBlack
        Marks.ArrowLength = 8
        Marks.BackColor = clWhite
        Marks.Style = smsXValue
        Marks.Visible = True
        SeriesColor = clRed
        Title = #1043#1088#1072#1092#1080#1082' '#1092#1091#1085#1082#1094#1080#1080
        LinePen.Color = clGreen
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
    object Panel1: TPanel
      Left = 533
      Top = 0
      Width = 194
      Height = 285
      Align = alRight
      Color = clWhite
      TabOrder = 2
      object Label2: TLabel
        Left = 8
        Top = 96
        Width = 137
        Height = 13
        Caption = #1043#1083#1086#1073#1072#1083#1100#1085#1072#1103' '#1080#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103':'
      end
      object RunB: TBitBtn
        Left = 8
        Top = 168
        Width = 100
        Height = 25
        Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
        Enabled = False
        TabOrder = 0
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
      object RadioButton2: TRadioButton
        Left = 7
        Top = 144
        Width = 138
        Height = 17
        Caption = #1084#1085#1086#1075#1086#1095#1083#1077#1085' '#1051#1072#1075#1088#1072#1085#1078#1072
        TabOrder = 1
        OnClick = RadioButton1Click
      end
      object RadioButton1: TRadioButton
        Left = 7
        Top = 120
        Width = 130
        Height = 17
        Caption = #1084#1085#1086#1075#1086#1095#1083#1077#1085' '#1053#1100#1102#1090#1086#1085#1072
        TabOrder = 2
        OnClick = RadioButton1Click
      end
      object Edit1: TEdit
        Left = 8
        Top = 58
        Width = 83
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = '4'
      end
      object UpDown1: TUpDown
        Left = 91
        Top = 58
        Width = 16
        Height = 21
        Associate = Edit1
        Min = 2
        Position = 4
        TabOrder = 4
      end
      object XEdit: TLabeledEdit
        Left = 8
        Top = 24
        Width = 97
        Height = 21
        EditLabel.Width = 98
        EditLabel.Height = 13
        EditLabel.Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1090#1086#1095#1082#1077' '#1061
        PopupMenu = MainForm.PopupMenu3
        TabOrder = 5
        OnKeyPress = sgKeyPress
      end
    end
  end
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 289
    Width = 731
    Height = 180
    HelpContext = 8
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
    object SGD: TStringGrid
      Left = 316
      Top = 0
      Width = 411
      Height = 176
      Align = alRight
      Color = clWhite
      ColCount = 6
      Ctl3D = False
      DefaultRowHeight = 21
      FixedColor = clWhite
      FixedCols = 0
      RowCount = 7
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
    end
  end
end
