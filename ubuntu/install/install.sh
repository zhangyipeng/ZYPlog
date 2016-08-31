#!/bin/bash
basepath=$(cd `dirname $0`; pwd)            # the path of this .sh
cp $basepath/setup.sh ~/                    # copy bash script for shadowsocks,network sharing,keyboard mapping
cp $basepath/ssh.exp ~/                     # copy expect script for ssh to vps 

sudo apt install ttf-wqy-microhei -y        # Install WQY fonts 
sudo apt install ttf-wqy-zenhei -y
sudo apt install xfonts-wqy -y
sudo apt install samba -y                   # network sharing
sudo apt install wodim -y                   # burning CD
sudo apt install expect -y                  # expect interpreter
#sudo apt install xclip -y                  # copy characters
sudo apt install vim vim-gtk vim-doc -y     # VIM
sudo apt install git-core -y                # GIT
sudo apt install build-essential cmake -y   # compiler environment
# ------------------------------------------- change ls colors in solarized themes
mkdir ~/.dircolors-solarized/
cd ~/.dircolors-solarized/
git clone git://github.com/seebi/dircolors-solarized.git
cp ~/.dircolors-solarized/dircolors-solarized/dircolors.256dark ~/.dircolors
eval 'dircolors ~/.dircolors'
# ------------------------------------------- Vundle to manage the vim plugins
mkdir ~/.vim/bundle/
cd ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp $basepath/.vimrc ~/
cp $basepath/.ycm_extra_conf.py ~/          # ycm搜索配置.py文件的顺序是依次向上搜索直至根目录，所以需拷贝至当前当前文件夹
vim +PluginInstall +qall                    # !!!安装完成后在vim内输入:colorscheme molokai或者solarized等切换主题
cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer              # 若需要安装更多的语法语言支持，可以参阅github.com/Valloric/YouCompleteMe
# ------------------------------------------- install Tmux
sudo apt install tmux -y                    # install tmux change prefix key to Ctrl+x
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp $basepath/.tmux.conf ~/.tmux.conf	    # !!!安装完成后进入tmux 按prefix+I安装
tmux                                        # 必须安装完成后才可以进行后续步骤
cp $basepath/tmux_plugin/default.sh ~/.tmux/plugins/tmux-powerline/themes/
cp $basepath/tmux_plugin/date_day.sh ~/.tmux/plugins/tmux-powerline/segments/
cp $basepath/tmux_plugin/tmux_mem_cpu_load.sh ~/.tmux/plugins/tmux-powerline/segments/
cp $basepath/.bashrc /home/zyp/
sudo apt install ifstat		                # 在ifstat.sh中修正网卡的名称
# ------------------------------------------- install tmux-mem-cpu-load a plugin to see memory and others
cd ~/.tmux/plugins/tmux-powerline/
git clone https://github.com/thewtex/tmux-mem-cpu-load.git
cd ~/.tmux/plugins/tmux-powerline/tmux-mem-cpu-load
cmake .
make
sudo make install
# ------------------------------------------- install google chorme
cd $basepath/package/                       # install google chrome
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
# #======安装wps文件                        # install WPS
# cd /work/install/
# sudo dpkg -i wps-office_10.1.0.5672-a21_amd64.deb
# sudo dpkg -i wps-office-fonts_1.0_all.deb
# sudo dpkg -i symbol-fonts_1.2_all.deb
# ------------------------------------------- 安装sougou拼音 ps:语言设置应选fcitx，注销后会出现搜狗选项
sudo dpkg -i sogoupinyin_2.0.0.0072_amd64.deb
sudo apt-get -f install -y
sudo dpkg -i sogoupinyin_2.0.0.0072_amd64.deb
# #======安装python版本的shadowsocks
# sudo apt install python-pip -y
# sudo pip install shadowsocks
# mkdir ~/Downloads/soft/
# cd ~/Downloads/soft/
# wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
# tar zxf LATEST.tar.gz
# cd libsodium*
# sudo ./configure
# sudo make
# sudo make install
# sudo echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
# sudo ldconfig
# ------------------------------------------- install GIMP a vector software
sudo apt install gimp -y                    # install GIMP a vector sofrware
# ------------------------------------------- gimp plugins and help docs
#sudo apt install gimp-gap gimp-helpbrowser gimp-help-common gimp-help-zh-cn gimp-manual libgimp-perl
# ------------------------------------------- install BaiduPcs
sudo apt install build-essential libcurl4-openssl-dev libssl-dev -y             # install BaiduPCS
cd ~/Downloads/soft/
git clone https://github.com/GangZhuo/BaiduPCS.git
cd ~/Downloads/soft/BaiduPCS
sudo make clean
sudo make
sudo make install
# ------------------------------------------- baidupcs配置 name:zypdan password:z8332388
pcs set --max_thread=3			            # 最多允许3个线程同时下载
#pcs context					            # 查看设置是否成功
#pcs login					    	        # 登陆命令
# ------------------------------------------- install xunlei for linux
cd $basepath/package/                       # install xunlei for linux
sudo dpkg -i xware-desktop_0.13.20160328_amd64.deb
sudo apt-get -f install -y
sudo dpkg -i xware-desktop_0.13.20160328_amd64.deb
#---安装说明
#1.启动前端，暂时不登陆
#2.设置下载文件夹 --文件》设置》挂载，点击添加，现则下载目标文件，点击确定。PS：永远把任务下载到x：\TDDOWNLOADS
#3.托管xware并启动 --文件》设置》启动与登陆》xwared托管里选择systemed托管，ETM选随xwared启动
#					--手动启动 systemctl --user start xwared
#4.用迅雷账号登陆
#5.设备激活。
#命令行参数为 xware-desktop http://www.website.com/file1 ftp://www.website.com/file2 ...
#以Firefox上Flashgot为例子，打开选项，添加一个新的下载器，程序设置xware-desktop，参数设置为【URL】
#==================================
#安装完成后需要1.修改terminal的配置首选项2.修改输入法3.修改快捷键增加最大termianal和全屏 命令为 gnomoe-terminal --maximize  gnome-terminal --full-screen
#区域截图命令gnome-screenshot -a 可增加自定义快捷键C+A+l
exit 0
