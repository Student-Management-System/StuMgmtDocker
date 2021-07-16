FROM httpd:2.4

ARG FRONTEND_SPARKY_HOST=http://localhost
ARG FRONTEND_WEBMASTER=webmaster@localhost

COPY --chown=www-data:www-data dist/student-mgmt-client/ /var/www/html
COPY env.js /var/www/html/env.js
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN sed -i "s|__FRONTEND_SPARKY_HOST__|${FRONTEND_SPARKY_HOST}|" /var/www/html/env.js
RUN sed -i "s|__FRONTEND_WEBMASTER__|${FRONTEND_WEBMASTER}|" /usr/local/apache2/conf/httpd.conf

EXPOSE 80
