#/bin/bash

set -e

mkdir -p $HOME/.vim/others
wget --trust-server-names http://jp2.php.net/get/php_manual_ja.tar.gz/from/this/mirror -O /tmp/php_manual_ja.tar.gz
tar xvfz /tmp/php_manual_ja.tar.gz -C ~/.vim/others/

