#!/usr/bin/env bash

echo "This process takes about 35 minutes, be patient..."
rm a0005_google_authenticator.box
time vagrant package default --output a0005_google_authenticator.box
time mv *.box /localbackup/boxes/
