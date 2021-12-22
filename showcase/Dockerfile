FROM httpd:alpine

ADD ./startup.sh /usr/local/bin

ADD ./img /var/www/html/img
ADD ./index.html /var/www/html
ARG USER_SPARKY_JAR
ADD "$USER_SPARKY_JAR" /var/www/html/misc/User-Sparky.jar
RUN chown -R www-data:www-data /var/www/html
RUN chmod a+r /var/www/html/misc/User-Sparky.jar

ADD httpd.conf /usr/local/apache2/conf/httpd.conf
EXPOSE 80

ENTRYPOINT [ "startup.sh" ]
CMD [ "httpd-foreground" ]
