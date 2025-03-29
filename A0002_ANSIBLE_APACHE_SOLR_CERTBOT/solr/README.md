# THIS ROLE IS INTELLECTUAL PROPERTY, SORRY

I've left the overall folder structure and tasks/main.yaml as a starting pistol to help you figure out how to build your own fork from this wireframe.

However the main bulk of the tasks and templates are co-developed and are not public.

You'll need to develop your own fork of this role on your own. Sorry about that

## Main takeaways: 

### You'll notice that theres a Part 1 and 2 of configuring apache:

Part 1, we set up a port 80 vhost. This is so Certbot / LetsEncrypt can pass its validation checks
Part 2, we then replace that port 80 vhost with a 443 vhost and a port 80 redirect

We used apache to serve the Lets Encrypt SSL and proxypass to solr.
We acheived this using ansible's template capability.
The actuial templates aren't shared


### Solr needs to be secured, using a security.json file

There is information on how to do that in the official solr docs.

Without a security.json file your solr dashboard is visible to the world.
We built our own which is proprietary and not for public.

### Defaults

These contained sesitive info and weren't included, but technicaly are'nt themselves IP.

Here is the basic format I used:

```yaml  
---
solr_version: "9.8.1"
solr_port: 8983
certbot_email: "firstname.lastname@yourdomain.com"
```

You can use this info to recreate your own file but use your own email address.

What defaults allow you to do is specify a different `solr_version` by passing in a prompt_var (though this isnt possible with the Vagrant provisioning, theres a clue on how you can do that in the Vagrantfile)

If you were running the `ansible_playbook` command from a control node, in the traditional sense, it might look like this:

```bash

ansible-playbook \
  -i inventory.yml \
  -l yourhosthame \
  playbook.yml \
  -e "solr_domain=solr.yourdomain.com" \
  -e "solr_version=9.8.1"

```
LINE BREAKS ARE OPTIONAL

Note: 

9.8.1 is the latest version, they have a habit of yanking old versions off the cdn causing the playbook to fail to download its corresponding tar.gz file:

https://dlcdn.apache.org/solr/solr/

Solr 9.8.1 is the most recent Apache Solr release.

https://solr.apache.org/downloads.html

### Vars

Vars wasn't actually used, we favoured defaults/main.yml as it allows for overrides, but you can use vars/main.yml if you have constants that dont change in your projects. 

### Conclusion

This is about all I can say.

Remember, this git repo is all about the integration of Vagrant and Ansible, using DevOps principles of IaC (Infrastructure as Code) and Provisioning (with Ansible).

Some things just need to stay private, it is what it is. However I have tried to leave breadcrumbs for future me, and to help you get started.

With AI these days, you can probably rebuild most of it automatically with the right prompt engineering.

I hope you appreciate my candor.
