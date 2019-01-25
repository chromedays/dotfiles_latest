@echo off
if not exist build (
    echo Build directory doesn't exist. Generating...
    mkdir build
)
if not exist code (
    echo Code directory doesn't exist. Generating...
    mkdir code
    echo Generating default main.c in code directory...
    type %userprofile%\default_main.c > code\main.c
)
if not exist data (
    echo Data directory doesn't exist. Generating...
    mkdir data
)
for %%a in ("%cd%") do set "curdir=%%~na" REM Get current directory name
echo Executing premake...
premake5 --file="%userprofile%\premake_single_proj.lua" --project_name="%curdir%" --abs_root_path=%cd%
