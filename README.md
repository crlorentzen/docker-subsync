# docker-subsync
Docker version of https://github.com/sc0ty/subsync

1. Build process clones from release tag.
2. Exports a /root volume for shared library storage between runs
  - Recommend storing this as a docker volume, not a bind mount
  

## Syncing a Single File
```
docker run --rm \
  -v 'subsync-root:/root' -v '/path/to/media:/in' -v '/path/to/output:/out' \
  crlorentzen/docker-subsync \
  sync --sub /in/sub.srt --ref /in/media.mkv --out /out/sub.srt
```

## Local Build Instructions
- If you don't want the Docker Hub build
```
docker build -t docker-subsync \
  https://github.com/crlorentzen/docker-subsync.git
```
