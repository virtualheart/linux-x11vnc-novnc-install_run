#!/bin/bash

echo -e "Please Enter your listen port num (Defalut 8081): \c"
read port
if [[ -z "$port" ]] ; then
   port=8081
fi

if ! [[ "$port" =~ ^[0-9]+$ ]] ; then
    echo "Sorry integers only"
else

# vnc tern on sh script....!!!
gnome-terminal -e x11vnc  &&

# novnc on script
gnome-terminal -e '/usr/share/novnc/utils/launch.sh --listen '$port' --vnc localhost:5900' 
fi

