#!/bin/bash

PREV_TOTAL=0
PREV_IDLE=0

while true; do
    read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat

    IDLE=$((idle + iowait))
    TOTAL=$((user + nice + system + idle + iowait + irq + softirq + steal))

    DIFF_IDLE=$((IDLE - PREV_IDLE))
    DIFF_TOTAL=$((TOTAL - PREV_TOTAL))

    DIFF_USAGE=$((100 * (DIFF_TOTAL - DIFF_IDLE) / DIFF_TOTAL))

    echo "$DIFF_USAGE%"

    PREV_TOTAL=$TOTAL
    PREV_IDLE=$IDLE

    sleep 2
done
