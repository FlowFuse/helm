FROM nodered/node-red:2.2.3-16

ARG REGISTRY
ARG REGISTRY_TOKEN
ARG BUILD_TAG=latest
RUN if [[ ! -z "$REGISTRY_TOKEN" ]]; then echo "//$REGISTRY/:_authToken=$REGISTRY_TOKEN" >> ~/.npmrc ; fi
RUN if [[ ! -z "$REGISTRY" ]] ; then npm config set @flowfuse:registry "https://$REGISTRY"; fi

COPY healthcheck.js /healthcheck.js

COPY package.json /data
WORKDIR /data
RUN mkdir node_modules
RUN npm install

USER root

WORKDIR /usr/src/flowforge-nr-launcher
RUN chown -R node-red:node-red /usr/src/flowforge-nr-launcher

USER node-red
RUN npm install @flowfuse/nr-launcher@${BUILD_TAG}

USER root
RUN chmod -R g+w /data/* /data/.npm/* 
RUN chown -R node-red:root /data/* /data/.npm/* 

USER node-red

ENV NODE_PATH=/usr/src/node-red
ENV HOME=/usr/src/node-red

EXPOSE 2880

ENTRYPOINT ["./node_modules/.bin/flowfuse-node-red", "-p", "2880", "-n", "/usr/src/node-red"]