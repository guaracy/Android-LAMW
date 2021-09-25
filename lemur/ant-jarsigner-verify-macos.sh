export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/lemur
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/lemur/bin/lemur-release.apk
