#!/bin/bash
#base packages

echo "################################################################################"
echo "####################----INICIANDO SCRIPT- ######################################"
echo "################################################################################"

##Install updates
sudo dnf update -y

##Install JAVA
sudo dnf install java-9-openjdk vim mariadb mariadb-server maven -y

##Install VLC
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install vlc
sudo dnf install python-vlc 

#Install ECLIPCE
eclipse
wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz
tar -xzf eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz
mv eclipse /usr/local/
ln -s /usr/local/eclipse/eclipse /usr/bin/eclipse
rm eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz

echo "[Desktop Entry]
Name=Eclipse
Comment=Eclipse IDE
Type=Application
Encoding=UTF-8
Exec=/usr/bin/eclipse
Icon=/usr/local/eclipse/icon.xpm
Categories=GNOME;Application;Development;
Terminal=false
StartupNotify=true" > /usr/share/applications/eclipse.desktop


##Install MARIADB/MYSQL
mysql
service mariadb start
mysql_secure_installation

###Install VSCODE
vscode
echo "[vscode]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install code -y

## Install Node js
##Step 1 – Installing Node.js
sudo dnf install -y gcc-c++ make -y
curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
sudo dnf install nodejs -y
node --version
##Step 2 – Install Cordova on Fedora
sudo npm install -g cordova@ -y
##Step 3 – Check Cordova Version
cordova --version

##Install terminator
sudo dnf install terminator -y


#Install VIM
sudo dnf -y install vim-enhanced 

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

vi ~/.bashrc 
add alias to the end
alias vi='vim'
apply changes

source ~/.bashrc

###Install htop
sudo dnf install htop -y
sudo dnf install acpi -y
acpi
htop

echo "SCRIPT EXECUTADO COM SUCESSO!!!"
echo "Seu nome de usuário é:"
whoami
echo "Data e hora exata:"
uptime

echo "################################################################################"
echo "####################----ATÉ A PRÓXIMA-- ########################################"
