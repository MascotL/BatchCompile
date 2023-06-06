@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

rem 目标文件夹为 "%~dp0"（当前文件夹）
set "source_folder=%~dp0"

rem 设置颜色


rem 循环体编译c++
for %%F in ("%source_folder%\*.cpp") do (
    set "source_file=%%~dpnxF"
    set "output_file=%%~dpnF.exe"
    set "filename=%%~nF" 

    echo 正在编译 !filename!.cpp...
    
    rem 编译并将错误信息重定向到空设备
    g++ -o "!output_file!" "!source_file!" 2>nul
    
    rem 判断成功与否
    if exist "!output_file!" (
        echo 完成
    ) else (    
        echo 编译失败!!!
    )
    echo.
)

rem 循环体编译c
for %%F in ("%source_folder%\*.c") do (
    set "source_file=%%~dpnxF"
    set "output_file=%%~dpnF.exe"
    set "filename=%%~nF" 

    echo 正在编译 !filename!.cpp...
    
    rem 编译并将错误信息重定向到空设备
    gcc -o "!output_file!" "!source_file!" 2>nul
    
    rem 判断成功与否
    if exist "!output_file!" (
        echo 完成
    ) else (    
        echo 编译失败!!!
    )
    echo.
)
pause
endlocal
