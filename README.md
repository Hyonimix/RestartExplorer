> The contents of this document have been translated by AI.

### Select Language
* [English](#-english)
* [日本語 (Japanese)](#-日本語-japanese)
* [한국어 (Korean)](#-한국어-korean)
* [简体中文 (Simplified Chinese)](#-简体中文-simplified-chinese)
* [繁體中文 (Traditional Chinese)](#-繁體中文-traditional-chinese)
* [Português (Portuguese)](#-português-portuguese)

---

## 🇺🇸 English

# Miruvor

A lightweight automation utility set that allows you to safely restart Windows Explorer (`explorer.exe`) or refresh your display state using desktop shortcuts.

Unlike simple shortcut refreshes in Windows, it provides a **dynamic resolution toggle** to fix screen distortion or monitor signal errors, along with a **smart explorer restart** that remembers and restores your previously opened folder paths.

### Features

1. **F5 (On Desktop)**: **Dynamic Display Refresh**
   - Pressing `F5` on an empty desktop space temporarily switches Windows to its lowest supported safe resolution for 0.5 seconds before smoothly restoring your original resolution.
   - Safely forces a display refresh without third-party tools to fix monitor flickering, refresh rate glitches, temporary graphics driver hangs, or post-game screen tearing.
2. **Shift + F5 (On Desktop)**: **Smart Explorer Restart**
   - Backs up the paths of all currently open File Explorer windows.
   - Force-closes the Windows Explorer process (`explorer.exe`) and safely restarts it.
   - Automatically re-opens your folders to their exact previous paths once the restart is complete.
3. **Invisible Background Execution**
   - Runs silently in the Windows background without exposing CMD or PowerShell windows via a launcher.
4. **Smart Instance Control (Anti-Duplication)**
   - Automatically detects and safely kills any older instances of `Miruvor.ps1` running in the background before launching a new one.

### Files

- **`Miruvor.ps1`**: The main script containing the core logic (Win32 API calls for key input and display control).
- **`Run.bat`**: The launcher that runs the script completely hidden in the background.
- **`Startup.bat`**: Registers a shortcut in the Windows Startup folder so the program runs automatically upon booting.
- **`Update.bat`**: Updates the startup shortcut with the latest path if you move the project folder or update the script.
- **`Remove.bat`**: Completely removes the program. Kills background processes and deletes the startup shortcut.
- **`Stop.bat`**: Temporarily terminates the currently running background process without deleting anything.

### Usage

1. **First Manual Run & Test**: Execute `Run.bat`. Click an empty space on your desktop, then test `F5` and `Shift + F5`.
2. **Auto-start Registration**: Run `Startup.bat` to enable it automatically on your next Windows boot.
3. **Update or Move**: Run `Update.bat` if you modified the code or moved the project folder to a new location.
4. **Clean Removal**: Run `Remove.bat` to kill processes and remove startup entries. You can then delete the project folder safely.

### License
This project is licensed under the **GNU General Public License v3.0 (GPLv3)**. See the `LICENSE` file for details.

---

## 🇯🇵 日本語 (Japanese)

# Miruvor

デスクトップのショートカットを使用して、Windowsのディスプレイ状態をリフレッシュしたり、エクスプローラー（`explorer.exe`）を安全に再起動したりできる軽量の自動化ユーティリティセットです。

単なる画面更新にとどまらず、画面の乱れやモニター信号のエラーを解決するための**動的解像度トグル機能**と、開いていたフォルダのパスを記憶して復元する**スマートエクスプローラー再起動機能**を提供します。

### 主な機能

1. **F5 (デスクトップ上)**: **ディスプレイの動的リフレッシュ**
   - デスクトップの何もない場所をクリックして `F5` を押すと、Windowsがサポートする最も低い安全な解像度に一瞬（0.5秒）切り替わり、元の解像度にきれいに復元されます。
   - モニターのちらつき、リフレッシュレートの不具合、グラフィックドライバーの一時的なハングアップなどを、サードパーティ製ソフトなしで安全に強制リフレッシュします。
2. **Shift + F5 (デスクトップ上)**: **スマートエクスプローラー再起動**
   - 現在開いているすべてのエクスプローラーウィンドウのパスをバックアップします。
   - エクスプローラープロセス（`explorer.exe`）を強制終了し、安全に再起動します。
   - 再起動が完了すると、開いていたフォルダウィンドウを元のパスのまま自動的に復元します。
3. **バックグラウンドのサイレント実行**
   - ランチャーを介して、CMDやPowerShellウィンドウを表示させず、Windowsのバックグラウンドで静かに待機・動作します。
4. **スマート重複実行防止**
   - スクリプト実行時に、バックグラウンドですでに実行中の古い `Miruvor.ps1` を自動的に検出し、安全に終了させてから新しいプロセスに置き換えます。

### ファイル構成

- **`Miruvor.ps1`**: コアロジック（キー入力とディスプレイ制御用のWin32 API呼び出し）が含まれるメインスクリプト。
- **`Run.bat`**: スクリプトを完全に非表示でバックグラウンド実行するためのランチャー。
- **`Startup.bat`**: Windows起動時にプログラムが自動実行されるよう、スタートアップフォルダにショートカットを登録します。
- **`Update.bat`**: プロジェクトフォルダを移動したり、スクリプトを更新したりした場合に、スタートアップの登録パスを最新状態に更新します。
- **`Remove.bat`**: プログラムを完全に削除する場合に使用します。プロセスを終了し、スタートアップ登録を解除します。
- **`Stop.bat`**: 登録は削除せず、現在バックグラウンドで待機中のプロセスのみを一時的に終了させます。

### 使用方法

1. **初回手動実行とテスト**: `Run.bat` を実行します。デスクトップの空きスペースをクリックし、`F5` および `Shift + F5` の動作を確認します。
2. **自動実行の設定**: `Startup.bat` を実行すると、次回のWindows起動時から自動的に有効になります。
3. **更新またはパス変更時**: コードを変更したりフォルダを移動したりした場合は、`Update.bat` を実行してください。
4. **完全な削除**: `Remove.bat` を実行してプロセスとスタートアップ登録を解除した後、プロジェクトフォルダを削除してください。

### ライセンス
このプロジェクトは **GNU General Public License v3.0 (GPLv3)** の下でライセンスされています。詳細は `LICENSE` ファイルを参照してください。

---

## 🇰🇷 한국어 (Korean)

# Miruvor

바탕화면에서 단축키를 이용해 Windows 디스플레이 상태를 리프레시하거나 탐색기(`explorer.exe`)를 안전하게 재시작할 수 있는 경량 자동화 유틸리티 세트입니다.

기존 윈도우의 단순 단축키 리프레시와 달리, 화면 왜곡이나 모니터 신호 오류를 해결하기 위한 **동적 해상도 토글 기능**과 열려 있던 폴더의 경로를 기억해 되살려주는 **스마트 탐색기 재시작 기능**을 함께 제공합니다.

### 주요 기능

1. **F5 (바탕화면 단독 입력)**: **디스플레이 해상도 동적 리프레시**
   - 바탕화면 빈 곳을 클릭하고 `F5`를 누르면, Windows가 공식적으로 지원하는 가장 낮고 안전한 해상도로 순간 전환(0.5초)되었다가 다시 기존 원본 해상도로 깔끔하게 원복됩니다.
   - 모니터 깜빡임, 주사율 인지 오류, 그래픽 드라이버 일시적 꼬임, 게임 직후 화면 깨짐 현상 등을 서드파티 프로그램 없이 안전하게 강제 리프레시합니다.
2. **Shift + F5 (바탕화면 입력)**: **스마트 Windows 탐색기 재시작**
   - 현재 윈도우에 열려 있는 모든 탐색기 폴더 창의 경로를 유실 없이 백업합니다.
   - 윈도우 탐색기 프로세스(`explorer.exe`)를 강제 종료한 뒤 안전하게 재실행합니다.
   - 탐색기 재시작이 완료되면 기존에 열려 있던 폴더 창들을 원래 경로 그대로 자동 복구해 줍니다.
3. **백그라운드 무인 실행**
   - 런처를 통해 명령 프롬프트(CMD)나 파워쉘 창이 노출되지 않고, 윈도우 백그라운드 프로세스 내부에서 조용히 대기하며 작동합니다.
4. **스마트 중복 실행 방지**
   - 스크립트가 실행될 때, 백그라운드에 이미 실행 중인 이전 버전의 `Miruvor.ps1` 프로세스가 있다면 자동으로 감지하여 안전하게 종료(Kill)하고 새 프로세스로 교체합니다.

### 파일 구성

- **`Miruvor.ps1`**: 핵심 로직이 들어 있는 메인 PowerShell 스크립트입니다.
- **`Run.bat`**: 스크립트를 완전히 숨겨진 상태로 상시 실행해 주는 스타터입니다.
- **`Startup.bat`**: 윈도우 시작 시 자동 실행되도록 시작 프로그램 폴더에 바로가기를 등록합니다.
- **`Update.bat`**: 폴더 경로 변경이나 버전 업데이트 시, 시작 프로그램 바로가기 정보를 최신 상태로 덮어씌웁니다.
- **`Remove.bat`**: 완전 제거 툴. 백그라운드 프로세스 강제 종료 및 시작 프로그램 바로가기 삭제를 일괄 처리합니다.
- **`Stop.bat`**: 삭제는 하지 않고, 현재 백그라운드에서 상시 대기 중인 프로세스만 일시 종료합니다.

### 사용 방법

1. **최초 수동 실행**: `Run.bat`를 실행한 후 바탕화면 빈 곳을 클릭하고 `F5`와 `Shift + F5`를 테스트합니다.
2. **자동 실행 등록**: `Startup.bat`를 실행하면 다음 부팅 시부터 자동 활성화됩니다.
3. **업데이트/경로 이동**: 내용 수정 및 폴더 이동 시 `Update.bat`를 실행합니다.
4. **프로그램 제거**: `Remove.bat`를 실행하여 정리를 마친 뒤 프로젝트 폴더를 통째로 삭제하시면 됩니다.

### 라이선스
이 프로젝트는 **GNU General Public License v3.0 (GPLv3)** 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하십시오.

---

## 🇨🇳 简体中文 (Simplified Chinese)

# Miruvor

一个轻量级自动化实用程序集，允许您使用桌面快捷键安全地重启 Windows 资源管理器 (`explorer.exe`) 或刷新显示状态。

与 Windows 中的简单快捷键刷新不同，它提供了**动态分辨率切换**以修复屏幕扭曲或显示器信号错误，以及**智能资源管理器重启**功能，可记住并恢复之前打开的文件夹路径。

### 功能特点

1. **F5 (在桌面上)**：**动态显示刷新**
   - 点击桌面空白处并按下 `F5`，Windows 会在 0.5 秒内瞬间切换到支持的最低安全分辨率，然后再平滑地恢复到原始分辨率。
   - 在无需第三方工具的情况下安全地强制刷新显示，修复显示器闪烁、刷新率故障、显卡驱动程序暂时卡顿或游戏后画面撕裂的问题。
2. **Shift + F5 (在桌面上)**：**智能资源管理器重启**
   - 备份当前打开的所有文件资源管理器窗口的路径。
   - 强制关闭 Windows 资源管理器进程 (`explorer.exe`) 并安全重启。
   - 重启完成后，自动将您的文件夹恢复到确切的原始路径。
3. **后台静默运行**
   - 通过启动器在 Windows 后台静默运行，不会暴露出 CMD 或 PowerShell 窗口。
4. **智能实例控制 (防多开)**
   - 启动新实例之前，自动检测并安全地终止在后台运行的任何旧版 `Miruvor.ps1` 实例。

### 文件说明

- **`Miruvor.ps1`**：包含核心逻辑（用于按键输入和显示控制的 Win32 API 调用）的主脚本。
- **`Run.bat`**：在后台完全隐藏运行脚本的启动器。
- **`Startup.bat`**：在 Windows 启动文件夹中注册快捷方式，以便程序在开机时自动运行。
- **`Update.bat`**：如果您移动了项目文件夹或更新了脚本，请使用此文件将最新的路径更新至启动快捷方式。
- **`Remove.bat`**：彻底删除程序的清理工具。终止后台进程并删除启动快捷方式。
- **`Stop.bat`**：暂时终止当前运行的后台进程，但不删除任何文件。

### 使用方法

1. **首次手动运行与测试**：执行 `Run.bat`。点击桌面空白处，然后测试 `F5` 和 `Shift + F5`。
2. **自动启动注册**：运行 `Startup.bat`，即可在下次启动 Windows 时自动启用。
3. **更新或移动**：如果您修改了代码或将项目文件夹移动到了新位置，请运行 `Update.bat`。
4. **彻底卸载**：运行 `Remove.bat` 清除进程和启动项后，您可以安全地删除整个项目文件夹。

### 许可证
本项目采用 **GNU General Public License v3.0 (GPLv3)** 许可证。详情请参阅 `LICENSE` 文件。

---

## 🇹🇼 繁體中文 (Traditional Chinese)

# Miruvor

一個輕量級自動化實用程式集，允許您使用桌面快捷鍵安全地重啟 Windows 檔案總管 (`explorer.exe`) 或刷新顯示狀態。

與 Windows 中的簡單快捷鍵刷新不同，它提供了**動態解析度切換**以修復螢幕扭曲或顯示器訊號錯誤，以及**智能檔案總管重啟**功能，可記住並恢復先前打開的資料夾路徑。

### 功能特色

1. **F5 (在桌面上)**：**動態顯示刷新**
   - 點擊桌面空白處並按下 `F5`，Windows 會在 0.5 秒內瞬間切換到支援的最低安全解析度，然後再平滑地恢復到原始解析度。
   - 在無需第三方工具的情況下安全地強制刷新顯示，修復顯示器閃爍、更新率故障、顯示卡驅動程式暫時卡頓或遊戲後畫面撕裂的問題。
2. **Shift + F5 (在桌面上)**：**智能檔案總管重啟**
   - 備份當前打開的所有檔案總管視窗的路徑。
   - 強制關閉 Windows 檔案總管處理程序 (`explorer.exe`) 並安全重啟。
   - 重啟完成後，自動將您的資料夾恢復到確切的原始路徑。
3. **背景靜默執行**
   - 透過啟動器在 Windows 背景靜默執行，不會暴露出 CMD 或 PowerShell 視窗。
4. **智能實例控制 (防多開)**
   - 啟動新實例之前，自動檢測並安全地終止在背景執行的任何舊版 `Miruvor.ps1` 實例。

### 檔案說明

- **`Miruvor.ps1`**：包含核心邏輯（用於按鍵輸入和顯示控制的 Win32 API 呼叫）的主指令碼。
- **`Run.bat`**：在背景完全隱藏執行指令碼的啟動器。
- **`Startup.bat`**：在 Windows 啟動資料夾中註冊捷徑，以便程式在開機時自動執行。
- **`Update.bat`**：如果您移動了專案資料夾或更新了指令碼，請使用此檔案將最新的路徑更新至啟動捷徑。
- **`Remove.bat`**：徹底刪除程式的清理工具。終止背景處理程序並刪除啟動捷徑。
- **`Stop.bat`**：暫時終止當前執行的背景處理程序，但不刪除任何檔案。

### 使用方法

1. **首次手動執行與測試**：執行 `Run.bat`。點擊桌面空白處，然後測試 `F5` 和 `Shift + F5`。
2. **自動啟動註冊**：執行 `Startup.bat`，即可在下次啟動 Windows 時自動啟用。
3. **更新或移動**：如果您修改了程式碼或將專案資料夾移動到了新位置，請執行 `Update.bat`。
4. **徹底解除安裝**：執行 `Remove.bat` 清除處理程序和啟動項後，您可以安全地刪除整個專案資料夾。

### 授權條款
本專案採用 **GNU General Public License v3.0 (GPLv3)** 授權條款。詳情請參閱 `LICENSE` 檔案。

---

## 🇧🇷 Português (Portuguese)

# Miruvor

Um conjunto de utilitários de automação leve que permite reiniciar com segurança o Windows Explorer (`explorer.exe`) ou atualizar o estado de exibição usando atalhos na área de trabalho.

Diferente de uma simples atualização de atalho no Windows, ele fornece uma **alternância de resolução dinâmica** para corrigir distorções de tela ou erros de sinal do monitor, além de uma **reinicialização inteligente do explorer** que lembra e restaura os caminhos das pastas abertas anteriormente.

### Recursos

1. **F5 (Na área de trabalho)**: **Atualização Dinâmica de Exibição**
   - Pressionar `F5` em um espaço vazio da área de trabalho muda o Windows temporariamente para a resolução segura mais baixa suportada por 0,5 segundos antes de restaurar suavemente a resolução original.
   - Força com segurança a atualização da tela sem ferramentas de terceiros para corrigir cintilação do monitor, falhas na taxa de atualização, travamentos temporários do driver gráfico ou distorções de tela após jogos.
2. **Shift + F5 (Na área de trabalho)**: **Reinicialização Inteligente do Explorer**
   - Faz backup dos caminhos de todas as janelas do Explorador de Arquivos atualmente abertas.
   - Força o encerramento do processo do Windows Explorer (`explorer.exe`) e o reinicia com segurança.
   - Reabre automaticamente as pastas em seus caminhos exatos assim que a reinicialização é concluída.
3. **Execução Invisível em Segundo Plano**
   - É executado silenciosamente no segundo plano do Windows sem expor as janelas do CMD ou do PowerShell por meio de um inicializador.
4. **Controle Inteligente de Instâncias (Prevenção de Duplicatas)**
   - Detecta automaticamente e encerra com segurança quaisquer instâncias antigas do `Miruvor.ps1` em execução no segundo plano antes de iniciar uma nova.

### Arquivos

- **`Miruvor.ps1`**: O script principal que contém a lógica central (chamadas da API Win32 para entrada de teclas e controle de exibição).
- **`Run.bat`**: O inicializador que executa o script completamente oculto em segundo plano.
- **`Startup.bat`**: Registra um atalho na pasta de Inicialização do Windows para que o programa seja executado automaticamente ao iniciar o sistema.
- **`Update.bat`**: Atualiza o atalho de inicialização com o caminho mais recente se você mover a pasta do projeto ou atualizar o script.
- **`Remove.bat`**: Ferramenta de remoção completa. Encerra processos em segundo plano e exclui o atalho de inicialização.
- **`Stop.bat`**: Encerra temporariamente o processo em execução no segundo plano sem excluir nada.

### Como Usar

1. **Primeira Execução Manual e Teste**: Execute `Run.bat`. Clique em um espaço vazio na área de trabalho e teste o `F5` e o `Shift + F5`.
2. **Registro de Inicialização Automática**: Execute `Startup.bat` para ativá-lo automaticamente na próxima inicialização do Windows.
3. **Atualizar ou Mover**: Execute `Update.bat` se você modificou o código ou moveu a pasta do projeto para um novo local.
4. **Remoção Limpa**: Execute `Remove.bat` para encerrar processos e remover entradas de inicialização. Depois disso, você pode excluir a pasta do projeto com segurança.

### Licença
Este projeto está licenciado sob a **GNU General Public License v3.0 (GPLv3)**. Consulte o arquivo `LICENSE` para obter mais detalhes.
