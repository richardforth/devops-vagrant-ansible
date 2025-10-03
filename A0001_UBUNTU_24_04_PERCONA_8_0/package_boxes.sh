#!/usr/bin/env bash

echo "This process takes about 35 minutes, be patient..."
rm a0001_db.box
time vagrant package db --output a0001_db.box
time mv *.box /localbackup/boxes/
