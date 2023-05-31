@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set "source_folder=%~dp0"

for %%F in ("%source_folder%\*.cpp") do (
    set "source_file=%%~dpnxF"
    set "output_file=%%~dpnF.exe"
    echo 正在编译 !source_file!...
    g++ -o "!output_file!" "!source_file!"
    if %errorlevel% equ 0 (
        echo 编译成功！！
    ) else (
        echo 编译失败！！
    )
    echo.
)

pause
endlocal
