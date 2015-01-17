#!/usr/bin/env bash

npm install
bower install
./bin/prepare_crosswalk.sh
ionic build android
ionic build firefoxos
ionic build ios
npm run build-node-webkit
