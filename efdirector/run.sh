#!/bin/bash +e

mkdir -p /etc/pki/mantl
mkdir -p /etc/pki/CA
#ls /etc/pki/mantl
#ls  /etc/pki/CA

cat /etc/pki/mantl/cert >> /etc/pki/mantl/input.pem
cat /etc/pki/CA/ca.cert >> /etc/pki/mantl/input.pem
cat /etc/pki/mantl/cert >> /etc/pki/mantl/temp.pem
cp /etc/pki/CA/ca.cert /etc/pki/CA/ca.pem
cp /etc/pki/CA/ca.pem /usr/local/share/ca-certificates
cp /etc/pki/mantl/input.pem /usr/local/share/ca-certificates

update-ca-certificates

nginx -c /src/nginx.conf
#cd /src/nginxclojure
#./nginx

