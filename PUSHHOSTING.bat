@echo off
chcp 65001 >nul
cd /d "G:\Mój dysk\.AI PROJEKTY\Stronyai\EKMASSAGE - EMIL KOGUT"

echo Sprawdzam konfigurację Git...
git remote -v | findstr origin >nul 2>&1
if errorlevel 1 (
    echo.
    echo BŁĄD: Nie skonfigurowano zdalnego repozytorium 'origin'!
    echo.
    echo Aby dodać origin, wykonaj:
    echo git remote add origin URL_DO_TWOJEGO_REPOZYTORIUM
    echo.
    echo Przykłady:
    echo - GitHub:    git remote add origin https://github.com/UZYTKOWANIE/REPO.git
    echo - GitLab:    git remote add origin https://gitlab.com/UZYTKOWANIE/REPO.git
    echo - Bitbucket: git remote add origin https://bitbucket.org/UZYTKOWANIE/REPO.git
    echo.
    pause
    exit /b 1
)

echo.
echo === Wgrywanie zmian na hosting ===
echo.

git pull origin main --no-rebase
if errorlevel 1 (
    echo.
    echo Ostrzeżenie: Nie udało się pobrać zmian z remote
    echo.
)

git add .
git commit -m "Aktualizacja %date% %time%"
if errorlevel 1 (
    echo.
    echo Brak zmian do commitowania
    echo.
)

git push origin main
if errorlevel 1 (
    echo.
    echo BŁĄD: Nie udało się wypchnąć zmian!
    echo Sprawdź czy masz uprawnienia do repozytorium.
    echo.
    pause
    exit /b 1
)

echo.
echo Gotowe! Strona zaktualizowana.
pause
