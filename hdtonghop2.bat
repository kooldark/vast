@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
color 0A

:: Configuration
set "AUTHOR=Tran Nhu Tuan"
set "ZALO=0379031662"
set "ZALO_GROUP=https://zalo.me/g/rktftw605"
set "VASTAI_URL=https://cloud.vast.ai/?ref_id=221650&creator_id=221650&name=ComfyUI%%208GB%%20-%%20Storage"
set "SSH_DIR=%USERPROFILE%\.ssh"
set "KEY_NAME=vast_ai_key"
set "SAVE_FILE=last_ssh.txt"

:: Main Menu
:MENU
cls
call :PrintHeader "CÔNG CỤ COMFYUI TRÊN VAST.AI - PHOTOSHOP ALL IN ONE"
echo.
echo Tác giả: %AUTHOR% ^| Zalo: %ZALO%
echo Cộng đồng: %ZALO_GROUP%
echo.
call :PrintBox "CHỨC NĂNG"
echo   [1] Hướng dẫn từng bước
echo   [2] Tạo SSH Key
echo   [3] Kết nối + Cài đặt ComfyUI tự động
echo   [4] Chỉ kết nối SSH
echo   [5] Mở link Vast.ai (thuê GPU)
echo   [6] Tham gia cộng đồng Zalo
echo   [0] Thoát
echo.
call :PrintSeparator
set /p "choice=Chọn [0-6]: "

if "%choice%"=="1" goto GUIDE
if "%choice%"=="2" goto SSH_KEY
if "%choice%"=="3" goto AUTO_INSTALL
if "%choice%"=="4" goto SSH_ONLY
if "%choice%"=="5" call :OpenURL "%VASTAI_URL%" & goto MENU
if "%choice%"=="6" call :OpenURL "%ZALO_GROUP%" & goto MENU
if "%choice%"=="0" goto EXIT
echo Lựa chọn không hợp lệ! & timeout /t 2 >nul & goto MENU

:: ============================================================================
:: GUIDE SECTION
:: ============================================================================
:GUIDE
cls
call :PrintHeader "HƯỚNG DẪN SỬ DỤNG"
echo.
call :PrintBox "CÁC BƯỚC"
echo   [1] Bước 1: Thuê GPU trên Vast.ai
echo   [2] Bước 2: Tạo SSH Key
echo   [3] Bước 3: Cài Plugin Photoshop
echo   [4] Bước 4: Kết nối Server
echo   [5] Bước 5: Sử dụng Plugin
echo   [6] Xem toàn bộ hướng dẫn
echo   [0] Quay lại
echo.
call :PrintSeparator
set /p "g=Chọn [0-6]: "

if "%g%"=="1" call :GuideStep1 & goto GUIDE
if "%g%"=="2" call :GuideStep2 & goto GUIDE
if "%g%"=="3" call :GuideStep3 & goto GUIDE
if "%g%"=="4" call :GuideStep4 & goto GUIDE
if "%g%"=="5" call :GuideStep5 & goto GUIDE
if "%g%"=="6" call :GuideFull & goto GUIDE
if "%g%"=="0" goto MENU
goto GUIDE

:GuideStep1
cls
call :PrintHeader "BƯỚC 1: THUÊ GPU TRÊN VAST.AI"
echo.
echo → Cấu hình GPU đã thiết lập sẵn
echo → Nhấn phím bất kỳ để mở Vast.ai...
pause >nul
call :OpenURL "%VASTAI_URL%"
echo.
echo ✓ Sau khi thuê GPU, lưu lại:
echo   • Địa chỉ IP và Port SSH
echo   • Thông tin đăng nhập
pause & exit /b

:GuideStep2
cls
call :PrintHeader "BƯỚC 2: TẠO SSH KEY"
echo.
echo → Quay lại menu chính và chọn [2]
pause & exit /b

:GuideStep3
cls
call :PrintHeader "BƯỚC 3: CÀI PLUGIN PHOTOSHOP"
echo.
echo 1. Copy thư mục "nhutuan_plugin"
echo 2. Dán vào: ^<Photoshop^>/Plug-ins/
echo.
echo Ví dụ:
echo    C:\Program Files\Adobe\Adobe Photoshop 2024\Plug-ins\
echo.
echo 3. Khởi động lại Photoshop
pause & exit /b

:GuideStep4
cls
call :PrintHeader "BƯỚC 4: KẾT NỐI SERVER"
echo.
echo → Quay lại menu chính và chọn [3]
pause & exit /b

:GuideStep5
cls
call :PrintHeader "BƯỚC 5: SỬ DỤNG PLUGIN"
echo.
echo • Mở Photoshop
echo • Tìm plugin trong menu
echo • Bắt đầu sử dụng tính năng AI
echo.
echo LƯU Ý:
echo   • Hoàn thành đầy đủ bước 1-4
echo   • Đảm bảo server đang chạy
echo   • Kiểm tra GPU trên Vast.ai
pause & exit /b

:GuideFull
cls
call :PrintHeader "HƯỚNG DẪN ĐẦY ĐỦ"
echo.
echo BƯỚC 1: Thuê GPU → Chọn [5] từ menu
echo BƯỚC 2: Tạo SSH Key → Chọn [2] từ menu
echo BƯỚC 3: Cài Plugin → Copy "nhutuan_plugin" vào Photoshop/Plug-ins/
echo BƯỚC 4: Kết nối → Chọn [3] từ menu
echo BƯỚC 5: Sử dụng → Mở Photoshop và bắt đầu
echo.
echo Hỗ trợ: Tham gia cộng đồng Zalo (chọn [6] từ menu)
pause & exit /b

:: ============================================================================
:: SSH KEY GENERATION
:: ============================================================================
:SSH_KEY
cls
call :PrintHeader "TẠO SSH KEY"
echo.

if not exist "%SSH_DIR%" mkdir "%SSH_DIR%"

set "KEY_PATH=%SSH_DIR%\%KEY_NAME%"

if exist "%KEY_PATH%" (
    echo ⚠ Key đã tồn tại: %KEY_PATH%
    choice /C YN /M "Tạo key mới (ghi đè key cũ)?"
    if errorlevel 2 goto SHOW_KEY
)

echo → Đang tạo SSH key...
ssh-keygen -t ed25519 -f "%KEY_PATH%" -N "" -C "vast-ai-key" >nul 2>&1

if errorlevel 1 (
    echo ✗ Lỗi: Không thể tạo key!
    echo → Cài đặt OpenSSH Client trên Windows
    pause & goto MENU
)

echo ✓ Tạo key thành công!
echo.

:SHOW_KEY
call :PrintSeparator
echo PUBLIC KEY (Copy nội dung bên dưới):
call :PrintSeparator
type "%KEY_PATH%.pub"
echo.
call :PrintSeparator

type "%KEY_PATH%.pub" | clip 2>nul
if not errorlevel 1 echo ✓ Đã copy vào clipboard!

echo.
echo HƯỚNG DẪN:
echo 1. Vào Vast.ai → Account → SSH Keys
echo 2. Click "Add SSH Key"
echo 3. Paste và lưu
echo.
echo Private key: %KEY_PATH%
echo Public key:  %KEY_PATH%.pub
pause & goto MENU

:: ============================================================================
:: AUTO INSTALL COMFYUI
:: ============================================================================
:AUTO_INSTALL
cls
call :PrintHeader "CÀI ĐẶT TỰ ĐỘNG COMFYUI"
echo.

if exist "%SAVE_FILE%" (
    set /p lastcmd=<%SAVE_FILE%
    echo Lệnh SSH đã lưu:
    echo %lastcmd%
    echo.
    choice /M "Sử dụng lệnh này?"
    if errorlevel 2 goto INPUT_SSH
    set "ssh_cmd=%lastcmd%"
    goto EXEC_INSTALL
)

:INPUT_SSH
echo Nhập lệnh SSH từ Vast.ai:
set /p "ssh_cmd="
set "ssh_cmd=!ssh_cmd:-L 8080:localhost:8080=-L 8188:localhost:18188!"
echo %ssh_cmd%>"%SAVE_FILE%"

:EXEC_INSTALL
echo.
call :PrintSeparator
echo ĐANG KẾT NỐI VÀ CÀI ĐẶT...
call :PrintSeparator
echo.

set "setup=mkdir -p /workspace/ComfyUI/custom_nodes && cd /workspace/ComfyUI/custom_nodes && git clone https://github.com/rgthree/rgthree-comfy && git clone https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch && git clone https://github.com/chrisgoringe/cg-use-everywhere && git clone https://github.com/zombieyang/sd-ppp && mkdir -p /workspace/ComfyUI/models/checkpoints && cd /workspace/ComfyUI/models/checkpoints && curl -L -J -O 'https://huggingface.co/kooldark/majicmixRealistic_v7-inpainting/resolve/main/majicmixRealistic_v7-inpainting.safetensors' && mkdir -p /workspace/ComfyUI/user/default && cd /workspace/ComfyUI/user/default && git clone https://github.com/kooldark/ptscf workflows"

set "restart=pkill -f 'python.*main.py' 2>/dev/null; sleep 3; cd /workspace/ComfyUI && nohup python main.py --listen 0.0.0.0 --port 8188 > /tmp/comfyui.log 2>&1 &"

%ssh_cmd% "echo '[BƯỚC 1] Cài đặt...'; %setup%; echo '[BƯỚC 2] Khởi động ComfyUI...'; %restart%; echo '[HOÀN TẤT] ComfyUI chạy trên port 8188'; exec bash"

echo.
call :PrintSuccess
pause & goto MENU

:: ============================================================================
:: SSH CONNECT ONLY
:: ============================================================================
:SSH_ONLY
cls
call :PrintHeader "KẾT NỐI SSH"
echo.

if exist "%SAVE_FILE%" (
    set /p lastcmd=<%SAVE_FILE%
    echo Lệnh đã lưu: %lastcmd%
    choice /M "Sử dụng lệnh này?"
    if errorlevel 1 (
        %lastcmd%
        goto MENU
    )
)

echo Nhập lệnh SSH:
set /p "ssh_cmd="
set "ssh_cmd=!ssh_cmd:-L 8080:localhost:8080=-L 8188:localhost:18188!"
echo %ssh_cmd%>"%SAVE_FILE%"
%ssh_cmd%
pause & goto MENU

:: ============================================================================
:: EXIT
:: ============================================================================
:EXIT
cls
echo.
call :PrintSeparator
echo.
echo   Cảm ơn bạn đã sử dụng!
echo   Tác giả: %AUTHOR% ^| Zalo: %ZALO%
echo   Cộng đồng: %ZALO_GROUP%
echo.
call :PrintSeparator
timeout /t 3 >nul
exit

:: ============================================================================
:: UTILITY FUNCTIONS
:: ============================================================================
:PrintHeader
echo ╔══════════════════════════════════════════════════════════════╗
echo ║  %~1
echo ╚══════════════════════════════════════════════════════════════╝
exit /b

:PrintBox
echo ┌──────────────────────────────────────────────────────────────┐
echo │  %~1
echo └──────────────────────────────────────────────────────────────┘
exit /b

:PrintSeparator
echo ══════════════════════════════════════════════════════════════
exit /b

:PrintSuccess
call :PrintSeparator
echo        CẢM ƠN BẠN ĐÃ SỬ DỤNG CÔNG CỤ!
echo        Tác giả: %AUTHOR% - Zalo: %ZALO%
call :PrintSeparator
exit /b

:OpenURL
start "" "%~1"
echo ✓ Đã mở: %~1
timeout /t 2 >nul
exit /b