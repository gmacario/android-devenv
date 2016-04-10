
### Building the Docker image

Logged as ubuntu@aws-wtf

```
$ cd && git clone https://github.com/gmacario/wtf-docs
$ cd ~/wtf-docs && docker build --no-cache -t gmacario/wtfapp-devenv wtfapp-devenv/
```

### Using the image as Developer environment for the UDOO NEO

Logged as ubuntu@aws-wtf

```
$ cd && git clone https://github.com/WillyShakes/UdooWtf
$ cd ~/UdooWtf && docker run -ti -v $(pwd):/opt/workspace gmacario/wtfapp-devenv
```

Logged as root@container

```
# gradlew tasks
```

etc.

<!-- EOF -->
