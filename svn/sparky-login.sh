#!/bin/sh

read -r user
read -r password

code="$(curl \
	--silent --output /dev/null \
	--write-out "%{http_code}" \
	--request POST "http://sparky-service:8080/api/v1/authenticate" \
	--header "accept: */*" --header "Content-Type: application/json" \
	--data "{\"username\":$(echo -n "$user" | jq -aRs .),\"password\":$(echo -n "$password" | jq -aRs .)}")"

if [ "$code" = "200" ]
then
	exit 0
else
	exit 1
fi
