FROM node:14-alpine AS builder

WORKDIR /opt/StudentMgmtBackend

ADD https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Backend/lastSuccessfulBuild/artifact/Backend.tar.gz ./Backend.tar.gz
RUN tar -xf Backend.tar.gz && rm Backend.tar.gz

RUN npm install


FROM node:14-alpine

WORKDIR /opt/StudentMgmtBackend

COPY --from=builder /opt/StudentMgmtBackend .

ADD production.yml ./config/production.yml

ARG BACKEND_DB_PW
RUN sed -i "s|__BACKEND_DB_PW__|${BACKEND_DB_PW}|g" ./config/production.yml
ARG BACKEND_MAIL_ENABLED=false
RUN sed -i "s|__BACKEND_MAIL_ENABLED__|${BACKEND_MAIL_ENABLED}|g" ./config/production.yml
ARG BACKEND_MAIL_SERVER
RUN sed -i "s|__BACKEND_MAIL_SERVER__|${BACKEND_MAIL_SERVER}|g" ./config/production.yml
ARG BACKEND_MAIL_USERNAME
RUN sed -i "s|__BACKEND_MAIL_USERNAME__|${BACKEND_MAIL_USERNAME}|g" ./config/production.yml
ARG BACKEND_MAIL_PASSWORD
RUN sed -i "s|__BACKEND_MAIL_PASSWORD__|${BACKEND_MAIL_PASSWORD}|g" ./config/production.yml
ARG BACKEND_MAIL_PORT
RUN sed -i "s|__BACKEND_MAIL_PORT__|${BACKEND_MAIL_PORT}|g" ./config/production.yml

EXPOSE 3000

USER node
ENV NODE_ENV=production
CMD [ "node", "dist/src/main" ]
