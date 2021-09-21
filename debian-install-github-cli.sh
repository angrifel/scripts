#/usr/bin/env bash

which curl >/dev/null
if [ ! "$?" == "0" ]; then
  echo "missing curl. aborting..."
  exit 1
fi

# taken from https://github.com/cli/cli/blob/02ed5a9666c29dc25ab03fc422cdf90deaf133fb/docs/install_linux.md

# Debian, Ubuntu Linux, Raspberry Pi OS (apt)
# Install:

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh



cat <<NOTE
  
  Note: If you get the error "gpg: failed to start the dirmngr '/usr/bin/dirmngr': No such file or directory", try installing the dirmngr package: sudo apt install dirmngr.

  Upgrade:

  sudo apt update
  sudo apt install gh

NOTE