#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_INT=${CPU_USAGE%.*}
THRESHOLD=5

ALERT_FILE="logs/alert_sent"
COOLDOWN=300   # seconds (5 minutes)

TOPIC_ARN="arn:aws:sns:us-east-1:964242332531:cpu-alert-topic"

HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $1}')
TIMESTAMP=$(date)

mkdir -p logs

echo "----- $TIMESTAMP -----" >> logs/output.log
echo "CPU usage: $CPU_INT%" >> logs/output.log

SEND_ALERT=false

if [ "$CPU_INT" -gt "$THRESHOLD" ]; then
  if [ -f "$ALERT_FILE" ]; then
    LAST_SENT=$(cat $ALERT_FILE)
    NOW=$(date +%s)
    DIFF=$((NOW - LAST_SENT))

    if [ "$DIFF" -gt "$COOLDOWN" ]; then
      SEND_ALERT=true
    else
      echo "Alert in cooldown period, skipping..." >> logs/output.log
    fi
  else
    SEND_ALERT=true
  fi

  if [ "$SEND_ALERT" = true ]; then
    echo "Sending alert..." >> logs/output.log

    /usr/bin/aws sns publish \
      --topic-arn $TOPIC_ARN \
      --message "🚨 High CPU Alert

Server: $HOSTNAME
IP: $IP
CPU Usage: $CPU_INT%
Time: $TIMESTAMP"

    date +%s > $ALERT_FILE
  fi

else
  echo "CPU normal, resetting alert state..." >> logs/output.log
  rm -f $ALERT_FILE
fi