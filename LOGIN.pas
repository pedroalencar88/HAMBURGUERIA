unit LOGIN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRMLOGIN = class(TForm)
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    btnAcessar: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    btnNovoUser: TSpeedButton;
    btnResetSenha: TSpeedButton;
    edtCPF: TMaskEdit;
    QVALIDACPF: TFDQuery;
    QUSUARIO: TFDQuery;
    QVALIDACPFCODIGO: TFDAutoIncField;
    QVALIDACPFNOME: TStringField;
    QVALIDACPFCPF: TStringField;
    QVALIDACPFCEP: TWideStringField;
    QVALIDACPFENDERECO: TWideStringField;
    QVALIDACPFEMAIL: TWideStringField;
    QVALIDACPFCELULAR: TWideStringField;
    QVALIDACPFSENHA: TWideStringField;
    QUSUARIOCODIGO: TFDAutoIncField;
    QUSUARIONOME: TStringField;
    QUSUARIOCPF: TStringField;
    QUSUARIOCEP: TWideStringField;
    QUSUARIOENDERECO: TWideStringField;
    QUSUARIOEMAIL: TWideStringField;
    QUSUARIOCELULAR: TWideStringField;
    QUSUARIOSENHA: TWideStringField;
    procedure btnAcessarClick(Sender: TObject);
    procedure lblPrimeiroAcessoClick(Sender: TObject);
    procedure lblEsqueceuSenhaClick(Sender: TObject);
    procedure lblEsqueceuSenhaLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure edtCPFExit(Sender: TObject);
    procedure btnResetSenhaClick(Sender: TObject);
    procedure btnNovoUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMLOGIN: TFRMLOGIN;

implementation

{$R *.dfm}

uses CLIENTE, PEDIDO, PRINCIPAL, PRODUTO, DM, RELATORIO, TROCARSENHA;

procedure TFRMLOGIN.btnAcessarClick(Sender: TObject);
begin
    if (edtCPF.Text = '   .   .   -  ') then
    begin
      ShowMessage('CPF n�o infomado');
    end;

  QVALIDACPF.Close;
  QVALIDACPF.ParamByName('CPF').AsString := EDTCPF.Text;
  QVALIDACPF.Open;
  if QVALIDACPF.IsEmpty then
  BEGIN
    ShowMessage('CPF/CLIENTE N�O CADASTRADO');
  END
  ELSE
  BEGIN
    QUSUARIO.Close;
    QUSUARIO.ParamByName('CPF').AsString := edtCPF.Text;
    QUSUARIO.ParamByName('SENHA').AsString := edtSenha.Text;
    QUSUARIO.Open;
    if QUSUARIO.IsEmpty then
    begin
      ShowMessage('SENHA INV�LIDA');
    end
    else
    begin
      dm.UsuarioLogado := QUSUARIOCODIGO.AsInteger;
      FRMLOGIN.Hide;
      FRMPRINICIPAL.ShowModal;
    end;
  END;

end;



PROCEDure TFRMLOGIN.edtCPFExit(Sender: TObject);
begin
    if (edtCPF.Text = '   .   .   -  ') then
    begin
      ShowMessage('CPF n�o infomado');
      edtCPF.SetFocus;
    end;

end;

procedure TFRMLOGIN.btnNovoUserClick(Sender: TObject);
begin
  FRMCLIENTE := TFRMCLIENTE.create ( application );
  FRMCLIENTE.ShowModal;
end;

procedure TFRMLOGIN.btnResetSenhaClick(Sender: TObject);
begin
  FRMTROCARSENHA := TFRMTROCARSENHA.create ( application );
  FRMTROCARSENHA.ShowModal;
end;

procedure TFRMLOGIN.lblEsqueceuSenhaClick(Sender: TObject);
begin
    if (edtCPF.Text = '   .   .   -  ') then
    begin
      ShowMessage('CPF n�o infomado');
    end;
end;

procedure TFRMLOGIN.lblEsqueceuSenhaLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
    if (edtCPF.Text = '   .   .   -  ') then
    begin
      ShowMessage('CPF n�o infomado');
    end;
end;

procedure TFRMLOGIN.lblPrimeiroAcessoClick(Sender: TObject);
begin
    if (edtCPF.Text = '   .   .   -  ') then
    begin
      ShowMessage('CPF n�o infomado');
    end;

end;

end.
