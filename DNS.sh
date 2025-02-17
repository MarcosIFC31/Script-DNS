#!/bin/bash
#Script de configuración DNS Grup1

apt install -y bind9

#Zona programaciocor.com
cat <<EOT > /etc/bind/db.buguisoft.com
\$TTL 1M
@   IN  SOA ns01.buguisoft.com. admin.buguisoft.com. (
    2008052001
    120
    60
    86400
    60 )
@   IN  NS  ns01.buguisoft.com.
@   IN  NS  ns02.buguisoft.com.
@   IN  MX  10 mail01.buguisoft.com.
@   IN  MX  20 mail02.buguisoft.com.
www IN  CNAME web.buguisoft.com.
ftp IN  CNAME file.buguisoft.com.
ns01 IN  A 192.168.144.140
ns02 IN  A 192.168.144.141
mail01 IN A 192.168.144.142
mail02 IN A 192.168.144.143
web IN A 192.168.144.144
file IN A 192.168.144.145
@    IN A 192.168.144.146
EOT

#Subzona estacions.buguisoft.com
cat <<EOT > /etc/bind/db.estacions.buguisoft.com
\$TTL 1M
@   IN  SOA ns01.buguisoft.com. admin.buguisoft.com. (
    2008052001
    120
    60
    86400
    60 )
@   IN  NS  ns01.buguisoft.com.
@   IN  NS  ns02.buguisoft.com.
@   IN  NS 192.168.144.140
est01 IN  A 10.18.32.2
est02 IN  A 10.18.32.3
est03 IN  A 10.18.32.4
est04 IN  A 10.18.32.5
est05 IN  A 10.18.32.6
EOT

#Zona inversa 10.18.32
cat <<EOT > /etc/bind/db.10.18.32
\$TTL 1M
@   IN  SOA ns01.buguisoft.com. admin.buguisoft.com. (
    2008052001
    120
    60
    86400
    60 )
@   IN  NS  ns01.buguisoft.com.
@   IN  NS  ns02.buguisoft.com.
2   IN  PTR est01.buguisoft.com.
3   IN  PTR est02.buguisoft.com.
4   IN  PTR est03.buguisoft.com.
5   IN  PTR est04.buguisoft.com.
6   IN  PTR est05.buguisoft.com.
EOT

cat <<EOT >> "/etc/bind/named.conf.local"

zone "buguisoft.com" {
    type master;
    file "/etc/bind/db.buguisoft.com";
};

zone "estacions.buguisoft.com" {
    type master;
    file "/etc/bind/db.estacions.buguisoft.com";
};

zone "32.18.10.in-addr.arpa" {
    type master;
    file "/etc/bind/db.10.18.32";
};
EOT

systemctl restart bind9
systemctl status bind9
