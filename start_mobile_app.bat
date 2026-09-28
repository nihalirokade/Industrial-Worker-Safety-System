@echo off
setlocal
set "PATH=C:\Program Files\nodejs;%PATH%"

echo ====================================================================
echo             AEGIS-SAFE - MOBILE APP ENVIRONMENT LAUNCHER
echo ====================================================================
echo.
echo  Your Local Wi-Fi IP Address for Mobile Devices: 192.168.1.4
echo.
echo  Choose how to launch the Mobile App:
echo.
echo    [1] Start Expo Mobile App (React Native - Scan QR with Expo Go)
echo    [2] Open Mobile Phone Simulator (Mobile Device Frame in Browser)
echo    [3] Launch Full Mobile System (Backend + Mobile Web on LAN)
echo    [4] Exit
echo.
set /p choice="Enter your choice (1-4) [default: 1]: "

if "%choice%"=="" set choice=1

if "%choice%"=="1" goto launch_expo
if "%choice%"=="2" goto launch_simulator
if "%choice%"=="3" goto launch_full
goto exit_launcher

:launch_expo
echo.
echo Starting Expo Mobile App server...
cd /d %~dp0mobile
if not exist node_modules (
  echo Installing mobile dependencies (Expo & React Native)...
  call npm install
)
echo.
echo Launching Expo QR Code for physical phone or emulator...
call npx expo start --tunnel || call npx expo start
goto exit_launcher

:launch_simulator
echo.
echo Opening Mobile Phone Simulator in Browser...
start "" "%~dp0mobile_preview.html"
goto exit_launcher

:launch_full
echo.
echo Starting Backend API on 0.0.0.0:8000 (accessible on LAN)...
start "AEGIS Backend (Port 8000)" cmd /k "cd /d %~dp0backend && set PATH=C:\Program Files\nodejs;%%PATH%% && .venv\Scripts\python.exe -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"

echo Starting Frontend on 0.0.0.0:5173...
start "AEGIS Frontend (Port 5173)" cmd /k "cd /d %~dp0frontend && set PATH=C:\Program Files\nodejs;%%PATH%% && npm run dev"

timeout /t 3 /nobreak >nul
start http://localhost:5173
start "" "%~dp0mobile_preview.html"
goto exit_launcher

:exit_launcher
echo.
echo Done.
