#!/bin/bash
rm ip.list
/root/random2.sh > /root/ip.list
cd 3proxy
rm 3proxy.cfg
/root/3proxy/3proxy.sh > /root/3proxy/3proxy.cfg
/usr/sbin/service rc.local restart

