#!/bin/bash

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

echo 'Installing GO tools ...'
go install github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/OJ/gobuster/v3@latest
go install github.com/ffuf/ffuf@latest
go install github.com/Emoe/kxss@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/anew@latest
go install github.com/hakluke/hakrawler@latest
go install -v github.com/hakluke/haktrails@latest



# AMASS
sudo apt-get install amass -y


cd 
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

cd /opt
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




# Update all git repos
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull origin master" \;
