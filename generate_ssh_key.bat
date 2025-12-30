@echo off
chcp 65001 >nul
echo =======================================
echo    Tạo SSH Key cho Vast.ai
echo =======================================
echo.

REM Kiểm tra thư mục .ssh
set SSH_DIR=%USERPROFILE%\.ssh
if not exist "%SSH_DIR%" (
    echo Tạo thư mục .ssh...
    mkdir "%SSH_DIR%"
)

REM Tên file key
set KEY_NAME=vast_ai_key
set KEY_PATH=%SSH_DIR%\%KEY_NAME%

REM Kiểm tra nếu key đã tồn tại
if exist "%KEY_PATH%" (
    echo.
    echo CẢNH BÁO: Key đã tồn tại tại %KEY_PATH%
    echo.
    choice /C YN /M "Bạn có muốn tạo key mới (key cũ sẽ bị ghi đè)?"
    if errorlevel 2 goto :show_existing_key
    if errorlevel 1 goto :generate_key
) else (
    goto :generate_key
)

:generate_key
echo.
echo Đang tạo SSH key...
echo.

REM Tạo SSH key với ssh-keygen
ssh-keygen -t ed25519 -f "%KEY_PATH%" -N "" -C "vast-ai-key"

if errorlevel 1 (
    echo.
    echo LỖI: Không thể tạo SSH key!
    echo Đảm bảo bạn đã cài đặt OpenSSH Client trên Windows.
    echo.
    pause
    exit /b 1
)

echo.
echo ✓ Đã tạo SSH key thành công!
echo.

:show_existing_key
echo =======================================
echo    PUBLIC KEY (Copy nội dung bên dưới)
echo =======================================
echo.

REM Hiển thị public key
type "%KEY_PATH%.pub"

echo.
echo.
echo =======================================
echo    HƯỚNG DẪN
echo =======================================
echo.
echo 1. Copy toàn bộ nội dung PUBLIC KEY ở trên
echo 2. Vào Vast.ai → Account → SSH Keys
echo 3. Click "Add SSH Key"
echo 4. Paste key vào và lưu
echo.
echo File private key: %KEY_PATH%
echo File public key:  %KEY_PATH%.pub
echo.
echo =======================================

REM Copy public key vào clipboard (nếu có clip command)
type "%KEY_PATH%.pub" | clip 2>nul
if not errorlevel 1 (
    echo.
    echo ✓ Public key đã được copy vào clipboard!
    echo   Bạn có thể paste trực tiếp vào Vast.ai
    echo.
)

pause