FROM archlinux:base-devel
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc" && rm $patched_glibc
RUN pacman -Sy --noconfirm git exa pacman-contrib && \
    rm -rf /var/lib/pacman/sync/*
RUN useradd -m -G wheel -s /bin/bash archlinux
WORKDIR /home/archlinux
ENTRYPOINT su -l archlinux
