:: --- General initialization --- ::
::@echo off

set j4n_verstion=8.9
set MSBuildVersion=v4.0.30319
set RootDirectory=%~dp0

md artifacts
md artifacts\bin
md artifacts\proxies\clr

:: --- Selenide --- ::
xcopy /E /Y "%RootDirectory%src\bin\*" %RootDirectory%artifacts\bin
xcopy /E /Y "%RootDirectory%src\proxies\*" %RootDirectory%artifacts\proxies\clr

:: --- jni4net --- ::
xcopy /E /Y %RootDirectory%bin-%j4n_verstion%\*.* artifacts

:: --- Go! --- ::
artifacts\proxygen.exe %RootDirectory%artifacts\bin\selenide-3.0.jar -wd %RootDirectory%artifacts\proxies\ -cp "%RootDirectory%artifacts\bin\guava-19.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\selenium-java-2.48.2.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\apache-mime4j-0.6.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\bsh-2.0b4.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\cglib-nodep-2.1_3.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-codec-1.10.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-collections-3.2.1.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-el-1.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-exec-1.3.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-io-2.4.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-lang3-3.4.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\commons-logging-1.2.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\cssparser-0.9.16.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\gson-2.3.1.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\guava-18.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\hamcrest-core-1.3.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\hamcrest-library-1.3.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\htmlunit-2.18.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\htmlunit-core-js-2.17.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\httpclient-4.5.1.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\httpcore-4.4.3.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\httpmime-4.5.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jasper-compiler-5.5.15.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jasper-compiler-jdt-5.5.15.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jasper-runtime-5.5.15.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\javax.servlet-api-3.1.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jcommander-1.48.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-continuation-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-http-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-io-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-jmx-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-security-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-server-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-servlet-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-servlets-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jetty-util-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jna-4.1.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jna-platform-4.1.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\jsp-api-2.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\junit-4.12.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\nekohtml-1.9.22.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\netty-3.5.7.Final.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\phantomjsdriver-1.2.1.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\sac-1.3.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\serializer-2.7.2.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\testng-6.9.6.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\websocket-api-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\websocket-client-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\websocket-common-9.2.13.v20150730.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\xalan-2.7.2.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\xercesImpl-2.11.0.jar;%RootDirectory%artifacts\bin\selenium-java-2.48.2\libs\xml-apis-1.4.01.jar"

:: CLR proxies library ::
C:\WINDOWS\Microsoft.NET\Framework\%MSBuildVersion%\MSBuild %RootDirectory%artifacts\proxies\clr\selenide-3.0.proxies.clr.csproj

:: Demo Test app ::
::C:\WINDOWS\Microsoft.NET\Framework\%MSBuildVersion%\MSBuild %RootDirectory%test\TestSelenideForNet\TestSelenideForNet.csproj /property:Configuration=Debug /property:Platform="x64"

pause