@echo off
set ENV=%1
set PORT=%2

echo %ENV% server running on port %PORT%...

cd /d "%~dp0..\production\%ENV%"

REM IMPORTANT: Replace the path below with the path to *your* Python environment's waitress-serve executable.
REM This is specific to your machine and may not work for others.
REM For example, it might be something like: "%USERPROFILE%\envs\myenv\Scripts\waitress-serve.exe"
"C:\Users\lipar\Typescript projects\DevOps\simple-devops-pipeline\.env\Scripts\waitress-serve.exe" --host=127.0.0.1 --port=%PORT% app:app
