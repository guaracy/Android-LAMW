export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/SaveState
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/SaveState/build/outputs/apk/release/SaveState-release.apk
