@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Thong tin tac gia
echo.
echo ====================================================================
echo           CONG CU TU DONG CAI DAT COMFYUI TREN VAST.AI
echo ====================================================================
echo.
echo    Tac gia: Tran Nhu Tuan
echo    Zalo: 0379031662
echo.
echo ====================================================================
echo.

set "savefile=last_ssh.txt"

:: Kiem tra lenh da luu
if exist "%savefile%" (
    set /p lastcmd=<%savefile%
    echo [*] Lenh SSH da luu truoc do:
    echo    %lastcmd%
    echo.
    choice /m "Ban co muon su dung lenh SSH nay khong?"
    if errorlevel 2 goto NEWCMD
    if errorlevel 1 goto USEOLD
)

:NEWCMD
:: Nhap lenh SSH moi
echo.
echo [+] Vui long nhap lenh SSH cua ban:
set /p "input="

:: Thay the port mapping
set "output=!input:-L 8080:localhost:8080=-L 8188:localhost:18188!"

echo %output% > "%savefile%"

goto RUNNEW

:USEOLD
set "output=%lastcmd%"
goto RUNOLD

:RUNNEW
echo.
echo ====================================================================
echo [BUOC 1] Dang ket noi SSH...
echo ====================================================================
echo.
echo Lenh: %output%
echo.

:: Tao noi dung script cai dat
set "setup_script=mkdir -p /workspace/ComfyUI/custom_nodes && cd /workspace/ComfyUI/custom_nodes && git clone https://github.com/rgthree/rgthree-comfy && git clone https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch && git clone https://github.com/chrisgoringe/cg-use-everywhere && git clone https://github.com/zombieyang/sd-ppp && mkdir -p /workspace/ComfyUI/models/checkpoints && cd /workspace/ComfyUI/models/checkpoints && curl -L -J -O 'https://huggingface.co/kooldark/majicmixRealistic_v7-inpainting/resolve/main/majicmixRealistic_v7-inpainting.safetensors' && mkdir -p /workspace/ComfyUI/user/default && cd /workspace/ComfyUI/user/default && git clone https://github.com/kooldark/ptscf workflows"

:: Tao script khoi dong lai
set "restart_script=echo '======================================'; echo '[BUOC 3] Dang khoi dong lai ComfyUI...'; echo '======================================'; pkill -f 'python.*main.py' 2>/dev/null; sleep 3; cd /workspace/ComfyUI && nohup python main.py --listen 0.0.0.0 --port 8188 > /tmp/comfyui.log 2>&1 & sleep 2; echo '[THANH CONG] ComfyUI da khoi dong!'; echo 'ComfyUI dang chay tren cong 8188'; echo '======================================'"

:: Thuc thi SSH va chay setup + restart tu dong
%output% "echo '======================================'; echo '[BUOC 2] Dang cai dat ComfyUI SD1.5...'; echo '======================================'; %setup_script%; echo ''; echo '[THANH CONG] Cai dat hoan tat!'; %restart_script%; exec bash"

goto END

:RUNOLD
echo.
echo ====================================================================
echo [KET NOI LAI] Dang ket noi vao phien SSH da ton tai...
echo ====================================================================
echo.
echo Lenh: %output%
echo.

:: Thuc thi SSH KHONG cai dat cho ket noi da ton tai
%output%

:END

echo.
echo ====================================================================
echo             CAM ON BAN DA SU DUNG CONG CU!
echo             Tac gia: Tran Nhu Tuan - Zalo: 0379031662
echo ====================================================================
echo.

endlocal
pause