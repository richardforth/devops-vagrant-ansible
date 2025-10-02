#!/usr/bin/env bash

echo "This process takes about 1 hour and 4 minutes, be patient..."
rm a0004_jenkins-controller.box
rm a0004_jenkins-build-agent.box
time vagrant package jenkins-controller --output a0004_jenkins-controller.box
time vagrant package jenkins-build-agent --output a0004_jenkins-build-agent.box
time mv *.box /localbackup/boxes/
