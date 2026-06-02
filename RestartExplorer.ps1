$currentPid = $PID
$scriptPath = $MyInvocation.MyCommand.Path

if ($scriptPath) {
    $processes = Get-CimInstance Win32_Process -Filter "Name = 'powershell.exe' OR Name = 'pwsh.exe'"
    foreach ($proc in $processes) {
        if ($proc.ProcessId -ne $currentPid -and $proc.CommandLine -match [regex]::Escape($scriptPath)) {
            Stop-Process -Id $proc.ProcessId -Force -ErrorAction SilentlyContinue
        }
    }
}

$CsharpCode = @"
using System;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

public class Win32 {
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);

    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int GetClassName(IntPtr hWnd, StringBuilder lpClassName, int nMaxCount);

    [DllImport("user32.dll", CharSet = CharSet.Ansi)]
    public static extern int EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

    [DllImport("user32.dll", CharSet = CharSet.Ansi)]
    public static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags);

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    public struct DEVMODE {
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmDeviceName;
        public short dmSpecVersion;
        public short dmDriverVersion;
        public short dmSize;
        public short dmDriverExtra;
        public int dmFields;
        public int dmPositionX;
        public int dmPositionY;
        public int dmDisplayOrientation;
        public int dmDisplayFixedOutput;
        public short dmColor;
        public short dmDuplex;
        public short dmYResolution;
        public short dmTTOption;
        public short dmCollate;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmFormName;
        public short dmLogPixels;
        public int dmBitsPerPel;
        public int dmPelsWidth;
        public int dmPelsHeight;
        public int dmDisplayFlags;
        public int dmDisplayFrequency;
    }

    public static void ForceDisplayRefresh() {
        DEVMODE original = new DEVMODE();
        original.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));

        if (EnumDisplaySettings(null, -1, ref original) != 0) {
            DEVMODE temp = new DEVMODE();
            temp.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));
            DEVMODE safeMode = original;
            bool foundSafe = false;
            int i = 0;
            
            while (EnumDisplaySettings(null, i, ref temp) != 0) {
                if (temp.dmBitsPerPel == original.dmBitsPerPel && 
                    temp.dmPelsWidth == original.dmPelsWidth && 
                    temp.dmPelsHeight == original.dmPelsHeight &&
                    temp.dmDisplayFrequency != original.dmDisplayFrequency &&
                    temp.dmDisplayFrequency >= 30) {
                    safeMode = temp;
                    foundSafe = true;
                    break;
                }
                i++;
            }

            if (!foundSafe) {
                i = 0;
                while (EnumDisplaySettings(null, i, ref temp) != 0) {
                    if (temp.dmBitsPerPel == original.dmBitsPerPel && 
                        temp.dmPelsWidth >= 800 && 
                        temp.dmPelsWidth < original.dmPelsWidth) {
                        safeMode = temp;
                        foundSafe = true;
                        break;
                    }
                    i++;
                }
            }

            if (!foundSafe) {
                safeMode.dmPelsWidth = 1024;
                safeMode.dmPelsHeight = 768;
            }

            ChangeDisplaySettings(ref safeMode, 0);
            Thread.Sleep(500);
            ChangeDisplaySettings(ref original, 0);
        }
    }
}
"@

Add-Type -TypeDefinition $CsharpCode

$VK_F5 = 0x74
$VK_SHIFT = 0x10

while ($true) {
    Start-Sleep -Milliseconds 50

    $keyStateF5 = [Win32]::GetAsyncKeyState($VK_F5)
    if (($keyStateF5 -band 0x8000) -eq 0x8000) {
        
        $hwnd = [Win32]::GetForegroundWindow()
        $className = New-Object System.Text.StringBuilder 256
        [Win32]::GetClassName($hwnd, $className, 256) | Out-Null
        
        $currentWindow = $className.ToString()

        if ($currentWindow -eq "Progman" -or $currentWindow -eq "WorkerW" -or $currentWindow -eq "SysListView32") {
            
            $shell = New-Object -ComObject Shell.Application
            $shell.MinimizeAll()
            Start-Sleep -Milliseconds 200

            $keyStateShift = [Win32]::GetAsyncKeyState($VK_SHIFT)
            $isShiftPressed = (($keyStateShift -band 0x8000) -eq 0x8000)

            if ($isShiftPressed) {
                $openFolders = @()
                
                foreach ($window in $shell.Windows()) {
                    try {
                        if ($window.FullName -match "explorer\.exe$") {
                            $path = $window.Document.Folder.Self.Path
                            if ($path) {
                                $openFolders += $path
                            }
                        }
                    } catch {}
                }

                Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                
                Start-Sleep -Seconds 1
                if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
                    Start-Process explorer.exe
                }

                Start-Sleep -Seconds 2

                foreach ($folder in $openFolders) {
                    Start-Process explorer.exe -ArgumentList "`"$folder`""
                }
                
                Start-Sleep -Seconds 1
                $shell2 = New-Object -ComObject Shell.Application
                $shell2.UndoMinimizeALL()
                
            } else {
                [Win32]::ForceDisplayRefresh()
                Start-Sleep -Seconds 1
                $shell.UndoMinimizeALL()
            }
        }
    }
}
