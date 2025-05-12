@echo off
setlocal enabledelayedexpansion

:: Define the target file and placeholder
set "TARGET_FILE=.roorules-test"
set "PLACEHOLDER=WORKSPACE_PLACEHOLDER"
set "WORKSPACE=%CD%"

echo --- Injecting Workspace Path into %TARGET_FILE% ---

:: Check if the target file exists
if not exist "%TARGET_FILE%" (
    echo Error: %TARGET_FILE% not found in %WORKSPACE%
    exit /b 1
)

echo   Workspace Path: %WORKSPACE%
echo   Target File: %TARGET_FILE%

:: Use PowerShell to replace the placeholder in the target file
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'Stop'; $targetFile = '%TARGET_FILE%'; $placeholder = '%PLACEHOLDER%'; $workspacePath = '%WORKSPACE%'; try { $content = Get-Content $targetFile -Raw; $newContent = $content -replace [regex]::Escape($placeholder), $workspacePath; Set-Content -Path $targetFile -Value $newContent -NoNewline; Write-Host ('Successfully updated %TARGET_FILE%'); } catch { Write-Error ('Failed to update %TARGET_FILE%: ' + $_.Exception.Message); exit 1 }"

if errorlevel 1 (
    echo ERROR: Failed to inject workspace path into %TARGET_FILE%.
    exit /b 1
)

echo --- Injection Complete ---
endlocal
exit /b 0