#!/bin/bash +e

#mkdir -p /etc/pki/mantl
#mkdir -p /etc/pki/CA
#ls /etc/pki/mantl
#ls  /etc/pki/CA

#cat /etc/pki/mantl/cert >> /etc/pki/mantl/input.pem
#cat /etc/pki/CA/ca.cert >> /etc/pki/mantl/input.pem

#cat /etc/pki/mantl/cert >> /etc/pki/mantl/temp.pem

#cp /etc/pki/CA/ca.cert /etc/pki/CA/ca.pem
#cp /etc/pki/CA/ca.pem /usr/local/share/ca-certificates
#cp /etc/pki/mantl/input.pem /usr/local/share/ca-certificates

cp /src/bosuiteCA.pem /usr/local/share/ca-certificates
update-ca-certificates

#sudo service nginx start
#/usr/bin/nginx  -c /etc/nginx/nginx.conf
# nginx -t -c /src/nginx.conf -s reload 
#openssl s_client -connect mantl-do-nyc2-worker-009.node.consul:31214

#nginx -c /src/nginx.conf
env_mode='';
env_mode=`printenv bo.custom.environment`
echo $env_mode;
if [ "$env_mode" == "STAGING" ]; then
echo  Staging mode or development mode;
nginx -c /src/nginx-dev.conf
elif [ "$env_mode" == "PRODUCTION" ]; then
echo Production mode;
nginx -c /src/nginx.conf
else
echo  "No  environment is set. entering default mode which is production "
nginx -c /src/nginx.conf
fi

