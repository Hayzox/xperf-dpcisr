@echo off
title xperf-dpcisr - github.com/hayzox
echo xperf-dpcisr-script
echo.
set /p time=How many second(s) do you want to record? 
%~dp0\data\xperf.exe -on base+interrupt+dpc
cls
echo xperf-dpcisr-script
echo.
echo Recording for %time% second(s). Press any key to skip.
timeout %time% > nul
xperf -d %~dp0\report\trace.etl
xperf -i %~dp0\report\trace.etl -o %~dp0\report\report.txt -a dpcisr
cls
echo xperf-dpcisr-script
echo.
echo Recording finished. Press any key to exit.
pause > nul
start "" notepad "%~dp0\report\report.txt"
exit
