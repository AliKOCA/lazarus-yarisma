program yarisma;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, zcomponent, w_yarisma_ana, w_yarisma_dm1
  { you can add units after this };

{$R *.res}

begin

  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDM1, DM1);
  DM1.ZConnection1.Database :='./db/yarisma.sqlite3';
  {$IFDEF UNIX}
  DM1.ZConnection1.LibraryLocation:='';
  {$ENDIF}
  {$IFDEF WINDOWS}
  DM1.ZConnection1.LibraryLocation:='./db/x64/sqlite3.dll';
  {$ENDIF}

  Application.CreateForm(TF_yarisma_ana, F_yarisma_ana);
  Application.Run;
end.

