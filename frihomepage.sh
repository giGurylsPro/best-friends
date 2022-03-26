#!/bin/bash

ifconfig

apt-get update && apt-get install "gcc++" git make screen mc wget -y

echo -e "\033[31;4m how the ports should be (example 30000 ) \033[0m";read port1

echo -e "\033[31;4mHow many proxies are you going to install?\033[0m";read adet

echo -e "\033[31;4mEnter Ipv6\033[0m";read ipv6

echo -e "\033[31;4mIf the Proxy type is http, type proxy, and if socks5, type socks, press enter.\033[0m";read turuset

echo -e "\033[31;4mEndPoint\033[0m";read endpoint

curl -O https://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@raw.githubusercontent.com/giGurylsPro/best-friends/master/frirandom.sh

cd

chmod +x frirandom.sh

sed -i 's/\r//' frirandom.sh

sed -e "s/MAXCOUNT=4200/MAXCOUNT=$adet/" /root/frirandom.sh > /root/random1.sh

chmod +x random1.sh

sed -i 's/\r//' random1.sh

sed -e "s/network=2001:470:1f0f:a7/network=$ipv6/" /root/random1.sh > /root/random2.sh

chmod +x random2.sh

sed -i 's/\r//' random2.sh

./random2.sh > ip.list

echo -e "\033[31;4mipv4 address:\033[0m";read ipv4

echo -e "\033[31;4minterfaces tour (eth0,ech1,ens3.....)\033[0m";read ipvtur

apt install unzip

apt install build-essential -y

apt install git

cd ~
git clone https://github.com/DanielAdolfsson/ndppd.git
cd ~/ndppd
make all && make install

cat > ndppd.conf << END
route-ttl 30000
proxy $ipvtur {
   router no
   timeout 500
   ttl 30000
   rule $ipv6::/64 {
      static
   }
}
END

ndppd -d -c /root/ndppd/ndppd.conf

cd ~
cd ~
git clone https://github.com/z3APA3A/3proxy.git
cd 3proxy/
make -f Makefile.Linux

cat > 3proxy.sh << END
#!/bin/bash

echo daemon
echo maxconn 20000
echo nserver 77.88.8.8
echo nserver 77.88.8.1
echo nscache 65536
echo timeouts 1 5 30 60 180 1800 15 60
echo setgid 65535
echo setuid 65535
echo stacksize 6000
echo flush

port=$port1
count=1
as=echo cat /root/ip.list
for i in `\$(as)`; do
    echo "$turuset -6 -s0 -n -a -p\$port -i$ipv4 -e\$i"
    ((port+=1))
    ((count+=1))
    if [ $count -eq 10001 ]; then
        exit
    fi
done
END

chmod +x 3proxy.sh

./3proxy.sh > 3proxy.cfg

ulimit -n 600000
ulimit -u 600000

cat >> /etc/sysctl.conf << END
net.ipv6.conf.all.proxy_ndp = 1
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
net.ipv6.ip_nonlocal_bind = 1
net.ipv6.route.max_size = 409600
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv6.neigh.default.gc_thresh3 = 102400
END

sysctl -p

cd

#!/bin/bash

portlarr=portt
cat > /root/2proxy.sh << END
#!/bin/bash

port=$port1
count=1
for i in \$(cat /root/ip.list); do
    echo "$ipv4:\$port"
    ((port+=1))
    ((count+=1))
    if [ \$count -eq 10001 ]; then
        exit
    fi
done
END

chmod +x /root/2proxy.sh

./2proxy.sh > /root/proxyler.txt

/sbin/ip -6 addr add $ipv6::2/64 dev $i
/sbin/ip -6 route add default via $ipv6::1
/sbin/ip -6 route add local $ipv6::/64 dev lo

cat > /etc/rc.local << END
#!/bin/bash
ulimit -n 600000
ulimit -u 600000
/sbin/ip -6 addr add $ipv6::2/64 dev ens3
/sbin/ip -6 route add default via $ipv6::1
/sbin/ip -6 route add local $ipv6::/64 dev lo
/root/ndppd/ndppd -d -c /root/ndppd/ndppd.conf
/root/3proxy/bin/3proxy /root/3proxy/3proxy.cfg
exit 0
END

chmod +x /etc/rc.local
systemctl enable rc-local.service
systemctl start rc-local.service
/usr/sbin/service rc.local restart

cd

echo -e "\033[33;4mNormal Proxy is installed downloading the necessary files to Rotate..\033[0m"

curl -O https://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@raw.githubusercontent.com/giGurylsPro/best-friends/master/frirota.sh

chmod +x frirota.sh

apt install rar

echo -e "\033[33;4mFiles needed to Rotate downloaded all you have to do is set the crontab\033[0m"

crontab -e

cd

curl -O https://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@raw.githubusercontent.com/giGurylsPro/best-friends/master/fritestt.sh

chmod +x fritestt.sh

sed -i -e 's/\r$//' fritestt.sh

cd /root/

./fritestt.sh

echo -e "\033[33;4mSuccessfully completed\033[0m"
