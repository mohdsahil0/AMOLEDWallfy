
# NOTE: All scripts must be called while in the tools directory.

# A. [ANDROID & IOS] SCRIPT CHANGE BUNDLE ID
## 1. SETUP
### Seetup script in file setup.conf

- 1. Change name folder

```
    NEW_FOLDER_NAME=app-example
```

- 2. Change android package name

```
    OLD_ANDROID_PACKAGE_NAME=appdemo.example.appandroid
    NEW_ANDROID_PACKAGE_NAME=example.demo.androidapp
```


- 3. Change ios package name

```
    OLD_IOS_PACKAGE_NAME=appdemo.example.appios
    NEW_IOS_PACKAGE_NAME=example.demo.iosapp
```

- 4. Change project name (name in pubspec.yaml)

```
    OLD_NAME_PROJECT=demo_app
    NEW_NAME_PROJECT=example_demo_app
```

- 5. Change name app

```
    OLD_NAME_APP=Demo App
    NEW_NAME_APP=Example Demo App
```

## 2. RUN

```
    bash tools/change-bundleid.sh
```

------


# B. [ANDROID] SCRIPT CREATE KEYSTORE AND KEY PROPERTIEST 

## Usage: 
 - Step 1: 
    Add data to 3 keys in file create-keystore.conf, this is the installation file to run create-keystore.sh. 

        NAME_FILE : name of file key store
        NAME_ALIAS : name if Alias
        PASSWORD : password of keyPassword and storePassword
- Step 2:
    Run script with command: 

        bash tools/create-keystore.sh
- Step 3: Enter info of key

## Note: 
- In the final step, after entering keystore information, a few cases will ask:

        ...
        Enter key password for <NAMEKEY>
        (RETURN if same as keystore password):
- Press "Enter" to finish.


-----

# C. [ANDROID & IOS] BUILD ICON APP
- Step 1: config info icon in pubspec.yaml

```
        ...
dev_dependencies:
  flutter_test:
    sdk: flutter
        ...

flutter_icons:
    android: "launcher_icon"
    ios: true
    image_path: "assets/images/app_icon.png"
```

- Step 2: call script build

```
    bash tools/build-icon.sh
```

# D. [ANDROID] Build appbundle 

```
    bash tools/build-appbundle.sh
```