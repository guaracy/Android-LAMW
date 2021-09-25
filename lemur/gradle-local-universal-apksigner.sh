export PATH=/home/guaracy/LAMW/sdk/platform-tools:$PATH
export PATH=/home/guaracy/LAMW/sdk/build-tools/29.0.3:$PATH
export GRADLE_HOME=/home/guaracy/LAMW/gradle-6.6.1
export PATH=$PATH:$GRADLE_HOME/bin
zipalign -v -p 4 /home/guaracy/Dev/LAMWProjects/lemur/build/outputs/apk/release/lemur-universal-release-unsigned.apk /home/guaracy/Dev/LAMWProjects/lemur/build/outputs/apk/release/lemur-universal-release-unsigned-aligned.apk
apksigner sign --ks /home/guaracy/Dev/LAMWProjects/lemur/lemur-release.keystore --ks-pass pass:123456 --key-pass pass:123456 --out /home/guaracy/Dev/LAMWProjects/lemur/build/outputs/apk/release/lemur-release.apk /home/guaracy/Dev/LAMWProjects/lemur/build/outputs/apk/release/lemur-universal-release-unsigned-aligned.apk
