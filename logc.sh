#!/bin/bash
packageName=$1
logfile=$2

pid=`adb shell ps | grep $packageName | awk '{print $2}'`
adb logcat -v threadtime | grep --color=auto $pid|tee $logfile


