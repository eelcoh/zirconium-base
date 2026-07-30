FROM ghcr.io/zirconium-dev/zirconium:latest

# Installeer Git en maak de dnf cache direct leeg om de image compact te houden
RUN dnf -y install git && \
    dnf clean all

#RUN hostnamectl set-hostname jepara
RUN systemctl enable sshd
