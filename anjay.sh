#!/bin/bash
clear
rm -fr *
clear

#// Folder
mkdir -p /etc/funny
mkdir -p /etc/xray

# // Cek Domain
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi

clear

# // Masukan Domain
clear
read -p "Input Domain: " domain
echo "$domain" > /etc/xray/domain

# // Install Depen
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
apt install wget curl -y
apt install htop -y
apt install sed -y
apt install cron -y
apt install socat -y
apt install zip unzip -y

# // udpgw
REPO="https://raw.githubusercontent.com/NevermoreSSH/VVV/main/"
wget -O /usr/sbin/badvpn "${REPO}badvpn/badvpn" >/dev/null 2>&1
chmod +x /usr/sbin/badvpn > /dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn1.service "${REPO}badvpn/badvpn3.service" >/dev/null 2>&1
systemctl disable badvpn3
systemctl stop badvpn3
systemctl enable badvpn3
systemctl start badvpn3

# Install NoobzVPN

mkdir -p /etc/noobzvpns

# [ Membuat Json Config yang di gunakan pada server ]
cat > /etc/noobzvpns/config.json <<-JSON
{
"tcp_std": [
8080
],
"tcp_ssl": [
8443
],
"ssl_cert": "/etc/noobzvpns/cert.pem",
"ssl_key": "/etc/noobzvpns/key.pem",
"ssl_version": "AUTO",
"conn_timeout": 60,
"dns_resolver": "/etc/resolv.conf",
"http_ok": "HTTP/1.1 101 Switching Protocols[crlf]Upgrade: websocket[crlf][crlf]"
}
JSON
# Port Dari tcp_std & tcp_ssl edit sesuai kemauan kalian agar tidak bentrok dengan service lain pada vps kalian


# [ wget ambil file ]
wget -O /usr/bin/noobzvpns "https://github.com/noobz-id/noobzvpns/raw/master/noobzvpns.x86_64"
wget -O /etc/noobzvpns/cert.pem "https://github.com/noobz-id/noobzvpns/raw/master/cert.pem"
wget -O /etc/noobzvpns/key.pem "https://github.com/noobz-id/noobzvpns/raw/master/key.pem"

# [ memberi izin pada file json & cert + key ]
chmod +x /etc/noobzvpns/*

# [ Memberi Izin Exec pada file biner ]
chmod +x /usr/bin/noobzvpns

# [ Mengambil Service yang di perlukan ]
wget -O /etc/systemd/system/noobzvpns.service "https://github.com/noobz-id/noobzvpns/raw/master/noobzvpns.service"

# [ Enable & Start Service ]
systemctl enable noobzvpns
systemctl restart noobzvpns

clear
echo " Done Install "

# // Certificate
cd /root/
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m rere@rerechan02.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key

# // setting ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
echo "Rerechan02" > /etc/issue.net

# / Nginx
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
rm -fr /etc/nginx/nginx.conf
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/Rerechan-Store/Rerechan-Store.github.io/main/.nginx"
wget -O /var/www/html/index.html https://github.com/Rerechan02/Rerechan02.github.io/raw/main/index.html
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m rere;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
/etc/init.d/nginx restart
clear

# // Seting Cron
echo "*/15 * * * * root mullog" >> /etc/crontab
echo "*/15 * * * * root xp" >> /etc/crontab

# // Seting Lainya
APW="sc.funy.biz.id"

# // Biner Core
cd /usr/local/bin
wget -O m.zip "${APW}mla.zip"
unzip m.zip
rm -fr m.zip
chmod 777 *
cd

# // Seting Login
echo "
clear
neofetch
echo -e "Type menu To access All Menu Panel" " > /roo/.profile

# Service
cat > /etc/systemd/system/ws.service << END
[Unit]
Description=Websocket Enhanced FN Project
Documentation=https://t.me/fn_project
Documentation=https://t.me/Rerechan02
Documentation=https://wa.me/6283120684925
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/usr/local/bin/ws -f /usr/local/bin/ws.conf
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable ws
systemctl start ws
systemctl restart nginx
systemctl enable nginx
systemctl enable ssh
sytemctl start ssh
systemctl restart cron
clear

# Done
echo -e "
============
 Done Install
============
"
echo "Reboot 5sec"
sleep 5
reboot