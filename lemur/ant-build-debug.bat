set Path=%PATH%;/home/guaracy/LAMW/apache-ant-1.10.11/bin
set JAVA_HOME=/home/guaracy/LAMW/jdk/openjdk-11
cd /home/guaracy/Dev/LAMWProjects/lemur
call ant clean -Dtouchtest.enabled=true debug
if errorlevel 1 pause
