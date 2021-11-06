#!/bin/bash
echo " **************** Download csv **************** "
wget https://bitkeys.work/btc_balance_sorted.csv

mkdir /root/BTC & cd /root/BTC
echo " **************** Download brainflayer **************** "
git clone https://github.com/ryancdotorg/brainflayer.git

echo " **************** download apt libs **************** "
apt-get install -y openssl libgmp3-dev libimobiledevice-dev libplist-dev libusbmuxd-dev libssl-dev zlib1g-dev dh-autoreconf
apt install build-essential libgmp-dev libssl-dev
apt install python

echo " **************** download wordlist generator **************** "
cd /root/BTC/brainflayer/
wget https://raw.githubusercontent.com/Weleor/brain/main/brain12words.py
wget https://raw.githubusercontent.com/Weleor/brain/main/wordlist.txt
chmod +x *
make
echo " **************** test  make result **************** "

./brainflayer -h

screen ./brain12words.py -n 9000000000000000000 -l 12 -w brainwalletdictionary.txt | ./brainflayer -v -o found.txt -b bloom.blf
