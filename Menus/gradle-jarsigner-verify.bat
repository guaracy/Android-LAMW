set JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
path %JAVA_HOME%/bin;%path%
cd /home/guaracy/Dev/LAMWProjects/GBMMenu
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/GBMMenu/build/outputs/apk/release/GBMMenu-release.apk
