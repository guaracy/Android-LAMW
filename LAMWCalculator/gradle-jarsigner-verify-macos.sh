export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/LAMWCalculator
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/LAMWCalculator/build/outputs/apk/release/LAMWCalculator-release.apk
