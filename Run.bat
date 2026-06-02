@echo off
powershell.exe -Command "Start-Process -FilePath 'powershell.exe' -ArgumentList '-ExecutionPolicy Bypass -WindowStyle Hidden -File \"%~dp0Miruvor.ps1\"' -WindowStyle Hidden"
exit
