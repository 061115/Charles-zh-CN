@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Charles Chinese Patch / Charles HanHua

set SRC=%~dp0charles.jar

echo ==================================================
echo   Charles 5.2  Simplified Chinese Patch
echo   Charles 5.2  简体中文补丁
echo ==================================================
echo.

if not exist "%SRC%" (
    echo [ERROR] charles.jar not found next to this script.
    echo         请把本脚本和 charles.jar 放在同一个文件夹里。
    pause
    exit /b 1
)

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
    echo.
    echo [ERROR] No lib\charles.jar in that folder. / 该目录下没有 lib\charles.jar
    pause
    exit /b 1
)

echo Target / 安装目录: %DIR%
echo.

tasklist /FI "IMAGENAME eq Charles.exe" 2>nul | find /I "Charles.exe" >nul
if not errorlevel 1 (
    echo [1/3] Closing Charles / 正在关闭 Charles ...
    taskkill /IM Charles.exe /F >nul 2>&1
    timeout /t 4 /nobreak >nul
) else (
    echo [1/3] Charles is not running. / Charles 未在运行
)

if exist "%DIR%\lib\charles.jar.official-backup" (
    echo [2/3] Backup already exists, skipped. / 备份已存在
) else (
    copy /Y "%DIR%\lib\charles.jar" "%DIR%\lib\charles.jar.official-backup" >nul
    if errorlevel 1 (
        echo [ERROR] Backup failed. Run as Administrator.
        echo [错误] 备份失败，请右键以管理员身份运行
        pause
        exit /b 1
    )
    echo [2/3] Backup created: lib\charles.jar.official-backup
)

copy /Y "%SRC%" "%DIR%\lib\charles.jar" >nul
if errorlevel 1 (
    echo [ERROR] Write failed. Close Charles or run as Administrator.
    echo [错误] 写入失败，请确认 Charles 已退出，或以管理员身份运行
    pause
    exit /b 1
)
echo [3/3] Patch installed. / 汉化包已安装

echo.
echo ==================================================
echo   Done! Start Charles to see the Chinese UI.
echo   完成！启动 Charles 即为中文界面
echo   Undo: run 还原英文.bat
echo ==================================================
echo.
pause
