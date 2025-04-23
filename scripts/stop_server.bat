@echo off
set ENV=%1
set PORT=%2

echo Attempting to stop %ENV% server running on port %PORT%...

:: Find the PID of the process using the port
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :%PORT% ^| findstr LISTENING') do (
    echo Found process with PID %%a using port %PORT%
    taskkill /F /PID %%a
    echo Successfully stopped %ENV% server on port %PORT%
    goto :done
)

echo No process found using port %PORT%

:done
