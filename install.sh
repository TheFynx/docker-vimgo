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

usage="$(basename "$0") [-h] [-p /path/to/project] -- Small docker wrapper script to run vim-go-ide with project path

where:
    -h  show this help text
    -p  set path (default \$(pwd))"

WORKPATH=$(pwd)
while getopts ':hs:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s) WORKPATH=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

if [ $(command -v docker) ]; then
    docker run --rm -tiv ${WORKPATH}:/project thefynx/vim-go-ide
else
    echo -e 'This program requires Docker, please install docker'
fi
EOF

sudo chmod +x /usr/local/bin/vimgo

echo -e '>> Setup complete'
echo -e '\n'
echo -e '>> Run `vimgo --help` for more info'

