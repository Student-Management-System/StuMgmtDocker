FROM httpd:alpine

ADD ./startup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/startup.sh

# These env variable is used in startup.sh:
#  FRONTEND_API_BASE_URL

ADD https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Client/lastSuccessfulBuild/artifact/Client-Root.tar.gz /var/www/html/Client-Root.tar.gz
RUN cd /var/www/html && tar -xf Client-Root.tar.gz && mv dist/student-mgmt-client/* . && rm -r dist Client-Root.tar.gz
RUN chown -R www-data:www-data /var/www/html

ADD httpd.conf /usr/local/apache2/conf/httpd.conf

EXPOSE 80

ENTRYPOINT [ "startup.sh" ]
CMD [ "httpd-foreground" ]
