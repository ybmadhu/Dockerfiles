#FROM nginx:alpine
FROM  nimmis/alpine-micro:3.4

COPY run.sh /src/

#COPY bosuiteCA.pem /src/

COPY nginx.conf /src/


COPY development.crt /src/

COPY development.key /src/

COPY symphoni-priv-key.pem /src/

COPY invent_symphoni.crt /src/

COPY bosuiteCA.cer /src/
COPY bosuiteCA.pem /src/

COPY nginx-dev.conf /src/

#RUN keytool -importcert -file /src/bosuiteCA.cer -alias bosuite -keystore /usr/lib/jvm/default-jvm/jre/lib/security/cacerts -keypass changeit -noprompt -storepass changeit

EXPOSE 3005


RUN mkdir /run/nginx

RUN apk update && apk upgrade

RUN  apk add --update ca-certificates nginx

RUN apk add --update bash

RUN chmod +x /src/run.sh

RUN apk add --update --force

RUN apk add --update openssl

#RUN apk add ca-certificates && update-ca-certificates

RUN openssl version -v
RUN nginx -v
#RUN nginx -t -c /src/nginx.conf -s reload
ENTRYPOINT /src/run.sh
#CMD ["nginx", "-g", "daemon off;"]

