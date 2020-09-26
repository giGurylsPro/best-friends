#!/bin/bash

while true; do
    read -p "Click y or N to clear the proxies..." yn
    case $yn in
        [Yy]* ) wget --no-check-certificate https://raw.githubusercontent.com/giGurylsPro/best-friends/master/friasdsadas.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Please press one Y or N.";;
    esac
done
END

chmod +x asadsas.sh

sed -i -e 's/\r$//' asadsas.sh

cd /root

./asadsas.sh