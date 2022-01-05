#!/bin/sh

echo "Initializing env.js with $FRONTEND_API_BASE_URL"

cat >/var/www/html/env.js <<EOF
(function (window) {
	window.__env = window.__env || {};
        window.__env.API_BASE_PATH = "$FRONTEND_API_BASE_URL/stmgmt";
        window.__env.CONVERGENCE_REALTIME_API_PATH = "";
        window.__env.STUDENT_MGMT_BASE_PATH = "$FRONTEND_API_BASE_URL/stmgmt";
        window.__env.AUTH_BASE_PATH = "$FRONTEND_API_BASE_URL";
        window.__env.PISTON_CODE_EXECUTION_BASE_PATH = "$WEB_IDE_CODE_EXECUTION_PATH";
        window.__env.EXERCISE_SUBMITTER_BASE_PATH = "$SUBMISSION_SERVER_PATH";
})(this);
EOF

echo "Running $@"
exec "$@"
