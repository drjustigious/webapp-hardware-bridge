# Building a macOS installer for WebApp Hardware Bridge

1. Install Platypus 5.3 or compatible.
    - Run `brew install platypus`.
    - See https://github.com/sveinbjornt/Platypus for details.
1. Download the latest Amazon Corretto 8 JRE and copy it into the directory `jre` next to this README file.
    - https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
    - You may have to download the whole JDK if a separate JRE is not available for the platform you're targeting.
1. Build the `webapp_hardware_bridge_jar` artifact in IntelliJ Idea.
1. Run the script `build.sh` next to this README file.
1. Following the instructions printed by the build script, use Platypus to run the launcher app profiles.
    - *WebApp Hardware Bridge Server*
    - *WebApp Hardware Bridge Configurator*
    - *Uninstall WebApp Hardware Bridge*
1. Further following the instructions, use Platypus to run the installer profile.
    - *Install WebApp Hardware Bridge*