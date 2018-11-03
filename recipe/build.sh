#!/bin/bash

autoconf
autoreconf -i
./configure --prefix=$PREFIX
make
./signalhandler_unittest die_in_thread || true
make check
make install
