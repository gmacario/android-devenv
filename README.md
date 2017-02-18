# android-devenv

Docker image suitable for Android application development.

### Building the Docker image

Logged as user@host

```
cd ${HOME}
git clone https://github.com/gmacario/android-devenv
cd android-devenv
docker build --no-cache -t gmacario/android-devenv .
```

### Using the image as Developer environment for the UDOO NEO

Logged as user@host

```
cd ${HOME}
git clone https://github.com/WillyShakes/UdooWtf
cd ~/UdooWtf
docker run -ti -v $(pwd):/opt/workspace gmacario/android-devenv
```

Logged as root@container

```
# gradlew tasks
```

etc.

<!-- EOF -->
