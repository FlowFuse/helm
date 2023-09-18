FROM nodered/node-red:3.0.2-16

ARG BUILD_TAG=latest

COPY healthcheck.js /healthcheck.js

COPY package.json /data
WORKDIR /data
RUN npm install

USER root

WORKDIR /usr/src/flowforge-nr-launcher
RUN chown node-red:node-red /data/* /usr/src/flowforge-nr-launcher

USER node-red
RUN npm install @flowforge/nr-launcher@${BUILD_TAG}

ENV NODE_PATH=/usr/src/node-red
ENV HOME=/usr/src/node-red

EXPOSE 2880

ENTRYPOINT ["./node_modules/.bin/flowforge-node-red", "-p", "2880", "-n", "/usr/src/node-red"]