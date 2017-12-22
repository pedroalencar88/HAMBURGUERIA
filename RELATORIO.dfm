object FRMRELATORIO: TFRMRELATORIO
  Left = 0
  Top = 0
  Caption = 'RELAT'#211'RIOS'
  ClientHeight = 336
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 13
    Width = 68
    Height = 13
    Caption = 'DATA INICIAL'
  end
  object Label1: TLabel
    Left = 24
    Top = 59
    Width = 59
    Height = 13
    Caption = 'DATA FINAL'
  end
  object DATAINICIAL: TDateTimePicker
    Left = 8
    Top = 32
    Width = 186
    Height = 21
    Date = 43068.716036342590000000
    Time = 43068.716036342590000000
    TabOrder = 0
  end
  object DATAFINAL: TDateTimePicker
    Left = 8
    Top = 78
    Width = 186
    Height = 21
    Date = 43068.716036342590000000
    Time = 43068.716036342590000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 206
    Top = 33
    Width = 99
    Height = 67
    Caption = 'PESQUISAR'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 108
    Width = 315
    Height = 220
    DataSource = DSULTIMASCOMPRAS
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object QULTIMASCOMPRAS: TFDQuery
    Connection = DM_.FDCONEXAO
    SQL.Strings = (
      'SELECT'#9'PEDIDO.COD_PEDIDO, '
      #9#9'PEDIDO.DATA,'
      #9#9'PEDIDO.CLIENTE,'
      #9#9'CLIENTE.NOME,'#9#9#9#9
      #9#9'ITEM_PEDIDO.NRITEM,'
      #9#9'ITEM_PEDIDO.PRODUTO,'
      #9#9'PRODUTO.DESC_PRODUTO,'#9#9
      #9#9'PRODUTO.PRECO,'
      #9#9'ITEM_PEDIDO.QTDE,'
      #9
      'CASE STATUS '
      '  WHEN '#39'S'#39' THEN '#39'SOLICITADO'#39' '
      '  WHEN '#39'P'#39' THEN '#39'PREPARA'#199#195'O'#39'  '
      '  WHEN '#39'F'#39' THEN '#39'FINALIZADO'#39' '
      'END as STATUS'
      #9#9'FROM PEDIDO'
      'LEFT JOIN ITEM_PEDIDO ON ITEM_PEDIDO.PEDIDO = PEDIDO.cod_PEDIDO'
      'LEFT JOIN PRODUTO ON PRODUTO.cod_produto = ITEM_PEDIDO.produto'
      'LEFT JOIN CLIENTE ON CLIENTE.CODIGO = PEDIDO.cliente'
      'WHERE PEDIDO.DATA >= :D1 AND DATA <= :D2'
      'ORDER BY PEDIDO.cod_PEDIDO, ITEM_PEDIDO.nritem')
    Left = 136
    Top = 254
    ParamData = <
      item
        Name = 'D1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'D2'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object QULTIMASCOMPRASCOD_PEDIDO: TIntegerField
      DisplayLabel = 'PEDIDO'
      DisplayWidth = 8
      FieldName = 'COD_PEDIDO'
      Origin = 'COD_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QULTIMASCOMPRASDATA: TDateField
      DisplayWidth = 10
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object QULTIMASCOMPRASNRITEM: TIntegerField
      DisplayLabel = 'ITEM'
      DisplayWidth = 6
      FieldName = 'NRITEM'
      Origin = 'NRITEM'
    end
    object QULTIMASCOMPRASDESC_PRODUTO: TWideStringField
      DisplayLabel = 'PRODUTO'
      DisplayWidth = 18
      FieldName = 'DESC_PRODUTO'
      Origin = 'DESC_PRODUTO'
      FixedChar = True
      Size = 15
    end
    object QULTIMASCOMPRASSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ReadOnly = True
      Size = 10
    end
  end
  object DSULTIMASCOMPRAS: TDataSource
    DataSet = QULTIMASCOMPRAS
    Left = 248
    Top = 254
  end
end
