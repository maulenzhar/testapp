## Создание Dockerfile
nano Dockerfile.test_app1
```
FROM openjdk:13-jdk-alpine3.10
ARG JAR_FILE=test2.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```
## Собираем образ
```
docker build -t bagabooengin/app:v1 -f Dockerfile.test_app1  .

docker run -it --name edufood -p 8080:8080 bagabooengin/app:v1
```

## Публикуем на dockerhub
```
docker commit edufood bagabooengin/app:v1
docker push bagabooengin/app
```

## Файл для конфигурирования наших сервисов

nano docker-compose.yml
```
version: '3'
services:
  db:
    image: mysql:8.0
    container_name: mysqll
    ports:
      - 3306:3306
    networks:
      test:
        ipv4_address: 10.1.0.100
    volumes:
      - ./sql_data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: test2
      MYSQL_ROOT_HOST: '%'
    restart: always
  app:
    depends_on:
      - db
    image: bagabooengin/app:v1
    ports:
      - 8080:8080
    networks:
      test:
        ipv4_address: 10.1.0.101
    restart: always
    links:
      - db:db
  nginx:
    image: nginx:1.17.2-alpine
    container_name: nginx
    restart: always
    volumes:
      - ./default.conf:/etc/nginx/conf.d/default.conf
    links:
      - app
    ports:
      - 80:80
    networks:
      test:
        ipv4_address: 10.1.0.102
networks:
  test:
    driver: bridge
    ipam:
      driver: default
      config:
          - subnet: 10.1.0.0/24
```
## Конфиг для nginx

nano default.conf
```
upstream application {
  server app:80;
}

server {
   listen 80;
  server_name localhost;

  location / {
    proxy_pass       http://app:8080;
    proxy_set_header Host      $host;
    proxy_set_header X-Real-IP $remote_addr;
  }

}
```