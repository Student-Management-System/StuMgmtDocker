#!/bin/sh

code="$(curl \
	--silent --output /dev/null \
	--write-out "%{http_code}" \
	--request GET "http://localhost:3000/uptime" \
	--header "accept: */*")"

if [ "$code" = "200" ]
then
	exit 0
else
	exit 1
fi
