#!/bin/sh
echo "Gay, I am installing some packages, please wait....."
sudo apt install git libusb-dev libpcsclite-dev automake autoconf
echo "git and compile libnfc and mfoc"
git clone --depth=1 -b master https://github.com/nfc-tools/libnfc
cd libnfc
autoreconf -vis
./configure --prefix=/usr --sysconfdir=/etc
make
mmake install
sudo mkdir /etc/nfc
sudo cp libnfc.conf.sample /etc/nfc/libnfc.conf
cd ..
git clone --depth=1 -b master https://github.com/nfc-tools/mfoc
cd mfoc
autoreconf -is
./configure
make && sudo make install
echo "OK, now you can edit /etc/nfc/libnfc.conf to test nfc...."
