# To launch in Vagrant environment, set environment variables:

(set these values to sane ones!)

JITSI_DOMAIN=meet.example.com JITSI_EMAIL=jitsi@example.com vagrant up

(if the vm is already running)

JITSI_DOMAIN=meet.example.com JITSI_EMAIL=jitsi@example.com vagrant up --provision

ISSUES:

After the secure domain setup, youre prompted for your credentials when creating and joining a room but they don't work, it feels like something isnt talking to something else 
