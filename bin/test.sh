#!/usr/bin/env bash
export LC_ALL="en_US.UTF-8"

set -o pipefail

xcodebuild test -workspace SkateNavigator.xcworkspace -scheme KingsChat -sdk iphonesimulator BUILD_ACTIVE_ARCH=NO | xcpretty -t -c
