#!/bin/sh
if pid=$(pgrep mosdns); then
    kill $pid
fi
/usr/bin/mosdns start --dir /etc/mosdns