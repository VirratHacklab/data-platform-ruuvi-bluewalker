SOCKETPATH="/tmp/ruuvi.sock"

sudo hciconfig hci0 down
sudo ../go/bin/bluewalker -device hci0 -ruuvi -active -json -duration 10 -unix $SOCKETPATH > /dev/null 2>&1
