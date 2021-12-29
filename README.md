# Ansible

Various playbooks for managing my Digital Ocean servers. Does basic setup for webservers and fairly involved setup for
Valheim and Satisfactory servers.

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

## DDNS

DDNS is not setup as a part of these playbooks, that's a manual step I didn't want to deal with.

1. `git clone https://github.com/colwynmyself/dynamic-dns.git`
2. `vim dynamic-dns/src/update-record.sh`
   1. Add your Cloudflare key
3. `sudo crontab -e`
   1. Add `* * * * * ./dynamic-dns/src/update-record.sh colwyn.me <subdomain> >/dev/null 2>&1`

## Uptime Monitoring

1. `sudo crontab -e`
   1. add `* * * * * /usr/local/bin/valheim-up.sh && curl '<uptime-url>' >/dev/null 2>&1`
