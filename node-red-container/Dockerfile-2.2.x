FROM nodered/node-red:2.2.3-16

ARG BUILD_TAG=latest

COPY healthcheck.js /healthcheck.js

COPY package.json /data
WORKDIR /data
RUN npm install --omit=dev --no-audit --no-fund

USER root
RUN mkdir -p /usr/local/ssl-certs

WORKDIR /usr/src/flowforge-nr-launcher
RUN mkdir -p /data/storage
RUN chown node-red:node-red /data/* /usr/src/flowforge-nr-launcher
RUN ln -s /usr/src/flowforge-nr-launcher /usr/src/flowfuse-nr-launcher

USER node-red
RUN --mount=type=secret,id=npm,target=/usr/src/node-red/.npmrc npm install npm install @flowfuse/nr-launcher@${BUILD_TAG} --omit=dev --no-audit --no-fund

ENV NODE_PATH=/usr/src/node-red
ENV HOME=/usr/src/node-red

EXPOSE 2880

ENTRYPOINT ["./node_modules/.bin/flowfuse-node-red", "-p", "2880", "-n", "/usr/src/node-red"]