#!/bin/bash

#------------------------------------------------------------
#install tmux 2.4 and tmuxp in local t3 directory 
#Note after this, tmux2.4 will be at $HOME/.local/bin/tmux and
#tmuxp will be at $HOME/.local/bin/tmuxp
#In order to acces these you might want to add:
#export PYTHONPATH=$PYTHONPATH:$HOME/.local
#export PATH=$HOME/.local/bin:$PATH
#to your bash_profile/rc 

#DOCS: 

#tmuxp: 
#      https://pypi.python.org/pypi/tmuxp
#sample yaml/json files for configs/window/pane management: 
#      https://tmuxp.git-pull.com/en/latest/examples.html
#tmux: 
#     https://github.com/tmux/tmux/wiki


#Some interesting optimization and learning:
#  https://blog.bugsnag.com/tmux-and-vim/ 
#  https://tmuxcheatsheet.com
#  http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/ 

#script inspired by https://gist.github.com/ryin/3106801
#------------------------------------------------------------

#setup 
mkdir -p $HOME/tmux_build
cd $HOME/tmux_build
wget -O tmux-2.4.tar.gz https://github.com/tmux/tmux/releases/download/2.4/tmux-2.4.tar.gz
wget -O libevent-2.1.8-stable.tar.gz https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
wget -O tmuxp-1.3.2.tar.gz https://pypi.python.org/packages/80/79/22bf1c58ae5b122f8a2cd1eeec7ec805e097e445e328716e79aa40a34df7/tmuxp-1.3.2.tar.gz#md5=d54711fb559cbf719c5917692c4ea333

#setup libevent locally, technically a different version is setup here on the t3 but I can't find it... so this works
tar xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=$HOME/.local --disable-shared
make && make install
cd .. 

#install latest tmux working with tmuxp
tar xvzf tmux-2.4.tar.gz
cd tmux-2.4
./configure CFLAGS="-I$HOME/.local/include -I/usr/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L/usr/include/ncurses -L$HOME/.local/include"
CPPFLAGS="-I$HOME/.local/include -I/usr/include/ncurses" LDFLAGS="-static -L$HOME/.local/include -L/usr/include/ncurses -L$HOME/.local/lib" make
cp tmux $HOME/.local/bin
cd .. 

tar xvzf tmuxp-1.3.2.tar.gz
cd tmuxp-1.3.2
#************************************************************************
#************************************************************************
#THIS SETUP might need changing... the directory might need editing 
#but just make the directory its tring to install at
#************************************************************************
#************************************************************************
mkdir -p $HOME/.local/lib/python3.4/site-packages/test-easy-install-1290032.write-test
python3 setup.py build install --prefix $HOME/.local

#remove directory if everything works correctly
#rm -rf $HOME/tmux_build
