FROM openjdk:8-buster

ARG version=2.0.8
WORKDIR /kafka-eagle
ENV KE_HOME=/kafka-eagle
ENV EAGLE_VERSION=$version

COPY v${version}.tar.gz /opt

RUN tar -xf /opt/v$version.tar.gz -C /opt \
&& tar -xf /opt/kafka-eagle-bin-$version/kafka-eagle-web-$version-bin.tar.gz  -C /kafka-eagle --strip-components=1 \
&& rm -rf /opt/* \
&& touch /kafka-eagle/logs/ke_console.out

CMD bash /kafka-eagle/bin/ke.sh start ; sleep 3 ;tail -f /kafka-eagle/logs/ke_console.out