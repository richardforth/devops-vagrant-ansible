# Google Autehnticator Test Environment

```

Playbook inspired by DevOps for the Desperate book.

```

# Bring up the environment and let ansible provision the VM (see Process)

```bash

vagrant up

```


# Process (ansible will take care of these steps):

1. Install Google Authenicator PAM Plugin
2. Disable password authentication for SSH
3. Configure PAM to use GoogleAuthenticator for SSH logins
4. Set ChallengeResponseAuthentication to yes
5. Set KbdInteractiveAuthentication to yes 
6. Set PasswordAuthentication to no
5. Set Authentication Methods for vagrant
6. Restart ssh daemon

# Manual steps - User:

## As vagrant

1. Become the gauthtest user

```bash

vagrant ssh
sudo su - gauthtest

```

1. Run `google-authenticator` as `gauthtest` user
2. Follow Onscreen instructions, scan QR code in Google Authenticator App
3. Answer the remaining questions
4. Log out of the VM

# Testing:

```bash

ssh -p 2222 gauthtest@127.0.0.1

```

You should be prompted for an authenticator code from the google authenticator app:

```
$ ssh -p 2222 gauthtest@127.0.0.1
(gauthtest@127.0.0.1) Verification code:

```

Enter the code from your Google Authenticator App

Enjoy!
