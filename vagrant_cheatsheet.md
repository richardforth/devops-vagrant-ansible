# Vagrant Cheatsheet

## Initialise a folder with a boilerplate Vagrantfile

```bash
vagrant init
```

## Check status of a given folder with a Vagrantfile

```bash
vagrant status
```

## Start up a vagrant environment from a Vagrantfile

```bash
vagrant up
```

## Destroy everything
You will need to respond to prompts

```bash
vagrant destroy
```

## Destroy everything without having to keep typing y for each vm each time

```bash
vagrant destroy --force
```

## Better still, Destroy everything without having to keep typing y for each vm each time, and rebuild again
This is handy if you've just fixed an issue in either Vagrantfile or playbook.yml etc

```bash
vagrant destroy --force && vagrant up
```

## Even better, dont destroy the VM, just re-run the playbook

```bash
vagrant up --provision
```

## Even better yet, dont destroy the VM, just re-run the playbook, and pass an environment variable

```bash
SOLR_DOMAIN=solr.yourdomain.co.uk vagrant up --provision
```

### Note: requires a special block in the Vagrantfile to pass the environment variable:

```ruby

  # Provisioning configuration for Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = {
      solr_domain: ENV['SOLR_DOMAIN'] || "solr.default.local"
    }

```
Here the default is set to `solr.default.local` which obviously will fail to satisfy Certbot/LE


# SSH

## Get SSH config from vagrant to use in say VS Code
Attribution link: https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e

VSCode Plugin Link: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh

```bash

vagrant ssh-config

```
Copy and paste the output of that into your ~/.ssh/config on Linux, or
C:\Users\YourUsername\\.ssh\config on windows.

# Playbooks and Vagrant

## Run a custom playbook without hacking the Vagrantfile

1. Create an ssh config for the vagrant vm in the current folder:

```bash

vagrant ssh-config > ssh_config

```

2. Create a basic inventory file like so:

```ini
[vagrant]
default ansible_host=127.0.0.1 ansible_port=2222 ansible_user=vagrant ansible_ssh_private_key_file=.vagrant/machines/default/virtualbox/private_key

```

3. Create the playbook

(I'll assume you did this already, I called mine test_play.yml)

4. Run this command:

```bash
ansible-playbook -i inventory.ini test_play.yml --ssh-common-args="-F ssh_config  -o StrictHostKeyChecking=no"

```
(dont forget to replace "test_play.yml" with your playbook name)
