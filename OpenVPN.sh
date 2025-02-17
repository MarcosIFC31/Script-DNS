#!/bin/bash
#Script Instalación servicio OpenVPN
sudo apt install openvpn -y

wget -O ca.crt https://raw.githubusercontent.com/PauAlumnesS2I/sxi-ci-grup3/refs/heads/main/ca.crt
wget -O usuario1.crt https://raw.githubusercontent.com/PauAlumnesS2I/sxi-ci-grup3/refs/heads/main/usuario1.crt
wget -O usuario1.key https://raw.githubusercontent.com/PauAlumnesS2I/sxi-ci-grup3/refs/heads/main/usuario1.key
wget -O ta.key https://raw.githubusercontent.com/PauAlumnesS2I/sxi-ci-grup3/refs/heads/main/ta.key
wget -O client.conf https://raw.githubusercontent.com/PauAlumnesS2I/sxi-ci-grup3/refs/heads/main/client.conf

mv *.key /etc/openvpn/
mv *.crt /etc/openvpn/
mv client.conf /etc/openvpn/

systemctl start openvpn@client
ip a
