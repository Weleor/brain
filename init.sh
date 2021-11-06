#!/bin/bash
echo " **************** Download csv **************** "
wget https://bitkeys.work/btc_balance_sorted.csv

mkdir /root/BTC & cd /root/BTC
echo " **************** Download brainflayer **************** "
git clone https://github.com/matchv/brainflayer.git

echo " **************** Download Bip39Helper **************** "

wget https://github.com/TheRealLordFractal/Bip39Helper/archive/refs/tags/1.02a.zip
echo " **************** unzip Bip39Helper **************** "
unzip 1.02a.zip
echo " **************** delete 1.02a.zip **************** "
rm 1.02a.zip
echo " **************** download apt libs **************** "
apt-get install openssl libgmp3-dev libimobiledevice-dev libplist-dev libusbmuxd-dev libssl-dev zlib1g-dev dh-autoreconf

cd /root/BTC/brainflayer/
make
./brainflayer -h
