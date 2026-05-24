@echo off
cls
cd /d %~dp0
setlocal enabledelayedexpansion
title IcyCMDownloader - v1.0.0
color B0
set "ZIP_URL=https://drive.usercontent.google.com/download?id=1UZM7KB0RX0aMbrBnreWvJg4DPZzRACPn&confirm=t&export=download"
set "ZIP_NAME=IcyCoolPak.zip"

echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

call :typewriter "ICY CMDOWNLOADER V1"
call :typewriter "Target File: IcyCoolPak (Folder)"
call :typewriter "Source: Google Drive [ZIP]"
call :typewriter "Ready to download :D"
echo.
echo ICYCMDOWNLOADER - MADE BY ICY
echo RETRIEVING FILE...

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Write-Host 'INITIATING DATA TRANSFER...' -ForegroundColor Cyan; Start-BitsTransfer -Source '%ZIP_URL%' -Destination '%ZIP_NAME%'"

echo.
call :typewriter "Archive downloaded!"
call :typewriter "IcyCoolPak.zip has been acquired."
call :typewriter "Decompressing archive..."

powershell -Command "Expand-Archive -Path '%ZIP_NAME%' -DestinationPath '%USERPROFILE%\Desktop\IcyCoolPak'"

echo SUCCESS!
call :typewriter "Decompression finished."
call :typewriter "IcyCoolPak has been acquired!"
call :typewriter "Thank you for using IcyCMDownloader :D"

pause
exit /b

:typewriter
set "str=%~1"

:: This block dynamically creates a real backspace character code in the 'BS' variable
for /F "tokens=1 delims=#" %%a in ('"prompt #$H# & echo on & for %%b in (1) do rem"') do set "BS=%%a"

for /L %%i in (0,1,100) do (
    set "char=!str:~%%i,1!"
    if "!char!"=="" echo. & goto :eof
    
    :: The Trick: If it's a space, output a dummy "x", rub it out with backspace, then print a space.
    if "!char!"==" " (
        <nul set /p "=x%BS% "
        ping -n 1 -w 1 127.0.0.1 >nul
    ) else (
        <nul set /p "=!char!"
        ping -n 1 -w 30 127.0.0.1 >nul
    )
)
goto :eof