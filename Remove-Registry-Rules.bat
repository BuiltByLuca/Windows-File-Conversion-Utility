@echo off

NET SESSION >nul 2>&1
if %ERRORLEVEL% EQU 0 (

REG DELETE "HKCR\SystemFileAssociations\.jpg\Shell\WFCU" /f

echo ========== WFCU sucessfully Removed from registry ===========
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