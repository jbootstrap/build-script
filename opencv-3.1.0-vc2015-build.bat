SETLOCAL

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

set BUILD=build

cd /d %SCRIPT_CURRENT_DIR%

rmdir /s /q opencv-3.1.0
7z x opencv-3.1.0.zip

cd opencv-3.1.0
rmdir /s /q %BUILD%
mkdir %BUILD%
cd %BUILD%

cmake -G "Visual Studio 14 2015" -DBUILD_SHARED_LIBS="0" ..
devenv OpenCV.sln /build Release /project INSTALL

ENDLOCAL
PAUSE
