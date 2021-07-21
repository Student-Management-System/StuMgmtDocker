# Template for args.sh, environment variables used as build args
# Real args.sh is not tracked, as it contains secret keys and passwords.

### PostgreSQL ###

# The password of the postgres database; not really used
export POSTGRES_PASSWORD=some_pw0

### Sparky Service ###

# The version of the sparky-service to pull from jenkins (required as the URL contains this)
# build-time arg
export SPARKY_VERSION=1.0.1-SNAPSHOT

# The public (host) port where the sparky-service will be available
export SPARKY_PORT=8080

# The password of the sparky database in postgres
export SPARKY_DB_PW=some_pw1

# Username and password for the in-memory administrator in sparky-service
export SPARKY_ADMIN_USER=admin_user
export SPARKY_ADMIN_PW=some_pw2

# The JWT-secret for the sparky-service; must have a minimum size or else authentication always fails
export SPARKY_JWT_SECRET="some_secret"

# Configuration for the LDAP connection of sparky-service
export SPARKY_LDAP=false
export SPARKY_LDAP_DOMAIN=
export SPARKY_LDAP_URLS=
export SPARKY_LDAP_AD=false

### Stu-Mgmt Backend ###

# The public (host) port where the stu-mgmt-backend will be available
export BACKEND_PORT=3000

# The password of the stu-mgmt-backend database in postgres
export BACKEND_DB_PW=some_pw3

# Configuration for the mail connection of the stu-mgmt-backend
export BACKEND_MAIL_ENABLED=false
export BACKEND_MAIL_SERVER=mail.company.org
export BACKEND_MAIL_PORT=587
export BACKEND_MAIL_USERNAME=stu-mgmt@company.org
export BACKEND_MAIL_PASSWORD=some_pw4

### Stu-Mgmt Frontend ###

# The public (host) port where the stu-mgmt-frontend will be available
export FRONTEND_PORT=8000

# The publicly accesible base-url where the sparky-service can be reached
# This is where the web-browser clients will connect to for all API calls
export FRONTEND_API_BASE_URL=http://localhost:$SPARKY_PORT

# The webmaster mail used in the apache configuration
# build-time arg
export FRONTEND_WEBMASTER=webmaster@localhost
