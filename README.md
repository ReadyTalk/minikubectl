# MiniKubectl

This is the build of a miniture kubernetes cli docker container.

### Why use it


## Usage

```bash
$ docker run --rm readytalk/minikubectl:v1.10 kubectl --help
```

### Usage example1

For example to access a local Kubernetes cluster you may run:

```bash
$ docker run --rm --net=host --user $UID -v ~/.kube:/config/.kube readytalk/minikubectl:v1.10 kubectl cluster-info
```

