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

cp /src/broker.crt /mosquitto/config/certs/broker.crt
cp /src/broker.key /mosquitto/config/certs/broker.key
cp /src/ca.crt /mosquitto/config/ca_certs/ca.crt

exec "$@"
