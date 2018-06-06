#!/bin/bash
sudo apt-get -y update
sleep 10
sudo apt-get -y install python-pip
sleep 10
sudo pip install awscli
sleep 10
source ~/.bashrc
echo "Begain to sync from s3"
aws s3 sync s3://configfilebtcc/snsreport/ ./synccheck
sleep 10
find ./synccheck -type f -exec echo "Found  {} " \;