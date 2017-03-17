#!/usr/bin/env bash
# This script install PhantomJS in your Debian/Ubuntu System
#wefwefwef
# This script must be run as root:
# sudo sh install_phantomjs.sh
#

PHANTOM_VERSION="phantomjs-2.1.1"
ARCH=$(uname -m)

if ! [ $ARCH = "x86_64" ]; then
    $ARCH="i686"
fi

PHANTOM_JS="$PHANTOM_VERSION-linux-$ARCH"

apt-get update
apt-get -y install build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

cd /tmp
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
echo untar
tar xvjf $PHANTOM_JS.tar.bz2
echo mv
mv $PHANTOM_JS /usr/local/share/
echo ln 1
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs
echo ln 2
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs
echo ln 3
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs

ls -lah /usr/bin
