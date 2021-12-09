#!/bin/bash

instances=()

for network in $(docker network ls | awk 'NR!=1 {print $2}')
do
	if [[ "$network" =~ ^stu-mgmt-testing-[0-9]+_default$ ]]
	then
		instances+=("${network%_default}")
	fi
done

printf "Running instances:\n"
for instance in "${instances[@]}"
do
	printf "    %s\n" "$instance"
done

read -p "Kill all instances? [y/N] " -r reply
if [[ ! "$reply" =~ ^[Yy]$ ]]
then
	exit 2
fi

for instance in "${instances[@]}"
do
	docker-compose -p "$instance" down --volumes
done
