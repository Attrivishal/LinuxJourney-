#!/bin/bash


####################
# Author: Vishal
#  Date: 07/01/2026
#
#  This script outputs the node health
#
#  version: v1
######################

set -x #debug mode
set -e
set -o pipefail
df -h 

free -g

nproc

ps -ef | grep amazon | awk -F" " '{print $2}' 
