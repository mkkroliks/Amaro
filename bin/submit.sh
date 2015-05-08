#!/usr/bin/env bash
export LC_ALL="en_US.UTF-8"

# add API_TOKEN & BUILD_SECRET if others that defaults in /var/_xcsbuildd/.bashrc
#export CRASHLYTICS_API_TOKEN=
#export CRASHLYTICS_BUILD_SECRET=

# check if build user
[ "$(whoami)" == "_xcsbuildd" ] || exit 0

# check existance of archive
IPA_PATH="${XCS_OUTPUT_DIR}/${XCS_BOT_NAME}.ipa"
[ -f "$IPA_PATH" ] || exit 0

# check if integrated with Crashlytics
CRASHLYTICS_SCRIPT="./Pods/Fabric/Crashlytics.framework/submit"
[ -x "$CRASHLYTICS_SCRIPT" ] || exit 0

# # check branch
# branches=('master' 'release')
# echo ${branches[@]} | grep -q $(git rev-parse --abbrev-ref HEAD) || exit 0

# # check bot names
# bots=('Skate M-CR' 'Skate M-AP')
# echo ${bots[@]} | grep -q "${XCS_BOT_NAME}" || exit 0

# do not upload if test fails or build error
RESULT=('test-failures' 'build-errors')
echo ${RESULT[@]} | grep -q "${XCS_INTEGRATION_RESULT}" && exit 0

# upload to crashlytics with emails list
emails=('test@appunite.com')
$CRASHLYTICS_SCRIPT $CRASHLYTICS_API_TOKEN $CRASHLYTICS_BUILD_SECRET -ipaPath "${IPA_PATH}" -emails $(IFS=, ; echo "${emails[*]}") 
