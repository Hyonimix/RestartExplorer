@echo off
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Miruvor.lnk"

echo Removing Miruvor...

powershell.exe -Command "Get-CimInstance Win32_Process -Filter \"Name = 'powershell.exe' OR Name = 'pwsh.exe'\" | Where-Object { $_.CommandLine -match 'Miruvor\.ps1' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }"
if exist "%shortcutPath%" del "%shortcutPath%"

echo [OK] Clean-up complete. Safe to delete the folder.

pause