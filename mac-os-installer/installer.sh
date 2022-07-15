#! /bin/zsh

INSTALL_DIR="/Users/Shared/webapp-hardware-bridge"
USER_DIR="/Applications"

echo "Acting as user ${USER}."
echo "Installing WebApp Hardware Bridge to ${INSTALL_DIR}."
echo "Placing launchers in ${USER_DIR}."

pwd
ls -l

echo "Copying application files..."
rm -fr ${INSTALL_DIR}/jar
mkdir -p ${INSTALL_DIR}
cp -R jar ${INSTALL_DIR}

echo "Copying Java runtime environment..."
rm -fr ${INSTALL_DIR}/jre
mkdir -p ${INSTALL_DIR}
cp -R jre ${INSTALL_DIR}

echo "Setting up launchers..."
mkdir -p ${USER_DIR}
cp -R *.app ${USER_DIR}
open ${USER_DIR}

echo "Installation complete."
