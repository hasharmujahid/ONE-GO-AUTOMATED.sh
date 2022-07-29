#!/bin/bash
# System Updates
sudo apt-get update -y
sudo apt-get full-upgrade --fix-missing -y
sudo apt-get autoremove -y

cd /opt
mkdir Tools
cd Tools


#Sqlmap install
echo 'installing sqlmap ...'
sudo apt install sqlmap

#hashcat
echo 'installing hashcat ...'
sudo apt-get install hashcat

# john FULL VERSION
echo 'installing full john ...'
sudo apt-get install build-essential libssl-dev
sudo apt-get install yasm libgmp-dev libpcap-dev libnss3-dev libkrb5-dev pkg-config libbz2-dev zlib1g-dev
mkdir ~/src
cd ~/src
git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
cd ~/src/john/src
./configure 
echo ' THIS WILL TAKE SOME TIME SO DONT WORRY .. GO TOUCH SOME GRASS ...'
make -s clean && make -sj4

echo ' to test if john is succesfully installed run "/src/run/john --test" '


cd /opt

mkdir lists && cd lists

# Rock you
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
echo 'rock you downloaded ...'
# Seclists
git clone https://github.com/danielmiessler/SecLists.git
echo 'seclist downloaded ...'

cd /opt


#go install
wget https://go.dev/dl/go1.18.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.4.linux-amd64.tar.gz
#echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile && source $HOME/.profile
#ADD GO TO PATH
sudo echo 'export GOPATH="$HOME/go"' >> ~/.bashrc 
sudo echo 'export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"' >> ~/.bashrc
rm go1.18.4.linux-amd64.tar.gz
sleep 1s
echo 'SETTING THE GO PATH IN BASHRC ...'
exec /bin/bash
source ~/.bashrc

echo 'Installing GO tools ...'
# Go
go install github.com/OJ/gobuster/v3@latest
go get -u -v github.com/ffuf/ffuf
go get -u -v github.com/Emoe/kxss
go get -u -v github.com/tomnomnom/meg
go get -u -v github.com/tomnomnom/assetfinder
go get -u -v github.com/tomnomnom/gf
go get -u -v github.com/tomnomnom/gron
go get -u -v github.com/tomnomnom/httprobe
go get -u -v github.com/tomnomnom/unfurl
go get -u -v github.com/tomnomnom/qsreplace
go get -u -v github.com/tomnomnom/anew
go get -u -v github.com/tomnomnom/waybackurls
GO111MODULE=on go get -u -v github.com/lc/gau
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -u -v github.com/projectdiscovery/chaos-client/cmd/chaos
GO111MODULE=on go get -u -v github.com/jaeles-project/gospider




# AMASS
sudo apt-get install amass -y



#MSFCONSOLE
cd /opt
wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run
echo 'YOU MUST BE PRESENT TO SET THIS ONE UP ...'
sudo chmod +x ./metasploit-latest-linux-x64-installer.run
sudo ./metasploit-latest-linux-x64-installer.run


#EXPLOIT DB
echo 'Installing Exploitdb ...'
sudo apt-get -y install exploitdb


#Pip
pip3 install search-that-hash

cd /opt

# Github
mkdir Github
cd Github
# Asn lookup
git clone https://github.com/yassineaboukir/Asnlookup && cd Asnlookup && pip3 install -r requirements.txt && cd ..
# Responder 
git clone https://github.com/lgandx/Responder.git
# XSS Strike
git clone https://github.com/s0md3v/XSStrike.git && cd XSStrike && pip3 install -r requirements.txt && cd ..
# Smuggler
git clone https://github.com/defparam/smuggler.git
# Malicious PDF Generator
git clone https://github.com/jonaslejon/malicious-pdf.git
# Fuxsploiter
git clone https://github.com/almandin/fuxploider.git && cd fuxploider && pip3 install -r requirements.txt && cd ..
cd ..
# AWS
mkdir AWS
cd AWS
git clone https://github.com/nahamsec/lazys3.git
git clone https://github.com/0xSearches/sandcastle.git
git clone https://github.com/sa7mon/S3Scanner.git && cd S3Scanner && pip3 install -r requirements.txt && cd ..
cd ..

# Linux priv esc
mkdir Linux-Priv-Esc
cd Linux-Priv-Esc
git clone https://github.com/Anon-Exploiter/SUID3NUM.git
git clone https://github.com/mzet-/linux-exploit-suggester.git
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
git clone https://github.com/carlospolop/PEASS-ng.git
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/sleventyeleven/linuxprivchecker.git && cd linuxprivchecker && pip3 install -r requirements.txt && cd ..
git clone https://github.com/spencerdodd/kernelpop.git
cd ..




# Firefox Extensions
nohup firefox &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/cookie-quick-manager/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/dotgit/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/open-multiple-urls/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/s3-bucket-list/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/link-gopher/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/security-txt/" &

# Update all git repos
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull origin master" \;
# Update all go packages
#go get -u all
