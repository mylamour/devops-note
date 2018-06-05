#!/bin/bash
echo "Add Repository"
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sleep 10
sudo apt-get -y update
sleep 60

echo "Install Bitcoin Daemon"
sudo apt-get -y install bitcoind
sleep 30
# Download data from blockchain, aria2 need 6938 udp services
# sudo apt-get install aria2
# aria2c https://getbitcoinblockchain.com/blockchain.torrent

# Download from AWS S3 
