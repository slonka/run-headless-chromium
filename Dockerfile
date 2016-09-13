FROM markadams/chromium-xvfb

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y curl make build-essential imagemagick

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && npm install -g npm@latest

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /usr/src/app/ && cp -a /tmp/node_modules /usr/src/app/

COPY run-headless-chromium.js /usr/src/app/run-headless-chromium.js
COPY package.json /usr/src/app/package.json
COPY test.sh /usr/src/app/test.sh
COPY site /usr/src/app/site/
