#!/bin/bash
# update system

if [[ $(id -u) -ne 0 ]] ; then
    echo 'Please run me as root or "sudo ./install.sh"' ; 
    exit 1 ;
fi

clear
echo "Updateing...!"
sudo apt update -y;
echo "Updated...!"

echo -e "Do You Want to Upgrade...!(Y/N Defalut:N) \c"
  read Y
  if [[ $Y == "y" || $Y == "Y" ]] ; then
    sudo apt upgrade -y;
else
   echo "Not upgraded...!";
fi

if [ $(dpkg-query -W -f='${Status}' x11vnc 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install x11vnc;
else
  echo "X11VNC Already installed in your System...!"
fi


if [ $(dpkg-query -W -f='${Status}' novnc 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install novnc;
  clear
  echo "All Done, Please run vnc.sh"
else

  echo "novnc Already installed in your System...!"
  echo ''
  echo "Please run vnc.sh"
fi

sleep 0.5;
echo -e "Thankyou for installing \033[0;32m https://github.com/virtualheart/ \033[0;0mKeep Support...!"







