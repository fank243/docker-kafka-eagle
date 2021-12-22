# docker-kafka-eagle

kafka web 监控工具

Github：https://github.com/smartloli/EFAK

## 构建步骤

### 构建镜像

```bash
docker build -t kafka-eagle:2.0.8 .
```

### 验证镜像

```bash
# 验证
docker run --name kafka-eagle -it kafka-eagle:2.0.8 sh

java -version

# +0800 时区验证
date -R
```

### 推送镜像到hub.docker.com

```bash
docker login

# tag 
docker tag kafka-eagle:2.0.8 fank243/kafka-eagle:2.0.8

# push
docker push fank243/kafka-eagle:2.0.8
```

## 使用

docker-compose

```yaml
version: '3.7'
services:
  eagle:
    image: fank243/kafka-eagle:2.0.8
    container_name: eagle
    ports:
      - "8048:8048"
    volumes:
      - ./conf/system-config.properties:/kafka-eagle/conf/system-config.properties
    links: 
      - zookeeper
```
