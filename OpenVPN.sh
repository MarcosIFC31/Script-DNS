#!/bin/bash
#Script Instalación servicio OpenVPN
sudo apt install openvpn -y

wget -O ca.crt https://raw.githubusercontent.com/MarcosIFC31/Script-DNS/refs/heads/main/ca.crt
wget -O usuario1.crt https://raw.githubusercontent.com/MarcosIFC31/Script-DNS/refs/heads/main/usuario.crt
wget -O usuario1.key https://raw.githubusercontent.com/MarcosIFC31/Script-DNS/refs/heads/main/usuario.key
wget -O ta.key https://raw.githubusercontent.com/MarcosIFC31/Script-DNS/refs/heads/main/ta.key
wget -O client.conf https://raw.githubusercontent.com/MarcosIFC31/Script-DNS/refs/heads/main/client.conf

mv *.key /etc/openvpn/
mv *.crt /etc/openvpn/
mv client.conf /etc/openvpn/

systemctl start openvpn@client
ip a
