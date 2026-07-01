@echo off
echo ============================================
echo   Nexus IMNU - Firebase Deployment Script
echo ============================================
echo.
cd /d "D:\1. MBA\TimeTabe C\Timetable\New web"
echo Deploying to Firebase Hosting...
echo.
call npx -y firebase-tools@latest deploy --only hosting,firestore
echo.
echo ============================================
echo   Done! Your site should be live at:
echo   https://nexus-imnu.web.app
echo ============================================
echo.
pause
