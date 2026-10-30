@echo off
title CivicAI - Municipal AI Platform Launcher
echo ========================================================
echo   Starting CivicAI Backend and Frontend Services...
echo ========================================================

set "PROJECT_DIR=c:\Users\ASUS\Desktop\civicai\"
set "PATH=C:\Users\ASUS\AppData\Local\Programs\nodejs;C:\Users\ASUS\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\Scripts;%PATH%"

echo [1/3] Starting FastAPI Backend on http://127.0.0.1:8000...
start "CivicAI Backend" /min cmd /c "cd /d %PROJECT_DIR%backend && python -m uvicorn app.main:app --host 127.0.0.1 --port 8000"

echo [2/3] Starting React Vite Frontend on http://localhost:5173...
start "CivicAI Frontend" /min cmd /c "cd /d %PROJECT_DIR%frontend && npm run dev"

echo [3/3] Waiting for servers to initialize...
ping 127.0.0.1 -n 3 >nul

echo Opening CivicAI in your default browser...
start http://localhost:5173

echo.
echo ========================================================
echo   CivicAI is now running!
echo   Browser opened at: http://localhost:5173
echo ========================================================
