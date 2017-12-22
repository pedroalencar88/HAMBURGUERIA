object FRMCONSULTAPRODUTO: TFRMCONSULTAPRODUTO
  Left = 0
  Top = 0
  Caption = 'CONSULTA PRODUTO'
  ClientHeight = 173
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 329
    Height = 173
    Align = alClient
    DataSource = DSPRODUTO
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object QPRODUTO: TFDQuery
    Connection = DM_.FDCONEXAO
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 200
    Top = 88
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
    Top = 88
  end
end
