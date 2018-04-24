sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt update
sudo apt install -y shadowsocks-qt5

sudo apt install -y polipo
sudo chmod 777 /etc/polipo/config
echo socksParentProxy=\"10.214.150.131:1080\" >> /etc/polipo/config
echo socksProxyType=socks5 >> /etc/polipo/config
echo logLevel=4 >> /etc/polipo/config
sudo chmod 644 /etc/polipo/config
sudo service polipo stop
sudo service polipo start

pip install virtualenv pylint autopep8

sudo apt install -y emacs
shadowsocks emacs
