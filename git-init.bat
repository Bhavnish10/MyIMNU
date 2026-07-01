@echo off
cd /d "D:\1. MBA\TimeTabe C\Timetable\New web"

echo Cleaning up old git data...
rmdir /s /q .git 2>nul

echo Initializing Git repository...
git init

echo Configuring Git identity...
git config user.email "bhavnishnanda9933@gmail.com"
git config user.name "Bhavnish Nanda"

echo Adding files...
git add .

echo Committing...
git commit -m "Initial commit - MyIMNU campus web app"

echo Setting up remote...
git branch -M main
git remote add origin https://github.com/Bhavnish10/MyIMNU.git

echo Pushing to GitHub...
git push -u origin main

echo.
echo ========================================
echo   Done! Check github.com/Bhavnish10/MyIMNU
echo ========================================
pause
