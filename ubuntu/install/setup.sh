#!/bin/bash
nohup /usr/local/bin/sslocal -c /work/install/config.json > /dev/null 2>&1 &
#echo "1121" |sudo -S mount -t cifs -o username=zyp,password=Earies2012 //192.168.1.173/迅雷下载 /mnt/pc/xunlei/
#echo "1121" |sudo -S mount -t cifs -o username=zyp,password=Earies2012 //192.168.1.173/users/zyp/Documents/My\ RTX\ Files/张一鹏 /mnt/pc/rtx/
echo "1121" |sudo -S mount -t cifs -o username=zyp,password=Earies2012 //192.168.0.101/迅雷下载 /mnt/pc/xunlei/
echo "1121" |sudo -S mount -t cifs -o username=zyp,password=Earies2012 //192.168.0.101/users/zyp/Documents/My\ RTX\ Files/张一鹏 /mnt/pc/rtx/
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
exit 0
