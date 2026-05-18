@echo off
setlocal enabledelayedexpansion

set "DESTROOT=U:\zaloha-C"
set "USER=%USERNAME%"
set "SRC=C:\Users\%USER%"

REM === Datum/čas: YYYY-MM-DD_HHMM ===
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HHmm"') do set "STAMP=%%i"

set "DST=%DESTROOT%\%USER%\HISTORIE\%STAMP%"
set "LOG=%DST%\backup_%STAMP%.log"

if not exist "%DST%" mkdir "%DST%"

REM === Kopíruj změny: /E + /XO (exclude older) => jen nové/změněné ===
robocopy "%SRC%\Desktop"   "%DST%\Desktop"   /E /XO /R:1 /W:1 /XJ /FFT /Z /NP /TEE /LOG:"%LOG%"
robocopy "%SRC%\Documents" "%DST%\Documents" /E /XO /R:1 /W:1 /XJ /FFT /Z /NP /TEE /LOG+:"%LOG%"
robocopy "%SRC%\Pictures"  "%DST%\Pictures"  /E /XO /R:1 /W:1 /XJ /FFT /Z /NP /TEE /LOG+:"%LOG%"
robocopy "%SRC%\Downloads" "%DST%\Downloads" /E /XO /R:1 /W:1 /XJ /FFT /Z /NP /TEE /LOG+:"%LOG%"

echo Hotovo. Historie: "%DST%"
exit /b 0
