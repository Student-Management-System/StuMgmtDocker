# Template for args.sh, environment variables. Must be set when starting containers.
# Real args.sh is not tracked, as it contains secret keys and passwords.

### PostgreSQL ###

# The password of the postgres database; not really used
export POSTGRES_PASSWORD=some_pw0

######################
###                ###
### Sparky Service ###
###                ###
######################

# The public (host) port where the sparky-service will be available
export SPARKY_PORT=8080
export SPARKY_SWAGGER_URL=http://localhost:$SPARKY_PORT/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config

# The password of the sparky database in postgres
export SPARKY_DB_PW=some_pw1

# Username and password for the in-memory administrator in sparky-service
export SPARKY_ADMIN_USER=admin_user
export SPARKY_ADMIN_PW=some_pw2

# The JWT-secret for the sparky-service; must have a minimum size or else authentication always fails
export SPARKY_JWT_SECRET="some_secret_which_has_a_minimum_size:and_a_second_part_as_this_key_must_have_a_minimum_size_of_512_bits"

# Configuration for the LDAP connection of sparky-service
export SPARKY_LDAP=false
export SPARKY_LDAP_DOMAIN=
export SPARKY_LDAP_URLS=
export SPARKY_LDAP_AD=false

########################
###                  ###
### Stu-Mgmt Backend ###
###                  ###
########################

# The public (host) port where the stu-mgmt-backend will be available
export BACKEND_PORT=3000
export BACKEND_SWAGGER_URL=http://localhost:$BACKEND_PORT/api/

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
export FRONTEND_URL=http://localhost:$FRONTEND_PORT

# The webmaster mail used in the apache configuration
# build-time arg
export FRONTEND_WEBMASTER=webmaster@localhost

#################################
###                           ###
### exercise-submitter-server ###
###                           ###
#################################

# The public (host) port where the exercise-submitter-server will be available
export SUBMISSION_SERVER_PORT=8001
export SUBMISSION_SERVER_PATH=http://localhost:$SUBMISSION_SERVER_PORT

# Username and password that the exercise-submitter-server will use to access
# the student management system
export SUBMISSION_SERVER_MGMT_USER=exercise-submitter-server
export SUBMISSION_SERVER_MGMT_PW=some_pw5

##############
###        ###
### WebIDE ###
###        ###
##############

export PISTON_PORT=2000
export WEB_IDE_PORT=8002
export WEB_IDE_URL=http://localhost:$WEB_IDE_PORT
export WEB_IDE_CODE_EXECUTION_PATH=http://localhost:$PISTON_PORT

################
###          ###
### Showcase ###
###          ###
################

export SHOWCASE_PORT=80