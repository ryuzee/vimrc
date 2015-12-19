#!/bin/bash
# See http://openlab.jp/edict/eblook/

set -e

PATH=/usr/local/bin:$PATH
unset GREP_OPTIONS

#=== Installing EB Library ===
wget ftp://ftp.sra.co.jp/pub/misc/eb/eb-4.4.3.tar.bz2 -O /tmp/eb-4.4.3.tar.bz2
cd /tmp/
tar jxvf /tmp/eb-4.4.3.tar.bz2
cd /tmp/eb-4.4.3
./configure
sudo make install

#=== Installing EB-look
wget http://openlab.jp/edict/eblook/dist/eblook-1.6.1.tar.gz -O /tmp/eblook-1.6.1.tar.gz
cd /tmp
tar xvfz /tmp/eblook-1.6.1.tar.gz
cd /tmp/eblook-1.6.1
./configure
sudo make install

#=== Dictionary
mkdir -p "$HOME/dictionary/"
wget https://dl.dropboxusercontent.com/u/428597/epwing.zip -O /tmp/epwing.zip
unzip /tmp/epwing.zip -d "$HOME/dictionary/"
