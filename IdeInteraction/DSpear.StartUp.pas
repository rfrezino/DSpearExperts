unit DSpear.StartUp;

interface

uses
  Spring,

  DSpear.Ide.Main,
  DSpear.ImageGalery,
  DSpear.Settings,

  Ide.Main.Interf,
  Ide.Shortcuts,
  Ide.Shortcuts.Interf,

  ImageGalery.Interf,

  RegisterTool.Viewer,
  RegisterTool.Viewer.Interf,

  RegisterToolItem.Viewer,
  RegisterToolItem.Viewer.Interf,

  Spring.Container;

  procedure Register;

implementation

var
  IdeMain: IIdeMain;
  DSpearContainer: TContainer;

procedure StartInteractionWithIde;
begin
  IdeMain := DSpearContainer.Resolve<IIdeMain>;
  IdeMain.CreateMainMenu;
end;

procedure RegisterInitialShortcuts;
begin

end;

procedure RegisterClasses;
begin
  DSpearContainer := TContainer.Create;
  DSpearContainer.RegisterType<TDSpearImageGalery>.Implements<IImageGalery>;
  DSpearContainer.RegisterType<TSettings>.Implements<ISettings>;
  DSpearContainer.RegisterType<TIdeShortcuts>.Implements<IIdeShortCuts>;
  DSpearContainer.RegisterType<TDSpearIdeMain>.Implements<IIdeMain>;
  DSpearContainer.RegisterType<TfraRegisterToolItem>.Implements<IRegisterToolItemViewer>;
  DSpearContainer.RegisterType<TfrmRegisterTool>.Implements<IRegisterToolViewer>;
  DSpearContainer.Build;
end;

procedure Register;
begin
  RegisterClasses;
  StartInteractionWithIde;
  RegisterInitialShortcuts;
end;

initialization

finalization
  IdeMain := nil;

end.

