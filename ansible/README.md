# Ansible Playbooks

- [Ansible Playbooks](#ansible-playbooks)
  - [Setup](#setup)
  - [Playbooks](#playbooks)
    - [Digital Ocean Setup](#digital_ocean_setup)
    - [Webserver Setup](#webserver-setup)
    - [Minecraft Server](#minecraft-server)
    - [Satisfactory Server](#satisfactory-server)
    - [Valheim Server](#valheim-server)

This folder contains a number of playbooks that I use for managing my servers. Read [the root `README.md`](../README.md)
if you want some more context.

## Setup

Choose your Python virtualenv handler of choice, I use [`pyenv`](https://github.com/pyenv/pyenv) and
[`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv).

1. Setup your virtualenv (change this for your setup)
   1. `pyenv install 3.8.12`
   2. `pyenv virtualenv 3.8.12 ansible`
   3. `pyenv activate ansible`
2. `pip install --upgrade pip poetry`
   1. [Poetry's GitHub](https://github.com/python-poetry/poetry), use it if you like sanity
3. `poetry install`

## Playbooks

These can all be run by reading the playbooks, seeing what inventory they use, and running
`ansible-playbook -i inventories/digitalocean playbooks/PLAYBOOK.yml`. Sorry, you won't be able to use the existing
inventory unless you steal my SSH key - if you've done that then have fun!

### Digital Ocean Setup

Sets up some basic Digital Ocean monitoring and a baseline for all my DO servers.

### Webserver Setup

Basic Nginx webserver setup, nothing too fancy here.

### Minecraft Server

Sets up `ufw` rules for Minecraft and invokes the `minecraft_dedicated_server` role. More info can be found in
[the `README.md` for that role](roles/minecraft_dedicated_server).

### Satisfactory Server

Sets up `ufw` rules for Satisfactory and invokes the `satisfactory_dedicated_server` role. More info can be found in
[the `README.md` for that role](roles/satisfactory_dedicated_server).

### Valheim Server

Sets up `ufw` rules for Valheim and invokes the `valheim_dedicated_server` role. More info can be found in
[the `README.md` for that role](roles/valheim_dedicated_server).
