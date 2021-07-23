#!/bin/bash

[[ -d "/repository" ]] || { mkdir "/repository" ; chown -R www-data:www-data "/repository" ; }

if [[ ! -d "/repository/$SVN_REPO_NAME" ]]
then
	echo "Creating repository $SVN_REPO_NAME"

	svnadmin create "/repository/$SVN_REPO_NAME"

	cat >>/repository/access <<EOF
[$SVN_REPO_NAME:/]
* = rw

EOF

	chown -R www-data:www-data "/repository/$SVN_REPO_NAME"
fi

echo "Running $@"
exec "$@"
