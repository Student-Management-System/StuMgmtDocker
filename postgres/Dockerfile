FROM postgres:alpine

ADD init-sparky.sh /docker-entrypoint-initdb.d/1-init-sparky.sh
ADD init-stu-mgmt-backend.sh /docker-entrypoint-initdb.d/2-init-stu-mgmt-backend.sh

# These environment variables are used in the init scripts:
#  SPARKY_DB_PW
#  BACKEND_DB_PW
# Additionally, postgres uses:
#  POSTGRES_PASSWORD
