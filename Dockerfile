FROM golang:1.6.2
MAINTAINER Levi Smith

# install pagkages
RUN apt-get update                                                      && \
    apt-get install -y sudo ncurses-dev libtolua-dev exuberant-ctags    && \
    ln -s /usr/include/lua5.2/ /usr/include/lua                         && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so     && \
    cd /tmp                                                             && \
# build and install vim
    git clone https://github.com/vim/vim.git                            && \
    cd vim                                                              && \
    ./configure --with-features=huge --enable-luainterp                    \
        --enable-gui=no --without-x --prefix=/usr                       && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim74                             && \
    make install                                                        && \
# get go tools
    go get golang.org/x/tools/cmd/godoc                                 && \
    go get github.com/nsf/gocode                                        && \
    go get github.com/derekparker/delve/cmd/dlv                         && \
    go get golang.org/x/tools/cmd/goimports                             && \
    go get github.com/rogpeppe/godef                                    && \
    go get golang.org/x/tools/cmd/gorename                              && \
    go get github.com/golang/lint/golint                                && \
    go get github.com/kisielk/errcheck                                  && \
    go get github.com/jstemmer/gotags                                   && \
    mv /go/bin/* /usr/local/go/bin                                      && \
# add dev user
    adduser dev --disabled-password --gecos ""                          && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers     && \
    chown -R dev:dev /home/dev /go                                      && \
# cleanup
    rm -rf /go/src/* /go/pkg                                            && \
    apt-get remove -y ncurses-dev                                       && \
    apt-get autoremove -y                                               && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER dev
ENV HOME /home/dev
ADD dotfiles/ /

# install vim plugins
RUN sudo mkdir -p $HOME/.vim/bundle                                     && \
    sudo chown -R dev $HOME                                             && \
    sudo chmod -R 755 $HOME                                             && \
    vim +PluginInstall +qall                                            #&& \
#   cd  $HOME/.vim/bundle
# cleanup
    # rm -rf Vundle.vim/.git vim-go/.git tagbar/.git neocomplete.vim/.git    \
    #        nerdtree/.git vim-airline/.git vim-fugitive/.git                   \
    #    vim-nerdtree-tabs/.git undotree/.git vim-easymotion/.git           \
    #    nerdcommenter/.git
