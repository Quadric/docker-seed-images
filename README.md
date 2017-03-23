# Docker Seed Images

This repo contains few custom docker seed images.

## Summary of images

| Name | Description |
|------|-------------|
| alpine:latest | Fix wget in alpine:latest |
| meteor:1.4.2.7 | Custom meteor 1.4.2.7 on node 5.12 |
| mongo:3.2 | Install curl on mongo:3.2 |
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