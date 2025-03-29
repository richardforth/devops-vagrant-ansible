# Missing vault.yml

To keep a clear repo and a clear conscience, I havent't committed any vault.yml files
To see how to recreate the vault.yml filem chek out this blog post:

https://richardforth78.wordpress.com/2025/03/28/using-ansible-vault-variables-in-playbooks-in-later-versions-of-ansible/

# TLDR

```bash

ansible-vault encrypt_string 'myrootpass' --name mysql_root_password > vault.yml

```

Checking

```bash

ansible localhost -m debug -a "var=mysql_root_password" -e @vault.yml

```
