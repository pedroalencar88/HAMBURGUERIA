unit CONSULTAPRODUTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFRMCONSULTAPRODUTO = class(TForm)
    DBGrid1: TDBGrid;
    QPRODUTO: TFDQuery;
    QPRODUTOCOD_PRODUTO: TFDAutoIncField;
    QPRODUTODESC_PRODUTO: TWideStringField;
    QPRODUTOPRECO: TBCDField;
    DSPRODUTO: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCONSULTAPRODUTO: TFRMCONSULTAPRODUTO;

implementation

{$R *.dfm}

uses CLIENTE, DM, LOGIN, PEDIDO, PRINCIPAL, PRODUTO, RELATORIO, TROCARSENHA;

procedure TFRMCONSULTAPRODUTO.DBGrid1DblClick(Sender: TObject);
begin
    FRMPEDIDO.EDTCODPROD.Text := DBGrid1.Fields[0].AsString;
    Close;
    FRMPEDIDO.EDTCODPROD.SetFocus;
end;

procedure TFRMCONSULTAPRODUTO.FormShow(Sender: TObject);
begin
QPRODUTO.Open;
end;

end.
