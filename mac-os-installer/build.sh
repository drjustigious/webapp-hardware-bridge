echo "\nStarting macOS installer build. Script version 0.0.1."
date
echo "\nCopying compiled webapp_hardware_bridge_jar artifact to ${PWD}/jar."
rm -fr jar
cp -R ../out/artifacts/webapp_hardware_bridge_jar jar || {
    echo "ERROR: Could not copy artifact."
    echo "Please rebuild the artifact webapp_hardware_bridge_jar through IntelliJ Idea." ; exit 1;
}

echo "\nChecking for Java 8 runtime environment in ${PWD}/jre:"
jre/bin/java -version || {
    echo "ERROR: Could not detect a Java 8 runtime."
    echo "Please obtain a JRE from https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html." ; exit 1;
}

echo "\nBuild staged successfully. Please proceed as follows to generate the distributable bundle."
echo "1. Run the following Platypus profiles to build the launcher apps:\n  - WebApp Hardware Bridge Server\n  - WebApp Hardware Bridge Configurator\n  - Uninstall WebApp Hardware Bridge"
echo "2. Run the following Platypus profile to bundle up the installer package:\n  - Install WebApp Hardware Bridge"
