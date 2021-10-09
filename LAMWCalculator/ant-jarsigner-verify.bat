set JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
path %JAVA_HOME%/bin;%path%
cd /home/guaracy/Dev/LAMWProjects/LAMWCalculator
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/LAMWCalculator/bin/LAMWCalculator-release.apk
