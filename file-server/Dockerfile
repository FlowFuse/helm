FROM node:20-alpine

ARG TAG

RUN apk add --no-cache --virtual build-base g++ make py3-pip sqlite-dev python3
# RUN npm config set python `which python3` --global

WORKDIR /usr/src/flowforge-file-server
RUN mkdir app bin etc var
COPY package.json /usr/src/flowforge-file-server/app
WORKDIR /usr/src/flowforge-file-server/app
RUN --mount=type=secret,id=npm,target=/root/.npmrc npm install --omit=dev --no-audit --no-fund
ENV FLOWFORGE_HOME=/usr/src/flowforge-file-server

LABEL org.label-schema.name="FlowFuse File Storage" \
    org.label-schema.url="https://flowfuse.com" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/flowfuse/helm" \
    org.label-schema.docker.dockerfile="fileserver/Dockerfile" \
    org.schema-label.description="Collaborative, low code integration and automation environment" \
    authors="FlowFuse Inc."

EXPOSE 3001

CMD ["./node_modules/.bin/ff-file-storage"]
