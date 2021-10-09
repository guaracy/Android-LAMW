set JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
set PATH=%JAVA_HOME%/bin;%PATH%
set JAVA_TOOL_OPTIONS=-Duser.language=en
cd /home/guaracy/Dev/LAMWProjects/LAMWCalculator
keytool -genkey -v -keystore lamwcalculator-release.keystore -alias lamwcalculator.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/LAMWCalculator/keytool_input.txt
:Error
echo off
cls
echo.
echo Signature file created previously, remember that if you delete this file and it was uploaded to Google Play, you will not be able to upload another app without this signature.
echo.
pause
