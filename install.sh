#!/bin/bash

echo -e '>> Initiating Install'

echo -e '>> Checking for Docker Install and Pulling Image'
if [ $(command -v docker) ]; then
    docker pull thefynx/vim-go-idea
else
    echo -e 'ERROR: Docker not installed or under bin as docker'
    exit 1
fi

echo -e '>> Setting up vimgo command, will require elevated privileges'

sudo cat > /usr/local/bin/vimgo <<EOF
#!/bin/bash

if [ $(command -v docker) ]; then
    if [ ${1} != '.' ]; then
        docker run --rm -tiv ${1}:/project thefynx/vim-go-ide
    else
        docker run --rm -tiv `pwd`:/project thefynx/vim-go-ide
    end
else
    echo -e "This program requires Docker, please install docker"
end
EOF

sudo chmod +x /usr/local/bin/vimgo

echo -e '>> Setup complete'
echo -e '\n'
echo -e '>> Run `vimgo --help` for more info'

