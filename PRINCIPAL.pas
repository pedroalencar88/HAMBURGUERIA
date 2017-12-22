unit PRINCIPAL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TFRMPRINICIPAL = class(TForm)
    BTNCOMPRA: TSpeedButton;
    BTNPRODUTO: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    QULTIMASCOMPRAS: TFDQuery;
    DSULTIMASCOMPRAS: TDataSource;
    QULTIMASCOMPRASCOD_PEDIDO: TIntegerField;
    QULTIMASCOMPRASDATA: TDateField;
    QULTIMASCOMPRASNRITEM: TIntegerField;
    QULTIMASCOMPRASDESC_PRODUTO: TWideStringField;
    QULTIMASCOMPRASSTATUS: TStringField;
    BTNRELATORIOS: TSpeedButton;
    QTIPOUSUARIO: TFDQuery;
    QTIPOUSUARIOTIPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCOMPRAClick(Sender: TObject);
    procedure BTNPRODUTOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMPRINICIPAL: TFRMPRINICIPAL;

implementation

{$R *.dfm}

uses CLIENTE, LOGIN, PEDIDO, PRODUTO, DM, RELATORIO, TROCARSENHA;

procedure TFRMPRINICIPAL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRMLOGIN.Close;
end;

procedure TFRMPRINICIPAL.FormShow(Sender: TObject);
begin
  QULTIMASCOMPRAS.Close;
  QULTIMASCOMPRAS.ParamByName('CLIENTE').AsInteger := UsuarioLogado;
  QULTIMASCOMPRAS.Open;

  QTIPOUSUARIO.Close;
  QTIPOUSUARIO.ParamByName('CODIGO').AsInteger := UsuarioLogado;
  QTIPOUSUARIO.Open;
  if NOT (QTIPOUSUARIO.IsEmpty) then
  BEGIN
    BTNRELATORIOS.Visible := True;
    BTNPRODUTO.Visible := True;
  END;

end;

procedure TFRMPRINICIPAL.BTNCOMPRAClick(Sender: TObject);
begin
  FRMPEDIDO := TFRMPEDIDO.create ( application );
  FRMPEDIDO.ShowModal;
end;

procedure TFRMPRINICIPAL.BTNPRODUTOClick(Sender: TObject);
begin
  FRMRELATORIO := TFRMRELATORIO.create ( application );
  FRMRELATORIO.ShowModal;
end;

end.
