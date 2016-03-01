# This Dockerfile expects that your user UID is 1000. If its not, modify the
# "useradd" line to match your desired uid

FROM base/archlinux:latest 
MAINTAINER Aitor Pazos <mail@aitorpazos.es>

RUN pacman-key --init && \
    pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm sudo fakeroot binutils git make gcc boost && \
    pacman-db-upgrade && \
    useradd -u 1000 -d /home/makepkg -m makepkg && \
    mkdir -p /work /home/makepkg && \
    chown -R makepkg /work /home/makepkg
COPY sudoers /etc/sudoers
RUN chown -c root:root /etc/sudoers && \
    chmod -c 0440 /etc/sudoers
VOLUME /work
USER makepkg
WORKDIR /work
ENV GIT_NAME Default User
ENV GIT_EMAIL default@user.com
ENTRYPOINT echo "Using UID `id -u`. If it's not the desired host UID, rebuild the image using the right one." && \
           sudo pacman -Syu --noconfirm && \
           cd /work && \
           git config --global user.name $GIT_NAME && \
           git config --global user.email $GIT_EMAIL && \
           makepkg --noconfirm -si
