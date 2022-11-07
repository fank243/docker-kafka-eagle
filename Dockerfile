FROM fank243/dragonwell:1.8.0_312

ARG version=3.0.2
WORKDIR /kafka-eagle
ENV KE_HOME=/kafka-eagle
ENV EAGLE_VERSION=$version

COPY efak-web-${version}-bin.tar.gz /opt

RUN tar -xf /opt/efak-web-$version-bin.tar.gz -C /opt \
&& tar -xf /opt/efak-web-$version-bin.tar.gz  -C /kafka-eagle --strip-components=1 \
&& rm -rf /opt/* \
&& touch /kafka-eagle/logs/ke_console.out

CMD sh /kafka-eagle/bin/ke.sh start ; sleep 3 ;tail -f /kafka-eagle/logs/ke_console.out