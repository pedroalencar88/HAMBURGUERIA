unit TROCARSENHA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRMTROCARSENHA = class(TForm)
    Label1: TLabel;
    edtCPF: TMaskEdit;
    Label3: TLabel;
    EDTEMAIL: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtSenha: TEdit;
    Label10: TLabel;
    BTNCANCELAR: TSpeedButton;
    BTNGRAVAR: TSpeedButton;
    QVALIDACPF: TFDQuery;
    QVALIDACPFCODIGO: TFDAutoIncField;
    QVALIDACPFNOME: TStringField;
    QVALIDACPFCPF: TStringField;
    QVALIDACPFCEP: TWideStringField;
    QVALIDACPFENDERECO: TWideStringField;
    QVALIDACPFEMAIL: TWideStringField;
    QVALIDACPFCELULAR: TWideStringField;
    QVALIDACPFSENHA: TWideStringField;
    QATUALIZASENHA: TFDQuery;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNGRAVARClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMTROCARSENHA: TFRMTROCARSENHA;

implementation

{$R *.dfm}

uses CLIENTE, DM, LOGIN, PEDIDO, PRINCIPAL, PRODUTO, RELATORIO;

procedure TFRMTROCARSENHA.BTNGRAVARClick(Sender: TObject);
var
ok : boolean;
begin
  ok := true;
  if ((edtCPF.Text = '') OR (EDTEMAIL.Text = '') OR (edtSenha.Text = ''))  then
  BEGIN
    ShowMessage('CAMPOS OBRIGATÓRIOS NÃO PREENCHIDOS');
    ok := false;
    Exit;
  END;

  QVALIDACPF.Close;
  QVALIDACPF.ParamByName('CPF').AsString   := EDTCPF.Text;
  QVALIDACPF.ParamByName('EMAIL').AsString := EDTEMAIL.Text;
  QVALIDACPF.Open;
  if (QVALIDACPF.IsEmpty) then
  BEGIN
    ShowMessage('CLIENTE NÃO CADASTRADO');
    ok := false;
    Exit;
  END;

  if ok then
    begin
    QATUALIZASENHA.ParamByName('CPF').AsString   := edtCPF.Text;
    QATUALIZASENHA.ParamByName('EMAIL').AsString := EDTEMAIL.Text;
    QATUALIZASENHA.ParamByName('SENHA').AsString := edtSenha.Text;
    QATUALIZASENHA.ExecSQL;
    ShowMessage('SENHA ALTERADA!');
    Close;
  end;

end;

procedure TFRMTROCARSENHA.BTNCANCELARClick(Sender: TObject);
begin
CLOSE;
end;

end.
