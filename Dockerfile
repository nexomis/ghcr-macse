FROM eclipse-temurin:21-jre-alpine

LABEL org.opencontainers.image.title="MACSE with openjdk-jre on Alpine Linux (Eclipse Temurin)"
LABEL org.opencontainers.image.authors="Julien FOURET"
LABEL org.opencontainers.image.description="[MACSE](https://www.agap-ge2pop.org/macse/) - CECILL-2.1 \
 with [openjdk-jre](https://openjdk.org/) - GPL-2.0-only"
LABEL org.opencontainers.image.vendor="Nexomis"
LABEL org.opencontainers.image.licenses="Apache-2.0 AND GPL-2.0-only AND CECILL-2.1"

RUN apk add --update-cache \
  wget \
  bash \
  && wget https://www.agap-ge2pop.org/wp-content/uploads/macse/releases/macse_v2.07.jar \
  && mkdir /opt/macse \
  && mv macse_v2.07.jar /opt/macse/ \
  && chmod o+rx /opt/macse/macse_v2.07.jar \
  && echo '#!/bin/bash' > /usr/local/bin/macse \
  && echo 'java -jar /opt/macse/macse_v2.07.jar "$@"' >> /usr/local/bin/macse \
  && chmod o+rx /usr/local/bin/macse \
  && apk del wget \
  && rm -rf /var/cache/apk/*

ENTRYPOINT [""]
CMD [""]
