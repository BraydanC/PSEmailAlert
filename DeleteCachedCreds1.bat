:: Please run 'if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "X:\path\DeleteCachedCreds1.bat" %* && exit' first in batch file
:: Above batch file launches this batch script in a minimized window
:: Please update the file path and @TIMEOUT settings as you see fit. 
:: @TIMEOUT setting is set for 60 minutes (in seconds)
@echo off
cmdkey.exe /list > "X:\path\List.txt"
findstr.exe Target "X:\path\List.txt" > "X:\path\tokens.txt"
@TIMEOUT /T 3600 /NOBREAK
FOR /F "tokens=1,2 delims= " %%G IN (X:\path\tokens.txt) DO cmdkey.exe /delete:%%H
del "X:\path\List.txt" /s /f /q
del "X:\path\tokens.txt" /s /f /q
echo Complete.
exit