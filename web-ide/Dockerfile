FROM httpd:alpine

ADD ./startup.sh /usr/local/bin

# These env variable is used in startup.sh:
#  FRONTEND_API_BASE_URL

ARG WEB_IDE_ARCHIVE
ADD "$WEB_IDE_ARCHIVE" /var/www/html/WEB-IDE-Root.tar.gz
RUN cd /var/www/html && tar -xf WEB-IDE-Root.tar.gz && mv dist/apps/client/* . && rm -r dist WEB-IDE-Root.tar.gz
RUN chown -R www-data:www-data /var/www/html

ADD httpd.conf /usr/local/apache2/conf/httpd.conf

EXPOSE 80

ENTRYPOINT [ "startup.sh" ]
CMD [ "httpd-foreground" ]
