set name=nginx-www
set imagePort=8080
set exportPort=8081

docker build -t %name% .
echo built
for /F %%i in ('docker ps -a -q --filter="name=%name%"') do ( set containerId=%%i)

docker stop %containerId%
docker rm %containerId%
docker run --name %name% -d -p %exportPort%:%imagePort% %name%

REM docker exec -i -t %name% sh

REM pause