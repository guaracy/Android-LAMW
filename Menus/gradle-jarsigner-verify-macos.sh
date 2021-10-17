export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/GBMMenu
jarsigner -verify -verbose -certs /home/guaracy/Dev/LAMWProjects/GBMMenu/build/outputs/apk/release/GBMMenu-release.apk
