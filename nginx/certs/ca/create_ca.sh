#!/bin/sh

echo "Creating private key\n"
openssl genrsa -des3 -out myCA.key 2048

echo
echo

echo "Creating root certificate\n"
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem
openssl x509 -outform der -in myCA.pem -out myCA.crt
