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

echo.
echo Thanks for using HBuilder v2.01
pause