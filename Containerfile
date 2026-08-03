FROM ghcr.io/zirconium-dev/zirconium:latest

# Install gir and other tools, then clean the dnf cache
# to not make the image larger than necessary
RUN curl -fsSL https://mise.jdx.dev/rpm/mise.repo -o /etc/yum.repos.d/mise.repo && \
    dnf -y install git zsh atuin zoxide \
    virt-manager qemu-kvm libvirt \
    podman-compose distrobox \
    sysprof traceroute htop tree \
    wl-clipboard ptyxis mise jq httpie && \
    dnf clean all

# make sure required services are enabled
RUN systemctl enable sshd
RUN systemctl enable libvirtd

# final image check
RUN bootc container lint
