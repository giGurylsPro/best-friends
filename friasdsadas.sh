#!/bin/bash

echo -e "\033[31;4mipv4 address:\033[0m";read ipv44

echo -e "\033[31;4mUserName:\033[0m";read useerr

echo -e "\033[31;4mpassword:\033[0m";read passrs

echo -e "\033[31;4m how the ports should be (example 30000 ) \033[0m";read portt

echo -e "\033[31;4m If the Proxy type is http, type proxy, and if socks5, type socks, press enter.\033[0m";read turusets

cd

cat > /root/fridrok.sh << END
#!/bin/bash

echo daemon
echo maxconn 20000
echo nserver 198.153.192.1
echo nserver 198.153.194.1
echo nscache 65536
echo timeouts 1 5 30 60 180 1800 15 60
echo setgid 65535
echo setuid 65535
echo stacksize 6000
echo flush
echo auth strong
echo users $useerr:CL:$passrs
echo allow $useerr

port=$portt
count=1
for i in \$(cat /root/ip.list); do
    echo "$turusets -6 -s0 -n -a -p\$port -i$ipv44 -e\$i"
    ((port+=1))
    ((count+=1))
    if [ \$count -eq 10001 ]; then
        exit
    fi
done
END

chmod +x fridrok.sh

./fridrok.sh > /root/3proxy/3proxy.cfg

cd

cat > /root/4proxy.sh << END
#!/bin/bash

port=$portt
count=1
for i in \$(cat /root/ip.list); do
    echo "$ipv44:\$port:$useerr:$passrs"
    ((port+=1))
    ((count+=1))
    if [ \$count -eq 10001 ]; then
        exit
    fi
done
END

chmod +x 4proxy.sh

./4proxy.sh > /root/PASSWORDproxyler.txt

./4proxy.sh > /root/PASSWORD2proxyler.txt

cat > /root/rotate.sh << END
#!/bin/bash
rm ip.list
/root/random2.sh > /root/ip.list
cd 3proxy
rm 3proxy.cfg
/root/eldrok.sh > /root/3proxy/3proxy.cfg
/usr/sbin/service rc.local restart
END