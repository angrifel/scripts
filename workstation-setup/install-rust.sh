#!/usr/bin/env sh

now=$(date --iso-8601=second)
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
echo "# lines added by script on $now" >> $HOME/.zshenv
echo $(cat $HOME/.cargo/env) >> $HOME/.zshenv
echo "# end of lines added by script on $now" >> $HOME/.zshenv
echo "" >> $HOME/.zshenv
