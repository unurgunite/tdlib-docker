FROM debian:10-slim AS builder

RUN apt update -qq && \
    apt install -yqq make git zlib1g-dev libssl-dev gperf php-cli cmake clang libc++-dev libc++abi-dev && \
    apt clean autoclean && \
    apt autoremove -y && \
		rm -rf /var/lib/apt/lists/* /root/.cache /tmp*

RUN git clone https://github.com/tdlib/td.git /td
WORKDIR /td/build
RUN CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
RUN cmake --build . --parallel $(expr `nproc` - 1) --target install

# ---- Second Stage: Minimal Runtime Image ----
FROM alpine

COPY --from=builder /td/tdlib/lib/libtdjson.so /lib/libtdjson.so
CMD ["cp", "-L", "/lib/libtdjson.so", "/libtdjson"]
