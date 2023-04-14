FROM alpine

RUN apk add --no-cache openjdk17-jre-headless curl

WORKDIR /opt/exercise-submission-server

ARG EXERCISE_SUBMISSION_SERVER_JAR
ADD "$EXERCISE_SUBMISSION_SERVER_JAR" ./exercise-submitter-server.jar
RUN chmod a+r exercise-submitter-server.jar

ADD checkstyle-rules.xml checkstyle.xml
RUN chmod a+r checkstyle.xml


ADD healthstatus.sh /
RUN chmod +x /healthstatus.sh
HEALTHCHECK --interval=5s --timeout=5s --start-period=60s CMD /healthstatus.sh

RUN adduser -S -D -H -G www-data www-data
RUN mkdir /storage
RUN chown -R www-data:www-data /storage

# Uses env variables for login to stu-mgmt sytem:
#  SUBMISSION_SERVER_MGMT_USER
#  SUBMISSION_SERVER_MGMT_PW

EXPOSE 8080

USER www-data
CMD [ "java", "-jar", "exercise-submitter-server.jar", \
	"8080", "/storage", "http://sparky-service:8080", "http://stu-mgmt-backend:3000" ]
