setlocal

set SCRIPT=%~0
for /f "delims=\ tokens=*" %%z in ("%SCRIPT%") do (
  set SCRIPT_DRIVE=%%~dz
  set SCRIPT_PATH=%%~pz
  set SCRIPT_CURRENT_DIR=%%~dpz
)

SET VCDIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC
call "%VCDIR%\vcvarsall.bat" x86
rem call "%VCDIR%\vcvarsall.bat" x64

echo on

rmdir /s /q wxWidgets-3.1.0
7z x -o"wxWidgets-3.1.0" wxWidgets-3.1.0.zip

cd wxWidgets-3.1.0\build\msw
nmake /f makefile.vc BUILD=release RUNTIME_LIBS=static

endlocal
pause
