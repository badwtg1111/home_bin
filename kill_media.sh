echo "before kill"
adb shell ps | grep mediaserver
adb shell kill -9 $(adb shell ps | grep mediaserver | awk -F " " '{print $2}')
sleep 1
echo "after kill"
adb shell ps | grep mediaserver

