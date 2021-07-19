FROM httpd:2.4

ADD https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Client/lastSuccessfulBuild/artifact/Client-Root.tar.gz /var/www/html/Client-Root.tar.gz
RUN cd /var/www/html && tar -xf Client-Root.tar.gz && mv dist/student-mgmt-client/* . && rm -r dist Client-Root.tar.gz
RUN chown -R www-data:www-data /var/www/html

ADD env.js /var/www/html/env.js
ADD httpd.conf /usr/local/apache2/conf/httpd.conf

ARG FRONTEND_SPARKY_HOST=http://localhost:8080
RUN sed -i "s|__FRONTEND_SPARKY_HOST__|${FRONTEND_SPARKY_HOST}|g" /var/www/html/env.js
ARG FRONTEND_WEBMASTER=webmaster@localhost
RUN sed -i "s|__FRONTEND_WEBMASTER__|${FRONTEND_WEBMASTER}|g" /usr/local/apache2/conf/httpd.conf

EXPOSE 80
