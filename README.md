# ArchLinux-docker-makepkg
A Docker image that allows building ArchLinux packages on any distro.

Once built, it will expect that the /work volume is mounted on the
directory that contains the PKGBUILD for the package you want to build.

Example run command:
```
docker -ti run -v <PKGBUILD dir>:/work ArchLinux-docker-makepkg:latest
```

If you want to use a pre-built image, use:
```
docker pull aitorpazos/archlinux-docker-makepkg
```
