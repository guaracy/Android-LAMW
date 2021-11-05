export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/android/projects/Polias
keytool -genkey -v -keystore polias-release.keystore -alias polias.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/android/projects/Polias/keytool_input.txt
