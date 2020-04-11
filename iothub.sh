export IOTHUBCONNECTION="<IoT Hub Connection String>"
export SOCKETPATH="/tmp/ruuvi.sock"

while true; do
    if [ $PID > 0 ]; then
        kill -9 $PID
    fi

    rm -rf $SOCKETPATH

    node index.js > /dev/null 2>&1
    PID=$!
    #node index.js
    sleep 1
done
