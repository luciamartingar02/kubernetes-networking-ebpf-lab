#!/bin/bash

set -e

PROFILE=$(nmcli -t -f NAME,DEVICE connection show | grep ":eth0$" | cut -d: -f1)

nmcli connection modify "$PROFILE" \
    ipv4.addresses 192.168.100.11/24 \
    ipv4.gateway 192.168.100.1 \
    ipv4.dns "1.1.1.1 8.8.8.8" \
    ipv4.method manual

nmcli connection up "$PROFILE"