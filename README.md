# vim-go-ide Docker image

This Docker image adds [Go](https://golang.org/) tools and the following vim plugins to the [official Go image](https://registry.hub.docker.com/_/golang/):

It merges these two projects [vim-go-ide github](https://github.com/farazdagi/vim-go-ide)/[vim-go-ida blog post](http://farazdagi.com/blog/2015/vim-as-golang-ide/) and [go-docker-dev](https://github.com/mbrt/go-docker-dev) with a little bit more added into the mix.

Here is a [Cheatsheet](https://github.com/TheFynx/docker-vimgo/blob/master/dotfiles/home/dev/.vim/CHEATSHEET.md) for all IDE specific bindings available in this setup.

To Access the Cheatsheet from inside Vim, just hit `F2`

## Dockerhub Link
* [vim-go-ide](https://hub.docker.com/r/thefynx/vim-go-ide/)

## File Link
* [Dockerfile](https://github.com/TheFynx/docker-vimgo/blob/master/Dockerfile)
* [VIMRC](https://github.com/TheFynx/docker-vimgo/blob/master/dotfiles/home/dev/.vimrc)
* [BASHRC](https://github.com/TheFynx/docker-vimgo/blob/master/dotfiles/home/dev/.bashrc)

## Vim Plugins

* [vim-go](https://github.com/fatih/vim-go)
* [tagbar](https://github.com/majutsushi/tagbar)
* [neocomplete](https://github.com/Shougo/neocomplete)
* [NERD Tree](https://github.com/scrooloose/nerdtree)
* [vim-airline](https://github.com/bling/vim-airline)
* [fugitive.vim](https://github.com/tpope/vim-fugitive)
* [NERD Tree tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [undotree](https://github.com/mbbill/undotree)
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
* [NERD Commenter](https://github.com/scrooloose/nerdcommenter)

## Go Tools

* [godoc](https://godoc.org/golang.org/x/tools/cmd/godoc)
* [gocode](https://github.com/nsf/gocode)
* [godef](https://github.com/rogpeppe/godef)
* [golint](https://github.com/golang/lint/golint)
* [errcheck](https://github.com/kisielk/errcheck)
* [gotags](https://github.com/jstemmer/gotags)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
* [oracle](https://godoc.org/golang.org/x/tools/cmd/oracle)
* [gorename](https://godoc.org/golang.org/x/tools/cmd/gorename)
* [delve](https://github.com/derekparker/delve)

## Install

### Via Dockerhub

`docker pull thefynx/vim-go-ide`

### Via Curl

Sets up a bin file to offer some quick options

`curl -s https://raw.githubusercontent.com/TheFynx/docker-vimgo/master/install.sh | bash`

## Usage

Run this image from within your go workspace. You can than edit your project using `vim`, and usual go commands: `go build`, `go run`, etc.

### If installed via Dockerhub

```
cd your/go/workspace
docker run --rm -tiv `pwd`:/project thefynx/vim-go-ide
```

### If Installed via Curl Script

If project folder, will just use `pwd`
```
vimgo
```

From anywhere
```
vimgo -p /path/to/project
```

Any additional help info
```
vimgo -h
```

## Thanks/Ackowledgement
* A good portion of the Dockerfile comes from [go-docker-dev](https://github.com/mbrt/go-docker-dev)
* Most of the vim-go .vimrc settings come from [vim-go-ide github](https://github.com/farazdagi/vim-go-ide)
* Idea and most of the setup comes from both projects

