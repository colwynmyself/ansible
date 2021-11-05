FROM ubuntu:20.04

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  software-properties-common \
  apt-utils \
  nmap \
  jq \
  curl \
  wget \
  tmux \
  screen \
  lib32gcc1 \
  lib32stdc++6 && \
  rm -rf /var/lib/apt/lists/*

RUN apt-add-repository multiverse
RUN dpkg --add-architecture i386

RUN apt-get update -y

# We can't agree to the terms right now
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
#   steamcmd && \
#   rm -rf /var/lib/apt/lists/*

RUN useradd -m steam
USER steam
WORKDIR /home/steam
RUN mkdir -p /home/steam/steamgames
WORKDIR /home/steam/steamgames
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# Install satisfactory - app id 1690800
RUN /home/steam/steamgames/steamcmd.sh +login anonymous +force_install_dir /home/steam/steamgames/SatisfactoryDedicatedServer +app_update 1690800 validate +quit

EXPOSE 15777/udp
EXPOSE 15000/udp
EXPOSE 7777/udp

CMD [ "/home/steam/steamgames/SatisfactoryDedicatedServer/FactoryServer.sh", "-log", "-unattended" ]
