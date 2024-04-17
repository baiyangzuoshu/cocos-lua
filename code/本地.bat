python ./MakeRes.py local nocache
rd /s /q .\simulator\win32\res\
rd /s /q .\simulator\win32\src\
XCOPY .\res .\simulator\win32\res\ /S/Y
XCOPY .\src .\simulator\win32\src\ /S/Y
pause