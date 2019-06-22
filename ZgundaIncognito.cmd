@echo off
setlocal

SET TargetUrl=%*

:TryCreateTempFolder
	:: Create the variable based on the current time
	SET TempFolder=tmp%Date%%Time%
	SET TempFolder=%TempFolder::=%
	SET TempFolder=%TempFolder:.=%
	SET TempFolder=%TempFolder:,=%
	SET TempFolder=%TempFolder: =%
	SET TempFolder=%TempFolder:-=%
	SET TempFolder=%TempFolder:/=%
	SET TempFolder=%TempFolder%
	:: If the folder already exists loop back up
	IF EXIST "%LOCALAPPDATA%.\Google\Chrome\%TempFolder%" (GOTO TryCreateTempFolder) ELSE (md %LOCALAPPDATA%.\Google\Chrome\%TempFolder%)

echo %LOCALAPPDATA%.\Google\Chrome\%TempFolder%

start "" /WAIT "%ProgramFiles(x86)%.\Google\Chrome\Application\chrome.exe" --user-data-dir="%LOCALAPPDATA%.\Google\Chrome\%TempFolder%" --start-maximized --no-first-run --homepage "chrome:blank" --incognito %TargetUrl%

"%~dp0.\sdelete.exe" -accepteula -s -q "%LOCALAPPDATA%.\Google\Chrome\%TempFolder%\*"

rmdir "%LOCALAPPDATA%.\Google\Chrome\%TempFolder%" /s /q
