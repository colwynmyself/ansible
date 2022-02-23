# Minecraft Dedicated Server

- [Minecraft Dedicated Server](#minecraft-dedicated-server)
  - [Post installation](#post-installation)
    - [TLS](#tls)
    - [General Server Configuration](#general-server-configuration)
    - [Allowlist](#allowlist)

Ansible role for a Java dedicated server. Random notes in here.

Sets up a server with [Minecraft Server Control Script](https://minecraftservercontrol.github.io/docs/mscs/installation)
and [PaperMC](https://papermc.io/) installed. Check `vars/main.yml` for things like the world name, PaperMC version,
install dir, and more!

## Post installation

### TLS

There will be an Nginx server for Minecraft Overviewer maps served on port `80` and `443`. No certificate will be
generated yet, I recommend using LetsEncrypt to generate your cert. `certbot` will be installed so the steps to get a
cert are:

1. Make sure you have DNS pointing at your server - visit `http://${hostname}` to check
2. Run `sudo certbot --nginx` and follow the prompts

That's it! Once you've run Certbot this playbook won't overwrite the changes to the Nginx config. You can find the
config in `/etc/nginx/conf.d` if you do need to edit it.

### General Server Configuration

There are all sorts of things you may want to edit. `/ops/mscs/worlds/friendos/server.properties` is the place to make
those edits.

### Allowlist

The allowlist is not enabled by default, if you would like to use it then you'll have to manually add it. It will be
located by default at `/opt/mscs/worlds/friendos/whitelist.json`. Fetch UUIDs from <https://mcuuid.net>

1. Edit `/opt/mscs/worlds/friendos/whitelist.json`.

   ```json
   [
     {
       "uuid": "f430dbb6-5d9a-444e-b542-e47329b2c5a0",
       "name": "username"
     }
   ]
   ```

2. Edit `/opt/mscs/worlds/friendos/ops.json` to make yourself an OP. **NOTE:** I recommend using OP level 3 so server
   management still happens at the CLI level. This is important because
   [MSCS will view `/stop` commands as a crash](https://minecraftservercontrol.github.io/docs/mscs/crash-detection#notes)
   and automatically restart the server if an OP tries to stop the server using `/stop`.

   ```json
   [
     {
       "uuid": "f430dbb6-5d9a-444e-b542-e47329b2c5a0",
       "name": "username",
       "level": 3
     }
   ]
   ```

3. Edit `/opt/mscs/worlds/friendos/server.properties` and set `white-list=true` and `enforce-whitelist=true`
4. Stop and start the server
   1. `sudo su - minecraft`
   2. `mscs stop friendos`
   3. `mscs start friendos`
