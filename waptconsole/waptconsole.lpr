program waptconsole;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Translations, LCLProc,

  Interfaces, // this includes the LCL widgetset
  Forms, pl_indy, uwaptconsole, uVisCreateKey,
  dmwaptpython, uVisEditPackage, uviscreatewaptsetup,
  uvislogin, uvisprivatekeyauth, uvisloading, uviswaptconfig,
  uvischangepassword, uviswaptdeploy, uvishostsupgrade, uVisAPropos,
  uVisImportPackage, uwaptconsoleres,waptcommon, uVisWUAGroup,
uVisWAPTWUAProducts, uviswuarules;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TDMPython, DMPython);
  DMPython.WaptConfigFileName := AppIniFilename;
  Application.CreateForm(TVisWaptGUI, VisWaptGUI);

  if not VisWaptGUI.Login then
     Halt;
  Application.Run;
end.

