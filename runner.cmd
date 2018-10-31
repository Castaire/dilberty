
:: USAGE: sets your desktop background to today's Dilbert comic, if available
:: WARNING: will need to refresh desktop to see changes :()

@ECHO off
ECHO "hello world, motherfuckers"

:: run scraper to get image
python scraper.py > tmp
SET /p imgpath= < tmp
DEL tmp

SET imgpath=%~dp0%imgpath%
ECHO %imgpath%

:: modify background
REG add "HKCU\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d %imgpath%

:: refreshing background cache to display new background (as suggested by Vexxt)
:: (https://www.reddit.com/r/sysadmin/comments/7akhyl/most_outlandish_request/dpbh3hw)
RMDIR /s /q "%APPDATA%\Microsoft\Windows\Themes\CachedFiles"
DEL /f /s /q "%APPDATA%\Microsoft\Windows\Themes\*.*"

:: update user parameters
%windir%\System32\RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1,True


