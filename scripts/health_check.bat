@echo off
set PORT=%1
set LOGFILE=health_log.txt
set TIMESTAMP=[%date% %time%]
curl -s -o nul -w "%%{http_code}" http://127.0.0.1:%PORT% > temp_status.txt
set /p STATUS=<temp_status.txt
del temp_status.txt

if "%STATUS%"=="200" (
    echo %TIMESTAMP% ✅ Server is UP on port %PORT% - Status: %STATUS% >> %LOGFILE%
) else (
    echo %TIMESTAMP% ❌ Server is DOWN or returning error on port %PORT% - Status: %STATUS% >> %LOGFILE%
)
