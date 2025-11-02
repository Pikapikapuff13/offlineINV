@echo off
:: =====================================================
:: Inventory Manager – Build Script (Windows .exe)
:: =====================================================
:: 1. Installs dependencies
:: 2. Builds standalone .exe with PyInstaller
:: 3. Cleans up temp files (optional)
:: =====================================================

echo.
echo =================================================
echo   BUILDING INVENTORY MANAGER (.EXE)
echo =================================================
echo.

:: --- Step 1: Upgrade pip ---
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    echo [ERROR] Failed to upgrade pip
    pause
    exit /b %errorlevel%
)

:: --- Step 2: Install required packages ---
echo.
echo Installing PySide6, openpyxl, PyInstaller...
pip install PySide6 openpyxl PyInstaller
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install packages
    pause
    exit /b %errorlevel%
)

:: --- Step 3: Build .exe with PyInstaller ---
echo.
echo Building standalone .exe...
pyinstaller ^
    --onefile ^
    --windowed ^
    --name InventoryApp ^
    --icon=resources\icon.png ^
    --add-data "resources;resources" ^
    --clean ^
    main.py

if %errorlevel% neq 0 (
    echo [ERROR] PyInstaller failed
    pause
    exit /b %errorlevel%
)

:: --- Step 4: Success Message ---
echo.
echo =================================================
echo   BUILD SUCCESSFUL!
echo =================================================
echo.
echo Your executable is here:
echo   dist\InventoryApp.exe
echo.
echo You can now:
echo   - Upload dist\InventoryApp.exe to GitHub Releases
echo   - Share it directly with users
echo.
echo (Optional) Delete build/ and __pycache__/ folders to clean up.
echo.

pause