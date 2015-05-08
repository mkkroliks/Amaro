#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin

# load integration start & end date
export APPUNITE_START_INTEGRATION_TIMESTAMP=`cat /tmp/${XCS_BOT_TINY_ID}`
export APPUNITE_END_INTEGRATION_TIMESTAMP=`date +%s`

# get build no
BUILD_NO=`./bin/buildNo.sh`

# post slack message
slack-integration.rb -c '#channel-test' -n ${BUILD_NO}

# fire submit script
./bin/submit.sh
