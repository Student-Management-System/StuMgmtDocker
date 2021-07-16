FROM node:14

ARG BACKEND_DB_PW
ARG BACKEND_MAIL_ENABLED=false
ARG BACKEND_MAIL_SERVER
ARG BACKEND_MAIL_USERNAME
ARG BACKEND_MAIL_PASSWORD
ARG BACKEND_MAIL_PORT

WORKDIR /opt/StudentMgmtBackend

COPY package*.json ./
COPY config ./config
COPY dist ./dist

RUN npm install

ADD production.yml ./config/production.yml

RUN sed -i "s|__BACKEND_DB_PW__|${BACKEND_DB_PW}|g" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_ENABLED__|${BACKEND_MAIL_ENABLED}|g" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_SERVER__|${BACKEND_MAIL_SERVER}|g" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_USERNAME__|${BACKEND_MAIL_USERNAME}|g" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_PASSWORD__|${BACKEND_MAIL_PASSWORD}|g" ./config/production.yml
RUN sed -i "s|__BACKEND_MAIL_PORT__|${BACKEND_MAIL_PORT}|g" ./config/production.yml

EXPOSE 3000

ENV NODE_ENV=production
CMD [ "node", "dist/src/main" ]
