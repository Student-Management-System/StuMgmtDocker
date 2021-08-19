#!/bin/sh

echo "Initializing env.js with $FRONTEND_API_BASE_URL"

cat >/var/www/html/env.js <<EOF
(function (window) {
	window.__env = window.__env || {};

	window.__env.API_BASE_PATH = "$FRONTEND_API_BASE_URL/stmgmt";
	window.__env.AUTH_BASE_PATH = "$FRONTEND_API_BASE_URL";

}(this));
EOF

echo "Running $@"
exec "$@"
