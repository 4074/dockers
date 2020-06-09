FROM php:7.1-cli  

RUN apt-get update

RUN apt-get install curl git zip --assume-yes
RUN apt-get install libx11-xcb1
RUN apt-get install -y wget
RUN rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install node
RUN curl -L -O https://nodejs.org/dist/v14.4.0/node-v14.4.0-linux-x64.tar.xz \
  && tar -xf node-v14.4.0-linux-x64.tar.xz \
  && rm -rf node-v14.4.0-linux-x64.tar.xz \
  && mv node-v14.4.0-linux-x64 /usr/local/lib/node \
  && chmod u+x /usr/local/lib/node/bin/*
ENV PATH="/usr/local/lib/node/bin:${PATH}"

# Install node-sass
ARG FILE='linux-x64-83_binding.node'
RUN \
  mkdir -m 777 /opt/node-sass/ && \
  wget https://github.com/sass/node-sass/releases/download/v4.14.1/$FILE -O /opt/node-sass/$FILE
ENV SASS_BINARY_PATH=/opt/node-sass/$FILE

RUN npm config set registry https://registry.npm.taobao.org/
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
