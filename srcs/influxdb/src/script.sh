cd server

wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
apk add glibc-2.33-r0.apk

wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.1_linux_amd64.tar.gz
tar xf telegraf-1.18.1_linux_amd64.tar.gz
tar xzf influxdb2-2.0.4-linux-amd64.tar.gz
rm -rf influxdb2-2.0.4-linux-amd64.tar.gz
rm -rf telegraf-1.18.1_linux_amd64.tar.gz

mv ./influxdb2-2.0.4-linux-amd64 /etc/influxdb/
cp -r ./telegraf-1.18.1/* /

mkdir -p /var/log/supervisor
mv /server/supervisord.conf /etc/supervisord.conf
cd /
./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > etc/telegraf/telegraf.conf
# /usr/bin/supervisord -c /etc/supervisord.conf

# bash