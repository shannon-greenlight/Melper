@echo off
del .\melper_gerbers.zip
"C:\Program Files\7-Zip\7z.exe" a .\melper_gerbers.zip .\gerber\*.gbr
"C:\Program Files\7-Zip\7z.exe" a .\melper_gerbers.zip .\gerber\*.gbrjob
"C:\Program Files\7-Zip\7z.exe" a .\melper_gerbers.zip .\gerber\*.drl
pause
