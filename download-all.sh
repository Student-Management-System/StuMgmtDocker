#!/bin/bash

set -e

for dir in sparky-service stu-mgmt-backend stu-mgmt-frontend
do
	pushd "$dir"
	./download.sh
	popd
done
