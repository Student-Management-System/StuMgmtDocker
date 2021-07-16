# Template for env.sh
# env.sh is not tracked, as it contains secret keys and passwords.

### PostgreSQL ###

export POSTGRES_PASSWORD=some_pw0

### Sparky Service ###

export SPARKY_DB_PW=some_pw1

export SPARKY_ADMIN_USER=admin_user
export SPARKY_ADMIN_PW=some_pw2

export SPARKY_JWT_SECRET="some_secret"

export SPARKY_LDAP=false
export SPARKY_LDAP_DOMAIN=
export SPARKY_LDAP_URLS=
export SPARKY_LDAP_AD=

### Stu-Mgmt Backend ###

export BACKEND_DB_PW=some_pw3

export BACKEND_MAIL_ENABLED=false
export BACKEND_MAIL_SERVER=mail.company.org
export BACKEND_MAIL_USERNAME=stu-mgmt@company.org
export BACKEND_MAIL_PASSWORD=some_pw4
export BACKEND_MAIL_PORT=587

### Stu-Mgmt Frontend ###

export FRONTEND_PUBLIC_BASE_URL=http://localhost:8080

export FRONTEND_WEBMASTER=webmaster@localhost
