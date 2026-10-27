@echo off
cd /d "%~dp0"
start "Awka Direct MVP" http://localhost:8000
python -m http.server 8000
pause
