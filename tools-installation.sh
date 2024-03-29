#!/bin/bash

cd /opt;mkdir Tools;cd Tools
echo 'Installing PIP3'
apt install python3-pip -y
apt-get update --fix-missing
#CRACKMAPEXEC:
apt install pipx -y 
pipx ensurepath
apt install python3.10-venv -y
pipx install crackmapexec
pipx ensurepath
#INSTALLING IMPACKET:
echo 'Installing Impacket'
sudo git clone https://github.com/SecureAuthCorp/impacket.git /opt/Tools/impacket
sudo pip3 install -r /opt/Tools/impacket/requirements.txt
cd /opt/Tools/impacket/ 
sudo pip3 install .
sudo python3 setup.py install

cd 
echo 'Please wait'

echo 'Installing GO Recon Tools ...'

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
#NEUCLIE
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
#GOBUSTER
go install github.com/OJ/gobuster/v3@latest
#ANEW
go install -v github.com/tomnomnom/anew@latest
#HAKRAWLER
go install github.com/hakluke/hakrawler@latest
#HAKTRAILS
go install -v github.com/hakluke/haktrails@latest
#SUBFINDER
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
#FFUF
go install github.com/ffuf/ffuf@latest
#KXSS
go install github.com/Emoe/kxss@latest
#HTTPROBE
go install github.com/tomnomnom/httprobe@latest
#ASSETFINDER
go install github.com/tomnomnom/assetfinder@latest
#WAYBACKURLS
go install github.com/tomnomnom/waybackurls@latest
#GAU
go install github.com/lc/gau/v2/cmd/gau@latest

echo 'GO TOOLS INSTALLATION IS COMPLETED'

#apt pakages
apt install net-tools
apt  install nmap
apt install whois
apt install whatweb
apt install python3-shodan

# setting aliases
sudo echo "alias cls='clear'" >> /etc/bash.bashrc
sudo echo "alias jarvis='mkdir nmap ffuf exploit'" >> /etc/bash.bashrc

#PIP packages installation

sudo pip3 install updog 

cd /opt/Tools 
# RESPONDER
git clone https://github.com/SpiderLabs/Responder.git

echo ' YOU WILL NEED TO RELOGIN TO FULLY INSTALL IT ...'
#Sqlmap install
echo 'installing sqlmap using apt ...'
sudo apt install sqlmap -y

#NIKTO
sudo apt install nikto -y
#HYDRA
sudo apt install hydra -y

#hashcat
echo 'installing hashcat using apt ...'
sudo apt-get install hashcat -y

# john FULL VERSION
echo 'installing full john ...'
sudo apt-get install build-essential libssl-dev -y 
sudo apt-get install yasm libgmp-dev libpcap-dev libnss3-dev libkrb5-dev pkg-config libbz2-dev zlib1g-dev -y
mkdir ~/src
cd ~/src
git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
cd ~/src/john/src
./configure 
echo ' THIS WILL TAKE SOME TIME SO DONT WORRY .. GO TOUCH SOME GRASS ...'
make -s clean && make -sj4

echo ' to test if john is succesfully installed run "/src/run/john --test" '

# AMASS...
echo 'INSTALLING AMASS'
sudo snap install amass

#EXPLOIT DB
echo 'Installing Exploitdb ...'
sudo apt-get -y install exploitdb

#LISTS...
cd /opt

mkdir lists && cd lists
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
echo 'rock you downloaded ...'
git clone https://github.com/danielmiessler/SecLists.git
echo 'seclist downloaded ...'

cd /opt


mkdir windows-privesc 
#mimikatz
cd windows-privesc;mkdir mimikatz;cd mimikatz
wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20210810-2/mimikatz_trunk.zip ;unzip mimikatz_trunk.zip;rm mimikatz_trunk.zip
cd /opt/windows-privesc
#winpeas
mkdir winpeas;cd winpeas
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220807/winPEAS.bat 
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220807/winPEASx64.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220807/winPEASx86.exe
cd ..
mkdir Others-Enumeration-Scripts; cd Others-Enumeration-Scripts
wget https://github.com/NyaMeeEain/Privilege-Escalation-Windows/blob/master/Watson.exe
wget https://github.com/NyaMeeEain/Privilege-Escalation-Windows/blob/master/Seatbelt.exe
wget https://github.com/NyaMeeEain/Privilege-Escalation-Windows/blob/master/JuicyPotato.exe
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
cd ..

cd /opt
#LINUX PRIVESC TOOLS
mkdir linux-privesc
cd linux-privesc
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220807/linpeas.sh
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

cd 

find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull origin master" \;

#METASPLOIT
echo 'DO YOU WANT TO INSTALL METASPLOIT ENTER Y OR N'
read decision
if [[ $decision == "y" || $decision == "Y" ]]
then 
    sudo apt install curl postgresql postgresql-contrib -y
    cd /opt; mkdir metasploit ; cd metasploit
    curl curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
    chmod 755 msfinstall;sudo ./msfinstall
    sudo systemctl start postgresql
    msfdb init
    rm /opt/metasploit/msfinstall 
    cd /opt ; rmdir metasploit
    cd
else 
    echo 'OKAY SKIPING METASPLOIT'
fi

# I KNOW ITS WIRED BUT IT WORKS THT WAY.🤣
cd /opt/Tools/impacket/ 
sudo pip3 install . 




