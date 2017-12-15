numlockx &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
pgrep redshift &> /dev/null || redshift &> /dev/null & 

#  exec i3
 exec startxfce4
# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
