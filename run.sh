#!/bin/sh

echo $cloudproxy | base64 -d > creds.json

/usr/bin/cloud_sql_proxy -instances=zeit-main:europe-west1:cloud-sql-demo=tcp:3306 -credential_file=creds.json &
./node_modules/.bin/micro
