program Gerador;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  DelphiReverse in 'DelphiReverse.pas' {FGera},
  Atributos in 'Atributos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Gerador de VOs';
  Application.CreateForm(TFGera, FGera);
  Application.Run;
end.
