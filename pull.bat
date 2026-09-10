@echo off
setlocal EnableExtensions
cd /d "%~dp0"

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo Error: not a git repository.
  exit /b 1
)

for /f "usebackq tokens=*" %%B in (`git rev-parse --abbrev-ref HEAD`) do set "BRANCH=%%B"
if /I "%BRANCH%"=="HEAD" (
  echo Error: detached HEAD; checkout a branch first.
  exit /b 1
)

git fetch origin
if errorlevel 1 exit /b 1

git pull origin "%BRANCH%"
if errorlevel 1 (
  echo Conflict with origin/%BRANCH%; discarding local changes.
  git merge --abort >nul 2>&1
  git rebase --abort >nul 2>&1
  git reset --hard "origin/%BRANCH%"
  if errorlevel 1 exit /b 1
  git clean -fd
  if errorlevel 1 exit /b 1
)

echo OK: pulled %BRANCH%.
exit /b 0
