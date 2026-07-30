FROM ghcr.io/zirconium-dev/zirconium:latest

# Installeer Git en maak de dnf cache direct leeg om de image compact te houden
RUN dnf -y install git zsh atuin zoxide && \
    dnf clean all

RUN chsh -s /bin/zsh
RUN systemctl enable sshd
