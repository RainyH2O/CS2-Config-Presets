@echo off
setlocal enabledelayedexpansion

if not defined CS2_HOME (
    echo Error: env var CS2_HOME is not set.
    exit /b 1
)

pushd "%~dp0" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: failed to change directory.
    exit /b 1
)
copy .\*.cfg "%CS2_HOME%\cfg\" /Y >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: failed to copy cfg files.
    exit /b 1
)
xcopy custom\* "%CS2_HOME%\cfg\" /E /I /Y >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: failed to copy custom cfg files.
    exit /b 1
)

endlocal
exit /b 0
