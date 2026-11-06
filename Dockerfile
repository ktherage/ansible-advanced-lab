FROM ubuntu:26.04

# Installation stricte du minimum : SSH et systemd
RUN apt-get update && apt-get install -y \
    openssh-server \
    systemd \
    systemd-sysv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configuration SSH pour permettre la connexion root
RUN mkdir -p /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Activation du service SSH pour qu'il démarre tout seul avec systemd
RUN systemctl enable ssh

# Le petit hack pour renommer visuellement le hostname dans le terminal
RUN echo 'export PS1="\[\e[32m\]\u@host-$(hostname -I | awk '\''{print $1}'\'' | cut -d. -f4)\[\e[m\]:\[\e[34m\]\w\[\e[m\]# "' >> /root/.bashrc

EXPOSE 22
EXPOSE 5000
EXPOSE 3306

# Permet à Docker de couper systemd proprement lors d'un "docker stop"
STOPSIGNAL SIGRTMIN+3

# Lancement de systemd en tant que PID 1 (qui s'occupera de lancer SSH)
CMD ["/sbin/init"]
