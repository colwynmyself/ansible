# Satisfactory Dedicated Server

This repo creates a Docker image meant to development testing and a pretty reasonable Digital Ocean server.

## Digital Ocean Setup

There are a couple of things that need to be done before this playbook can be run on DO:

* Make a Ubuntu 20.04 droplet manually with your SSH key
* On the server create a user for yourself that you can SSH to
  * To get this working you may need to enable passwordless sudo yourself

Steps because I'm lazy and forget

```shell
# as root
$ useradd -m colwyn
$ usermod -aG sudo colwyn
$ echo """
# Don't require password for sudo group
%sudo   ALL=(ALL:ALL) NOPASSWD: ALL
""" > /etc/sudoers.d/10-nopassword
$ su - colwyn
$ sudo ls # test to make sure sudo works
$ mkdir .ssh
$ vim .ssh/authorized_keys # add your ssh key
$ sudo chsh -s /bin/bash colwyn
# Exit server and ssh as colwyn
```

That's it! As long as you can `ssh ${server_ip}` to your server, this playbook will work.
