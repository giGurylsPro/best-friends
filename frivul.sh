#!/bin/bash

echo -e "\033[31;4mEnter Ipv6\033[0m";read ipv6

echo -e "\033[31;4mEndPoint\033[0m";read endpoint

echo -e "\033[31;4mipv4 address:\033[0m";read ipv4

echo -e "\033[31;4minterfaces tour (eth0,ech1,ens3.....)\033[0m";read ipvtur

cat > /etc/network/interfaces << END
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

#source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto $ipvtur
iface $ipvtur inet dhcp
iface $ipvtur inet6 auto

auto he-ipv6
iface he-ipv6 inet6 v4tunnel
        address $ipv6::2
        netmask 64
        endpoint $endpoint
        local $ipv4
        ttl 255
        gateway $ipv6::1
END