#!/bin/bash +e

java -jar   -Dserver.port=443 -Dserver.ssl.key-store="/src/symphoni.jks" -Dserver.ssl.key-store-password="syncoms" -Dserver.ssl.key-alias="symphoni" /src/helloworld_SB_Jetty-0.1.jar

