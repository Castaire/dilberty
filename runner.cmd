
:: USAGE: sets your desktop background to today's Dilbert comic, if available

@ECHO off
ECHO "hello world, motherfuckers"

:: RUN SCRAPER TO GET IMAGE
python scraper.py > tmp
SET /p imgpath= < tmp
DEL tmp

SET imgpath=%~dp0%imgpath%
ECHO %imgpath%

:: MODIFY BACKGROUND
 reg add "HKCU\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d %imgpath%






