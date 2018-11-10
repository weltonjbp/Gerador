unit DelphiReverse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, Buttons, StdCtrls, DB, SqlExpr, ExtCtrls,
  ComCtrls, FMTBcd, MidasLib, DBClient, Menus, DBCtrls, DBXMsSQL, DBXInterbase,
  DBXOracle, DBXFirebird, DBXMySql, FileCtrl, JvExStdCtrls, JvListBox,
  JvDriveCtrls, JvCombobox, Mask, JvExMask, JvToolEdit, JvComponentBase,
  JvEnterTab, IniFiles,CheckLst,JvExControls, IWSystem, acTitleBar,
  sSkinProvider, sSkinManager;

type
  TFGera = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    editHost: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    editSenha: TEdit;
    editUsuario: TEdit;
    StatusBar1: TStatusBar;
    Entidade: TSQLDataSet;
    comboConexao: TComboBox;
    DataSetEntidade: TClientDataSet;
    DataSetEntidadecampo: TStringField;
    DataSetEntidadeimplamentacao: TStringField;
    DataSource1: TDataSource;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    FindDialog1: TFindDialog;
    editDiretorioVO: TJvDirectoryEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    EditAutor: TLabeledEdit;
    EditEmailAutor: TLabeledEdit;
    botaoConectar: TBitBtn;
    Label2: TLabel;
    Label8: TLabel;
    editDiretorioControllerCliente: TJvDirectoryEdit;
    editDiretorioControllerServidor: TJvDirectoryEdit;
    Panel5: TPanel;
    ListaTabelasList: TCheckListBox;
    ListaCamposList: TListBox;
    EditBusca2: TLabeledEdit;
    Panel6: TPanel;
    memo: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    botaoGerar: TButton;
    botaoSair: TButton;
    botaoLimparMemo: TButton;
    BotaoGerarTodos: TButton;
    cbxOpcao: TComboBox;
    BotaoGerarConjunto: TButton;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel7: TPanel;
    EditBusca: TLabeledEdit;
    listaTabelas: TListBox;
    listaCampo: TListBox;
    INTERBASE: TSQLConnection;
    Oracle: TSQLConnection;
    SQL: TSQLConnection;
    CONN: TSQLConnection;
    MySQL: TSQLConnection;
    Splitter3: TSplitter;
    ChecPesistente: TCheckBox;
    editBancoDados: TJvFilenameEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure botaoConectarClick(Sender: TObject);
    procedure listaTabelasClick(Sender: TObject);
    procedure botaoGerarClick(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure botaoLimparMemoClick(Sender: TObject);
    procedure BotaoGerarTodosClick(Sender: TObject);
    procedure cbxOpcaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BotaoGerarConjuntoClick(Sender: TObject);
    procedure EditBuscaChange(Sender: TObject);
    procedure ListaTabelasListClick(Sender: TObject);
    procedure EditBusca2Change(Sender: TObject);
    procedure ListaCamposListClick(Sender: TObject);


  private
    ListaCampos: TStringList;
    ListaPropriedades: TStringList;
    ListaSets: TStringList;
    ListaProcedureSet: TStringList;
    ListaTransiente:TStringList;
    ListaTransienteVOAsosiation:TStringList;
    MyLalueTransienteVOAsosiation:TStringList;
    ListaTransienteVOPropet:TStringList;
    ListaTransienteVOJoson:TStringList;
    ListaTransientePropriVO:TStringList;
 //   ListaTransienteNnVO:TStringList;
    ListaTransienteCampos: TStringList;
   // ListaUser:TStringList;
    MyLalueTransienteVOdestructor:TStringList;
    MyLalueTransienteVOconstructor:TStringList;
    VOsTransisente : String; //Adciona no Uses
    TabelaTransienteVo:TStringList;
    ListaClasseLista:TStringList;
    MyLalueTransienteVOPropriedades:TStringList;
    Persistilist: TStringList;
    PersistilistDeclarar: TStringList;
    ListProcedimento:TStringList;
    ListProcedimentos:TStringList;
    function TrataNomeTabela: String;
    function NomeTabelaMaiusculo: String;
    function TrataNomeProperty(NomeCampo: String): String;
    function TrataNomeDisplay(NomeCampo: String): String;
    function TrataNomeTabelaTransiente(TabelaTransiente:String): String;

    function GetUserFromWindows: String;

    procedure AdicionaLicenca;
    procedure GetPropriedades;
    procedure CriarClasseVO;
    procedure ConfigurePropertyListVO(Classe, Campo, Tamanho, Tipo, GetSet: String);

    procedure Conectar(Driver: String; Conn: TSQLConnection; Server, Database, User, Pass: String);
    procedure GravaIni;
   
   { Private declarations }
  public
    { Public declarations }
  end;

var
  FGera: TFGera;
  NomeClasse: String;
  TabelaVO, NomeTabela: String;
  Diretorio : TJvDirectoryEdit;
  PopulaTransiente:integer; 
  Transiente,digitado,Nn:string;
  TabelaTransiente,TabelaTransienteVOs,ListObj,TemTransient,ListaUser: String;
implementation



{$R *.dfm}

procedure TFGera.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(gsAppPath+'DelphiReverse.ini');
  try
    with Ini do
    begin
      WriteString('Autor','Autor',EditAutor.Text);
      WriteString('Autor','Email',EditEmailAutor.Text);
      WriteString('Banco','Banco',EditBancoDados.Text);
      WriteString('VO', 'VO',EditDiretorioVO.Text);
      WriteString('ControllerCliente','ControllerCliente',EditDiretorioControllerCliente.Text);
      WriteString('ControllerServidor','ControllerServidor',EditDiretorioControllerServidor.Text);
    end;
  finally
    Ini.Free;
  end;
end;

procedure TFGera.FormCreate(Sender: TObject);
begin
  cbxOpcaoChange(self);
  BotaoGerar.Enabled := False;
  BotaoGerarTodos.Enabled := False;
  BotaoGerarConjunto.Enabled := False;
   TemTransient:='N';

end;

procedure TFGera.FormShow(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(gsAppPath+'DelphiReverse.ini');
  try
    with Ini do
    begin
      if not SectionExists('Autor') then
      begin
        WriteString('Autor','Autor',GetUserFromWindows);
        WriteString('Autor','Email','weltonjbp@gmail.com');
        WriteString('Banco','Banco','caminho do banco');
        WriteString('VO', 'VO','Caminho do VO');
        WriteString('Usuario', 'Usuario','SYSDBA');
        WriteString('Senha', 'Senha','masterkey');

      end;

      EditAutor.Text := ReadString('Autor','Autor','');
      EditEmailAutor.Text := ReadString('Autor','Email','');
      EditBancoDados.Text := ReadString('Banco','Banco','');
      EditDiretorioVO.Text := ReadString('VO','VO','');
      editUsuario.Text:=          ReadString('Usuario', 'Usuario','');
      editSenha.Text:=            ReadString('Senha', 'Senha','');
    end;
  finally
    Ini.Free;
  end;
end;

procedure TFGera.Conectar(Driver: String; Conn: TSQLConnection; Server, Database, User, Pass: String);
begin
  Conn.Connected := false;
  if (Driver = 'MSSQL') then
  begin
    Conn.Params.Values['HostName'] := Server;
    Conn.Params.Values['DataBase'] := Database;
  end
  else if (Driver = 'INTERBASE') then
    Conn.Params.Values['DataBase'] := Server + ':' + Database
  else if (Driver = 'FIREBIRD') then
    Conn.Params.Values['DataBase'] := Server + ':' + Database
  else if (Driver = 'Oracle') then
    Conn.Params.Values['DataBase'] := Database
  else if (Driver = 'MySQL') then
  begin
    Conn.Params.Values['HostName'] := Server;
    Conn.Params.Values['DataBase'] := Database;
  end;
  Conn.Params.Values['User_Name'] := User;
  Conn.Params.Values['Password'] := Pass;
  Conn.Connected := True;
  Entidade.SQLConnection := CONN;
end;

procedure TFGera.botaoConectarClick(Sender: TObject);
var
  List: TStringList;
begin
  GravaIni;
  if comboConexao.text = 'MSSQL' then
    Conectar(comboConexao.text,SQL, editHost.text,EditBancoDados.Text,editUsuario.text, editSenha.text)
  else if comboConexao.text = 'FIREBIRD' then
    Conectar(comboConexao.text, INTERBASE, edithost.text,EditBancoDados.Text,editUsuario.text, editSenha.text)
  else if comboConexao.text = 'INTERBASE' then
    Conectar(comboConexao.text, INTERBASE, edithost.text,EditBancoDados.Text,editUsuario.text, editSenha.text)
  else if comboConexao.text = 'Oracle' then
     Conectar(comboConexao.text, Oracle , edithost.text,EditBancoDados.Text,editUsuario.text, editSenha.text)
  else if comboConexao.text = 'MySQL' then
     Conectar(comboConexao.text, MySQL , edithost.text,EditBancoDados.Text,editUsuario.text, editSenha.text);

  List := TStringList.Create;
  Entidade.SQLConnection.GetTableNames(List, false);
  if listaTabelas.itemindex > -1 then
     if listaTabelas.Items.Strings[listaTabelas.itemindex] <> '' then
      Entidade.SQLConnection.GetFieldNames(listaTabelas.Items.Strings[listaTabelas.itemindex],listaCampo.Items);

  listaTabelas.Items.Assign(List);
  if List.Count>0 then
    BotaoGerarTodos.Enabled := True;

  EditBusca.SetFocus;
   ListaTabelasList.Items.Assign(List);
  List.Free;
end;

procedure TFGera.listaTabelasClick(Sender: TObject);
begin
  ListaClasseLista := TStringList.Create;
 // ListaTransienteNnVO:= TStringList.Create;
  MyLalueTransienteVOconstructor:= TStringList.Create;
  MyLalueTransienteVOdestructor:= TStringList.Create;
  MyLalueTransienteVOAsosiation:= TStringList.Create;
  MyLalueTransienteVOPropriedades:= TStringList.Create;
  Persistilist := TStringList.Create;
  PersistilistDeclarar := TStringList.Create;
  ListProcedimento:=TStringList.Create;
  ListProcedimentos:=TStringList.Create;
  Entidade.SQLConnection.GetFieldNames(listaTabelas.Items.Strings[listaTabelas.itemindex],listaCampo.Items);
  if ListaCampo.Count > 0 then
  BotaoGerar.Enabled := True;
  BotaoGerarConjunto.Enabled := BotaoGerar.Enabled;
  VOsTransisente:='';
  ListaUser:='';

end;

procedure TFGera.ListaTabelasListClick(Sender: TObject);
begin
Entidade.SQLConnection.GetFieldNames(listaTabelasList.Items.Strings[listaTabelasList.itemindex],listaCamposList.Items);
end;

procedure TFGera.botaoGerarClick(Sender: TObject);
begin
  memo.Clear;
  if listaTabelas.itemindex > -1 then
  begin
     try
       Entidade.Active := false;
       Entidade.CommandText:= 'Select * From '+ listaTabelas.Items.Strings[listaTabelas.itemindex] +' where 0=1';
       Entidade.Active := true;

       NomeTabela := TrataNomeTabela;
       TabelaVO   := NomeTabela + 'VO';
       NomeClasse := NomeTabela + 'Controller';
       case (cbxOpcao.ItemIndex) of
          0:
          begin
            NomeClasse := TabelaVO;
            GetPropriedades;
            CriarClasseVO;
            Diretorio := EditDiretorioVO;
          end;

     
       end;
       memo.Lines.SaveToFile(Diretorio.Directory + '\' + NomeClasse+'.pas');
     finally
       if cbxOpcao.ItemIndex  = 0then
       begin
         ListaPropriedades.free;
         ListaCampos.free;
         ListaSets.free;
         ListaProcedureSet.free;
         ListaTransiente.Free;
         ListaTransienteVOAsosiation.Free;
         MyLalueTransienteVOAsosiation.Free;
         ListaTransienteVOPropet.Free;
         ListaTransientePropriVO.Free;
         ListaTransienteVOJoson.Free;
         ListaTransienteCampos.Free;
         ListProcedimento.Free;
         ListProcedimentos.Free;
         MyLalueTransienteVOconstructor.Free;
         MyLalueTransienteVOdestructor.Free;
         ListaUser:=emptystr;
         TabelaTransienteVo.Free;
         Persistilist.Free;
         PersistilistDeclarar.Free;
         ListaClasseLista.Free;
         MyLalueTransienteVOPropriedades.Free;
         TemTransient:='N';
         VOsTransisente:=emptystr;
       end;
     end;
  end;

end;

procedure TFGera.botaoLimparMemoClick(Sender: TObject);
begin
  memo.Clear;
end;

procedure TFGera.botaoSairClick(Sender: TObject);
begin
  Close;
end;


procedure TFGera.cbxOpcaoChange(Sender: TObject);
begin
   case (cbxOpcao.ItemIndex) of
     0:  botaoGerar.Caption :=  'Gerar VO';
     1:  botaoGerar.Caption :=  'Controller (Cliente)';
   else
     botaoGerar.Caption :=  'Controller (Servidor)';
   end
end;

procedure TFGera.BotaoGerarConjuntoClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 3  do
  begin
    case I of
     1 :
      begin
         Diretorio := EditDiretorioVO;
         cbxOpcao.ItemIndex := 0;
      end;

     2 :
      begin
        Diretorio := EditDiretorioControllerCliente;
        cbxOpcao.ItemIndex := 1;
      end;

     3 :
      begin
        Diretorio := EditDiretorioControllerServidor;
        cbxOpcao.ItemIndex := 2;
      end;
    end;
    botaoGerar.Click;
    Application.ProcessMessages;
  end;
  Memo.Clear;
  memo.Lines.Add('');
  memo.Lines.Add('VO Gerado no Diretório :');
  memo.Lines.Add(' '+EditDiretorioVO.Text);
  memo.Lines.Add('*************************************************');
  memo.Lines.Add('ControllerCliente Gerado no Diretório :');
  memo.Lines.Add(' '+ EditDiretorioControllerCliente.Text);
  memo.Lines.Add('*************************************************');
  memo.Lines.Add('ControllerServidor Gerado no Diretório :');
  memo.Lines.Add(' '+EditDiretorioControllerServidor.Text);
end;

procedure TFGera.BotaoGerarTodosClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to listaTabelas.Count - 1 do
  begin
    listaTabelas.ItemIndex := I;
    BotaoGerarTodos.Caption := listaTabelas.Items.Strings[listaTabelas.itemindex];
    botaoGerar.Click;
    Application.ProcessMessages;
  end;
  BotaoGerarTodos.Caption := 'Gerar Todos';
end;


procedure TFGera.GetPropriedades;
var
 confirmou: boolean;
  I,j,F: Integer;
  GetSet, Campo, Classe,trans,trans1n,transvo,transaso, Tamanho,Converter: String;
begin
  ListaCampos := TStringList.Create;
  ListaPropriedades := TStringList.Create;
  ListaSets := TStringList.Create;
  ListaProcedureSet := TStringList.Create;
  //////////transiente
  ListaTransiente:=TStringList.Create;
  ListaTransienteVOAsosiation:= TStringList.Create;
  ListaTransienteVOPropet:= TStringList.Create;
  ListaTransienteVOJoson := TStringList.Create;
  ListaTransientePropriVO:= TStringList.Create;
  ListaTransienteCampos:= TStringList.Create;
  ListProcedimento:=tstringlist.Create;
  ListProcedimentos:=tstringlist.Create;

  PopulaTransiente:=0;
  /////////////////////
  Nn:='S';
   for I := 0 to Entidade.FieldList.Count - 1 do
  begin
    GetSet := ' read F' + Entidade.FieldList.Fields[I].FieldName + ' write Set' + Entidade.FieldList.Fields[I].FieldName + ';';
    Campo := Entidade.FieldList.Fields[I].FieldName;

    // Calcular tamanho do campo (tam.campo * 8)
    Tamanho := IntToStr((Entidade.FieldList.Fields[I].DisplayWidth * 8));

    // o tamanho passar de 450 então vamos deixar 450px
    if (StrToInt(Tamanho) > 450) then
      Tamanho := '450';

    // se o campo for do tipo memo fixamos em 450px
    if Entidade.FieldByName(Campo).DataType in [ftMemo] then
      Tamanho := '450';

    Classe := 'T' + listaTabelas.Items.Strings[listaTabelas.itemindex];

    if Entidade.FieldByName(Campo).DataType in [ftString, ftMemo] then
    begin
      if cbxOpcao.ItemIndex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'String', GetSet)
      else
       // ConfigurePropertyListController(Classe, Campo, 'String', GetSet);
    end
    else if Entidade.FieldByName(Campo).DataType = ftBoolean then
    begin
      if cbxOpcao.ItemIndex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'Boolean', GetSet)
      else
        //ConfigurePropertyListController(Classe, Campo, 'Boolean', GetSet);
    end
    else if Entidade.FieldByName(Campo).DataType in [ftSmallint, ftInteger, ftWord] then
    begin
      if cbxOpcao.ItemIndex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'Integer', GetSet)
      else
        //ConfigurePropertyListController(Classe, Campo, 'Integer', GetSet);
    end
    else if Entidade.FieldByName(Campo).DataType in [ftFloat, ftCurrency, ftBCD] then
    begin
      if cbxOpcao.ItemIndex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'Extended', GetSet)
      else
        //ConfigurePropertyListController(Classe, Campo, 'Extended', GetSet);
    end
    else if Entidade.FieldByName(Campo).DataType in [ftTime] then
    begin
      if cbxOpcao.itemindex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'String', GetSet)
      else
        //ConfigurePropertyListController(Classe, Campo, 'String', GetSet);
    end
    else if Entidade.FieldByName(Campo).DataType in [ftDate, ftDateTime, ftTimeStamp] then
    begin
      if cbxOpcao.ItemIndex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'TDateTime', GetSet)
      else
        //ConfigurePropertyListController(Classe, Campo, 'TDateTime', GetSet);
    end
    else if Entidade.FieldByName(Campo).DataType in [ftExtended, ftBCD, ftFMTBcd] then
    begin
      if cbxOpcao.ItemIndex = 0 then
        ConfigurePropertyListVO(Classe, Campo, Tamanho, 'Extended', GetSet)
      else
        //ConfigurePropertyListController(Classe, Campo, 'Extended', GetSet);
    end;
  end;
end;

function TFGera.GetUserFromWindows: String;
var
  Buffer: PWideChar;
  Size: dword;
begin
  Size := 256;
  Buffer := '';

  if GetUserName(Buffer, Size) then
    Result := Buffer
  else
    Result := 'Desconhecido';
end;

procedure TFGera.GravaIni;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(gsAppPath+'DelphiReverse.ini');
  try
    with Ini do
    begin
     //   WriteString('Autor','Autor',GetUserFromWindows);
        WriteString('Autor','Email','weltonjbp@gmail.com');
        WriteString('Banco','Banco','caminho do banco');
        WriteString('VO', 'VO','Caminho do VO');
        WriteString('Usuario', 'Usuario','SYSDBA');
        WriteString('Senha', 'Senha','masterkey');

     end;
  finally
    Ini.Free;
  end;
end;

procedure TFGera.ListaCamposListClick(Sender: TObject);
begin
//     GetPropriedadesListasTransiente;
end;

procedure TFGera.ConfigurePropertyListVO(Classe, Campo, Tamanho, Tipo, GetSet : String);
begin
    if Tipo = 'String' then
    begin
      if (Campo = 'FONE') or (Campo = 'TELEFONE') or (Campo = 'FAX') or (Campo = 'CELULAR') then
        ListaPropriedades.add('    [TFormatter(ftTelefone, taLeftJustify)]')
      else if (Campo = 'CEP') then
        ListaPropriedades.add('    [TFormatter(ftCep, taLeftJustify)]')
      else if (Campo = 'CNPJ') then
        ListaPropriedades.add('    [TFormatter(ftCnpj, taLeftJustify)]')
      else if (Campo = 'CPF') then
        ListaPropriedades.add('    [TFormatter(ftCpf, taLeftJustify)]');
    end
    else if Tipo = 'Integer' then
      ListaPropriedades.add('    [TFormatter(ftZerosAEsquerda, taCenter)]')
    else if Tipo = 'Currency' then
      ListaPropriedades.add('    [TFormatter(ftFloatComSeparador, taRightJustify)]')
    else if Tipo = 'Extended' then
      ListaPropriedades.add('    [TFormatter(ftFloatComSeparador, taRightJustify)]')
    else if Tipo = 'Double' then
      ListaPropriedades.add('    [TFormatter(ftFloatComSeparador, taRightJustify)]');
//  end;
  ListaPropriedades.add('    property ' + TrataNomeProperty(Campo) + ': ' + Tipo + ' ' + GetSet);
  ListaCampos.add('    F' + Campo + ': ' + Tipo + ';');
  ListProcedimento.Add('    procedure Set'+ Campo +'(const Value:'+ Tipo +');' );
  ListProcedimentos.Add('procedure T'+NomeTabela+'.Set'+ Campo +'(const Value:'+ Tipo +');' );
  ListProcedimentos.Add(' begin');
  ListProcedimentos.Add('  F' + Campo + ' := Value;');
  ListProcedimentos.Add(' end;');
  ListProcedimentos.Add('');
end;

procedure TFGera.CriarClasseVO;
begin
//  AdicionaLicenca;

  NomeTabela := TrataNomeTabela;// + 'VO';

  memo.Lines.Add('unit ' + NomeTabela + 'VO;');
  memo.Lines.Add('');

  memo.Lines.Add('interface');
  memo.Lines.Add('');

  memo.Lines.Add('uses');
  memo.Lines.Add(' Classes,Constantes,Generics.Collections, SysUtils'+VOsTransisente+ListaUser+', SimpleAttributes;');
  memo.Lines.Add('');

  memo.Lines.Add('type');
  memo.Lines.Add(' T' + NomeTabela + ' = class');
  memo.Lines.Add('  private');
  memo.Lines.Add(ListaCampos.Text);
  memo.Lines.Add(ListProcedimento.text);
  memo.Lines.Add('  public ');
  memo.Lines.Add('    constructor Create; ');
  memo.Lines.Add('    destructor Destroy; override;');
  memo.Lines.Add('');
  memo.Lines.Add('  published');
  memo.Lines.Add('    [PK, AutoInc]');
  memo.Lines.Add(ListaPropriedades.Text);
  memo.Lines.Add('end;');
  memo.Lines.Add('implementation');
  memo.Lines.Add('');
  memo.Lines.Add('{ TMinhaClasse }');
  memo.Lines.Add('');
  memo.Lines.Add('constructor T'+NomeTabela+'.Create;');
  memo.Lines.Add(' begin');
  memo.Lines.Add('');
  memo.Lines.Add(' end;');
  memo.Lines.Add('');
  memo.Lines.Add('destructor T'+NomeTabela+'.Destroy;');
  memo.Lines.Add(' begin');
  memo.Lines.Add('  inherited;');
  memo.Lines.Add(' end;');
  memo.Lines.Add('');
  memo.Lines.Add(ListProcedimentos.text);
  memo.Lines.Add('end.');
end;

procedure TFGera.EditBusca2Change(Sender: TObject);
begin
ListaTabelasList.Perform(LB_SELECTSTRING,0,LongInt(PChar(EditBusca2.Text)));
end;

procedure TFGera.EditBuscaChange(Sender: TObject);
begin
  ListaTabelas.Perform(LB_SELECTSTRING,0,LongInt(PChar(EditBusca.Text)));
end;



function TFGera.TrataNomeTabela: String;
var
  NomeTabela: String;
  I: Integer;
begin
  NomeTabela := listaTabelas.Items.Strings[listaTabelas.itemindex];
  NomeTabela := UpperCase(Copy(NomeTabela, 1, 1)) + LowerCase(Copy(NomeTabela, 2, length(NomeTabela) - 1));

//  for I := 1 to length(NomeTabela) do
//  begin
//    if Copy(NomeTabela, I, 1) = '_' then
//    begin
//      Delete(NomeTabela, I, 1);
//      NomeTabela := Copy(NomeTabela, 1, I - 1) + UpperCase(Copy(NomeTabela, I, 1)) + LowerCase(Copy(NomeTabela, I + 1, length(NomeTabela) - 1));
//    end;
//  end;

  Result := NomeTabela;
end;

function TFGera.TrataNomeTabelaTransiente(TabelaTransiente: String): String;
var
  NomeTabela: String;
  I: Integer;
begin
  NomeTabela := TabelaTransiente;
  NomeTabela := UpperCase(Copy(NomeTabela, 1, 1)) + LowerCase(Copy(NomeTabela, 2, length(NomeTabela) - 1));

  for I := 1 to length(NomeTabela) do
  begin
    if Copy(NomeTabela, I, 1) = '_' then
    begin
      Delete(NomeTabela, I, 1);
      NomeTabela := Copy(NomeTabela, 1, I - 1) + UpperCase(Copy(NomeTabela, I, 1)) + LowerCase(Copy(NomeTabela, I + 1, length(NomeTabela) - 1));
    end;
  end;

  Result := NomeTabela;

end;

function TFGera.NomeTabelaMaiusculo: String;
var
  NomeTabela: String;
begin
  NomeTabela := UpperCase(listaTabelas.Items.Strings[listaTabelas.itemindex]);
  Result := NomeTabela;
end;

function TFGera.TrataNomeProperty(NomeCampo: String): String;
var
  I: Integer;
begin
  NomeCampo := UpperCase(Copy(NomeCampo, 1, 1)) + LowerCase
    (Copy(NomeCampo, 2, length(NomeCampo) - 1));

//  for I := 1 to length(NomeCampo) do
//  begin
//    if copy(NomeCampo,I,1) = '_' then
//    begin
//      Delete(NomeCampo,I,1);
//      NomeCampo := Copy(NomeCampo,1,I-1) + UpperCase(Copy(NomeCampo,I,1)) + LowerCase(Copy(NomeCampo,I+1,length(NomeCampo)-1));
//    end;
//  end;

  Result := NomeCampo;
end;

function TFGera.TrataNomeDisplay(NomeCampo: String): String;
var
  I: Integer;
begin
  NomeCampo := UpperCase(Copy(NomeCampo,1,1)) + LowerCase(Copy(NomeCampo,2,length(NomeCampo)-1));
  for I := 1 to length(NomeCampo) do
  begin
    if copy(NomeCampo,I,1) = '_' then
    begin
      Delete(NomeCampo,I,1);
      Insert(' ',NomeCampo,I);
      NomeCampo := Copy(NomeCampo,1,I) + UpperCase(Copy(NomeCampo,I+1,1)) + (Copy(NomeCampo,I+2,length(NomeCampo)-1));
    end;
  end;
  result := NomeCampo;
end;

procedure TFGera.AdicionaLicenca;
var
  loOpcao: String;
begin
  case (cbxOpcao.ItemIndex) of
    0:  loOpcao:=  ' VO ';
    1:  loOpcao := 'Controller do lado Cliente';
    2:  loOpcao := 'Controller do lado Servidor';
  end;

  memo.Lines.add
    ('{*******************************************************************************');
  memo.Lines.add
    ('Title: Gmap ERP                                                                 ');
  memo.Lines.add('Description: ' + loOpcao + ' relacionado à tabela [' +
    NomeTabelaMaiusculo + '] ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add
    ('The MIT License                                                                 ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add
    ('Copyright: Copyright (C) 2017 infoprata.COM.br                                          ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add
    ('Permission is hereby granted, free of charge, to any person                     ');
  memo.Lines.add
    ('obtaining a copy of this software and associated documentation                  ');
  memo.Lines.add
    ('files (the "Software"), to deal in the Software without                         ');
  memo.Lines.add
    ('restriction, including without limitation the rights to use,                    ');
  memo.Lines.add
    ('copy, modify, merge, publish, distribute, sublicense, and/or sell               ');
  memo.Lines.add
    ('copies of the Software, and to permit persons to whom the                       ');
  memo.Lines.add
    ('Software is furnished to do so, subject to the following                        ');
  memo.Lines.add
    ('conditions:                                                                     ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add
    ('The above copyright notice and this permission notice shall be                  ');
  memo.Lines.add
    ('included in all copies or substantial portions of the Software.                 ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add
    ('THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 ');
  memo.Lines.add
    ('EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 ');
  memo.Lines.add
    ('OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        ');
  memo.Lines.add
    ('NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     ');
  memo.Lines.add
    ('HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    ');
  memo.Lines.add
    ('WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    ');
  memo.Lines.add
    ('FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   ');
  memo.Lines.add
    ('OTHER DEALINGS IN THE SOFTWARE.                                                 ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add
    ('       The author may be contacted at:                                          ');
  memo.Lines.add
    ('           infopratagmap@gmail.com                                                   ');
  memo.Lines.add
    ('                                                                                ');
  memo.Lines.add('@author ' + EditAutor.Text + ' (' + EditEmailAutor.Text +
    ')                    ');
  memo.Lines.add
    ('@version 1.0                                                                    ');
  memo.Lines.add
    ('*******************************************************************************}');
end;

end.
