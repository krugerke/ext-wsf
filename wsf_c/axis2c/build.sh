#!/bin/bash
set -e
sh autogen.sh
WSFC_HOME=${WSFC_HOME:=`pwd`/deploy}

export WSFC_HOME

echo "WSFC_HOME = ${WSFC_HOME}"

sh configure --prefix=${WSFC_HOME} --enable-tests=yes
make -j 10 
make install

cd samples
sh autogen.sh
sh configure --prefix=${WSFC_HOME} --with-axis2=${WSFC_HOME}/include/axis2-1.5.0
make -j 10
make install
								
cd ..
