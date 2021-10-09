export PATH=/home/guaracy/LAMW/apache-ant-1.10.11/bin:$PATH
export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /home/guaracy/Dev/LAMWProjects/LAMWCalculator
ant -Dtouchtest.enabled=true debug
