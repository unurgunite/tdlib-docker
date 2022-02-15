FROM debian:10-slim

RUN apt update -qq
RUN apt install -yqq make git zlib1g-dev libssl-dev gperf php-cli cmake clang libc++-dev libc++abi-dev

RUN git clone https://github.com/tdlib/td.git
WORKDIR /td/build
RUN CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
RUN cmake --build . --target install
RUN ls -l /td/tdlib
RUN mkdir /libtdjson
