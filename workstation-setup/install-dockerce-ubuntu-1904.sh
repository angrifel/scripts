#!/usr/bin/env bash

# KEYID="9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo apt-key add docker-ce.asc

# here we are using bionic's repo because disco's did not had all packages at the time of writing
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable"

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io