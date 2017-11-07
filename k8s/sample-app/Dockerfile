FROM node:8-alpine


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Labels
LABEL maintainer=nmtuan@fossil.com

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Build steps: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
RUN mkdir -p /src/logs/
WORKDIR /src
ADD package.json /src/
ADD package-lock.json /src/
RUN npm install --production
ADD . /src/

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Application port
ENV PORT=1337
EXPOSE 1337

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Application entrypoint & command
CMD ["node", "server.js"]


