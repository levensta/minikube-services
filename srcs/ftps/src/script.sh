mkdir -p /var/log/ftp
touch /var/log/ftp/xferlog

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Example-Certificates/CN=localhost.local" \
-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
# adduser -D levensta
# echo levensta > /etc/vsftpd/vsftpd.userlist
echo "root:root" | chpasswd
mv /server/vsftpd.conf /etc/vsftpd/vsftpd.conf


echo "start vsftpd"
vsftpd /etc/vsftpd/vsftpd.conf