FROM nimmis/alpine-java:openjdk-8-jre

WORKDIR /src

COPY development.jks /src/

COPY bosuiteCA.cer /src/
COPY symphoni.jks /src/

COPY helloworld_SB_Jetty-0.1.jar  /src/

COPY run.sh /src/

COPY bosuiteCA.pem /usr/local/share/ca-certificates

RUN update-ca-certificates

RUN apk add openssl --force

RUN apk add --update bash

RUN apk add  jq

RUN keytool -importcert -file /src/bosuiteCA.cer -alias bosuite -keystore /usr/lib/jvm/default-jvm/jre/lib/security/cacerts -keypass changeit -noprompt -storepass changeit

EXPOSE 2005

RUN chmod +x /src/run.sh

ENTRYPOINT /src/run.sh


