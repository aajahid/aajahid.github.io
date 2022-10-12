---
title: Runnng Android app on windows 11
cover-image: hipster.jpg

summary: Here I explain how to run Android app on windows 11 without access to amazon store or from a country where amazon store is not available.

---
![Chaldal & Cookups android app running on windows 11]({{ site.baseurl }}/img/wsa-windows11/chaldal-cookups-android-app-wsa-windows11.jpg)
Just like WSL (Windows Subsystem for Linux), microsoft also introduced WSA ( Windows Subsystem for Android). 
I've tested the feature with few android apps including Chaldal and Cookups android app (Screenshot above)

Microsoft also made nice integration with the windows 11, where the android app shows up just a like a normal app in the start menu.
![Android app icon on taskbar]({{ site.baseurl }}/img/wsa-windows11/windows11-integration.jpg)

Even support resizing screensizes on apps that supports them. Like how Cookups app does here - 
![Android app icon on taskbar]({{ site.baseurl }}/img/wsa-windows11/cookups-android-app-on-windows11.jpg)


## Easy setup

WSA is not available for all countries. But if its available for you, you should be able to find **“Amazon Appstore”** in Microsoft store. And installing “Amazon AppStore” should also install WSA along with it.

Or you can directly go to this link and attempt to install 

[https://www.microsoft.com/en-us/p/windows-subsystem-for-android/9p3395vx91nr](https://www.microsoft.com/en-us/p/windows-subsystem-for-android/9p3395vx91nr)

## Alternative Setup

But if you don’t have access to “amazon Appstore” or WSA, you can manually download using a thirdparty microsoft store link generator. 

[https://store.rg-adguard.net/](https://store.rg-adguard.net/)

Put the `https://www.microsoft.com/en-us/p/windows-subsystem-for-android/9p3395vx91nr` url in the input and generate link.

You should see bunch of file name, For me, I had to download 2 files

1. Microsoft.UI.Xaml.2.6_2.62112.3002.0_x64__8wekyb3d8bbwe.Appx
2. MicrosoftCorporationII.WindowsSubsystemForAndroid_2205.40000.16.0_neutral___8wekyb3d8bbwe.Msixbundle

I installed no 1 file just by double clicking and 2nd file using **powershell** in administrator mode with following command 

```
Add-AppxPackage -Path "C:\Users\jahid\Downloads\MicrosoftCorporationII.WindowsSubsystemForAndroid_2205.40000.16.0_neutral___8wekyb3d8bbwe.Msixbundle"
```

## Sideloading android app

If you don’t have amazon app store or the desired app that is not available on amazon app store - you can always sideload android app from APK.

Todo so - you’ll need 

1. [ADB installed](https://www.xda-developers.com/install-adb-windows-macos-linux/)
2. Developer mode enabled in “Windows Subsystem for Android Settings”

Once you enable developer mode, You’ll see the WSA IP address in settings and you can use the following command to connect to the WSA using adb

```
adb connect 127.0.0.1:58526
```

Once connected, you can download your desired APK from any thirdparty apk download site ( ex- apkpure ) and use following command to install

```
adb install .\app-release.apk
```