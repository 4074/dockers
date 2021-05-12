FROM 4074/pm2-builder:12-alpine-git-sass4.14.1

WORKDIR /www
COPY app/ /www/app/
COPY server/ /www/server/

WORKDIR /www/app
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build
RUN rm -rf node_modules

WORKDIR /www/server
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build

EXPOSE 8080

CMD [ "pm2-runtime", "start", "pm2.config.js" ]