#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias fileshare="python -m http.server"
alias locip="import socket; print(socket.gethostbyname(socket.gethostname()))"
alias pubip="python ~/scripts/getip.py"
