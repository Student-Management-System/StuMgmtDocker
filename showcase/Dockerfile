FROM httpd:alpine

ADD ./startup.sh /usr/local/bin

ADD ./img /var/www/html/img
ADD ./index.html /var/www/html
RUN chown -R www-data:www-data /var/www/html

ADD httpd.conf /usr/local/apache2/conf/httpd.conf
EXPOSE 80

ENTRYPOINT [ "startup.sh" ]
CMD [ "httpd-foreground" ]
