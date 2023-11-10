FROM node:18-alpine

ARG REGISTRY
ARG REGISTRY_TOKEN
ARG TAG
RUN if [[ ! -z "$REGISTRY_TOKEN" ]]; then echo "//$REGISTRY/:_authToken=$REGISTRY_TOKEN" >> ~/.npmrc ; fi
RUN if [[ ! -z "$REGISTRY" ]] ; then npm config set @flowforge:registry "https://$REGISTRY"; fi

RUN apk add --no-cache --virtual build-base g++ make py3-pip sqlite-dev python3
# RUN npm config set python `which python3` --global

WORKDIR /usr/src/forge
RUN mkdir app bin etc var
COPY package.json /usr/src/forge/app
WORKDIR /usr/src/forge/app
# RUN if [[ -z "$TAG" ]]; then npm install --production --no-audit --no-fund ; else npm install --production --no-audit --no-fund --tag $TAG; fi
RUN npm install --production --no-audit --no-fund
ENV FLOWFORGE_HOME=/usr/src/forge

LABEL org.label-schema.name="FlowFuse Kubernetes" \
    org.label-schema.url="https://flowfuse.com" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/flowfuse/helm" \
    org.label-schema.docker.dockerfile="flowforge-container/Dockerfile" \
    org.schema-label.description="Collaborative, low code integration and automation environment" \
    authors="FlowFuse Inc."

EXPOSE 3000

CMD ["./node_modules/.bin/flowforge"]
