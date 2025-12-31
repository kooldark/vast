@echo off
chcp 65001 >nul
color 0A
title Hướng Dẫn Sử Dụng ComfyUI trên Vast.ai với Photoshop

:MENU
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     HƯỚNG DẪN SỬ DỤNG COMFYUI TRÊN VAST.AI VỚI PHOTOSHOP    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo Tác giả: Trần Như Tuấn
echo Zalo/Sđt: 0379031662
echo.
echo ┌──────────────────────────────────────────────────────────────┐
echo │  Chọn bước bạn muốn thực hiện:                               │
echo └──────────────────────────────────────────────────────────────┘
echo.
echo   [1] Bước 1: Thuê GPU trên Vast.ai
echo   [2] Bước 2: Tạo SSH Key
echo   [3] Bước 3: Cài đặt Plugin cho Photoshop
echo   [4] Bước 4: Kết nối với Server
echo   [5] Bước 5: Sử dụng Plugin
echo   [6] Xem hướng dẫn đầy đủ
echo   [0] Thoát
echo.
echo ══════════════════════════════════════════════════════════════
set /p choice="Nhập lựa chọn của bạn: "

if "%choice%"=="1" goto STEP1
if "%choice%"=="2" goto STEP2
if "%choice%"=="3" goto STEP3
if "%choice%"=="4" goto STEP4
if "%choice%"=="5" goto STEP5
if "%choice%"=="6" goto FULLGUIDE
if "%choice%"=="0" goto EXIT
echo Lựa chọn không hợp lệ!
timeout /t 2 >nul
goto MENU

:STEP1
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                  BƯỚC 1: THUÊ GPU TRÊN VAST.AI               ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   → Cấu hình GPU đã được thiết lập sẵn
echo   → Nhấn phím bất kỳ để mở link Vast.ai...
echo.
pause >nul
if exist "VastAI.url" (
    start "" "VastAI.url"
    echo   ✓ Đã mở link Vast.ai
) else (
    echo   ✗ CẢNH BÁO: Không tìm thấy file VastAI.url!
    echo   → Vui lòng kiểm tra lại thư mục
)
echo.
echo   Sau khi thuê GPU xong, vui lòng:
echo   - Lưu lại thông tin SSH
echo   - Ghi nhớ địa chỉ IP và Port
echo.
pause
goto MENU

:STEP2
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    BƯỚC 2: TẠO SSH KEY                       ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   → Đang khởi chạy công cụ tạo SSH Key...
echo.
if exist "generate_ssh_key.bat" (
    call generate_ssh_key.bat
    echo.
    echo   ✓ Hoàn thành tạo SSH Key
) else (
    echo   ✗ CẢNH BÁO: Không tìm thấy file generate_ssh_key.bat!
    echo   → Vui lòng kiểm tra lại thư mục
)
echo.
pause
goto MENU

:STEP3
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
set /p install="Bạn đã cài đặt xong chưa? (Y/N): "
if /i "%install%"=="Y" (
    echo.
    echo   ✓ Tuyệt vời! Hãy chuyển sang Bước 4
    timeout /t 2 >nul
) else (
    echo.
    echo   → Vui lòng hoàn thành cài đặt trước khi tiếp tục
)
echo.
pause
goto MENU

:STEP4
cls
echo ╔══════════════════════════════════════════════════════════════╗
echo ║              BƯỚC 4: KẾT NỐI VỚI SERVER                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo   → Đang khởi động kết nối với Vast.ai...
echo.
if exist "auto_vast_pts.bat" (
    call auto_vast_pts.bat
    echo.
    echo   ✓ Kết nối thành công!
) else (
    echo   ✗ CẢNH BÁO: Không tìm thấy file auto_vast_pts.bat!
    echo   → Vui lòng kiểm tra lại thư mục
)
echo.
pause
goto MENU

:STEP5
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
goto MENU

:FULLGUIDE
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
echo   - Chạy file generate_ssh_key.bat
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
echo   - Chạy file auto_vast_pts.bat
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
goto MENU

:EXIT
cls
echo.
echo   Cảm ơn bạn đã sử dụng hướng dẫn!
echo   Chúc bạn thành công với ComfyUI và Photoshop!
echo.
timeout /t 2 >nul
exit