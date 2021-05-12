# Dockers
Useful dockers for my development.

**pm2-builder**: Includes node, pm2, node-sass. Use to build node-react web app, and run it with pm2

## Development

```sh
# build and push
docker build -t 4074/image-name:tag .
docker push 4074/image-name:tag
```

Run a container using a shell script

docker-run.bat for windows
```bat
set name=appName
set imagePort=3000
set exportPort=4000

docker build -t %name% .
echo built
for /F %%i in ('docker ps -a -q --filter="name=%name%"') do ( set containerId=%%i)

docker stop %containerId%
docker rm %containerId%
docker run --name %name% -d -p %exportPort%:%imagePort% %name%

pause
```

## Examples

### pm2-builder

A project structure likes

    --project
        --app
            --index.tsx
            --package.json
            --webpack.config.js
        --server
            --index.ts
            --package.json
            --pm2.config.js

Dockfile
```dockerfile
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
```