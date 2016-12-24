@echo off
setlocal enabledelayedexpansion

set cnt=0
set vcnt=0
FOR /f "tokens=* delims=" %%A IN ('DIR /b /s /o:gen bower.json') DO (
	for /f "tokens=2 delims=:," %%i in ('findstr /i "name" %%A') do (
		set /a cnt=cnt+1
		set choic=%%~i
		for /f %%b in ("!choic!") do (
			set choice[!cnt!]=%%~b
		)
	)
	for /f "tokens=2 delims=:," %%k in ('findstr /i "version" %%A') do (
		set choc=%%~k
		for /f %%c in ("!choc!") do (
			set choce[!cnt!]=%%~c
		)
	)
)

for /l %%i in (1,1,!cnt!) do (
		echo "!choice[%%i]!": "!choice[%%i]!#!choce[%%i]!">>versions.csv
		
)
versions.csv
pause