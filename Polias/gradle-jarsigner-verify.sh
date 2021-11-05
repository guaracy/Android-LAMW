export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
cd /home/guaracy/android/projects/Polias
jarsigner -verify -verbose -certs /home/guaracy/android/projects/Polias/build/outputs/apk/release/Polias-release.apk
