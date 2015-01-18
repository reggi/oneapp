#!/usr/bin/env bash

./node_modules/.bin/cordova build browser

rm -fr build/node-webkit/src
rm -fr build/node-webkit/build
mkdir -p build/node-webkit/src


cp -r platforms/browser/www/* build/node-webkit/src
cp -r node-webkit-src/* build/node-webkit/src

node ./bin/build-node-webkit.js
