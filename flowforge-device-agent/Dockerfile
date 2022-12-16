FROM node:16-alpine

RUN mkdir /opt/flowforge-device
RUN npm install -g @flowforge/flowforge-device-agent

EXPOSE 1880

CMD ["flowforge-device-agent"]
