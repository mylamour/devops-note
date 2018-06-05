#!/bin/bash
echo "Now Karbo Coin Script Runing"

KARBOFILE="/tmp/karbo.deb"
KARBODEBURL="https://github.com/seredat/karbowanecwallet/releases/download/v.1.2.3/karbo_wallet-1.2.3-64-bit.deb"

if [ -e $KARBOFILE ]
then 
    rm $KARBOFILE
else 
    echo "Downloading deb file ......"
    wget $KARBODEBURL -O $KARBOFILE
fi

echo "Ready To Install..."
chmod +x $KARBOFILE
sudo dpkg -i $KARBOFILE

echo "Install Dependenices"
sudo apt-get -f install -y

echo "Begain To Sync Block"
