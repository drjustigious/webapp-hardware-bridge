# Building a macOS installer for WebApp Hardware Bridge

The following steps will produce a signed `zip` file containing an installer application. The installer will perform the following:
- Set up a runtime directory, including a JRE, at `/Users/Shared/webapp-hardware-bridge/`.
- Set up launchers for the Configurator and server at `/Applications/`.


**Note:** Although signed, the installer package will not pass the Apple notarization process because the applications produced by Platypus are not "hardened". It is also possible that the JRE contains unsigned executables.

Because of the lack of notarization, the macOS Gatekeeper will prevent the installer from launching by default, stating that Apple could not check the contents for malicious software. To override the warning, Ctrl-click the installer after receiving the warning and select the new *Open* option.

Once installed, the Configurator and Server launchers will not produce similar warnings.

---

## Building the installer

1. Install Platypus 5.3 or compatible.
    - Run `brew install platypus`.
    - See https://github.com/sveinbjornt/Platypus for details.
1. Download the latest Amazon Corretto 8 JRE and copy it into the directory `jre` next to this README file.
    - https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
    - You may have to download the whole JDK if a separate JRE is not available for the platform you're targeting.
1. Build the `webapp_hardware_bridge_jar` artifact in IntelliJ Idea.
1. Run the script `build.sh` next to this README file.
1. Use Platypus to run the launcher app profiles.
    - *WebApp Hardware Bridge Server*
    - *WebApp Hardware Bridge Configurator*
1. Copy the applications into the same directory as this `README.md` file.
1. Obtain a suitable certificate and sign the applications using the Xcode `codesign` utility.
    ```
    security find-identity

    codesign -s "<YOUR-IDENTITY-HERE>" -f --timestamp "WebApp Hardware Bridge Server.app"

    $codesign -s "<YOUR-IDENTITY-HERE>" -f --timestamp "WebApp Hardware Bridge Configurator.app"
    ```

1. Use Platypus to run the installer profile.
    - *Install WebApp Hardware Bridge*
1. Sign the installer application.
    ```
    codesign -s "<YOUR-IDENTITY-HERE>" -f --timestamp "Install WebApp Hardware Bridge.app"
    ```
1. Create a `zip` file archive of `Install WebApp Hardware Bridge.app` (right click and select "Compress").
1. Sign the `zip` file and distribute.
    ```
    codesign -s "<YOUR-IDENTITY-HERE>" -f --timestamp "installer-mac-aarch64-<TIMESTAMP>.zip"
    ```

## Sample file structure after build
```
mac-os-installer/
    jar/
        [Artifacts copied by build.sh from the IntelliJ Idea output]

    jre/
        [A Java runtime enironment (JRE) of your choice]

    platypus-profiles/
        Install WebApp Hardware Bridge.platypus
        WebApp Hardware Bridge Configurator.platypus
        WebApp Hardware Bridge Server.platypus

    build.sh
    Install WebApp Hardware Bridge.app
    installer-mac-aarch64-20220801-1040.zip
    installer.sh
    launcher.sh
    README.md
    WebApp Hardware Bridge Configurator.app
    WebApp Hardware Bridge Server.app
```