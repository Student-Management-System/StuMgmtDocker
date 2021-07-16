#!/bin/bash

set -e

for dir in sparky-service stu-mgmt-backend stu-mgmt-frontend
do
	pushd "$dir"
	./build.sh
	popd
done

source env.sh
docker-compose up --no-start
