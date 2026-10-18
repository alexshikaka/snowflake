; Установщик «Котик на рабочем столе» (Inno Setup 6)
; Ставится в папку пользователя - права администратора не нужны.

#ifndef AppVersion
  #define AppVersion "1.0.0"
#endif

[Setup]
AppId={{C6F1357C-2465-411A-BB38-B1165D7D5725}
AppName=Котик на рабочем столе
AppVersion={#AppVersion}
AppVerName=Котик на рабочем столе {#AppVersion}
AppPublisher=shikaka068091
VersionInfoVersion={#AppVersion}
VersionInfoProductName=Котик на рабочем столе
VersionInfoDescription=Установщик программы «Котик на рабочем столе»
DefaultDirName={localappdata}\Programs\CatPet
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=Output
OutputBaseFilename=CatPet-Setup-{#AppVersion}
SetupIconFile=..\app\cat.ico
UninstallDisplayIcon={app}\CatPet.exe
UninstallDisplayName=Котик на рабочем столе
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
; программа держит этот мьютекс, пока запущена: установщик попросит её закрыть
AppMutex=CatPet_single_instance
CloseApplications=yes

[Languages]
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "autostart"; Description: "Запускать котика вместе с Windows"; GroupDescription: "Дополнительно:"
Name: "desktopicon"; Description: "Ярлык на рабочем столе"; GroupDescription: "Дополнительно:"

[Dirs]
Name: "{app}\autostart"

[Files]
Source: "..\dist\CatPet\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\Котик"; Filename: "{app}\CatPet.exe"
Name: "{autodesktop}\Котик"; Filename: "{app}\CatPet.exe"; Tasks: desktopicon
; образец ярлыка: пункт «Запускать вместе с Windows» в трее копирует его в «Автозагрузку»
Name: "{app}\autostart\CatPet"; Filename: "{app}\CatPet.exe"
Name: "{userstartup}\CatPet"; Filename: "{app}\CatPet.exe"; Tasks: autostart

[Run]
Filename: "{app}\CatPet.exe"; Description: "Запустить котика"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{userstartup}\CatPet.lnk"
Type: filesandordirs; Name: "{app}\autostart"
