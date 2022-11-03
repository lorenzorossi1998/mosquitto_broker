#!/bin/sh

#if [ -f /mosquitto/config/mosquitto.conf ]; then
#    echo 'CONFIG file exists. SKIPPING.'
#else
#fi

#if [ -f /mosquitto/config/passwd ]; then
#    echo 'passwd file exists. SKIPPING.'
#else
#fi

echo "Copying mosquitto.conf"
cp /src/mosquitto.conf /mosquitto/config/mosquitto.conf
echo "Copying passwd"
cp /src/passwd /mosquitto/config/passwd

if [ -f /mosquitto/config/certs ]; then
	echo "Certs' folder already exists. SKIPPING."
else
	echo "Creating certs' directory"
	mkdir /mosquitto/config/certs
fi

if [ -f /mosquitto/config/ca_certs ]; then
	echo "CA Certs' folder already exists. SKIPPING."
else
	echo "Creating CA certs' directory"
	mkdir /mosquitto/config/ca_certs
fi

echo "Copying broker.crt"
cp /src/broker.crt /mosquitto/config/certs/broker.crt
echo "Copying broker.key"
cp /src/broker.key /mosquitto/config/certs/broker.key
echo "Copying ca.crt"
cp /src/ca.crt /mosquitto/config/ca_certs/ca.crt

echo "Done"

sudo openssl x509 -in /mosquitto/config/certs/broker.crt -text -noout
sudo openssl x509 -in /mosquitto/config/ca_certs/ca.crt -text -noout

exec "$@"
