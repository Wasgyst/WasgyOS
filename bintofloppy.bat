@echo off
:menu
title File2Floppy
color 1f
mode con: cols=80 lines=25
cls
echo ================================================================================
echo ================================File2Floppy=====================================
echo =1. Convert=====================================================================
echo =2. Exit========================================================================
echo ================================================================================
choice /c 12 /n /m "Input: "
if errorlevel 2 goto exit
if errorlevel 1 goto compilemenu1
:compilemenu1
cls
set /p file=Which File (Or Path2File): 
if not exist "%file%" (
echo %file% Doesnt Exist.
pause
goto menu
)
cls
echo ================================================================================
echo ==============================Now Converting...=================================
echo ================================================================================
dd if=/dev/zero of=floppy.img bs=512 count=2880
if errorlevel 1 goto fail
dd if=%file% of=floppy.img
if errorlevel 1 goto fail
goto success
:fail
color 4f
cls
echo ================================================================================
echo =================================Convert Failed=================================
echo ================================================================================
pause
goto exit
:success
color 2f
cls
echo ================================================================================
echo ==============================Convert Succeded==================================
echo ================================================================================
pause
goto exit
:exit
exit