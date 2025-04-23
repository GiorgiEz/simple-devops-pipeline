@echo off
set ENV=%1
set PORT=%2

echo %ENV% server running on port %PORT%...

cd /d "%~dp0..\production\%ENV%"
"C:\Users\lipar\Typescript projects\DevOps\simple-devops-pipeline\.env\Scripts\waitress-serve.exe" --host=127.0.0.1 --port=%PORT% app:app
