set Path=%PATH%;/home/guaracy/LAMW/sdk/platform-tools;/home/guaracy/LAMW/sdk/build-tools\29.0.3
set GRADLE_HOME=/home/guaracy/LAMW/gradle-6.6.1
set PATH=%PATH%;%GRADLE_HOME%\bin
zipalign -v -p 4 /home/guaracy/Dev/LAMWProjects/LAMWCalculator\build\outputs\apk\release\LAMWCalculator-armeabi-v7a-release-unsigned.apk /home/guaracy/Dev/LAMWProjects/LAMWCalculator\build\outputs\apk\release\LAMWCalculator-armeabi-v7a-release-unsigned-aligned.apk
apksigner sign --ks /home/guaracy/Dev/LAMWProjects/LAMWCalculator\lamwcalculator-release.keystore --ks-pass pass:123456 --key-pass pass:123456 --out /home/guaracy/Dev/LAMWProjects/LAMWCalculator\build\outputs\apk\release\LAMWCalculator-release.apk /home/guaracy/Dev/LAMWProjects/LAMWCalculator\build\outputs\apk\release\LAMWCalculator-armeabi-v7a-release-unsigned-aligned.apk
