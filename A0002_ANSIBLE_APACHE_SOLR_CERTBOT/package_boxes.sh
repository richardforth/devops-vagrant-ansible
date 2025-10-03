#!/usr/bin/env bash

echo "This process takes about 35 minutes, be patient..."
rm a0002_solr.box
time vagrant package solr --output a0002_solr.box
time mv *.box /localbackup/boxes/
