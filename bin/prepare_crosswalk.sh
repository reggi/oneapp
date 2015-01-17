#!/usr/bin/env bash
#
# usage: provide a path to a crosswalk-cordova-x86 and crosswalk-cordova-arm library,
# run in the current (project) directory, and it will set up crosswalk for you
#
# ./prepare_crosswalk.sh /path/to/crosswalk-cordova-VERSION-x86 /path/to/crosswalk-cordova-VERSION-arm
# 

X86=$1
ARM=$2

if [[ -z $X86 ]]; then
  echo 'usage: ./prepare_crosswalk /path/to/crosswalk-cordova-VERSION-x86 /path/to/crosswalk-cordova-VERSION-arm'
  exit 1
fi
  
if [[ -z $ARM ]]; then
  echo 'usage: ./prepare_crosswalk /path/to/crosswalk-cordova-VERSION-x86 /path/to/crosswalk-cordova-VERSION-arm'
  exit 1
fi

rm -fr platforms/android/
cordova platform add android@3.5
rm -fr platforms/android/CordovaLib/*
cp -a $X86/framework/* platforms/android/CordovaLib/
cp -a $ARM/framework/xwalk_core_library/libs/armeabi-v7a platforms/android/CordovaLib/xwalk_core_library/libs/
cp $X86/VERSION platforms/android/
cd platforms/android/CordovaLib/
android update project --subprojects --path . --target "android-19"
ant debug
cd -

# sed sucks on a mac, can't do sed -i
cat platforms/android/AndroidManifest.xml | sed 's/<\/manifest>/<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" \/><uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" \/><\/manifest>/' > platforms/android/AndroidManifestNew.xml
mv platforms/android/AndroidManifestNew.xml platforms/android/AndroidManifest.xml
./node_modules/.bin/ionic build android
