FROM openjdk:8-jre

ENV WIREMOCK_VERSION 2.27.0

# grab wiremock standalone jar
RUN mkdir -p /var/wiremock/lib/ \
  && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$WIREMOCK_VERSION/wiremock-jre8-standalone-$WIREMOCK_VERSION.jar \
  -O /var/wiremock/lib/wiremock-standalone.jar

WORKDIR /var/wiremock

EXPOSE 8080 8443

COPY __files/ __files/
COPY mappings/ mappings/
COPY docker-entrypoint.sh /var/wiremock
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
