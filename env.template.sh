# Template for env.sh
# env.sh is not tracked, as it contains secret keys and passwords.


### Sparky Service ###

export SPARKY_DB_USER=sparky_db_user
export SPARKY_DB_PW=some_pw1

export SPARKY_ADMIN_USER=admin_user
export SPARKY_ADMIN_PW=some_pw2

export SPARKY_JWT_SECRET="some_secret1"

export SPARKY_LDAP=false
export SPARKY_LDAP_DOMAIN=
export SPARKY_LDAP_URLS=
export SPARKY_LDAP_AD=

### Stu-Mgmt Backend ###

export BACKEND_DB_USER=studentmgmt_db_user
export BACKEND_DB_PW=some_pw3

export BACKEND_JWT_SECRET="some_secret2"

export BACKEND_MAIL_SERVER=mail.company.org
export BACKEND_MAIL_USERNAME=stu-mgmt@company.org

### Stu-Mgmt Frontend ###

export FRONTEND_PUBLIC_BASE_URL=http://localhost:8080

export FRONTEND_WEBMASTER=webmaster@localhost
