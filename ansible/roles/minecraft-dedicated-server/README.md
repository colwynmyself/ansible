# Minecraft Dedicated Server

Ansible role for a Java dedicated server. Random notes in here.

Sets up a server with [Minecraft Server Manager](https://minecraftservercontrol.github.io/docs/mscs/installation) and
[PaperMC](https://papermc.io/) installed. Check `vars/main.yml` for things like the world name, PaperMC version, install
dir, and more!

## Post installation

The allowlist is not enabled by default, if you would like to use it then you'll have to manually add it. It will be
located by default at `/opt/mscs/worlds/friendos/whitelist.json`.

1. Edit `/opt/mscs/worlds/friendos/whitelist.json`. Fetch UUIDs from <https://mcuuid.net>

   ```json
   [
     {
       "uuid": "f430dbb6-5d9a-444e-b542-e47329b2c5a0",
       "name": "username"
     }
   ]
   ```

2. Edit `/opt/mscs/worlds/friendos/ops.json` to make yourself an OP. I generally recommend using OP level 3 so server
   management still happens at the CLI level. Fetch UUIDs from <https://mcuuid.net>

   ```json
   [
     {
       "uuid": "f430dbb6-5d9a-444e-b542-e47329b2c5a0",
       "name": "username",
       "level": 3
     }
   ]
   ```

3. Edit `/opt/mscs/worlds/friendos/server.properties` and set `white-list=true`
4. Stop and start the server
   1. `sudo su - minecraft`
   2. `mscs stop friendos`
   3. `mscs start friendos`
