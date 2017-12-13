# Docker Seed Images

This repo contains few custom docker seed images.

## Summary of images

| Name | Description |
|------|-------------|
| alpine:3.7 | Fix wget in alpine:3.7 |
| envsubst | [envsubst](https://linux.die.net/man/1/envsubst) on alpine |
| hashicorp-packer-sh-entrypoint_1.1.2 | Update entrypoint of `hashicorp/packer:1.1.2` to sh |
| jq:1.5-r4 | [jq](https://stedolan.github.io/jq/) 1.5-r4 on alpine:3.7 .. [alpine packages](https://pkgs.alpinelinux.org/packages?name=jq&branch=&repo=&arch=&maintainer=) |
| lerna | [lerna](https://www.npmjs.com/package/lerna) on node:8.9.3 |
| meteor_base | Custom meteor base image based on abernix:meteord |
| mongo:3.2 | Install curl on mongo:3.2 |
| mongo:3.4 | Install curl on mongo:3.4 |
| mongo-connector:2.3 | Install mongo-connector 2.3 and correspondant depedencies on python 3.4 |
| mongo-connector:2.5 | Install mongo-connector 2.5 and correspondant depedencies on python 3.4 |
| pandas | Install python dependencies on top of python:3.6.3 to run tests in quadric network | 
| serverless:node-8.9.3 | Installs `serverless` node module globally on node:8.9.3 |
| nsp:node-8.9.3 | Installs `nsp` node module globally on node:8.9.3 |

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