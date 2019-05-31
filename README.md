# [Aria2-RPC](https://github.com/aria2/aria2) server inside a docker container

- [How to run](#how-to-run)
  - [Simple Usage](#simple-usage)
  - [Full Usage](#full-usage)
  - [Supported Environment Variables](#supported-environment-variables)
  - [Supported Volumes](#supported-volumes)
- [Docker Hub](#docker-hub)
- [Usage it in Docker compose](#usage-it-in-docker-compose)

## How to run

### Supported Architectures

The architectures supported by this image are: arm64

### Simple Usage

```bash
docker run -d --name aria2-rpc -p 6800:6800 skywirex/aria2-rpc
```

## Aria2

![AriaNg](https://raw.githubusercontent.com/mayswind/AriaNg-WebSite/master/screenshots/desktop.png)

### Full Usage

```bash
docker run -d \
  --name aria2-rpc \
  -p 6800:6800 \
  -v /DOWNLOAD_DIR:/aria2/data \
  -v /CONFIG_DIR:/aria2/conf \
  -e PUID=1000 \
  -e PGID=1000 \
  -e RPC_SECRET=skywirex \
  skywirex/aria2-rpc
```

> Note: defaut rpc secret is `secret`. You can also remove secret by overriding `RPC_SECRET` with empty string when running your container:

```bash
-e RPC_SECRET=""
```

Now rpc status using this command

```bash
aria2c 
```

### Supported Environment Variables

- `PUID` Userid who will own all downloaded files and configuration files (Default `0` which is root)
- `PGID` Groupid who will own all downloaded files and configuration files (Default `0` which is root)
- `RPC_SECRET` The Aria2 RPC secret token (Default `secret`)
- `DOMAIN` The domain you'd like to bind (Default `0.0.0.0:80`)

### Supported Volumes

- `/aria2/data` The folder of all Aria2 downloaded files
- `/aria2/conf` The Aria2 configuration file

### User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```bash
$ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

### How to build

```bash
git clone https://github.com/skywirex/aria2-rpc
cd aria2-rpc
docker build -t aria2-rpc .
```

## Docker Hub

  <https://hub.docker.com/r/skywirex/aria2-rpc/>
