@echo off

echo (HBuilder) Setting up environement

:: Setting title because we're cool
title HBuilder v2.01 by xTrM_

:: Setup project var by getting
:: the last folder's (parent) name
for /D %%I in ("%CD%") do set project=%%~nxI


:: Cleaning old build files
echo (HBuilder) Cleaning old files
if exist "out" rm -r out
if exist "build" rm -r build

:: Executing Makefile
echo (HBuilder) Executing Makefile
make

:: Test if Makefile has failed
if exist "%project%.elf" goto :skip

:: Has failed, probably because
:: the path has spaces in it
rm -r "build"

echo.
echo.
echo.
echo Makefile has failed. A common issue is to have spaces 
echo or illegal characters in the Makefile path.
echo.
echo Ex: C:/Users/Me/Desktop/Switch Development/hb_dev/Makefile isn't allowed
echo     C:/Users/Me/Desktop/Switch-Development/hb_dev/Makefile is allowed
echo.
pause
exit

:skip

:: Creating the out folder
echo (HBuilder) Creating out folder
mkdir out

:: Moving the nro (or other) 
:: file(s) to the out folder
echo (HBuilder) Moving the generated files
mv %project%.nro out/%project%.nro

::mv %project%.elf out/%project%.elf

:: Removing useless files
echo (HBuilder) Removing useless files
rm %project%.*

echo.
echo Thanks for using HBuilder v2.01

pause