FROM node:14-alpine AS builder

WORKDIR /opt/StudentMgmtBackend

ADD https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Backend/lastSuccessfulBuild/artifact/Backend.tar.gz ./Backend.tar.gz
RUN tar -xf Backend.tar.gz && rm Backend.tar.gz

RUN npm install


FROM node:14-alpine

RUN apk add --no-cache curl

WORKDIR /opt/StudentMgmtBackend

COPY --from=builder /opt/StudentMgmtBackend .

ADD production.yml ./config/production.yml

ADD healthstatus.sh /
#HEALTHCHECK --interval=5s --timeout=5s --start-period=30s CMD /healthstatus.sh

EXPOSE 3000

USER node
ENV NODE_ENV=production
CMD [ "node", "dist/src/main" ]
