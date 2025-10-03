#!/usr/bin/env bash

echo "This process takes about 35 minutes, be patient..."
rm a0003_jitsi.box
time vagrant package default --output a0003_jitsi.box
time mv *.box /localbackup/boxes/
