export JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
cd /home/guaracy/Dev/LAMWProjects/GBMMenu
keytool -genkey -v -keystore gbmmenu-release.keystore -alias gbmmenu.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/GBMMenu/keytool_input.txt
