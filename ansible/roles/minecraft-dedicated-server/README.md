# Minecraft Dedicated Server

Ansible role for a Java dedicated server. Random notes in here.

Sets up a server with [Minecraft Server Manager](https://minecraftservercontrol.github.io/docs/mscs/installation) and
[PaperMC](https://papermc.io/) installed. Check `vars/main.yml` for things like the world name, PaperMC version, install
dir, and more!

## Post installation

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

3. Edit `/opt/mscs/worlds/friendos/server.properties` and set `white-list=true`
4. Stop and start the server
   1. `sudo su - minecraft`
   2. `mscs stop friendos`
   3. `mscs start friendos`
