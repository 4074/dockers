FROM 4074/pm2-builder:12-alpine AS builder

WORKDIR /www
COPY . /www/
WORKDIR /www
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build
RUN rm -rf node_modules

FROM nginx:1.19.5-alpine

COPY --from=builder /www/build /usr/share/nginx/html

# https://github.com/docker-library/docs/tree/master/nginx#using-environment-variables-in-nginx-configuration
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 8080
