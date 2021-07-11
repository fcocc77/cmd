
start() {
    python3 '/opt/throttled/throttle.py' &
    echo $! > /tmp/throttle.pid
}

stop() {
    pid=$(cat /tmp/throttle.pid)
    kill -9 $pid
}

if [ "$1" = "start" ]; then
    start
fi

if [ "$1" = "stop" ]; then
    stop
fi

exit 0

