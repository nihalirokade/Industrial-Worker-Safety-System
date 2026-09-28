@echo off
setlocal
set "PATH=C:\Program Files\nodejs;%PATH%"

echo =======================================================
echo Starting AEGIS-SAFE Industrial Worker Safety System...
echo =======================================================

:: Start Backend (bound to 0.0.0.0 for LAN/Mobile access)
start "AEGIS Backend API (Port 8000)" cmd /k "cd /d %~dp0backend && set PATH=C:\Program Files\nodejs;%%PATH%% && .venv\Scripts\python.exe -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"

:: Start Frontend
start "AEGIS Frontend UI (Port 5173)" cmd /k "cd /d %~dp0frontend && set PATH=C:\Program Files\nodejs;%%PATH%% && npm run dev"

:: Wait 3 seconds then open browser
timeout /t 3 /nobreak >nul
start http://localhost:5173

