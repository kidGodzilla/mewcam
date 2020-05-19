#!/bin/bash

rm -rf $1
rm -rf ./app/mewcam.app
cp -R ./build/mac/mewcam.app ./app

test -f mewcam.dmg && rm mewcam.dmg
test -f rw.mewcam.dmg && rm rw.mewcam.dmg
create-dmg \
  --volname "mewcam" \
  --background "./app/background@2x.png" \
  --window-pos 400 200 \
  --window-size 400 400 \
  --icon-size 128 \
  --icon "mewcam.app" 50 190 \
  --app-drop-link 240 190 \
  --hide-extension "mewcam.app" \
  "mewcam.dmg" \
  "./app/"

mkdir $1
mv mewcam.dmg $1
