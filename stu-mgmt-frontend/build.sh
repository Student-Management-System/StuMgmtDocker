#!/bin/bash

set -e

source ../env.sh

docker build \
	--build-arg FRONTEND_SPARKY_HOST=$FRONTEND_SPARKY_HOST \
	--build-arg FRONTEND_WEBMASTER=$FRONTEND_WEBMASTER \
	-t stu-mgmt/stu-mgmt-frontend .
