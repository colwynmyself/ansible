# Valheim Dedicated Server

Ansible role for a dedicated server. Random notes in here.

* `/home/steam/saves/valheim/` has the admin, ban, and allow lists in it.
  * Edit `permittedlist.txt` because this server has no password. Alternatively just change `vars/main.yml`

## Using Mods

This checks for `start_server_bepinex.sh` and launches using that file to start the server if it exists. Follow the
instructions on <https://valheim.plus/installation> to install ValheimPlus.

TODO: Backup my mod config file to more than a single place on the server.
