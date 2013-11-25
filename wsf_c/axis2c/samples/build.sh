#!/bin/bash

./autogen.sh

./configure --prefix=${WSFC_HOME} --with-axis2=${WSFC_HOME}/include/axis2-1.5.0
make 
make install

