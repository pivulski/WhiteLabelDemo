#!/bin/bash

# Validate input parameters
if [ "$1" = "" ]
then
  echo "Usage: $0 <wl name>"
  exit
fi

# Setup enviroment
WL_PATH=./Configs/$1

if [ -f $WL_PATH/build.env ]
then
  export $(cat $WL_PATH/build.env | xargs)
fi

# Copy xcconfig
cp $WL_PATH/WhiteLabel.xcconfig ./WhiteLabel.xcconfig
cp $WL_PATH/Settings.plist ./WhiteLabelDemo/Settings.plist

# Copy resources
rm -rf ./WhiteLabelDemo/WLResources
cp -R $WL_PATH/WLResources ./WhiteLabelDemo/WLResources

rm -rf ./WhiteLabelDemo/Assets.xcassets
cp -R $WL_PATH/Assets.xcassets ./WhiteLabelDemo/Assets.xcassets

pod install

echo "done"
