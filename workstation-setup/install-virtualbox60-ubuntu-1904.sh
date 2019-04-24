#!/usr/bin/env bash


# KEYID="B9F8 D658 297A F3EF C18D  5CDF A2F6 83C5 2980 AECF"
HEADER_LINE="## Line added from 'install-virtual-box-ubuntu-1904.sh'"
ARCHIVE_LINE="deb https://download.virtualbox.org/virtualbox/debian disco contrib"
TARGET=/etc/apt/sources.list

grep -Fxq "$HEADER_LINE" $TARGET 

if [[ $? -ne 0 ]]; then
    echo Adding repository to $TARGET
    echo $HEADER_LINE | sudo tee --append $TARGET > /dev/null
    echo $ARCHIVE_LINE | sudo tee --append $TARGET > /dev/null
fi

echo Adding GPG key to apt default keyring
sudo apt-key add oracle_vbox_2016.asc

# installing virtualbox
sudo apt-get update
sudo apt-get install virtualbox-6.0
