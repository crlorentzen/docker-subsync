# docker-subsync
docker version of https://github.com/sc0ty/subsync

1. Build process clones from release tag.
2. Exports a /root volume for shared library storage between runs
  - Recommend storing this as a docker volume, not a bind mount

## Build Instructions
- Requires a working docker install
```
docker build -t docker-subsync https://github.com/crlorentzen/docker-subsync.git
```

## Example Run
`docker run -it --rm -v 'subsync-root:/root' -v "/path/to/move/:/in" -v "/path/to/output:/out" docker-subsync s
ync --sub /in/sub.srt --ref /in/movie.mkv --out /out/sub.srt`
