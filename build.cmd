:: --- General initialization --- ::
::@echo off
Setlocal EnableDelayedExpansion

set j4n_version=8.9
set MSBuildVersion=14.0
set RootDirectory=%~dp0


rmdir artifacts /s /q
md artifacts
md artifacts\proxies\clr

:: --- Selenide --- ::
cd %RootDirectory%src\bin\
for /r %%f in (*.*) do copy %%f "%RootDirectory%artifacts"
cd %RootDirectory%

cd %RootDirectory%artifacts
set proxygenParameters=
for %%f in (*.jar) do ( if /I "%%f" neq "selenide-3.0.jar" ( if "%%f" neq "selenide-3.0.proxies.clr.jar" (set proxygenParameters=!proxygenParameters!.\artifacts\%%f;) else (echo %%f)))
set proxygenParameters=%proxygenParameters:~0,-1%
cd %RootDirectory%

xcopy /E /Y "%RootDirectory%src\proxies\*" %RootDirectory%artifacts\proxies\clr

:: --- jni4net --- ::
xcopy /E /Y %RootDirectory%bin-%j4n_version%\*.* artifacts

:: --- Go! --- ::
artifacts\proxygen.exe artifacts\selenide-3.0.jar -wd artifacts\proxies -cp "%proxygenParameters%"

:: CLR proxies library ::
"C:\Program Files (x86)\MSBuild\%MSBuildVersion%\Bin\MSBuild" %RootDirectory%artifacts\proxies\clr\selenide-3.0.proxies.clr.csproj

:: Demo Test app ::
"C:\Program Files (x86)\MSBuild\%MSBuildVersion%\Bin\MSBuild" %RootDirectory%test\TestSelenideForNet\TestSelenideForNet.csproj /t:build /property:Configuration=Debug /property:Platform="x64" 

pause