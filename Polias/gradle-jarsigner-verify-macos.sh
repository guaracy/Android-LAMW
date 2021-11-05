export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/android/projects/Polias
jarsigner -verify -verbose -certs /home/guaracy/android/projects/Polias/build/outputs/apk/release/Polias-release.apk
