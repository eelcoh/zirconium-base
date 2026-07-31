FROM ghcr.io/zirconium-dev/zirconium:latest

# Installeer Git en maak de dnf cache direct leeg om de image compact te houden
RUN dnf -y install git zsh atuin zoxide \
    virt-manager qemu-kvm libvirt \
    podman-compose distrobox \
    sysprof traceroute htop tree \
    ptyxis && \
    dnf clean all

RUN systemctl enable sshd
RUN systemctl enable libvirtd
