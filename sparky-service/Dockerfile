FROM ubuntu:20.04

ARG SPARKY_DB_USER=sparky_db_user
ARG SPARKY_DB_PW
ARG SPARKY_ADMIN_USER=admin_user
ARG SPARKY_ADMIN_PW
ARG SPARKY_JWT_SECRET
ARG SPARKY_LDAP=false
ARG SPARKY_LDAP_DOMAIN=
ARG SPARKY_LDAP_URLS=
ARG SPARKY_LDAP_AD=true

RUN apt update -y
RUN apt install -y openjdk-11-jre-headless libpostgresql-jdbc-java

WORKDIR /opt/SparkyService

ADD sparkyservice-api-*-spring-boot.jar ./sparkyservice-spring-boot.jar
ADD application-release.properties ./application-release.properties

RUN sed -i "s|__SPARKY_DB_USER__|${SPARKY_DB_USER}|" ./application-release.properties
RUN sed -i "s|__SPARKY_DB_PW__|${SPARKY_DB_PW}|" ./application-release.properties
RUN sed -i "s|__SPARKY_ADMIN_USER__|${SPARKY_ADMIN_USER}|" ./application-release.properties
RUN sed -i "s|__SPARKY_ADMIN_PW__|${SPARKY_ADMIN_PW}|" ./application-release.properties
RUN sed -i "s|__SPARKY_JWT_SECRET__|${SPARKY_JWT_SECRET}|" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP__|${SPARKY_LDAP}|" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP_DOMAIN__|${SPARKY_LDAP_DOMAIN}|" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP_URLS__|${SPARKY_LDAP_URLS}|" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP_AD__|${SPARKY_LDAP_AD}|" ./application-release.properties

EXPOSE 8080

CMD [ "java", "-cp", "sparkyservice-spring-boot.jar:application-release.properties", "org.springframework.boot.loader.JarLauncher" ]
