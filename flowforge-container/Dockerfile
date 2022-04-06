FROM node:16-alpine

ARG REGISTRY
ARG TAG
RUN if [[ ! -z "$REGISTRY" ]] ; then npm config set @flowforge:registry "$REGISTRY"; fi

RUN apk add --no-cache --virtual build-base g++ make py3-pip sqlite-dev python2

WORKDIR /usr/src/forge
RUN mkdir app bin etc var
COPY package.json /usr/src/forge/app
WORKDIR /usr/src/forge/app
# RUN if [[ -z "$TAG" ]]; then npm install --production --no-audit --no-fund ; else npm install --production --no-audit --no-fund --tag $TAG; fi
RUN npm install --production --no-audit --no-fund
ENV FLOWFORGE_HOME=/usr/src/forge

LABEL org.label-schema.name="Flowforge Kubernetes" \
    org.label-schema.url="https://flowforge.com" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/flowforge/helm" \
    org.label-schema.docker.dockerfile="flowforge-container/Dockerfile" \
    org.schema-label.description="Collaborative, low code integration and automation environment" \
    authors="Flowforge Inc."

EXPOSE 3000

CMD ["./node_modules/.bin/flowforge"]