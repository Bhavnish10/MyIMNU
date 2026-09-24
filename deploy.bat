@echo off
echo ============================================
echo   Nexus IMNU - Git & Firebase Deployer
echo ============================================
echo.
cd /d "D:\1. MBA\TimeTabe C\Timetable\New web"

:: Ask user for commit message
set /p msg="Enter commit message (or press Enter to skip Git push): "

if "%msg%"=="" (
    echo Skipping Git push. Proceeding to Firebase Deploy...
    goto deploy
)

echo.
echo [1/3] Adding changes to Git...
git add .

echo [2/3] Committing changes...
git commit -m "%msg%"

echo [3/3] Pushing to GitHub (main)...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo WARNING: Git push failed! (Check your credentials/scopes)
    echo.
) else (
    echo Push successful!
)

:deploy
echo.
echo Deploying to Firebase Hosting & Firestore...
call npx -y firebase-tools@latest deploy --only hosting,firestore
echo.
echo ============================================
echo   Done! Your site should be live at:
echo   https://nexus-imnu.web.app
echo ============================================
echo.
pause
