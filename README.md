# bcc-docker
Dockerized bcc toolset

### build

`docker build -t bcc .`

### run

## MacOS + rancher-desktop (lima vm)

Make sure you have installed kernel headers for lima vm:
```bash
rdctl shell
apk add linux-headers 
```

`docker run -it --rm --privileged --pid host -v /sys/kernel:/sys/kernel -v /lib/modules:/lib/modules -v /usr/src:/usr/src  -v /sys/fs/cgroup:/sys/fs/cgroup -v /sys/fs/bpf:/sys/fs/bpf  --net host bcc:latest`
