wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
apk add glibc-2.33-r0.apk

# wget https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz #replaced to ADD
tar -xzf grafana-7.5.4.linux-amd64.tar.gz
rm -rf grafana-7.5.4.linux-amd64.tar.gz

mkdir /grafana-7.5.4/data/
mv /server/grafana.db /grafana-7.5.4/data/grafana.db

cd /grafana-7.5.4/bin/
./grafana-server
# bash