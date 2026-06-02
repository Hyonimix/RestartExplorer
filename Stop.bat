@echo off
powershell.exe -Command "Get-CimInstance Win32_Process -Filter \"Name = 'powershell.exe' OR Name = 'pwsh.exe'\" | Where-Object { $_.CommandLine -match 'Miruvor\.ps1' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }"
echo Stopped Miruvor process.
pause
