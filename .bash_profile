export PS1=$' \W \[\033[1;37m\]\[\033[48;5;196m\]-\[\033[48;5;20m\]\[\033[1;37m\]-\[\033[0m\]> '
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./:./libs
#export PATH=$PATH:/home/mistryk/pdfjam/bin
export PYTHONPATH=$PYTHONPATH:$HOME/.local
export PATH=$HOME/.local/bin:$PATH
export HISTSIZE=
export HISTCONTROL=ignoreboth # Ignore duplicate commands and whitespace
export HISTFILESIZE=
export HISTFILE=~/.bash_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTIGNORE="cd:ls:exit:pwd:clear:c:l:lt"
export TERM="xterm-256color"
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
shopt -s checkwinsize

#personal setting
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias c='clear'
alias vi='vim'
alias root='root -l'
alias lt='ls -ltrh --color'
alias ll='ls -lh --color'
alias la='ls -lha --color'
alias mdisk='cd /disk/userdata00/atlas_data2/mistryk/'
alias atlasc='cd /xrootd/atlasC/'
#ssh stuff
alias lxp='ssh -Y kmistry@lxplus.cern.ch'
alias lxh='ssh -Y mistryk@lxhiggs.cern.ch'
alias gw='ssh -Y kmistry@atlasgw.cern.ch'
alias k='kinit kmistry@CERN.CH -l 5d -k -t ~/.kmistry.keytab'
alias open='gnome-open'
#alias tmux='$HOME/.local/bin/tmux'
alias voms='voms-proxy-init -voms atlas --valid 96:00'

complete -d cd
complete -f vim

###############################
#      Functions              #
###############################
function broot() {
    if [ -n "$1 $2" ]; then
        root $1 $2 ~/scripts/browser.C;
    elif [ -n "$1" ]; then 
        root $1 ~/scripts/browser.C;
    else
        root ~/scripts/browser.C;
    fi
}
function dusort()
{
     du --max-depth=0 -k * | sort -nr | awk '{ if($1>=1000*1000) {size=$1/1000/1000; unit="G"} else if($1>=1000) {size=$1/1000; unit="M"} else {size=$1; unit="K"}; if(size<10) format="%.1f%s"; else format="%.0f%s"; res=sprintf(format,size,unit); printf "%-8s %s\n",res,$2 }'
 }

