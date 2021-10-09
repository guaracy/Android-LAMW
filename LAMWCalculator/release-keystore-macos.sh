export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/LAMWCalculator
keytool -genkey -v -keystore lamwcalculator-release.keystore -alias lamwcalculator.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/LAMWCalculator/keytool_input.txt
