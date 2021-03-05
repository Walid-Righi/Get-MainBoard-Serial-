object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Demo'
  ClientHeight = 123
  ClientWidth = 323
  Color = 11060735
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 33
  object btn1: TButton
    Left = 8
    Top = 10
    Width = 305
    Height = 49
    Caption = 'Get Main Board Serial'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 8
    Top = 72
    Width = 305
    Height = 41
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
