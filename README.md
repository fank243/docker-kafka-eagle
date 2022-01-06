# docker-kafka-eagle

kafka web 监控工具

## kafka-eagle

<https://github.com/smartloli/EFAK>

<https://github.com/smartloli/kafka-eagle-bin>

## 构建步骤

### docker build

```bash
docker build -t kafka-eagle:${version} .
```

### docker run

```bash
# 验证
docker run --name kafka-eagle -it kafka-eagle:${version} sh

java -version
```

### docker push

```bash
docker login

# tag 
docker tag kafka-eagle:${version} fank243/kafka-eagle:${version}

# push
docker push fank243/kafka-eagle:${version}
```

## docker-compose

```yaml
version: '3.7'
services:
  eagle:
    image: fank243/kafka-eagle:${version}
    container_name: eagle
    ports:
      - "8048:8048"
    volumes:
      - ./conf/system-config.properties:/kafka-eagle/conf/system-config.properties
    links: 
      - zookeeper
```
