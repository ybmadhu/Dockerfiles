FROM  nimmis/alpine-java:openjdk-7-jdk

#RUN ls -a /usr/lib/jvm/default-jvm/jre/lib/amd64/server/

COPY run.sh /src/

COPY nginx.conf /src/

COPY nginx-clojure-0.4.4 /src/nginxclojure/

COPY libs /src/libs/

#RUN ls /usr/lib/jvm/java-1.7-openjdk/

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH $PATH:$JAVA_HOME/bin
#RUN printenv
#RUN java -version
#RUN javac -version
RUN apk --update add build-base ca-certificates linux-headers openssl openssl-dev wget zlib zlib-dev pcre pcre-dev bash
RUN apk update && apk upgrade \
&& cd /tmp \
&& wget http://nginx.org/download/nginx-1.10.1.tar.gz  \
&& tar xzf nginx-1.10.1.tar.gz \
&& cd /tmp/nginx-1.10.1 \
&& ./configure \
   --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/run/nginx.lock \
    --with-pcre-jit \
    --with-http_ssl_module \
    --add-module=/src/nginxclojure/src/c \
&&     make \
&& make install \
#&& sed -i -e 's/#access_log  logs\/access.log  main;/access_log \/dev\/stdout;/' -e 's/#error_log  logs\/error.log  notice;/error_log stderr notice;/' /etc/nginx/nginx.conf \
&&  rm -rf /tmp/* 

RUN nginx -v

#RUN cp /src/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /src/run.sh

RUN apk add ca-certificates && update-ca-certificates

RUN openssl version -v


ENTRYPOINT /src/run.sh


