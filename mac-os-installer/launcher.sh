#! /bin/zsh

# Launch the WebApp Hardware Bridge Configurator if the second argument is "configurator".
# Otherwise launch the Server.
INSTALL_DIR="/Users/Shared/webapp-hardware-bridge"
JAVA_HOME="${INSTALL_DIR}/jre"
JAR_DIRECTORY="${INSTALL_DIR}/jar"

cd ${JAR_DIRECTORY}
pwd
${JAVA_HOME}/bin/java -version

if [ "$1" = "configurator" ]
then
    echo "Launching WebApp Hardware Bridge Configurator."
    ${JAVA_HOME}/bin/java -cp webapp-hardware-bridge.jar tigerworkshop.webapphardwarebridge.Configurator;
else
    echo "Launching WebApp Hardware Bridge Server."
    ${JAVA_HOME}/bin/java -cp webapp-hardware-bridge.jar tigerworkshop.webapphardwarebridge.Server;
fi
