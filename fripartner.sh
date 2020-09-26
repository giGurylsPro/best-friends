#!/bin/bash

while true; do
    read -p "on which machine are you installing linode, if L Vultr, Press V..." vl
    case $vl in
        [Vv]* ) wget https://cdn.discordapp.com/attachments/750065676391022672/750065726219485234/vultur.sh; break;;
        [Ll]* ) wget https://cdn.discordapp.com/attachments/750065676391022672/750065722499137616/inter1.sh; break;;
        * ) echo "Lütfen birine basiniz L veya V.";;
    esac
done
END

chmod +x vultur.sh

sed -i -e 's/\r$//' vultur.sh

cd /root

./vultur.sh

chmod +x inter1.sh

sed -i -e 's/\r$//' inter1.sh

cd /root

./inter1.sh