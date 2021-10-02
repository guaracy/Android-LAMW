export JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
cd /home/guaracy/Dev/LAMWProjects/SaveState
keytool -genkey -v -keystore savestate-release.keystore -alias savestate.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/Dev/LAMWProjects/SaveState/keytool_input.txt
