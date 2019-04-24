#!/usr/bin/env bash

sudo apt-get -y install fonts-powerline

sed -i '/^ZSH_THEME="robbyrussell"$/a # Automatic added by customization script --angrifel \nZSH_THEME="agnoster"' ~/.zshrc