export JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
cd /home/guaracy/Dev/LAMWProjects/LAMWCalculator
keytool -genkey -v -keystore lamwcalculator-release.keystore -alias lamwcalculator.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/LAMWCalculator/keytool_input.txt
