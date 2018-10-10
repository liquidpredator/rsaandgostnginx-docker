#!/bin/bash

openssl genpkey -engine gost -algorithm gost2001 -pkeyopt paramset:A -out root-gost.key
openssl req -x509 -days 10000 -new -engine gost -key root-gost.key -out root-gost.crt
openssl genpkey -engine gost -algorithm gost2001 -pkeyopt paramset:A -out gost.key
openssl req -new -nodes -engine gost -key gost.key -out gost.csr -config ssl-gost.cnf -extensions v3_req
openssl ca -out gost.crt -config ssl-gost.cnf -extensions v3_req -infiles gost.csr