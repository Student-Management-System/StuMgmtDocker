FROM node:16-alpine AS builder

WORKDIR /opt/StudentMgmtBackend

ARG BACKEND_ARCHIVE
ADD "$BACKEND_ARCHIVE" ./Backend.tar.gz
RUN tar -xf Backend.tar.gz && rm Backend.tar.gz

RUN npm install


FROM node:16-alpine

RUN apk add --no-cache curl

WORKDIR /opt/StudentMgmtBackend

COPY --from=builder /opt/StudentMgmtBackend .

ADD production.yml ./config/production.yml

ADD healthstatus.sh /
HEALTHCHECK --interval=5s --timeout=5s --start-period=30s CMD /healthstatus.sh

EXPOSE 3000

USER node
ENV NODE_ENV=production
CMD [ "node", "dist/src/main" ]
