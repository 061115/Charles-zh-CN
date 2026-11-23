@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Charles Restore English / 还原英文

echo ==================================================
echo   Charles  Restore English Original
echo   Charles  还原英文原版
echo ==================================================
echo.

set DIR=
for %%P in (
    "%ProgramFiles%\Charles"
    "%ProgramFiles(x86)%\Charles"
    "%LOCALAPPDATA%\Programs\Charles"
) do (
    if exist "%%~P\lib\charles.jar" set DIR=%%~P
)

if "%DIR%"=="" (
    echo Charles default folder not found.
    echo 没在默认位置找到 Charles，请把 Charles 文件夹拖到下面再回车:
    echo.
    set /p DIR=Path / 路径: 
    set "DIR=!DIR:"=!"
)

if not exist "%DIR%\lib\charles.jar" (
    echo [ERROR] No lib\charles.jar in that folder. / 该目录下没有 lib\charles.jar
    pause
    exit /b 1
)

if not exist "%DIR%\lib\charles.jar.official-backup" (
    echo [ERROR] Backup not found: lib\charles.jar.official-backup
    echo [错误] 没找到备份，可能从未安装过汉化
    pause
    exit /b 1
)

echo Target / 目录: %DIR%
echo.

tasklist /FI "IMAGENAME eq Charles.exe" 2>nul | find /I "Charles.exe" >nul
if not errorlevel 1 (
    echo [1/2] Closing Charles / 正在关闭 Charles ...
    taskkill /IM Charles.exe /F >nul 2>&1
    timeout /t 4 /nobreak >nul
)

copy /Y "%DIR%\lib\charles.jar.official-backup" "%DIR%\lib\charles.jar" >nul
if errorlevel 1 (
    echo [ERROR] Restore failed. Run as Administrator.
    echo [错误] 还原失败，请右键以管理员身份运行
    pause
    exit /b 1
)
echo [2/2] Restored to English. / 已还原为英文原版

echo.
echo Done. / 完成
pause
