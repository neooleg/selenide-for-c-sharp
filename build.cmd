set MSBuildVersion=v4.0.30319

:: CLR proxies library ::
C:\WINDOWS\Microsoft.NET\Framework\%MSBuildVersion%\MSBuild .\artifacts\proxies\clr\selenide-3.0.proxies.clr.csproj

:: Demo Test app ::
C:\WINDOWS\Microsoft.NET\Framework\%MSBuildVersion%\MSBuild .\test\TestSelenideForNet\TestSelenideForNet.sln /property:Configuration=Debug /property:Platform="x64"