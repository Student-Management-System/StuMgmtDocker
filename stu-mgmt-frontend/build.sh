#!/bin/bash

set -e

source ../env.sh

docker build \
	--build-arg BACKEND_DB_USER=$BACKEND_DB_USER \
	--build-arg BACKEND_DB_PW=$BACKEND_DB_PW \
	--build-arg BACKEND_JWT_SECRET=$BACKEND_JWT_SECRET \
	--build-arg BACKEND_MAIL_SERVER=$BACKEND_MAIL_SERVER \
	--build-arg BACKEND_MAIL_USERNAME=$BACKEND_MAIL_USERNAME \
	-t stu-mgmt/stu-mgmt-frontend .
