# Ansible Playbooks

- [Ansible Playbooks](#ansible-playbooks)
  - [Playbooks](#playbooks)
    - [Digital Ocean Setup](#digital-ocean-setup)
    - [Webserver Setup](#webserver-setup)
    - [Minecraft Server](#minecraft-server)
    - [Satisfactory Server](#satisfactory-server)
    - [Valheim Server](#valheim-server)

This folder contains a number of playbooks that I use for managing my servers. Read [the root `README.md`](../README.md)
if you want some more context.

## Playbooks

These can all be run by reading the playbooks, seeing what inventory they use, and running
`ansible-playbook -i inventories/digitalocean playbooks/PLAYBOOK.yml`. Sorry, you won't be able to use the existing
inventory unless you steal my SSH key - if you've done that then have fun!

### Digital Ocean Setup

Sets up some basic Digital Ocean monitoring and a baseline for all my DO servers.

### Webserver Setup

Basic Nginx webserver setup, nothing too fancy here.

### Minecraft Server

Sets up `ufw` rules for Minecraft and invokes the `minecraft-dedicated-server` role. More info can be found in
[the `README.md` for that role](roles/minecraft-dedicated-server/README.md).

### Satisfactory Server

Sets up `ufw` rules for Satisfactory and invokes the `satisfactory-dedicated-server` role. More info can be found in
[the `README.md` for that role](roles/satisfactory-dedicated-server/README.md).

### Valheim Server

Sets up `ufw` rules for Valheim and invokes the `valheim-dedicated-server` role. More info can be found in
[the `README.md` for that role](roles/valheim-dedicated-server/README.md).
