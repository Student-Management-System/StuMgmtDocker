FROM ubuntu:latest

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -qq -y subversion apache2 libapache2-mod-svn libapache2-mod-authnz-external curl

ADD authnz-external.conf /etc/apache2/conf-available/
ADD svn-repository.conf /etc/apache2/sites-available/

ADD sparky-login.sh /usr/local/bin/sparky-login.sh
ADD init-svn.sh /

RUN a2enmod authnz_external
RUN a2enconf authnz-external
RUN a2ensite svn-repository

EXPOSE 80
ENTRYPOINT [ "/init-svn.sh" ]
CMD [ "apache2ctl", "-D", "FOREGROUND" ]
