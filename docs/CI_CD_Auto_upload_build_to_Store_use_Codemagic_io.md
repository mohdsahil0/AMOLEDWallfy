# CI/CD: Auto upload build to Store use Codemagic.io  
Create API key access Store 

## 1. Create google service account and download file credenticials 

 **Step 1:** In Google Play Console, navigate to Settings > API access.

 **Step 2:** Click on the **Create Service Account** button.

![image](https://user-images.githubusercontent.com/19247680/74402238-37e30400-4e56-11ea-9c4e-a3d115fce68d.png)


**Step 3:** Click on link to **Google API Console**.

![image](https://user-images.githubusercontent.com/19247680/74402352-901a0600-4e56-11ea-8a22-c431694c5d4a.png)


**Step 4:** In Google API Console, click on the **Create Service Account** button.

![image](https://user-images.githubusercontent.com/19247680/74402526-159db600-4e57-11ea-89e5-a79b188b7dbe.png)


**Step 5:** Enter service acttount name and click **CREATE**

![image](https://user-images.githubusercontent.com/19247680/74402646-71683f00-4e57-11ea-8a9d-838a6ceb2458.png)


**Step 6:** cick **Select a role**, select **Service Account User** and click **CONTINUE**

![image](https://user-images.githubusercontent.com/19247680/74402678-88a72c80-4e57-11ea-915a-27e5add86f52.png)

![image](https://user-images.githubusercontent.com/19247680/74402698-9bb9fc80-4e57-11ea-9f1d-7b8dbc5474c1.png)


**Step 7:** click CREATE KEY

![image](https://user-images.githubusercontent.com/19247680/74402733-b2f8ea00-4e57-11ea-8eb6-16197acec3dc.png)

- Choose JSON and click CRATE to download file credenticials

![image](https://user-images.githubusercontent.com/19247680/74402759-c86e1400-4e57-11ea-83bb-5669a1f66890.png)


**Step 8:** Back in Google Play Console, click **Done** to close the dialog.

![image](https://user-images.githubusercontent.com/19247680/74402793-dcb21100-4e57-11ea-9679-81f59482126b.png)

- Click **GRANT ACCESS**

![image](https://user-images.githubusercontent.com/19247680/74402888-17b44480-4e58-11ea-8312-2688028771c9.png)

- Choose Role is **Release manager** and **Add an app.** Final click **ADD USER** 

![image](https://user-images.githubusercontent.com/19247680/74402948-46321f80-4e58-11ea-8760-b93d9b86c636.png)

## 2. Create key store app android

- Create keystore

```
    keytool -genkey -v -keystore nameKey.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias name_alias_key
```

- Create file key.properties

```
    storePassword=password
    keyPassword=password
    keyAlias=name_alias_key
    storeFile=nameKey.keystore
```

## 3. Setup code magic 

 **Build Trigger**

![image](https://user-images.githubusercontent.com/19247680/74402992-6366ee00-4e58-11ea-82ca-bd7736fb460a.png)

**Setup variable environment**

```
    FCI_KEY_ALIAS
    FCI_KEYSTORE_PASSWORD
    FCI_KEY_PASSWORD
    FCI_KEYSTORE_FILE
```

![image](https://user-images.githubusercontent.com/19247680/74403015-737ecd80-4e58-11ea-935f-4bf71eb3282d.png)


**Create FCI_KEYSTORE_FILE** 

***By terminal*** 

- Step 1: run  command:

```
    openssl base64 -in <nameKey.keystore> -out <reuslt.txt>
```

- Step 2: After run comment, open file result.txt and copy content add to FCI_KEYSTORE_FILE in codemagic


***By codemagic*** 

- Step 1: Open the project settings page in codemagic and do the following:
        

![CLick to Encrypt environment variable](https://user-images.githubusercontent.com/19247680/74403116-ce182980-4e58-11ea-8959-a632be95dafb.png)

- Step 2: Choose a file keystore of android 
    
![image](https://user-images.githubusercontent.com/19247680/74403167-f011ac00-4e58-11ea-8c7c-dcaf74a372ec.png)

- Step 3: copy data after encode file keystore 
        
![image](https://user-images.githubusercontent.com/19247680/74403189-061f6c80-4e59-11ea-924d-16a3ac7c9df6.png)


 **Dependecy caching** 

![image](https://user-images.githubusercontent.com/19247680/74403219-16cfe280-4e59-11ea-8116-455fb20d81a8.png)


**Add script create key store** 

- Before option Text, click to button ADD

![image](https://user-images.githubusercontent.com/19247680/74403241-2818ef00-4e59-11ea-9717-399c32ba8ebe.png)


- Add script 

```
    #!/usr/bin/env sh
    set -e # exit on first failed commandset
    echo $FCI_KEYSTORE_FILE | base64 --decode > $FCI_BUILD_DIR/nameKey.keystore
```

![image](https://user-images.githubusercontent.com/19247680/74403259-36670b00-4e59-11ea-9ee8-b4cabdb2b25e.png)


 **Publishing ANDROID** 

- Add android code signing
![image](https://user-images.githubusercontent.com/19247680/74403289-4e3e8f00-4e59-11ea-8afc-7183438ebeeb.png)


- Upload file credentials google 

![image](https://user-images.githubusercontent.com/19247680/74403345-7fb75a80-4e59-11ea-8a6b-13bc5ed1ab51.png)


 **Publishing  IOS** 
 

- Add info certificate and **provisioning profiles** 
    - **Provisioning profiles** get in https://developer.apple.com/
    - **Certificate** is the file that was taken from the MAC computer that built the app for the first time. Specifically, this **certificate** must be registered in the **provisioning profiles**.

![image](https://user-images.githubusercontent.com/19247680/74403828-349e4700-4e5b-11ea-92a4-9e9775eba97b.png)

- Add Info App with 
    - **Apple ID** is the Icloud login email of the APP registered account
    - **App-specific password** : It is the code generated by apple after you enter the App-specific password. It has the following form: **xxxx-xxxx-xxxx-xxxx**
    docs: https://support.apple.com/en-jo/HT204397


    - **App ID** 
    docs: https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html
    
![image](https://user-images.githubusercontent.com/19247680/74403862-4c75cb00-4e5b-11ea-9baf-74cf65f9f683.png)

**Run build**

----------
