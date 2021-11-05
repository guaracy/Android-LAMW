export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
cd /home/guaracy/android/projects/Polias
keytool -genkey -v -keystore polias-release.keystore -alias polias.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /home/guaracy/android/projects/Polias/keytool_input.txt
