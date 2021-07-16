#!/bin/bash

set -e

source ../env.sh

docker build \
	--build-arg SPARKY_DB_PW=$SPARKY_DB_PW \
	--build-arg SPARKY_ADMIN_USER=$SPARKY_ADMIN_USER \
	--build-arg SPARKY_ADMIN_PW=$SPARKY_ADMIN_PW \
	--build-arg SPARKY_JWT_SECRET=$SPARKY_JWT_SECRET \
	--build-arg SPARKY_LDAP=$SPARKY_LDAP \
	--build-arg SPARKY_LDAP_DOMAIN=$SPARKY_LDAP_DOMAIN \
	--build-arg SPARKY_LDAP_URLS=$SPARKY_LDAP_URLS \
	--build-arg SPARKY_LDAP_AD=$SPARKY_LDAP_AD \
	-t stu-mgmt/sparky-service .
