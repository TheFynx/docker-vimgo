#!/bin/bash

echo -e '>> Initiating Install'

echo -e '>> Checking for Docker Install and Pulling Image'
if [ $(command -v docker) ]; then
    docker pull thefynx/vim-go-ide
else
    echo -e 'ERROR: Docker not installed or under bin as docker'
    exit 1
fi

echo -e '>> Setting up vimgo command, will require elevated privileges'

cat > /tmp/vimgo <<EOF
#!/bin/bash

usage="\$(basename "\$0") [-h] [-p /path/to/project] [-b] [-c command] [-i image_name] -- Small docker wrapper script to run vim-go-ide with project path

where:
    -h  show this help text
    -p  set path (default is currently \$(pwd))
    -b  Enter container at Bash instead of Vim
    -c  Choose command to run in container instead of vim
    -i  For passing a different image name (used for local images)"

WORKPATH=\$(pwd)
IMAGE='thefynx/vim-go-ide'
while getopts 'p:c:i:hb' opt; do
  case "\$opt" in
    h) echo "\$usage"
       exit
       ;;
    p) WORKPATH=\$OPTARG
       ;;
    i) IMAGE=\$OPTARG
       ;;
    b) CMDARG="/bin/bash"
       ;;
    c) CMDARG=\$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "\$OPTARG" >&2
       echo "\$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "\$OPTARG" >&2
       echo "\$usage" >&2
       exit 1
       ;;
  esac
done
shift \$((OPTIND - 1))

if [ \$(command -v docker) ]; then
    docker run --rm -tiv \${WORKPATH}:/project \${IMAGE} \${CMDARG}
else
    echo -e 'This program requires Docker, please install docker'
fi
EOF

chmod +x /tmp/vimgo

sudo su -c "mv /tmp/vimgo /usr/local/bin/vimgo"

echo -e '>> Setup complete'
echo -e '\n'
echo -e '>> Run `vimgo -h` for more info'
echo -e '\n'
