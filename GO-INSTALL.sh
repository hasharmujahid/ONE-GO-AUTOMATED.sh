#!/bin/bash
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
source /root/.bashrc
echo 'RUN go In terminal to test your Installation and path ...'