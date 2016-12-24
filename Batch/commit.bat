@echo off

echo adding files 
git status

set /p msg="Enter message to add while committing files: "

git add .
git commit -m "%msg%"

git push

pause