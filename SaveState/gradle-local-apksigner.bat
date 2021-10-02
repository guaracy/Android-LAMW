set Path=%PATH%;/home/guaracy/LAMW/sdk/platform-tools;/home/guaracy/LAMW/sdk/build-tools\29.0.3
set GRADLE_HOME=/home/guaracy/LAMW/gradle-6.6.1
set PATH=%PATH%;%GRADLE_HOME%\bin
zipalign -v -p 4 /home/guaracy/Dev/LAMWProjects/SaveState\build\outputs\apk\release\SaveState-armeabi-v7a-release-unsigned.apk /home/guaracy/Dev/LAMWProjects/SaveState\build\outputs\apk\release\SaveState-armeabi-v7a-release-unsigned-aligned.apk
apksigner sign --ks /home/guaracy/Dev/LAMWProjects/SaveState\savestate-release.keystore --ks-pass pass:123456 --key-pass pass:123456 --out /home/guaracy/Dev/LAMWProjects/SaveState\build\outputs\apk\release\SaveState-release.apk /home/guaracy/Dev/LAMWProjects/SaveState\build\outputs\apk\release\SaveState-armeabi-v7a-release-unsigned-aligned.apk
