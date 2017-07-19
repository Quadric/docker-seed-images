# Docker Seed Images

This repo contains few custom docker seed images.

## Summary of images

| Name | Description |
|------|-------------|
| alpine:latest | Fix wget in alpine:latest |
| jq:latest | [jq](https://stedolan.github.io/jq/) on alpine .. [alpine packages](https://pkgs.alpinelinux.org/packages?name=jq&branch=&repo=&arch=&maintainer=) |
| meteor:1.4.2.7 | Custom meteor 1.4.2.7 on node 5.12 |
| mongo:3.2 | Install curl on mongo:3.2 |
| mongo:3.4 | Install curl on mongo:3.4 |
| mongo-connector:2.3 | Install mongo-connector 2.3 and correspondant depedencies on python 3.4 |
| mongo-connector:2.5 | Install mongo-connector 2.5 and correspondant depedencies on python 3.4 |
| serverless:latest | Installs the latest serverless node module on node 6 |

## Commands

- Build an image:

```bash
docker build -t quadric/<name[:build]> <./context>
```

- Push an image:

```bash
docker push quadric/<name[:build]>
```

## Scripts

- `build-all.sh`: Builds all images locally
- `push-all.sh`: Pushes all images to quadric docker hub organization

## Mongo-Connector

The images runs mongo-connector
It uses configuration file with the path in variable: MONGO_CONNECTOR_CONFIG_FILE_PATH defaulting to /mongo-connector.config.json
You can configure it either by sending the file as a volume, or create another image based on this and copy your config file to this path

Or set environment variable MONGO_CONNECTOR_CONFIG, this should contain a stringified config file
If the file doesn't exist and the MONGO_CONNECTOR_CONFIG exists, I'll write it's content to the MONGO_CONNECTOR_CONFIG_FILE_PATH and start mongo-connector!

For the healthcheck I check the file in MONGO_CONNECTOR_OPLOG_FILE_SYMLINK_PATH which defaults to/symlink-oplog.timestamp to contain the MONGO_REPLICA_SET_NAME
and in the run script I read the config file (before running) and set a symlink from the previous healthcheck path to the oplogfile path