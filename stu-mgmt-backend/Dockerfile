FROM node:14

ARG BACKEND_DB_USER=studentmgmt_db_user
ARG BACKEND_DB_PW
ARG BACKEND_JWT_SECRET
ARG BACKEND_MAIL_SERVER
ARG BACKEND_MAIL_USERNAME

WORKDIR /opt/StudentMgmtBackend

COPY package*.json ./
COPY config ./config
COPY dist ./dist

RUN npm install

ADD production.yml ./config/production.yml

RUN sed -i "s|__BACKEND_DB_USER__|${BACKEND_DB_USER}|" ./config/production.yml
RUN sed -i "s|__BACKEND_DB_PW__|${BACKEND_DB_PW}|" ./config/production.yml
RUN sed -i "s|__BACKEND_JWT_SECRET__|${BACKEND_JWT_SECRET}|" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_SERVER__|${BACKEND_MAIL_SERVER}|" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_USERNAME__|${BACKEND_MAIL_USERNAME}|" ./config/production.yml

EXPOSE 3000

ENV NODE_ENV=production
CMD [ "node", "dist/src/main" ]
