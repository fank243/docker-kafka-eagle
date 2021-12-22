# docker-kafka-eagle

kafka web 监控工具

Github：https://github.com/smartloli/EFAK

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
