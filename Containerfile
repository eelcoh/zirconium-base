FROM ghcr.io/zirconium-dev/zirconium:latest

# Installeer Git en maak de dnf cache direct leeg om de image compact te houden
RUN curl -fsSL https://mise.jdx.dev/rpm/mise.repo -o /etc/yum.repos.d/mise.repo && \
    dnf -y install git zsh atuin zoxide \
    virt-manager qemu-kvm libvirt \
    podman-compose distrobox \
    sysprof traceroute htop tree \
    wl-clipboard ptyxis mise && \
    dnf clean all

RUN systemctl enable sshd
RUN systemctl enable libvirtd
