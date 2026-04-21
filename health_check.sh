#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_INT=${CPU_USAGE%.*}
THRESHOLD=2

ALERT_FILE="logs/alert_sent"
TOPIC_ARN="arn:aws:sns:us-east-1:964242332531:cpu-alert-topic"

mkdir -p logs

echo "----- $(date) -----" >> logs/output.log
echo "CPU usage: $CPU_INT%" >> logs/output.log

if [ "$CPU_INT" -gt "$THRESHOLD" ]; then
  if [ ! -f "$ALERT_FILE" ]; then
    echo "High CPU usage detected: $CPU_INT%" >> logs/output.log

    aws sns publish \
      --topic-arn $TOPIC_ARN \
      --message "🚨 High CPU Alert: $CPU_INT%"

    touch $ALERT_FILE
  fi
else
  rm -f $ALERT_FILE
fi