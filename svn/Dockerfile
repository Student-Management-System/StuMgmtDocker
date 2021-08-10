FROM ubuntu:latest

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -qq -y subversion apache2 libapache2-mod-svn libapache2-mod-authnz-external curl openjdk-11-jre-headless jq

ADD authnz-external.conf /etc/apache2/conf-available/
ADD svn-repository.conf /etc/apache2/sites-available/

ADD sparky-login.sh /usr/local/bin/sparky-login.sh
ADD init.sh /

RUN a2enmod authnz_external
RUN a2enconf authnz-external
RUN a2ensite svn-repository


## Rights Management

ARG RIGHTS_MANAGEMENT_JAR
ADD "${RIGHTS_MANAGEMENT_JAR}" /opt/rights-management/rights-management.jar
ADD rights-management-settings.json /opt/rights-management/settings_template.json

ARG SUBMISSION_CHECK_BUNDLE
ADD "${SUBMISSION_CHECK_BUNDLE}" /opt/submission-check/submission-check-bundle.tar.gz
ADD checkstyle-rules.xml /opt/submission-check/checkstyle-rules.xml
RUN cd /opt/submission-check/ && tar -xf submission-check-bundle.tar.gz --strip-components=1 && rm submission-check-bundle.tar.gz

EXPOSE 80
ENTRYPOINT [ "/init.sh" ]
CMD [ "apache2ctl", "-D", "FOREGROUND" ]
