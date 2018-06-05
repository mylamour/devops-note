#!/bin/bash
echo "Now Karbo Coin Script Runing"

KARBOFILE="/tmp/karbo.tar.gz"
KARBODEBURL="https://github.com/seredat/karbowanec/releases/download/v.1.5.1/karbo-cli-1.5.1-64bit.tar.gz"
#https://github.com/seredat/karbowanecwallet/releases/download/v.1.2.3/karbo_wallet-1.2.3-64-bit.deb
#https://github.com/seredat/karbowanec/releases/download/v.1.5.1/karbo-cli-1.5.1-64bit.tar.gz
if [ -e $KARBOFILE ]
then 
    rm $KARBOFILE
else 
    echo "Downloading file ......"
    wget $KARBODEBURL -O $KARBOFILE
fi

echo "Extracting Tar File"
tar -xf $KARBOFILE
sudo mv karbowanecd /usr/bin/karbowanecd

echo "Begain To Sync Block"
nohup karbowanecd &