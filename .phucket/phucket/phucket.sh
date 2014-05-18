#!/bin/bash

if [ ! `node -v` ]
then
    mkdir -p /tmp/node
    cd /tmp/node

    apt-get update
    apt-get install -y python g++ make checkinstall
    wget -N http://nodejs.org/dist/node-latest.tar.gz
    tar xzf node-latest.tar.gz && cd node-v*
    ./configure
    make
    make install

    cd ~
fi


echo ""
echo "Phucket !!"
echo ""

node -v

echo "----------- START PROVISIONING -------------"

cd /vagrant/.phucket
npm install

./node_modules/.bin/coffee phucket/phucket.coffee