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
