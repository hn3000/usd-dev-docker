
# Docker container for USD development

Dockerfile borrowed from <https://hub.docker.com/r/anguslang/usdz-dev>

- commented aliyun mirrors (not sure why they were used)

## Preparation

git clone git@github.com:PixarAnimationStudios/USD usd
git clone https://github.com/google/usd_from_gltf.git ufg


## build container

docker build . -t usd-dev

