FROM nodered/node-red:latest

RUN npm config set @flowforge:registry https://npm.hardill.me.uk

COPY package.json /data
RUN npm install

USER root

WORKDIR /usr/src/flowforge-nr-launcher
RUN chown node-red:node-red /data/* /usr/src/flowforge-nr-launcher

USER node-red
RUN npm install @flowforge/nr-launcher

ENV NODE_PATH=/usr/src/node-red

EXPOSE 2880

ENTRYPOINT ["./node_modueles/.bin/flowforge-node-red", "index.js", "-p", "2880"]