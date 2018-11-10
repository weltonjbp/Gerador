object FGera: TFGera
  Left = 217
  Top = 89
  BorderStyle = bsSingle
  Caption = 'Gerador de VOs e Controllers'
  ClientHeight = 626
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 172
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1024
      172)
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 997
      Height = 104
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Conex'#227'o:'
      TabOrder = 0
      DesignSize = (
        997
        104)
      object Label1: TLabel
        Left = 223
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Host:'
      end
      object Label3: TLabel
        Left = 423
        Top = 23
        Width = 40
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object Label4: TLabel
        Left = 606
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label5: TLabel
        Left = 11
        Top = 24
        Width = 30
        Height = 13
        Caption = 'SGBD:'
      end
      object Label2: TLabel
        Left = 11
        Top = 110
        Width = 131
        Height = 13
        Caption = 'Caminho Controller Cliente:'
        Visible = False
      end
      object Label8: TLabel
        Left = 11
        Top = 138
        Width = 138
        Height = 13
        Caption = 'Caminho Controller Servidor:'
        Visible = False
      end
      object lbl1: TLabel
        Left = 11
        Top = 49
        Width = 81
        Height = 13
        Caption = 'Banco de Dados:'
      end
      object lbl2: TLabel
        Left = 11
        Top = 76
        Width = 62
        Height = 13
        Caption = 'Caminho VO:'
      end
      object editHost: TEdit
        Left = 253
        Top = 20
        Width = 164
        Height = 21
        TabOrder = 1
        Text = 'localhost'
      end
      object editSenha: TEdit
        Left = 643
        Top = 20
        Width = 151
        Height = 21
        PasswordChar = '*'
        TabOrder = 3
        Text = 'root'
      end
      object editUsuario: TEdit
        Left = 469
        Top = 20
        Width = 131
        Height = 21
        TabOrder = 2
        Text = 'root'
      end
      object comboConexao: TComboBox
        Left = 44
        Top = 20
        Width = 173
        Height = 21
        ItemIndex = 2
        TabOrder = 0
        Text = 'FIREBIRD'
        Items.Strings = (
          'MySQL'
          'MSSQL'
          'FIREBIRD'
          'INTERBASE'
          'Oracle')
      end
      object editDiretorioVO: TJvDirectoryEdit
        Left = 98
        Top = 71
        Width = 824
        Height = 21
        DialogKind = dkWin32
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Text = ''
      end
      object editDiretorioControllerCliente: TJvDirectoryEdit
        Left = 156
        Top = 109
        Width = 826
        Height = 21
        DialogKind = dkWin32
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Text = ''
        Visible = False
      end
      object editDiretorioControllerServidor: TJvDirectoryEdit
        Left = 155
        Top = 136
        Width = 827
        Height = 21
        DialogKind = dkWin32
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        Text = ''
        Visible = False
      end
      object editBancoDados: TJvFilenameEdit
        Left = 96
        Top = 46
        Width = 825
        Height = 21
        AddQuotes = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        Text = 't2tierp'
      end
    end
    object EditAutor: TLabeledEdit
      Left = 17
      Top = 127
      Width = 390
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Autor:'
      TabOrder = 1
    end
    object EditEmailAutor: TLabeledEdit
      Left = 413
      Top = 127
      Width = 489
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Email:'
      TabOrder = 2
    end
    object botaoConectar: TBitBtn
      Left = 905
      Top = 123
      Width = 83
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Conectar'
      TabOrder = 3
      OnClick = botaoConectarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 607
    Width = 1024
    Height = 19
    Panels = <>
  end
  object Panel5: TPanel
    Left = 800
    Top = 172
    Width = 224
    Height = 435
    Align = alRight
    TabOrder = 2
    Visible = False
    object Splitter3: TSplitter
      Left = 1
      Top = 303
      Width = 222
      Height = 11
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 259
    end
    object ListaTabelasList: TCheckListBox
      Left = 1
      Top = 87
      Width = 222
      Height = 216
      Align = alBottom
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListaTabelasListClick
    end
    object ListaCamposList: TListBox
      Left = 1
      Top = 314
      Width = 222
      Height = 120
      Hint = 'Right Click Mouse'
      Align = alBottom
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ListaCamposListClick
    end
    object EditBusca2: TLabeledEdit
      Left = 4
      Top = 16
      Width = 206
      Height = 21
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = 'Localizar:'
      TabOrder = 2
      OnChange = EditBusca2Change
    end
  end
  object Panel6: TPanel
    Left = 369
    Top = 172
    Width = 431
    Height = 435
    Align = alClient
    TabOrder = 3
    object memo: TMemo
      Left = 1
      Top = 1
      Width = 429
      Height = 433
      Hint = 'copy content'
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 172
    Width = 369
    Height = 435
    Align = alLeft
    TabOrder = 4
    object Panel3: TPanel
      Left = 218
      Top = 1
      Width = 144
      Height = 433
      Align = alLeft
      TabOrder = 0
      DesignSize = (
        144
        433)
      object botaoGerar: TButton
        Left = 3
        Top = 55
        Width = 131
        Height = 23
        Caption = ' Controller (Cliente)'
        TabOrder = 0
        OnClick = botaoGerarClick
      end
      object botaoSair: TButton
        Left = 9
        Top = 480
        Width = 100
        Height = 23
        Caption = 'Sair'
        TabOrder = 1
        OnClick = botaoSairClick
      end
      object botaoLimparMemo: TButton
        Left = 9
        Top = 472
        Width = 100
        Height = 23
        Caption = 'Limpar Memo'
        TabOrder = 2
        OnClick = botaoLimparMemoClick
      end
      object BotaoGerarTodos: TButton
        Left = 3
        Top = 403
        Width = 131
        Height = 23
        Anchors = [akLeft, akBottom]
        Caption = 'Gerar Todos'
        TabOrder = 3
        Visible = False
        OnClick = BotaoGerarTodosClick
      end
      object cbxOpcao: TComboBox
        Left = 4
        Top = 8
        Width = 131
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'Gerar VOs'
        OnChange = cbxOpcaoChange
        Items.Strings = (
          'Gerar VOs'
          'Controller (Cliente)'
          'Controller (Servidor)')
      end
      object BotaoGerarConjunto: TButton
        Left = 3
        Top = 92
        Width = 131
        Height = 25
        Caption = 'Gerar Conjunto'
        TabOrder = 5
        Visible = False
        OnClick = BotaoGerarConjuntoClick
      end
      object ChecPesistente: TCheckBox
        Left = 6
        Top = 136
        Width = 131
        Height = 17
        Caption = 'Criar Campo "Persiste"'
        TabOrder = 6
        Visible = False
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 217
      Height = 433
      Align = alLeft
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 1
        Top = 169
        Width = 159
        Height = 3
        Align = alNone
      end
      object Splitter2: TSplitter
        Left = 1
        Top = 431
        Width = 215
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 172
        ExplicitWidth = 156
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 215
        Height = 41
        Align = alTop
        TabOrder = 0
        object EditBusca: TLabeledEdit
          Left = 4
          Top = 16
          Width = 206
          Height = 21
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'Localizar:'
          TabOrder = 0
          OnChange = EditBuscaChange
        end
      end
      object listaTabelas: TListBox
        Left = 1
        Top = 42
        Width = 215
        Height = 389
        Align = alTop
        ItemHeight = 13
        TabOrder = 1
        OnClick = listaTabelasClick
      end
      object listaCampo: TListBox
        Left = 1
        Top = 434
        Width = 215
        Height = 0
        Hint = 'Right Click Mouse'
        Align = alClient
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Visible = False
      end
    end
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 448
    Top = 240
  end
  object Entidade: TSQLDataSet
    SchemaName = 'dbo'
    CommandText = 'select * from "Sistema"'
    MaxBlobSize = -1
    Params = <>
    Left = 752
    Top = 248
  end
  object DataSetEntidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 752
    Top = 216
    object DataSetEntidadecampo: TStringField
      FieldName = 'campo'
      Size = 50
    end
    object DataSetEntidadeimplamentacao: TStringField
      FieldName = 'implamentacao'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = DataSetEntidade
    Left = 752
    Top = 360
  end
  object OpenDialog1: TOpenDialog
    Left = 752
    Top = 416
  end
  object FindDialog1: TFindDialog
    Left = 752
    Top = 496
  end
  object INTERBASE: TSQLConnection
    ConnectionName = 'IBCONNECTION'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver140.' +
        'bpl'
      'VendorLib=fbclient.DLL')
    Left = 320
    Top = 248
  end
  object Oracle: TSQLConnection
    ConnectionName = 'IBCONNECTION'
    DriverName = 'Oracle'
    LoginPrompt = False
    Params.Strings = (
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver140.' +
        'bpl')
    Left = 322
    Top = 408
  end
  object SQL: TSQLConnection
    ConnectionName = 'MSSQLCONNECTION'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'schemaoverride=sa.dbo'
      'drivername=MSSQL'
      'HostName=note-dell\sqlexpress'
      'Database=AXIAL_DB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'os authentication=False'
      'prepare sql=False'
      'connecttimeout=60'
      'mars_connection=False'
      'ErrorResourceFile=')
    Left = 320
    Top = 302
  end
  object CONN: TSQLConnection
    ConnectionName = 'MSSQLCONNECTION'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'schemaoverride=sa.dbo'
      'drivername=MSSQL'
      'HostName=note-dell\sqlexpress'
      'Database=AXIAL_DB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'os authentication=False'
      'prepare sql=False'
      'connecttimeout=60'
      'mars_connection=False'
      'ErrorResourceFile=')
    Left = 320
    Top = 356
  end
  object MySQL: TSQLConnection
    ConnectionName = 'IBCONNECTION'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver140.' +
        'bpl'
      'VendorLib=LIBMYSQL.dll')
    Left = 320
    Top = 464
  end
end
