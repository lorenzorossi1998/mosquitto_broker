#!/bin/sh

#if [ -f /mosquitto/config/mosquitto.conf ]; then
#    echo 'CONFIG file exists. SKIPPING.'
#else
  cp /src/mosquitto.conf /mosquitto/config/mosquitto.conf
#fi

#if [ -f /mosquitto/config/passwd ]; then
#    echo 'passwd file exists. SKIPPING.'
#else
  cp /src/passwd /mosquitto/config/passwd
#fi

cat mosquitto.conf
echo "-----------------"
cat /mosquitto/config/mosquitto.conf

exec "$@"
