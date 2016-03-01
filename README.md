# ArchLinux-docker-makepkg
A Docker image that allows building ArchLinux packages on any distro.

Once builded, it will expect that the /work volume should be mounted on the
directory that contains the PKGBUIL for the package you want to build.

Example run command:
```
docker -ti run -v <PKGBUIL dir>:/work ArchLinux-docker-makepkg:latest
```

