@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

FOR /f "tokens=* delims=" %%A IN ('DIR /b /s /o:gen *.ath') DO (
    SET folder=%%~dpA
    SET folder=!folder:~0,-1!
    FOR /f "tokens=* delims=" %%B IN ("!folder!") DO SET folder=%%~nxB 
    ECHO !folder! 
)

IF "!folder!"=="" echo 1

EXIT /B