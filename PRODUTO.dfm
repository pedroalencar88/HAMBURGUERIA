object FRMPRODUTO: TFRMPRODUTO
  Left = 0
  Top = 0
  Caption = 'CADASTRO DE PRODUTO'
  ClientHeight = 336
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 111
    Height = 13
    Caption = 'DESCRI'#199#195'O PRODUTO'
    FocusControl = cxDBTextEdit1
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 34
    Height = 13
    Caption = 'PRE'#199'O'
    FocusControl = cxDBCurrencyEdit1
  end
  object DBNavigator1: TDBNavigator
    Left = 1
    Top = 123
    Width = 320
    Height = 25
    DataSource = DSPRODUTO
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 157
    Width = 328
    Height = 171
    DataSource = DSPRODUTO
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 8
    Top = 27
    DataBinding.DataField = 'DESC_PRODUTO'
    DataBinding.DataSource = DSPRODUTO
    TabOrder = 2
    Width = 202
  end
  object cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Left = 8
    Top = 67
    DataBinding.DataField = 'PRECO'
    DataBinding.DataSource = DSPRODUTO
    TabOrder = 3
    Width = 121
  end
  object DBImage1: TDBImage
    Left = 216
    Top = 8
    Width = 105
    Height = 105
    TabOrder = 4
  end
  object QPRODUTO: TFDQuery
    Connection = DM_.FDCONEXAO
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 200
    Top = 248
    object QPRODUTOCOD_PRODUTO: TFDAutoIncField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPRODUTODESC_PRODUTO: TWideStringField
      FieldName = 'DESC_PRODUTO'
      Origin = 'DESC_PRODUTO'
      FixedChar = True
      Size = 30
    end
    object QPRODUTOPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 4
      Size = 2
    end
  end
  object DSPRODUTO: TDataSource
    DataSet = QPRODUTO
    Left = 272
    Top = 248
  end
end
