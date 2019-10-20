FROM golang:1.13.2-alpine

RUN go get gitlab.com/jtaimisto/bluewalker

CMD [ "bluewalker", "-device hci0 -active -ruuvi -json -unix /var/run/ruuvi.sock" ]
