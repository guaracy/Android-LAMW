export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/GBMMenu
keytool -genkey -v -keystore gbmmenu-release.keystore -alias gbmmenu.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/GBMMenu/keytool_input.txt
