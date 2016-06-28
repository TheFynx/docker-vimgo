#!/bin/bash

echo -e '>> Initiating Install'

echo -e '>> Checking for Docker Install and Pulling Image'
if [ $(command -v docker) ]; then
    docker pull thefynx/vim-go-idea
else
    echo -e 'ERROR: Docker not installed or under bin as docker'
    exit 1
fi

echo -e '>> Setting up vimgo command'

cat > /usr/local/bin/vimgo <<EOF

EOF

