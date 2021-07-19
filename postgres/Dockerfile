FROM postgres

ARG POSTGRES_PASSWORD
ARG SPARKY_DB_PW
ARG BACKEND_DB_PW

ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

ADD init-sparky.sql /docker-entrypoint-initdb.d/1-init-sparky.sql
ADD init-stu-mgmt-backend.sql /docker-entrypoint-initdb.d/2-init-stu-mgmt-backend.sql

RUN sed -i "s|__SPARKY_DB_PW__|${SPARKY_DB_PW}|g" /docker-entrypoint-initdb.d/1-init-sparky.sql
RUN sed -i "s|__BACKEND_DB_PW__|${BACKEND_DB_PW}|g" /docker-entrypoint-initdb.d/2-init-stu-mgmt-backend.sql
