@echo off

set j4n_verstion=8.9

copy .\bin-%j4n_verstion%\*.* artifacts
:: jni4net jar lib was not bult therefore 8.8 uses as 8.9
copy .\bin-8.8\jni4net.j-0.8.8.0.jar artifacts\jni4net.j-0.8.9.0.jar
artifacts\proxygen.exe artifacts\selenide-3.0.jar -wd artifacts
