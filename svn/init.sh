#!/bin/bash

[[ -d "/repository" ]] || { mkdir "/repository" ; chown -R www-data:www-data "/repository" ; }

pushd /opt/rights-management
cp settings_template.json settings.json

echo "Preparing settings.json for rights-management"
sed -i 's|${SVN_COURSE_NAME}|'"${SVN_COURSE%-*}"'|g' settings.json
sed -i 's|${SVN_COURSE_SEMESTER}|'"${SVN_COURSE##*-}"'|g' settings.json
sed -i 's|${SVN_REPO_NAME}|'"$SVN_REPO_NAME"'|g' settings.json
sed -i 's|${SVN_MGMT_USER}|'"$SVN_MGMT_USER"'|g' settings.json
sed -i 's|${SVN_MGMT_PW}|'"$SVN_MGMT_PW"'|g' settings.json

mkdir cache
chown -R www-data:www-data .

echo "Running rights-management"
su -c "java -Dlog4j.configurationFile=log4j2.yaml -jar rights-management.jar" -s /usr/bin/sh www-data &

popd

echo "Waiting for repository..."
while [[ ! -d "/repository/$SVN_REPO_NAME" ]]
do
	sleep 0.1
done

if [[ ! -d "/repository/$SVN_REPO_NAME/hooks/submission-check" ]]
then
	echo "Installing SubmissionCheck hook"
	pushd /opt/submission-check
	./install.sh "/repository/$SVN_REPO_NAME"

	cat >"/repository/$SVN_REPO_NAME/hooks/submission-check/config.properties" <<EOF
all.checkstyle.rules = /opt/submission-check/checkstyle-rules.xml
EOF

	chown -R www-data:www-data "/repository/$SVN_REPO_NAME/hooks"
	popd
else
	echo "Hook already installed in /repository/$SVN_REPO_NAME/hooks/submission-check"
fi

echo "Running $@"
exec "$@"
