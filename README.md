# archlinux-docker-makepkg
A Docker image that allows building ArchLinux packages on any distro.

It expects that the /work volume is mounted on the
directory that contains the PKGBUILD for the package you want to build.

Example run command:
```
docker run -v $(pwd):/work --rm aitorpazos/archlinux-docker-makepkg
```

By default it expects PKGBUILD and the other files to belong to uid 1000. If
those files belong to a user with other id, use environment variable `USER_UID` 
on docker run command:
```
docker run --env USER_UID=<desired uid> -v $(pwd):/work --rm aitorpazos/archlinux-docker-makepkg
```
