FROM ubuntu:20.04

ARG SPARKY_VERSION
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

ADD https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_Sparkyservice-Project/lastSuccessfulBuild/artifact/target/sparkyservice-api-${SPARKY_VERSION}-spring-boot.jar ./sparkyservice-spring-boot.jar
ADD application-release.properties ./application-release.properties


RUN sed -i "s|__SPARKY_DB_PW__|${SPARKY_DB_PW}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_ADMIN_USER__|${SPARKY_ADMIN_USER}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_ADMIN_PW__|${SPARKY_ADMIN_PW}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_JWT_SECRET__|${SPARKY_JWT_SECRET}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP__|${SPARKY_LDAP}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP_DOMAIN__|${SPARKY_LDAP_DOMAIN}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP_URLS__|${SPARKY_LDAP_URLS}|g" ./application-release.properties
RUN sed -i "s|__SPARKY_LDAP_AD__|${SPARKY_LDAP_AD}|g" ./application-release.properties

EXPOSE 8080

CMD [ "java", "-cp", "sparkyservice-spring-boot.jar:application-release.properties", "org.springframework.boot.loader.JarLauncher" ]
