# Google Authenticator Test Environment
> These steps are Currently under Testing and Experimantation by Richard A. Forth 2026-05-02 Sat

```

Playbook inspired by DevOps for the Desperate book.

```

# Bring up the environment and let ansible provision the VM (see Process)

```bash

vagrant up

```


# Process (ansible will take care of these steps):

1. Install Google Authenicator PAM Plugin
2. Configure PAM to use GoogleAuthenticator for SSH logins
3. Set ChallengeResponseAuthentication to yes
4. Set KbdInteractiveAuthentication to yes 
5. Set Authentication Methods for vagrant
6. Restart ssh daemon
7. Create a test user to apply google authenticator to (other than vagrant)

# Manual steps - User:

## Login directly as the gauthtest user
> Password is `HelloGoogle!` for this lab

```
ssh -p 2222 gauthtest@127.0.0.1

```


1. Run `google-authenticator` as `gauthtest` user
2. Follow Onscreen instructions, scan QR code in Google Authenticator App
3. Answer the remaining questions
   i. Do you want authentication tokens to be time based? (y/n) y
     (scan the QR code with the Google Autehnticator App on your phone)
     (enter the code)
     (save your emergency scratch codes, presented yo you on screen)
   ii. Do you swant to update your "/home.gauthtest/.google_authenticator" file? (y/n) y
   iii. Do you want to disallow multiple uses of the same authentication
        token? This restricts you to one login about every 30s, but it increases
        your chances to notice or even prevent man-in-the-middle attacks (y/n) y
   iv. By default, a new token is generated every 30 seconds by the mobile app.
       In order to compensate for possible time-skew between the client and the server,
       we allow an extra token before and after the current time. This allows for a
       time skew of up to 30 seconds between authentication server and client. If you
       experience problems with poor time synchronization, you can increase the window
       from its default size of 3 permitted codes (one previous code, the current
       code, the next code) to 17 permitted codes (the 8 previous codes, the current
       code, and the 8 next codes). This will permit for a time skew of up to 4 minutes
       between client and server.
       Do you want to do so? (y/n) n
   v. If the computer that you are logging into isn't hardened against brute-force
      login attempts, you can enable rate-limiting for the authentication module.
      By default, this limits attackers to no more than 3 login attempts every 30s.
      Do you want to enable rate-limiting? (y/n) y

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
