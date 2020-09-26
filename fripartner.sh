#!/bin/bash

while true; do
    read -p "on which machine are you installing linode, if L Vultr, Press V..." vl
    case $vl in
        [Vv]* ) wget --no-check-certificate https://raw.githubusercontent.com/giGurylsPro/best-friends/master/frivul.sh; break;;
        [Ll]* ) wget --no-check-certificate https://raw.githubusercontent.com/giGurylsPro/best-friends/master/frilin.sh; break;;
        * ) echo "Please press one L or V.";;
    esac
done
END

chmod +x frivul.sh

sed -i -e 's/\r$//' frivul.sh

cd /root

./frivul.sh

chmod +x frilin.sh

sed -i -e 's/\r$//' frilin.sh

cd /root

./frilin.sh
