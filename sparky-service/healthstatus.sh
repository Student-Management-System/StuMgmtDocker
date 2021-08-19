#!/bin/sh

code="$(curl \
	--silent --output /dev/null \
	--write-out "%{http_code}" \
	--request GET "http://localhost:8080/api/v1/heartbeat" \
	--header "accept: */*")"

if [ "$code" = "204" ]
then
	exit 0
else
	exit 1
fi
