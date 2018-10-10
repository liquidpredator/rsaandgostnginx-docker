#!/bin/bash

openssl genrsa -out root-rsa.key 2048
openssl req -x509 -days 10000 -new -key root-rsa.key -out root-rsa.crt
openssl genrsa -out rsa.key 2048
openssl req -new -nodes -key rsa.key -out rsa.csr -config ssl-rsa.cnf -extensions v3_req
openssl ca -out rsa.crt -config ssl-rsa.cnf -extensions v3_req -infiles rsa.csr