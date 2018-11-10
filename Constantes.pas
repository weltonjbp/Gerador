unit Constantes;

interface

const
  // Formatter
  ftCnpj = '##.###.###/####-##;0;_';
  ftCpf = '###.###.###-##;0;_';
  ftCep = '##.###-####;0;_';
  ftTelefone = '(##)####-####;0;_';
  ftInteiroComSeparador = '###,###,###';
  ftInteiroSemSeparador = '#########';
  ftFloatComSeparador = '###,###,##0.00';
  ftFloatSemSeparador = '0.00';
  ftZerosAEsquerda = '000000';
  ftZeroInvisivel = '#';
  ftHora = '##,##,##' ;

type

  TConstantes = class
  const
    QUANTIDADE_POR_PAGINA = 50;

    {$WRITEABLECONST ON}
    DECIMAIS_QUANTIDADE: Integer = 2;
    DECIMAIS_VALOR: Integer = 2;
     EMPRESA_BALCAO:Integer = 1;
    {$WRITEABLECONST OFF}

    TagBotao: array [Boolean] of Integer = (0, 1);
    TagPopupMenu: array [Boolean] of Integer = (0, 1);



  end;

implementation

end.
