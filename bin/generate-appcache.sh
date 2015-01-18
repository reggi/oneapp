#!/usr/bin/env bash
# usage: just run it, and it'll build a new www/manifest.appcache file
#

echo -e "CACHE MANIFEST\n# generated $(date)\nCACHE:" > www/manifest.appcache
find www -type f | grep -v manifest.appcache | grep -v DS_Store | sed 's/www\///g' >> www/manifest.appcache

echo -e "\nNETWORK:\n*" >> www/manifest.appcache
