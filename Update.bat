@echo off
set "targetPath=%~dp0Run.bat"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Miruvor.lnk"

echo Updating Miruvor startup registration...

if exist "%shortcutPath%" del "%shortcutPath%"
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutPath%'); $Shortcut.TargetPath = '%targetPath%'; $Shortcut.WorkingDirectory = '%~dp0'; $Shortcut.Save()"

if exist "%shortcutPath%" (
    echo [OK] Update complete.
) else (
    echo [FAIL] Update failed. Please run as Administrator.
)

pause