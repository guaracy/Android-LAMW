export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/lemur
keytool -genkey -v -keystore lemur-release.keystore -alias lemur.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/lemur/keytool_input.txt
