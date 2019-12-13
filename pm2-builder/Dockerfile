FROM node:12-alpine

ARG FILE='linux-x64-72_binding.node'
# Install node-sass
RUN \
  mkdir /opt/node-sass/ && \
  wget https://github.com/sass/node-sass/releases/download/v4.13.0/$FILE -O /opt/node-sass/$FILE

ENV SASS_BINARY_PATH=/opt/node-sass/$FILE

# Install pm2
RUN npm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]