#!/usr/bin/env bash

# This bootstrap ams to remiove some of the heaving lifting
# I did initially setting up the VM, so that on destroy / vagrant up
# we get back to a position that is relativbely close to how we left it.
# Note: all bootsrap commands run as root anyway

# change needrestart.conf to automatic instead of interactive, to avoid TUI popups during apt operations
sed -i "s/^#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf

# Update apt repos
apt -y update

# Update all packages to latest version
apt -y upgrade

# install zip and unzip packages
apt -y install zip unzip

# install tree package
apt -y install tree

# install ansible
apt -y install ansible

# create ansible roles directory and sync latest content back to the VM from the shared folder
mkdir -p /home/vagrant/ansible/roles
cp /vagrant/latest.zip /home/vagrant/ansible/roles/
cd /home/vagrant/ansible/roles/
unzip latest.zip
chown -R vagrant:vagrant /home/vagrant/


# insert bash function into vagrant's .bashrc file to save progress regularly

func=$(cat << EOF

# insered by bootstrap for solr development easy backups
function save_progress() {
        rsync -av --progress /home/vagrant/ansible/roles/solr /vagrant
        cp /home/vagrant/ansible/roles/apply_solr_role.yml /vagrant/
        datestamp=\$(date +%Y-%m-%d_%H%M%S)
        cd /vagrant
        zip -r solr_\${datestamp}.zip solr
        # add playbook to zip
        zip solr_\${datestamp}.zip /home/vagrant/ansible/roles/apply_solr_role.yml	
	# create a symlink 'latest' to use for vagrant up to deploy the most recent backup
        ln -sf solr_\${datestamp}.zip latest.zip
        tree /vagrant/
}
EOF
)

echo "$func" >> /home/vagrant/.bashrc
cat /home/vagrant/.bashrc

