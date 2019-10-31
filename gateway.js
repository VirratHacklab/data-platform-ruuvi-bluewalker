'use strict';

const net = require('net');
const clientFromConnectionString = require('azure-iot-device-mqtt').clientFromConnectionString;
const Message = require('azure-iot-device').Message;

const connectionString = process.env.IOTHUBCONNECTION;

const client = clientFromConnectionString(connectionString);

let unixServer = net.createServer(function(socket) {
    socket.on("data", function(data) {
        let telemetry = JSON.parse(data.toString());
        let payload = JSON.stringify({ ...telemetry, datetime: new Date().toISOString() });
        console.log(payload);
        let message = new Message(payload);
        client.sendEvent(message);
    });
});

unixServer.listen(process.env.SOCKETPATH);
