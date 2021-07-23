FROM ubuntu:latest

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -qq -y subversion apache2 libapache2-mod-svn libaprutil1-dbd-pgsql

ADD svn-repository.conf /etc/apache2/sites-available/

ADD init-svn.sh /

RUN a2ensite svn-repository
RUN a2enmod authn_dbd

EXPOSE 80
ENTRYPOINT [ "/init-svn.sh" ]
CMD [ "apache2ctl", "-D", "FOREGROUND" ]
