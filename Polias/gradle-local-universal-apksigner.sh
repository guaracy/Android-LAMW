export PATH=/home/guaracy/Android/Sdk/platform-tools:$PATH
export PATH=/home/guaracy/Android/Sdk/build-tools/31.0.0:$PATH
export GRADLE_HOME=/home/guaracy/android/fpc-lazarus/ccr/lamw-gradle/gradle-6.8.3
export PATH=$PATH:$GRADLE_HOME/bin
zipalign -v -p 4 /home/guaracy/android/projects/Polias/build/outputs/apk/release/Polias-universal-release-unsigned.apk /home/guaracy/android/projects/Polias/build/outputs/apk/release/Polias-universal-release-unsigned-aligned.apk
apksigner sign --ks /home/guaracy/android/projects/Polias/polias-release.keystore --ks-pass pass:123456 --key-pass pass:123456 --out /home/guaracy/android/projects/Polias/build/outputs/apk/release/Polias-release.apk /home/guaracy/android/projects/Polias/build/outputs/apk/release/Polias-universal-release-unsigned-aligned.apk
