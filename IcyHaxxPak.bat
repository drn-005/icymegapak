@echo off
setlocal enabledelayedexpansion
title IcyHaxxPak TUI - v1.0.0
color B0

:: Dynamic user profile targeting for portable distribution
set "PAK_DIR=%USERPROFILE%\Desktop\IcyCoolPak"

:: App Paths
set "RETROARCH=C:\RetroArch-Win64\retroarch.exe"
set "VLC=%PAK_DIR%\Media\vlc-3.0.23-win32\vlc-3.0.23\vlc.exe"
set "SUMATRA=%PAK_DIR%\Literature\SumatraPDF-3.6.1-64.exe"

:MAIN_MENU
cls
echo.
:: Bulletproof rendering: Safely grabs the raw text from the bottom of this file
powershell -NoProfile -Command "Get-Content '%~f0' | Where-Object { $_ -like '#LOGO:*' } | ForEach-Object { $_.Substring(6) }"
echo.
echo =====================================================================
echo                         CHOOSE YOUR PAK
echo =====================================================================
echo.
echo     1) Games
echo     2) Media
echo     3) Literature (Launch SumatraPDF)
echo     4) Exit
echo.
choice /c 1234 /n /m "Select an option (1-4): "

if errorlevel 4 exit /b
if errorlevel 3 goto :LAUNCH_LITERATURE
if errorlevel 2 goto :MEDIA_MENU
if errorlevel 1 goto :GAMES_MENU
goto :MAIN_MENU


:GAMES_MENU
cls
echo.
echo =====================================================================
echo                     WHICH GAME DO YOU WANT TO PLAY?
echo =====================================================================
echo.
echo     1) Super Mario Bros. (NES)
echo     2) Tetris (Game Boy)
echo     3) Pac-Man (Arcade)
echo     4) Mega Man (NES)
echo     5) Final Fantasy I/II (GBA)
echo     6) Go Back
echo.
choice /c 123456 /n /m "Select a game (1-6): "

if errorlevel 6 goto :MAIN_MENU
if errorlevel 5 start "" "%RETROARCH%" -L "mgba_libretro.dll" "%PAK_DIR%\Games\Final Fantasy I & II - Dawn of Souls (USA).zip" & goto :GAMES_MENU
if errorlevel 4 start "" "%RETROARCH%" -L "quicknes_libretro.dll" "%PAK_DIR%\Games\Mega Man (USA).zip" & goto :GAMES_MENU
if errorlevel 3 start "" "%RETROARCH%" -L "mame2003_plus_libretro.dll" "%PAK_DIR%\Games\pacman.zip" & goto :GAMES_MENU
if errorlevel 2 start "" "%RETROARCH%" -L "gambatte_libretro.dll" "%PAK_DIR%\Games\Tetris (World) (Rev 1).zip" & goto :GAMES_MENU
if errorlevel 1 start "" "%RETROARCH%" -L "quicknes_libretro.dll" "%PAK_DIR%\Games\Super Mario Bros. (World).zip" & goto :GAMES_MENU


:MEDIA_MENU
cls
echo.
echo =====================================================================
echo                     WHICH MEDIA DO YOU WANT TO PLAY?
echo =====================================================================
echo.
echo     [MOVIES]
echo     1) Pixels (2015) Movie
echo.
echo     [SONGS]
echo     2) Smells Like Teen Spirit - Nirvana
echo     3) Machine Love - JaimeP (feat. Kasane Teto)
echo     4) Sburban Jungle - Michael Guy Bowman
echo     5) MEGALOVANIA - Toby Fox
echo     6) Bad Apple!! - ZUN (feat. Nomico)
echo.
echo     7) Go Back
echo.
choice /c 1234567 /n /m "Select media (1-7): "

if errorlevel 7 goto :MAIN_MENU
if errorlevel 6 start "" "%VLC%" "%PAK_DIR%\Media\Music\Bad Apple!!.mp3" & goto :MEDIA_MENU
if errorlevel 5 start "" "%VLC%" "%PAK_DIR%\Media\Music\MEGALOVANIA.mp3" & goto :MEDIA_MENU
if errorlevel 4 start "" "%VLC%" "%PAK_DIR%\Media\Music\Sburban Jungle.mp3" & goto :MEDIA_MENU
if errorlevel 3 start "" "%VLC%" "%PAK_DIR%\Media\Music\Machine Love.mp3" & goto :MEDIA_MENU
if errorlevel 2 start "" "%VLC%" "%PAK_DIR%\Media\Music\Smells Like Teen Spirit.mp3" & goto :MEDIA_MENU
if errorlevel 1 start "" "%VLC%" "%PAK_DIR%\Media\Pixels (Full movie in English) [Xs4xd5kRcQY].webm" & goto :MEDIA_MENU


:LAUNCH_LITERATURE
start "" "%SUMATRA%" "%PAK_DIR%\Literature\The.Homestuck.Epilogues.-.Andrew.Hussepilogues.epub"
goto :MAIN_MENU

:: Code processing stops here. The lines below are isolated as raw text data assets.
exit /b

#LOGO:  _____            _    _                    _____          _    
#LOGO: |_   _|          | |  | |                  |  __ \        | |   
#LOGO:   | |   ___ _   _| |__| | __ _ __  ____  __| |__) | __ _  | | __ 
#LOGO:   | |  / __| | | |  __  |/ _` |\ \/ /\ \/ /|  ___/ / _` | | |/ / 
#LOGO:  _| |_| (__| |_| | |  | | (_| | >  <  >  < | |    | (_| | |   <  
#LOGO: |_____\___|\__,  |_|  |_|\__,_//_/\_\/_/\_\|_|     \__,_|_|_|\_\
#LOGO:             __/ /                                              
#LOGO:            |___/                                               
