# TDLib Docker
## Overview
This repo will help you compile TDLib source code via Docker
## Documentation content
1. [Usage][1]
2. [Contribution][2]

## Usage
There are several easy steps to build source code:
```sh
cd $HOME && \
git clone https://github.com/unurgunite/tdlib-docker.git && \
cd ~/tdlib-docker && \
docker build --tag=unurgunite/tdlib-docker && \
docker run --rm -v $HOME/libtdjson:/libtdjson unurgunite/tdlib-docker
```
Now you can find your compiled version of TDLib in `$HOME/libtdjson/libtdjson.so`

## Contribution

Contribute to the project development always welcome! You will need to fork this project then create new branch and push changes to the repository.

[1]:https://github.com/unurgunite/tdlib-docker#usage
[2]:https://github.com/unurgunite/tdlib-docker#contribution

