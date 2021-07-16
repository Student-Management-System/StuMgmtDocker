#!/bin/bash

set -e

source ../env.sh

docker build \
	--build-arg BACKEND_DB_PW=$BACKEND_DB_PW \
	--build-arg BACKEND_MAIL_ENABLED=$BACKEND_MAIL_ENABLED \
	--build-arg BACKEND_MAIL_SERVER=$BACKEND_MAIL_SERVER \
	--build-arg BACKEND_MAIL_USERNAME=$BACKEND_MAIL_USERNAME \
	--build-arg BACKEND_MAIL_PASSWORD=$BACKEND_MAIL_PASSWORD \
	--build-arg BACKEND_MAIL_PORT=$BACKEND_MAIL_PORT \
	-t stu-mgmt/stu-mgmt-backend .
