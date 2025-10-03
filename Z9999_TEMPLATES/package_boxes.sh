#!/usr/bin/env bash

echo "This process takes about 35 minutes, be patient..."
## Change these to soemthign unique and relevant to the Vagrantfile in use
rm default.box
time vagrant package default --output default.box
time mv *.box /localbackup/boxes/
