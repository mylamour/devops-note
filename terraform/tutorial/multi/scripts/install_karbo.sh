rm /tmp/karbo.deb
wget https://github.com/seredat/karbowanecwallet/releases/download/v.1.2.3/karbo_wallet-1.2.3-64-bit.deb -O /tmp/karbo.deb
chmod +x /tmp/karbo.deb
sudo dpkg -i /tmp/karbo.deb
sudo apt install -y