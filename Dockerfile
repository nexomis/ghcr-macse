FROM eclipse-temurin:21-jre-alpine

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
