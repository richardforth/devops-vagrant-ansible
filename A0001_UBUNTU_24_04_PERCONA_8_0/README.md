# Missing vault.yml

To keep a clear repo  - and a clear conscience -  I haven't committed any vault.yml files
To see how to recreate the vault.yml file, check out this blog post:

https://richardforth78.wordpress.com/2025/03/28/using-ansible-vault-variables-in-playbooks-in-later-versions-of-ansible/

# TLDR

```bash

ansible-vault encrypt_string 'myrootpass' --name mysql_root_password > vault.yml

```

Checking... 
(don't use ansible-vault view, it errors)

```bash

ansible localhost -m debug -a "var=mysql_root_password" -e @vault.yml

```

If you haven't read the blog post, here's what happens when you try ansible-vault view:


```bash

ansible-vault view vault.yml
ERROR! input is not vault encrypted data. vault.yml is not a vault encrypted file for vault.yml

```

This is because we set it up as a vault value to a variable eg `mysql_root_password`;

