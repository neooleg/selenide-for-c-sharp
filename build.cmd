:: CLR proxies library ::
MSBuild .\src\proxies\clr\selenide-3.0.proxies.clr\selenide-3.0.proxies.clr.sln /property:Configuration=Debug /property:Platform="Any CPU"

:: Demo Test app ::
MSBuild .\test\TestSelenideForNet\TestSelenideForNet.sln /property:Configuration=Debug /property:Platform="x64"