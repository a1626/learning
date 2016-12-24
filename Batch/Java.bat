:: Author Abhishek_gupta54


@echo off

:begin
set JAVA_HOME=D:\software\java\java\jdk1.7.0_11
set M2_HOME=D:\software\maven-2.2.1-maestro-2.3.0
set project_home=%cd%
set PATH=%JAVA_HOME%\bin;%PATH%;%M2_HOME%\bin
::set MAVEN_OPTS=-Xmx512m
::set JAVA_OPTS=-Xmx512m

IF "%JAVA_HOME%"=="" goto jError
IF "%M2_HOME%"=="" goto mError

Echo If you don't want to keep batch in your project home give your project home location in Line 9 in batch
echo.
Echo This Project Uses Default JAVA_HOME and M2_HOME IF You Want to Use Different one pleases update line 7 and/or 8 respectively
echo.

IF %project_home:~2,1%==: set drive=%project_home:~1,2%
IF %project_home:~1,1%==: set drive=%project_home:~0,2%
%drive%
goto main


:jError
echo.
echo Java home not found
echo you can set java home in batch file by uncommenting(remove ::) line 7
pause
goto exit


:mError
echo.
echo Maven home not found
echo you can set java home in batch file by uncommenting(remove ::) line 8
pause
goto exit


:main
echo.
echo Entering Main
cd %project_home%
goto :mvn

:mvn
set comnd=""
echo.
echo 1.Install APP Skip Test and Offline
echo 2.Install APP Offline
echo 3.Install APP
echo 4.Install APP Skip Test
echo 5.Package APP
echo 6.Install APP with Debug Logs Skip Test
echo 7.Install APP with Error Logs Skip Test
echo 8.Install APP with Arguments
echo 9.Run Custom Command
echo 10.Goto Project Module
echo 11.Exit Batch File Only
echo 12.Exit Command Prompt

echo.
set /p comnd="Enter your choice:"
IF NOT %ErrorLevel%==0 goto wrnNbr
IF %comnd% leq 0 goto wrnNbr
IF %comnd% geq 13 goto wrnNbr
IF %comnd%==12 goto exit
IF %comnd%==11 goto continue
IF %comnd%==10 goto RDPServer
IF %comnd%==9 goto custom
IF %comnd%==8 goto args
IF %comnd%==7 goto error
IF %comnd%==6 goto debug
IF %comnd%==5 goto package
IF %comnd%==4 goto online_noTest
IF %comnd%==3 goto online
IF %comnd%==2 goto Install_app
IF %comnd%==1 goto no_test
goto start



:output
echo.
echo Where to Print Output
echo 1. Console
echo 2.	Text File

set /p file="Enter your choice: "

IF NOT %ErrorLevel%==0 goto wrnNbr
if %file%==2 call :validate else exit /b
exit /b



:package
echo.
call :output
echo command being executed is "mvn clean package"
echo %file%
pause
IF %file%==2 (
	call mvn clean package>%fileName% 
) else (
	call mvn clean package
)
IF NOT %fileName%="" start fileName
goto start

:wrnNbr
echo.
echo Please enter correct option
echo.
set ErrorLevel=0
goto start


:appOnly
echo.
echo command being executed is "mvn clean install -N"
call mvn clean install -N
goto start


:debug
echo.
echo command being executed is "mvn clean install -Dmaven.test.skip=true -X"
call mvn clean install -Dmaven.test.skip=true -X
goto start


:error
echo.
echo command being executed is "mvn clean install -Dmaven.test.skip=true -e"
call mvn clean install -Dmaven.test.skip=true -e
goto start


:args
echo.
echo Give the Argument to Pass
set /p arg=?
echo command being executed is "mvn clean install %arg%"
call mvn clean install %arg%
goto start


:RDPServer
echo.
SETLOCAL ENABLEDELAYEDEXPANSION
set count=-1
set mod=""
::searching folder
FOR /f "tokens=* delims=" %%i IN ('DIR /b /s /o:gen pom.xml') DO (
    SET /a count=count+1
    SET folder[!count!]=%%~dpi
)

::printing folder names
FOR /l %%i IN (1,1,!count!) DO (
	set mod=!folder[%%i]:~0,-1!
	FOR /f "tokens=* delims=" %%B IN ("!mod!") DO SET mod=%%~nxB 
		echo %%i.!mod!
)

IF "!mod!"=="" goto mvn
::IF "!mod!"=="~0,-1" goto mvn

echo.
echo select the folder to enter
set /p select=

set /a nxtCount=count+1
IF NOT %ErrorLevel%==0 goto rptModule
IF %select% leq 0 goto rptModule
IF %select% geq %nxtCount% goto rptModule

::Printing selected folder
set mod=!folder[%select%]:~0,-1!
FOR /f "tokens=* delims=" %%B IN ("!mod!") DO SET mod=%%~nxB
	echo.
	echo Entering !mod!

cd !folder[%select%]!
SETLOCAL DISABLEDELAYEDEXPANSION
goto module
goto start


:rptModule
echo.
echo please choose correct option
echo.
set ErrorLevel=0
goto RDPServer


:module
set cmmand=""
echo.
echo 1.Install %mod% Skip Test and Offline
echo 2.Install %mod% Offlline
echo 3.Test %mod% Single Test Class Offline
echo 4.Test %mod% Single Test Case Offline
echo 5.Package %mod%
echo 6.Install %mod% with Debug Logs Skip Test
echo 7.Install %mod% with Error Logs Skip Test
echo 8.Install %mod% with Arguments
echo 9.Run Custom Command
echo 10.Goto Main 
echo 11.Goto Other Module
echo 12.Exit Batch File Only
echo 13.Exit Command Prompt

echo.
set /p cmmand="Enter your choice:"
IF NOT %ErrorLevel%==0 goto wrnNbr
IF %cmmand% leq 0 goto wrnNbr
IF %cmmand% geq 14 goto wrnNbr
IF %cmmand%==13 goto exit
IF %cmmand%==12 goto continue
IF %cmmand%==11 goto RDPWS
IF %cmmand%==10 goto main
IF %cmmand%==9 goto custom
IF %cmmand%==8 goto args
IF %cmmand%==7 goto error
IF %cmmand%==6 goto debug
IF %cmmand%==5 goto package
IF %cmmand%==4 goto single_case
IF %cmmand%==3 goto single_class
IF %cmmand%==2 goto Install_app
IF %cmmand%==1 goto no_test
goto start


:custom
echo.

set /p command="Enter the command to run"
echo command being executed is "%command%"
call %command%
echo.
goto start


:RDPWS
cd..
goto RDPServer


:no_test
echo.
echo command being executed is "mvn clean install -Dmaven.test.skip=true --offline"
call mvn clean install -Dmaven.test.skip=true --offline
echo.
goto start


:Install_app
echo.
echo command being executed is "mvn clean install --offline"
call mvn clean install --offline
echo.
goto start


:online
echo.
echo command being executed is "mvn clean install"
call mvn clean install
echo.
goto start


:external
echo.
call :validate
echo command being executed is "mvn clean install --offline>>%filePath%\%fileName%"
call mvn clean install --offline>>%filePath%\%fileName%
start %filePath%\%fileName%
echo.
goto start


:online_external
echo.
call :validate
echo command being executed is "mvn clean install>>%filePath%\%fileName%"
call mvn clean install >>%filePath%\%fileName%
start %filePath%\%fileName%
echo.
goto start


:online_noTest
echo.
echo command being executed is "mvn clean install -Dmaven.test.skip=true"
call mvn clean install -Dmaven.test.skip=true
echo.
goto start


:single_case
set sCase=Y
goto print_class


:single_class
set sCase=""
goto print_class


:print_class
echo.

setlocal enabledelayedexpansion
set cnt=0

::read_file_names
for /f %%i in ('dir /s /b Test*.java') do (
    set /a cnt=cnt+1
    set choice[!cnt!]=%%~ni
	set pth[!cnt!]=%%~i
)

::print_file_names
for /l %%i in (1,1,!cnt!) do (
     echo  %%i.!choice[%%i]!
)

echo.
echo This option will not work if you are using Surefire 2.12
echo Give option as -1 to go back
echo.
set/p slct="Choose which Test class to run"
set /a nxtCnt=cnt+1
IF NOT %ErrorLevel%==0 goto rptSingle
IF %slct%==-1 goto start
IF %slct% leq 0 goto rptSingle
IF %slct% geq %nxtCnt% goto rptSingle

goto chk_single


:chk_single
IF %sCase%==Y goto single_test 
goto run_single_class


:single_test
set ct=0

for /f "tokens=3 delims= " %%i in ('findstr /i " void " !pth[%slct%]!') do (
	set /a ct=ct+1
	set choic=%%~ni
	
	for /f "tokens=1 delims=(" %%b in ("!choic!") do (
		set chice[!ct!]=%%~nb
	)
)

for /l %%i in (1,1,!ct!) do (
	echo %%i.!chice[%%i]!
)

set /p sct="Enter the Test Case That You Want to Test"
set /a nxtct=ct+1

IF NOT %ErrorLevel%==0 goto rptTest
IF %sct% leq 0 goto rptTest
IF %sct% geq %nxtct% goto rptTest

echo command being executed is "mvn test -Dtest=!choice[%slct%]!#!chice[%sct%]! -offline"
call mvn test -Dtest=!choice[%slct%]!#!chice[%sct%]! -offline
::start %filePath%\%fileName%
setlocal disabledelayedexpansion
echo.
goto start



:run_single_class
call :validate
echo command being executed is "mvn cobertura:cobertura -Dtest=!choice[%slct%]! -offline"
call mvn cobertura:cobertura -Dtest=!choice[%slct%]! -offline
::start %filePath%\%fileName%
setlocal disabledelayedexpansion
echo.
goto start


:rptTest
echo.
echo Please choose correct option
echo.
set ErrorLevel=0
goto single_test


:rptSingle
echo.
echo Please choose correct option
echo.
set ErrorLevel=0
goto print_class


:update_sinlge
echo.
echo command being executed is "mvn release:update-versions -DautoVersionSubmodules=false"
call mvn release:update-versions -DautoVersionSubmodules=false
echo.
goto start

:continue
echo.
cmd /k


:exit
exit


:validate
Set filePath=D:\MVN\%date:~-10,2%.%date:~-7,2%.%date:~-4,4%
IF NOT EXIST %filePath% mkdir %filePath%
Set fileName=%const%%filePath%\%time:~-11,2%.%time:~-8,2%.%time:~-5,2%.log
exit /b


:start
call :clear

If %cd%==%project_home% goto mvn
IF NOT %cd%==%project_home% goto module


:clear
set fileName=""
set filePath=""
set sct=""
set chice=""
set choic=""
set ct=""
set sCase=""
set slct=""
set nxtCnt=""
set cnt=""
set pth=""
set choice=""
set cnt=""
set cmmand=""
set nxtCount=""
set select=""
set folder=""
set count=""
set arg=""
set comnd=""
set nxtct=""
set file=""

exit /b


:update
echo.
echo command being executed is "mvn release:update-versions -DautoVersionSubmodules=true"
call mvn release:update-versions -DautoVersionSubmodules=true
echo.
goto start