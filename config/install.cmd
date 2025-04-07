@echo off
setlocal

echo --- Starting Roo Code Memory Bank Config Setup ---

:: Define files to download (relative to config/ in the repo)
set "REPO_BASE_URL=https://raw.githubusercontent.com/GreatScottyMac/roo-code-memory-bank/main/config"
set "FILES_TO_DOWNLOAD=.roorules-architect .roorules-ask .roorules-code .roorules-debug .roorules-test .roomodes insert-variable.cmd"

:: Check for curl
where curl >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: curl.exe is not found in your PATH.
    echo Please ensure curl is installed and accessible. Modern Windows 10/11 should include it.
    echo You might need to install it or add it to your system PATH.
    pause
    exit /b 1
) else (
    echo Found curl executable.
)

echo Downloading configuration files...

:: Loop through files and download each one
set "DOWNLOAD_ERROR=0"
for %%F in (%FILES_TO_DOWNLOAD%) do (
    echo   Downloading %%F...
    curl -L -f -o "%%F" "%REPO_BASE_URL%/%%F"
    if errorlevel 1 (
        echo   ERROR: Failed to download %%F. Check URL or network connection.
        set "DOWNLOAD_ERROR=1"
        goto :DownloadFailed
    ) else (
        echo   Successfully downloaded %%F.
    )
)

echo Running variable injection script...
call insert-variable.cmd
if errorlevel 1 (
    echo ERROR: Failed to run insert-variable.cmd. Setup incomplete.
    set "DOWNLOAD_ERROR=1"
    goto :DownloadFailed
)
echo Variable injection complete.

:DownloadSuccess
echo All configuration files downloaded successfully.
echo --- Roo Code Memory Bank Config Setup Complete ---

:: Schedule self-deletion
echo Scheduling self-deletion of %~nx0...
start "" /b cmd /c "timeout /t 1 > nul && del /q /f "insert-variable.cmd" && del /q /f "%~f0""
goto :EOF

:DownloadFailed
echo ERROR: One or more files failed to download. Setup incomplete.
pause
exit /b 1

endlocal