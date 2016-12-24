@echo off
setlocal enabledelayedexpansion

set cnt=0

for /f "tokens=4 delims= " %%i in ('findstr /i "public static voi" Test.java') do (
	set /a cnt=cnt+1
	set choic=%%~ni
	for /f "tokens=1 delims=(" %%b in ("!choic!") do (
		set choice[!cnt!]=%%~nb
	)
)

for /l %%i in (1,1,!cnt!) do (
	echo %%i.!choice[%%i]!
)

pause