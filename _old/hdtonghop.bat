@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
color 0A

:: Thong tin tac gia
set "AUTHOR=Tran Nhu Tuan"
set "ZALO=0379031662"

:MAIN_MENU
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     CÔNG CỤ COMFYUI TRÊN VAST.AI CHO PHOTOSHOP - ALL IN ONE ║
echo ╚══════════════════════════════════════════════════════════════╝
echo Tác giả: %AUTHOR%
echo Zalo/Sđt: %ZALO%
echo.
echo ┌──────────────────────────────────────────────────────────────┐
echo │  Chọn chức năng bạn muốn sử dụng:                            │
echo └──────────────────────────────────────────────────────────────┘
echo.
echo   [1] Hướng dẫn sử dụng từng bước
echo   [2] Tạo SSH Key cho Vast.ai
echo   [3] Kết nối và cài đặt ComfyUI tự động
echo   [4] Chỉ kết nối SSH (không cài đặt)
echo   [5] Mở link Vast.ai (thuê GPU)
echo   [0] Thoát
echo.
echo ══════════════════════════════════════════════════════════════
set /p choice="Nhập lựa chọn của bạn: "

if "%choice%"=="1" goto GUIDE_MENU
if "%choice%"=="2" goto SSH_KEY_GEN
if "%choice%"=="3" goto AUTO_INSTALL
if "%choice%"=="4" goto SSH_CONNECT_ONLY
if "%choice%"=="5" goto OPEN_VASTAI
if "%choice%"=="0" goto EXIT_PROGRAM
echo Lựa chọn không hợp lệ!
timeout /t 2 >nul
goto MAIN_MENU

:: ============================================================================
:: PHẦN HƯỚNG DẪN
:: ============================================================================
:GUIDE_MENU
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     HƯỚNG DẪN SỬ DỤNG COMFYUI TRÊN VAST.AI VỚI PHOTOSHOP    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo ┌──────────────────────────────────────────────────────────────┐
echo │  Chọn bước bạn muốn xem:                                     │
echo └──────────────────────────────────────────────────────────────┘
echo.
echo   [1] Bước 1: Thuê GPU trên Vast.ai
echo   [2] Bước 2: Tạo SSH Key
echo   [3] Bước 3: Cài đặt Plugin cho Photoshop
echo   [4] Bước 4: Kết nối với Server
echo   [5] Bước 5: Sử dụng Plugin
echo   [6] Xem hướng dẫn đầy đủ
echo   [0] Quay lại menu chính
echo.
echo ══════════════════════════════════════════════════════════════
set /p guide_choice="Nhập lựa chọn: "

if "%guide_choice%"=="1" goto GUIDE_STEP1
if "%guide_choice%"=="2" goto GUIDE_STEP2
if "%guide_choice%"=="3" goto GUIDE_STEP3
if "%guide_choice%"=="4" goto GUIDE_STEP4
if "%guide_choice%"=="5" goto GUIDE_STEP5
if "%guide_choice%"=="6" goto GUIDE_FULL
if "%guide_choice%"=="0" goto MAIN_MENU
goto GUIDE_MENU

:GUIDE_STEP1
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                  BƯỚC 1: THUÊ GPU TRÊN VAST.AI               ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   → Cấu hình GPU đã được thiết lập sẵn
echo   → Nhấn phím bất kỳ để mở link Vast.ai...
echo.
pause >nul
start "" "https://cloud.vast.ai/?ref_id=221650&creator_id=221650&name=ComfyUI%208GB%20-%20Storage"
echo   ✓ Đã mở link Vast.ai
echo.
echo   Sau khi thuê GPU xong, vui lòng:
echo   - Lưu lại thông tin SSH
echo   - Ghi nhớ địa chỉ IP và Port
echo.
pause
goto GUIDE_MENU

:GUIDE_STEP2
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    BƯỚC 2: TẠO SSH KEY                       ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   → Quay lại menu chính và chọn [2] để tạo SSH Key
echo.
pause
goto GUIDE_MENU

:GUIDE_STEP3
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║            BƯỚC 3: CÀI ĐẶT PLUGIN CHO PHOTOSHOP              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   HƯỚNG DẪN CÀI ĐẶT:
echo   ──────────────────────────────────────────────────────────────
echo.
echo   1. Copy toàn bộ thư mục "nhutuan_plugin"
echo.
echo   2. Dán vào thư mục Plug-ins của Photoshop:
echo      ^<thư mục cài đặt Photoshop^>/Plug-ins/
echo.
echo   3. Ví dụ đường dẫn:
echo      C:\Program Files\Adobe\Adobe Photoshop 2024\Plug-ins\
echo.
echo   4. Khởi động lại Photoshop
echo.
echo   ──────────────────────────────────────────────────────────────
echo.
pause
goto GUIDE_MENU

:GUIDE_STEP4
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║              BƯỚC 4: KẾT NỐI VỚI SERVER                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   → Quay lại menu chính và chọn [3] để kết nối tự động
echo.
pause
goto GUIDE_MENU

:GUIDE_STEP5
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    BƯỚC 5: SỬ DỤNG PLUGIN                    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   CÁCH SỬ DỤNG:
echo   ──────────────────────────────────────────────────────────────
echo.
echo   1. Mở Photoshop
echo.
echo   2. Tìm plugin trong menu Photoshop
echo.
echo   3. Bắt đầu sử dụng các tính năng AI
echo.
echo   ──────────────────────────────────────────────────────────────
echo.
echo   LƯU Ý QUAN TRỌNG:
echo   • Đảm bảo đã hoàn thành đầy đủ các bước 1-4
echo   • Kết nối server phải đang hoạt động
echo   • Kiểm tra GPU trên Vast.ai vẫn đang chạy
echo.
pause
goto GUIDE_MENU

:GUIDE_FULL
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║          HƯỚNG DẪN ĐẦY ĐỦ - COMFYUI TRÊN VAST.AI            ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   BƯỚC 1: THUÊ GPU TRÊN VAST.AI
echo   ──────────────────────────────────────────────────────────────
echo   - Truy cập link VastAI.url (cấu hình đã thiết lập sẵn)
echo   - Chọn GPU phù hợp với nhu cầu
echo   - Lưu thông tin SSH và địa chỉ IP
echo.
echo   BƯỚC 2: TẠO SSH KEY
echo   ──────────────────────────────────────────────────────────────
echo   - Chạy chức năng [2] từ menu chính
echo   - Làm theo hướng dẫn hiển thị trên màn hình
echo.
echo   BƯỚC 3: CÀI ĐẶT PLUGIN CHO PHOTOSHOP
echo   ──────────────────────────────────────────────────────────────
echo   - Copy toàn bộ thư mục nhutuan_plugin
echo   - Dán vào: ^<Photoshop^>/Plug-ins/
echo   - Ví dụ: C:\Program Files\Adobe\Adobe Photoshop 2024\Plug-ins\
echo   - Khởi động lại Photoshop
echo.
echo   BƯỚC 4: KẾT NỐI VỚI SERVER
echo   ──────────────────────────────────────────────────────────────
echo   - Chạy chức năng [3] từ menu chính
echo.
echo   BƯỚC 5: SỬ DỤNG
echo   ──────────────────────────────────────────────────────────────
echo   - Mở Photoshop và bắt đầu sử dụng plugin
echo.
echo   ══════════════════════════════════════════════════════════════
echo   LƯU Ý: Đảm bảo hoàn thành đầy đủ các bước theo thứ tự
echo   để plugin hoạt động bình thường.
echo   ══════════════════════════════════════════════════════════════
echo.
pause
goto GUIDE_MENU

:: ============================================================================
:: PHẦN TẠO SSH KEY
:: ============================================================================
:SSH_KEY_GEN
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                  TẠO SSH KEY CHO VAST.AI                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set SSH_DIR=%USERPROFILE%\.ssh
if not exist "%SSH_DIR%" (
    echo → Tạo thư mục .ssh...
    mkdir "%SSH_DIR%"
)

set KEY_NAME=vast_ai_key
set KEY_PATH=%SSH_DIR%\%KEY_NAME%

if exist "%KEY_PATH%" (
    echo.
    echo CẢNH BÁO: Key đã tồn tại tại %KEY_PATH%
    echo.
    choice /C YN /M "Bạn có muốn tạo key mới (key cũ sẽ bị ghi đè)?"
    if errorlevel 2 goto SHOW_EXISTING_KEY
    if errorlevel 1 goto GENERATE_KEY
) else (
    goto GENERATE_KEY
)

:GENERATE_KEY
echo.
echo → Đang tạo SSH key...
echo.

ssh-keygen -t ed25519 -f "%KEY_PATH%" -N "" -C "vast-ai-key"

if errorlevel 1 (
    echo.
    echo ✗ LỖI: Không thể tạo SSH key!
    echo → Đảm bảo bạn đã cài đặt OpenSSH Client trên Windows.
    echo.
    pause
    goto MAIN_MENU
)

echo.
echo ✓ Đã tạo SSH key thành công!
echo.

:SHOW_EXISTING_KEY
echo ══════════════════════════════════════════════════════════════
echo    PUBLIC KEY (Copy nội dung bên dưới)
echo ══════════════════════════════════════════════════════════════
echo.

type "%KEY_PATH%.pub"

echo.
echo.
echo ══════════════════════════════════════════════════════════════
echo    HƯỚNG DẪN
echo ══════════════════════════════════════════════════════════════
echo.
echo 1. Copy toàn bộ nội dung PUBLIC KEY ở trên
echo 2. Vào Vast.ai → Account → SSH Keys
echo 3. Click "Add SSH Key"
echo 4. Paste key vào và lưu
echo.
echo File private key: %KEY_PATH%
echo File public key:  %KEY_PATH%.pub
echo.
echo ══════════════════════════════════════════════════════════════

type "%KEY_PATH%.pub" | clip 2>nul
if not errorlevel 1 (
    echo.
    echo ✓ Public key đã được copy vào clipboard!
    echo   Bạn có thể paste trực tiếp vào Vast.ai
    echo.
)

pause
goto MAIN_MENU

:: ============================================================================
:: PHẦN CÀI ĐẶT TỰ ĐỘNG COMFYUI
:: ============================================================================
:AUTO_INSTALL
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║        CÔNG CỤ TỰ ĐỘNG CÀI ĐẶT COMFYUI TRÊN VAST.AI         ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set "savefile=last_ssh.txt"

if exist "%savefile%" (
    set /p lastcmd=<%savefile%
    echo [*] Lệnh SSH đã lưu trước đó:
    echo    %lastcmd%
    echo.
    choice /m "Bạn có muốn sử dụng lệnh SSH này không?"
    if errorlevel 2 goto NEW_SSH_CMD
    if errorlevel 1 goto USE_OLD_SSH
)

:NEW_SSH_CMD
echo.
echo [+] Vui lòng nhập lệnh SSH của bạn:
set /p "input="

set "output=!input:-L 8080:localhost:8080=-L 8188:localhost:18188!"

echo %output% > "%savefile%"

goto RUN_NEW_SSH

:USE_OLD_SSH
set "output=%lastcmd%"
goto RUN_OLD_SSH

:RUN_NEW_SSH
echo.
echo ══════════════════════════════════════════════════════════════
echo [BƯỚC 1] Đang kết nối SSH...
echo ══════════════════════════════════════════════════════════════
echo.
echo Lệnh: %output%
echo.

set "setup_script=mkdir -p /workspace/ComfyUI/custom_nodes && cd /workspace/ComfyUI/custom_nodes && git clone https://github.com/rgthree/rgthree-comfy && git clone https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch && git clone https://github.com/chrisgoringe/cg-use-everywhere && git clone https://github.com/zombieyang/sd-ppp && mkdir -p /workspace/ComfyUI/models/checkpoints && cd /workspace/ComfyUI/models/checkpoints && curl -L -J -O 'https://huggingface.co/kooldark/majicmixRealistic_v7-inpainting/resolve/main/majicmixRealistic_v7-inpainting.safetensors' && mkdir -p /workspace/ComfyUI/user/default && cd /workspace/ComfyUI/user/default && git clone https://github.com/kooldark/ptscf workflows"

set "restart_script=echo '======================================'; echo '[BƯỚC 3] Đang khởi động lại ComfyUI...'; echo '======================================'; pkill -f 'python.*main.py' 2>/dev/null; sleep 3; cd /workspace/ComfyUI && nohup python main.py --listen 0.0.0.0 --port 8188 > /tmp/comfyui.log 2>&1 & sleep 2; echo '[THÀNH CÔNG] ComfyUI đã khởi động!'; echo 'ComfyUI đang chạy trên cổng 8188'; echo '======================================'"

%output% "echo '======================================'; echo '[BƯỚC 2] Đang cài đặt ComfyUI SD1.5...'; echo '======================================'; %setup_script%; echo ''; echo '[THÀNH CÔNG] Cài đặt hoàn tất!'; %restart_script%; exec bash"

goto END_SSH

:RUN_OLD_SSH
echo.
echo ══════════════════════════════════════════════════════════════
echo [KẾT NỐI LẠI] Đang kết nối vào phiên SSH đã tồn tại...
echo ══════════════════════════════════════════════════════════════
echo.
echo Lệnh: %output%
echo.

%output%

:END_SSH
echo.
echo ══════════════════════════════════════════════════════════════
echo             CẢM ƠN BẠN ĐÃ SỬ DỤNG CÔNG CỤ!
echo             Tác giả: %AUTHOR% - Zalo: %ZALO%
echo ══════════════════════════════════════════════════════════════
echo.
pause
goto MAIN_MENU

:: ============================================================================
:: PHẦN KẾT NỐI SSH ĐƠN GIẢN (KHÔNG CÀI ĐẶT)
:: ============================================================================
:SSH_CONNECT_ONLY
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                  KẾT NỐI SSH ĐƠN GIẢN                       ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set "savefile=last_ssh.txt"

if exist "%savefile%" (
    set /p lastcmd=<%savefile%
    echo [*] Lệnh SSH đã lưu:
    echo    %lastcmd%
    echo.
    choice /m "Sử dụng lệnh này?"
    if errorlevel 2 goto NEW_CONNECT
    if errorlevel 1 (
        echo.
        echo → Đang kết nối...
        %lastcmd%
        goto MAIN_MENU
    )
)

:NEW_CONNECT
echo.
echo [+] Nhập lệnh SSH:
set /p "ssh_cmd="

set "ssh_cmd=!ssh_cmd:-L 8080:localhost:8080=-L 8188:localhost:18188!"

echo %ssh_cmd% > "%savefile%"

echo.
echo → Đang kết nối...
%ssh_cmd%

pause
goto MAIN_MENU

:: ============================================================================
:: MỞ LINK VAST.AI
:: ============================================================================
:OPEN_VASTAI
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    MỞ LINK VAST.AI                           ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo → Đang mở trình duyệt...
echo.

start "" "https://cloud.vast.ai/?ref_id=221650&creator_id=221650&name=ComfyUI%208GB%20-%20Storage"
echo ✓ Đã mở link Vast.ai

echo.
pause
goto MAIN_MENU

:: ============================================================================
:: THOÁT CHƯƠNG TRÌNH
:: ============================================================================
:EXIT_PROGRAM
cls
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo   Cảm ơn bạn đã sử dụng công cụ!
echo   Chúc bạn thành công với ComfyUI và Photoshop!
echo.
echo   Tác giả: %AUTHOR%
echo   Zalo/Sđt: %ZALO%
echo.
echo ══════════════════════════════════════════════════════════════
echo.
timeout /t 3 >nul
endlocal
exit