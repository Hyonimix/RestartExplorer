@echo off
set "targetPath=%~dp0Run.bat"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Miruvor.lnk"

powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutPath%'); $Shortcut.TargetPath = '%targetPath%'; $Shortcut.WorkingDirectory = '%~dp0'; $Shortcut.Save()"

echo Registered to startup successfully.
pause
