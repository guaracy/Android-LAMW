export JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
cd /home/guaracy/Dev/LAMWProjects/lemur
keytool -genkey -v -keystore lemur-release.keystore -alias lemur.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/lemur/keytool_input.txt
