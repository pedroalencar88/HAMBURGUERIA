unit RELATORIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFRMRELATORIO = class(TForm)
    Label2: TLabel;
    DATAINICIAL: TDateTimePicker;
    Label1: TLabel;
    DATAFINAL: TDateTimePicker;
    Button1: TButton;
    DBGrid1: TDBGrid;
    QULTIMASCOMPRAS: TFDQuery;
    QULTIMASCOMPRASCOD_PEDIDO: TIntegerField;
    QULTIMASCOMPRASDATA: TDateField;
    QULTIMASCOMPRASNRITEM: TIntegerField;
    QULTIMASCOMPRASDESC_PRODUTO: TWideStringField;
    QULTIMASCOMPRASSTATUS: TStringField;
    DSULTIMASCOMPRAS: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMRELATORIO: TFRMRELATORIO;

implementation

{$R *.dfm}

procedure TFRMRELATORIO.Button1Click(Sender: TObject);
begin
    QULTIMASCOMPRAS.Close;
    QULTIMASCOMPRAS.ParamByName('D1').AsDate := DATAINICIAL.DateTime;
    QULTIMASCOMPRAS.ParamByName('D2').AsDate := DATAFINAL.DateTime;;
    QULTIMASCOMPRAS.Open;
end;

end.
