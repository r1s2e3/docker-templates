#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Usage: Must supply a domain"
  exit 1
fi

DOMAIN=$1

openssl genrsa -out private/$DOMAIN.key 2048
openssl req -new -key private/$DOMAIN.key -out meta/$DOMAIN.csr

cat > meta/$DOMAIN.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
EOF

openssl x509 -req -in meta/$DOMAIN.csr -CA ca/myCA.pem -CAkey ca/myCA.key -CAcreateserial \
-out certs/$DOMAIN.crt -days 825 -sha256 -extfile meta/$DOMAIN.ext

