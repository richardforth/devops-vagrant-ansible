# Google Authenticator Test Environment
> These steps are `Currently  Working but with nuance` by Richard A. Forth 2026-05-02 Sat
> Turns out with ssh key and google AUTH it accepts EITHER:
> IF YOU SUPPLY AN SSH KEY, you can get in fine
> IF YOU DO NOT SUPPLY AN SSH KEY you wil get prompted for the Google Authenticator code 
```

Playbook inspired by DevOps for the Desperate book.

```

# Expected behaviour when complete:

1. Verify the SSH key (this should be transparent unless the wrong key is given or no key provided)
2. Prompt for Authenticaor Token

> What we expected to see!
```
$ ssh -p 2222 -i gauthtest_ed25519 gauthtest@127.0.0.1
(gauthtest@127.0.0.1) Verification code:
gauthtest@vagrant:~$


> What we got!
> IF YOU SUPPLY AN SSH KEY, you can get in fine

```

$ ssh -p 2222 -i gauthtest_ed25519 gauthtest@127.0.0.1
gauthtest@vagrant:~$

```

> IF YOU DO NOT SUPPLY AN SSH KEY you will get prompted for the Google Authenticator code 


```

$ ssh -p 2222 gauthtest@127.0.0.1
(gauthtest@127.0.0.1) Verification code:
gauthtest@vagrant:~$


```

# Bring up the environment and let ansible provision the VM (see Process)

```bash

vagrant up

```


# Process (ansible will take care of these steps):

> 1. Install Google Authenicator PAM Plugin
> 2. Disable SSH in PAM
> 3. Configure PAM to use GoogleAuthenticator for SSH logins
> 4. Set ChallengeResponseAuthentication to yes
> 5. Set KbdInteractiveAuthentication to yes
> 6. Set PasswordAuthentication to no
> 7. Set Authentication Methods for vagrant
> 8. Restart ssh daemon
> 9. Create a test user to apply google authenticator to (other than vagrant) with an ed25519 SSH key
> 10. Push the SSH key up to the VM for the USER to use straight away?

# Manual steps - User:

## Login directly as the gauthtest user, pass in the ssh key with the -i flag
> make sure to specify the key that is generated
> Note: the key will not be comitted to GitHub

```
ssh -p 2222 -i gauthtest_ed25519 gauthtest@127.0.0.1

```


1. Run `google-authenticator` as `gauthtest` user
2. Follow Onscreen instructions, scan QR code in Google Authenticator App
3. Answer the remaining questions
i. Do you want authentication tokens to be time based? (y/n) y

>     (scan the QR code with the Google Autehnticator App on your phone)

>     (enter the code)

>     (save your emergency scratch codes, presented yo you on screen)

ii. Do you swant to update your "/home.gauthtest/.google_authenticator" file? (y/n) y
iii. Do you want to disallow multiple uses of the same authentication

>        token? This restricts you to one login about every 30s, but it increases

>        your chances to notice or even prevent man-in-the-middle attacks (y/n) y

iv. By default, a new token is generated every 30 seconds by the mobile app.

>       In order to compensate for possible time-skew between the client and the server,
>       we allow an extra token before and after the current time. This allows for a
>       time skew of up to 30 seconds between authentication server and client. If you
>       experience problems with poor time synchronization, you can increase the window
>       from its default size of 3 permitted codes (one previous code, the current
>       code, the next code) to 17 permitted codes (the 8 previous codes, the current
>       code, and the 8 next codes). This will permit for a time skew of up to 4 minutes
>       between client and server.

>       Do you want to do so? (y/n) n

v. If the computer that you are logging into isn't hardened against brute-force

>      login attempts, you can enable rate-limiting for the authentication module.

>      By default, this limits attackers to no more than 3 login attempts every 30s.

>      Do you want to enable rate-limiting? (y/n) y

4. Log out of the VM

# Testing:

## Test 1: supply a valid SSH key
> Observe that you dont get prompted for the Google Authenticator token

```bash

ssh -p 2222 -i gauthtest_ed25519 gauthtest@127.0.0.1
...
gauthtest@vagrant:~$
```

## Test 2: do not supply an ssh key
> Observe that this time you will get prompted for the Google Authenticator Token

```
$ ssh -p 2222 gauthtest@127.0.0.1
(gauthtest@127.0.0.1) Verification code:
...
gauthtest@vagrant:~$
```

Enter the code from your Google Authenticator App

Enjoy!
