unit CLIENTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRMCLIENTE = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCPF: TMaskEdit;
    edtSenha: TEdit;
    Label3: TLabel;
    EDTEMAIL: TEdit;
    Label4: TLabel;
    EDTCELULAR: TEdit;
    Label5: TLabel;
    EDTNOME: TEdit;
    Label6: TLabel;
    EDTCEP: TEdit;
    Label7: TLabel;
    EDTENDERECO: TEdit;
    Label9: TLabel;
    EDTSENHA2: TEdit;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    QINSERECLIENTE: TFDQuery;
    QVALIDACPF: TFDQuery;
    QVALIDACPFCODIGO: TFDAutoIncField;
    QVALIDACPFNOME: TStringField;
    QVALIDACPFCPF: TStringField;
    QVALIDACPFCEP: TWideStringField;
    QVALIDACPFENDERECO: TWideStringField;
    QVALIDACPFEMAIL: TWideStringField;
    QVALIDACPFCELULAR: TWideStringField;
    QVALIDACPFSENHA: TWideStringField;
    procedure edtCPFExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCLIENTE: TFRMCLIENTE;

implementation

{$R *.dfm}

uses LOGIN, PEDIDO, PRINCIPAL, PRODUTO, DM, RELATORIO, TROCARSENHA;

procedure TFRMCLIENTE.edtCPFExit(Sender: TObject);

  begin
    if (edtCPF.Text = '   .   .   -  ') then
    begin
      ShowMessage('CPF n�o infomado');
      edtCPF.SetFocus;
    end;

  end;

procedure TFRMCLIENTE.SpeedButton1Click(Sender: TObject);
var
ok : boolean;
begin
  ok := true;
  if ((EDTNOME.Text = '') OR (edtCPF.Text = '') OR (EDTCEP.Text = '') OR (EDTENDERECO.Text = '') OR (EDTEMAIL.Text = '') OR (EDTCELULAR.Text = '') OR (edtSenha.Text = '') OR (EDTSENHA2.Text = ''))  then
  BEGIN
    ShowMessage('CAMPOS OBRIGAT�RIOS N�O PREENCHIDOS');
    ok := false;
    Exit;
  END;

  QVALIDACPF.Close;
  QVALIDACPF.ParamByName('CPF').AsString := EDTCPF.Text;
  QVALIDACPF.Open;
  if NOT (QVALIDACPF.IsEmpty) then
    BEGIN
      ShowMessage('CLIENTE J� CADASTRADO');
      ok := false;
      Exit;
    END;

    if ok then
      begin
      QINSERECLIENTE.ParamByName('NOME').AsString := EDTNOME.Text;
      QINSERECLIENTE.ParamByName('CPF').AsString := EDTCPF.Text;
      QINSERECLIENTE.ParamByName('CEP').AsString := EDTCEP.Text;
      QINSERECLIENTE.ParamByName('ENDERECO').AsString := EDTENDERECO.Text;
      QINSERECLIENTE.ParamByName('EMAIL').AsString := EDTEMAIL.Text;
      QINSERECLIENTE.ParamByName('CELULAR').AsString := EDTCELULAR.Text;
      QINSERECLIENTE.ParamByName('SENHA').AsString := edtSenha.Text;
      QINSERECLIENTE.ParamByName('TIPO').AsString := 'C';
      QINSERECLIENTE.ExecSQL;

    end;
end;

procedure TFRMCLIENTE.SpeedButton3Click(Sender: TObject);
begin
CLOSE;
end;

end.
