@echo off
setlocal

set "WFCUExe=%~dp0\src\dist\WFCU.exe"

NET SESSION >nul 2>&1 
if %ERRORLEVEL% EQU 0 (
    echo ========== Adding WFCU to registry ===========
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU" /v "SubCommands" /t REG_SZ /d "" /f
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To PNG\command" /ve /d "\"%WFCUExe%\" \"%%1\" \".png\"" /f
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To JPEG\command" /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\"" /f
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To WEBP\command" /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\"" /f

    echo ========== WFCU successfully added to registry ===========
    echo.
    echo.
    echo exiting...
    timeout /t 7
    exit
) else (
    echo This script must be run with administrator privileges. Please run it as an administrator.
    echo exiting...
    timeout /t 7
    exit
)