#!/usr/bin/env bash

# add ssh
source  ~/.bashrc

# save start date
echo `date +%s` > /tmp/${XCS_BOT_TINY_ID}

# fire setup script
./bin/setup.sh
