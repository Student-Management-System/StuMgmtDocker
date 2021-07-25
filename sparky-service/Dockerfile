FROM alpine

RUN apk add --no-cache openjdk11-jre-headless java-postgresql-jdbc curl

WORKDIR /opt/SparkyService

ARG SPARKY_VERSION
ADD https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_Sparkyservice-Project/lastSuccessfulBuild/artifact/target/sparkyservice-api-${SPARKY_VERSION}-spring-boot.jar ./sparkyservice-spring-boot.jar

ADD application-release.properties ./application-release.properties

# These env variables are used in application-release.properties:
#  SPARKY_DB_PW
#  SPARKY_ADMIN_USER
#  SPARKY_ADMIN_PW
#  SPARKY_JWT_SECRET
#  SPARKY_LDAP
#  SPARKY_LDAP_DOMAIN
#  SPARKY_LDAP_URLS
#  SPARKY_LDAP_AD

ADD healthstatus.sh /
HEALTHCHECK --interval=5s --timeout=5s --start-period=60s CMD /healthstatus.sh

EXPOSE 8080

CMD [ "java", "-cp", "sparkyservice-spring-boot.jar:application-release.properties", "org.springframework.boot.loader.JarLauncher" ]
