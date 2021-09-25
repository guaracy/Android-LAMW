export JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
cd /home/guaracy/Dev/LAMWProjects/lemur
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/lemur/build/outputs/apk/release/lemur-release.apk
