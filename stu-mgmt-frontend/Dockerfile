FROM httpd:alpine

ADD ./startup.sh /usr/local/bin

# These env variable is used in startup.sh:
#  FRONTEND_API_BASE_URL

ARG CLIENT_ARCHIVE
ADD "$CLIENT_ARCHIVE" /var/www/html/Client-Root.tar.gz
RUN cd /var/www/html && tar -xf Client-Root.tar.gz && mv dist/apps/client/* . && rm -r dist Client-Root.tar.gz
RUN chown -R www-data:www-data /var/www/html

ADD httpd.conf /usr/local/apache2/conf/httpd.conf

EXPOSE 80

ENTRYPOINT [ "startup.sh" ]
CMD [ "httpd-foreground" ]
